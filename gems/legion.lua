
local myname, ns = ...


local LAYSTONE = 123918
local FELSLATE = 123919

-- These rates are the average number of gems obtained from prospecting ONE ore
-- Obtained via experimentation during patch 7.0.3
local LAYSTONE_GREEN_RATE = 12 / 200
local LAYSTONE_BLUE_RATE = 2 / 200
local LAYSTONE_CHIP_RATE = 40 / 200
local FELSLATE_GREEN_RATE = 48 / 200
local FELSLATE_BLUE_RATE = 8 / 200
local FELSLATE_CHIP_RATE = 40 / 200
local GREEN_GEMS = {130172, 130173, 130174, 130175, 130176, 130177}
local BLUE_GEMS = {130178, 130179, 130180, 130181, 130182, 130183}


local function AverageGemPrice(gems)
	local num = #gems
	local sum, skipped = 0, 0

	for _,id in pairs(gems) do
		local price = GetAuctionBuyout(id)
		if price and price > 0 then
			sum = sum + price
		else
			skipped = skipped + 1
		end
	end

	if skipped == num then return 0 end
	return sum/(num - skipped)
end


local avg_green
local function AverageGreenPrice()
	avg_green = avg_green or AverageGemPrice(GREEN_GEMS)
	return avg_green
end


local avg_blue
local function AverageBluePrice()
	avg_blue = avg_blue or AverageGemPrice(BLUE_GEMS)
	return avg_blue
end


local function GemChipPrice()
	return GetAuctionBuyout(129100) or 0
end


local lay_value
local function LaystoneOutputPrice()
	if lay_value then return lay_value end

	local green = AverageGreenPrice() * LAYSTONE_GREEN_RATE
	local blue  = AverageBluePrice()  * LAYSTONE_BLUE_RATE
	local chip  = GemChipPrice()      * LAYSTONE_CHIP_RATE
	lay_value = green + blue + chip
	return lay_value
end


local fel_value
local function FelslateOutputPrice()
	if fel_value then return fel_value end

	local green = AverageGreenPrice() * FELSLATE_GREEN_RATE
	local blue  = AverageBluePrice()  * FELSLATE_BLUE_RATE
	local chip  = GemChipPrice()      * FELSLATE_CHIP_RATE
	fel_value = green + blue + chip
	return fel_value
end


local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	if link then
		local id = tonumber((link:match("item:(%d+):")))

		local val = 0
		if     id == LAYSTONE then val = LaystoneOutputPrice()
		elseif id == FELSLATE then val = FelslateOutputPrice()
		end

		if val and val ~= 0 then
			frame:AddDoubleLine("Average crush value:", ns.GS(val))
			frame:AddDoubleLine("Average stack crush value:", ns.GS(val*200))
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
f:SetScript("OnEvent", function()
	avg_green = nil
	avg_blue = nil
end)
