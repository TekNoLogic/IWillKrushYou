
local myname, ns = ...
local GetItemInfo = GetItemInfo


local values = setmetatable({}, {
	__index = function(t, link)
		if not link or not GetItemInfo(link) then return end

		if not ns.DEable(link) then
			t[link] = false
			return
		end

		local id, _, _, qty = ns.GetPossibleDisenchants(link)

		local bo1 = id and GetAuctionBuyout(id)
		if not bo1 then return end

		local val = ns.GS(qty*bo1)
		t[link] = val
		return val
	end,
})


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function() for i in pairs(values) do values[i] = nil end end)

local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	local val = values[link]
	local meanval = ns.de_means[link]

	if val ~= false and ns.de_probs[link] and ns.de_results[link] then
		frame:AddDoubleLine("Disenchant ("..ns.de_probs[link].."):", ns.de_results[link])
	end

	if val then
		frame:AddDoubleLine("Common DE Value:", val)
		if meanval then
			frame:AddDoubleLine("Average DE Value:", meanval)
		end
	end

	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
