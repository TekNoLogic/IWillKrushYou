
local WRATH_GREEN_GEMS = {36917, 36929, 36920, 36932, 36923, 36926}
local WRATH_BLUE_GEMS = {36918, 36930, 36921, 36933, 36924, 36927}
local WRATH_PURPLE_GEMS = {36919, 36931, 36922, 36934, 36925, 36928}
local PANDA_GREEN_GEMS = {76136, 76130, 76134, 76137, 76133, 76135}
local PANDA_BLUE_GEMS = {76131, 76140, 76142, 76139, 76138, 76141}


local function gemavg(gems)
	local sum, skipped = 0, 0

	for _,id in pairs(gems) do
		local price = GetAuctionBuyout(id)
		if price and price > 0 then sum = sum + price else skipped = skipped + 1 end
	end

	return skipped < 6 and sum/(6 - skipped) or 0
end


local WrathGreenGemDEvalue
local function WrathGreenGemDE()
	-- All gems but green and purple have a 1 gem, 2 crystal earth recipe that can be DE'd
	-- 2x green + 2x purple + Eternal Earth == Jade Dagger Pendant (DE to a dream shard)
	if not WrathGreenGemDEvalue then
		local ROYB_DE = GetAuctionBuyout(34054) * 0.75 * 2 + GetAuctionBuyout(34056) * 0.22 * 1.5 + GetAuctionBuyout(34053) * 0.03
		local GP_DE = GetAuctionBuyout(34052)
		local cryst_earth = math.min(GetAuctionBuyout(37701), GetAuctionBuyout(35624)/10)
		WrathGreenGemDEvalue = (ROYB_DE + GP_DE - cryst_earth*12)/4
	end
	return WrathGreenGemDEvalue
end


local PandaGreenGemDEvalue
local function PandaGreenGemDE()
	-- Spend 3 gems, get a piece of DEable armor
	-- We get the ilvl 381-390 DE here:
	--   85% 1-4x Spirit Dust
	--   15%   1x Mysterious Essence
	-- wowhead says 1-9 and 1-4 though...
	if not PandaGreenGemDEvalue then
		local DE = GetAuctionBuyout(74249) * 0.85 * 2.5 + GetAuctionBuyout(74250) * 0.15
		PandaGreenGemDEvalue = DE/3
	end
	return PandaGreenGemDEvalue
end


-- Rates are the cumulative sum of all results divided by total prospects, from wowhead
-- Since this is the number of prospects that yield the item, not the number of items
-- received from the prospect, we have to multiply the result rate by the avearage yield
-- It is safe to assume that every quantity has equal frequency, so 2-5x is 3.5x avg
local   FEL_IRON_GREEN_RATE,   FEL_IRON_BLUE_RATE = 1.027, 0.060
local ADAMANTITE_GREEN_RATE, ADAMANTITE_BLUE_RATE = 1.100, 0.195
local     COBALT_GREEN_RATE,     COBALT_BLUE_RATE = 1.5*1.5, 0.074
local   SARONITE_GREEN_RATE,   SARONITE_BLUE_RATE = 1.1*1.5, 0.240
local   TITANIUM_GREEN_RATE,   TITANIUM_BLUE_RATE, TITANIUM_PURPLE_RATE, TITANIUM_DUST_RATE = 1.5, 0.25, 0.27, 0.58
local GHOST_IRON_GREEN_RATE, GHOST_IRON_BLUE_RATE, GHOST_IRON_SHARD_RATE = 1.415*1.5, 0.272, 0.802*1.5
local   KYPARITE_GREEN_RATE,   KYPARITE_BLUE_RATE,   KYPARITE_SHARD_RATE = 1.426*1.5, 0.275*1.5, 1.000*1.5
local   TRILLIUM_GREEN_RATE,   TRILLIUM_BLUE_RATE,   TRILLIUM_SHARD_RATE = 1.000*1.0, 0.750*1.0, 1.000*1.5
local function gemOutputValue(id)
end

local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	if link then
		local id = tonumber((link:match("item:(%d+):")))

		local deval = 0
		if     id == 36909 then deval = (WrathGreenGemDE() *     COBALT_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *     COBALT_BLUE_RATE)/5
		elseif id == 36912 then deval = (WrathGreenGemDE() *   SARONITE_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   SARONITE_BLUE_RATE)/5
		elseif id == 36910 then deval = (WrathGreenGemDE() *   TITANIUM_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   TITANIUM_BLUE_RATE + gemavg(WRATH_PURPLE_GEMS) * TITANIUM_PURPLE_RATE  + GetAuctionBuyout(46849) * TITANIUM_DUST_RATE)/5
		elseif id == 72092 then deval = (PandaGreenGemDE() * GHOST_IRON_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) * GHOST_IRON_BLUE_RATE)/5
		elseif id == 72093 then deval = (PandaGreenGemDE() *   KYPARITE_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   KYPARITE_BLUE_RATE)/5
		elseif id == 72094 then deval = (PandaGreenGemDE() *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE)/5
		elseif id == 72103 then deval = (PandaGreenGemDE() *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE)/5 end

		if deval and deval ~= 0 then frame:AddDoubleLine("Crush & DE value:", ns.GS(deval).."|cffffffff/ea") end

		if id == 44943 then
			local val = gemavg(WRATH_BLUE_GEMS) * 2.600 + (GetAuctionBuyout(42225) or 0) * 0.10
			frame:AddDoubleLine("Average value of contents:", ns.GS(val).."|cffffffff/ea")
		end
	end
	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function() WrathGreenGemDEvalue = nil end)
