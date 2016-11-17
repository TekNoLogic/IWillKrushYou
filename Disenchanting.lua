
local myname, ns = ...
local GetItemInfo = GetItemInfo


local results, probs, means = {}, {}, {}
local values = setmetatable({}, {
	__index = function(t, link)
		if not link or not GetItemInfo(link) then return end

		if not ns.DEable(link) then
			t[link] = false
			return
		end

		local id1, qtytxt1, perctxt1, qty1, weight1, id2, _, _, qty2, weight2,
			id3, _, _, qty3, weight3 = ns.GetPossibleDisenchants(link)
		if not id1 then return end

		local bo1 = GetAuctionBuyout(id1)
		local bo2 = id2 and GetAuctionBuyout(id2)
		local bo3 = id3 and GetAuctionBuyout(id3)

		assert(select(2, GetItemInfo(id1)), "No link found for id ".. id1.. " on item "..link)
		assert(qtytxt1, "No qtytext found for ".. link)
		results[link] = qtytxt1.." "..select(2, GetItemInfo(id1))
		probs[link] = perctxt1

		if bo1 then
			local val = ns.GS(qty1*bo1)
			t[link] = val
			return val
		end
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

	if val ~= false and probs[link] and results[link] then
		frame:AddDoubleLine("Disenchant ("..probs[link].."):", results[link])
	end

	if val then
		frame:AddDoubleLine("Common DE Value:", val)
		if meanval then
			frame:AddDoubleLine("Average DE Value:", meanval)
		end
	end

	if link and link:match("item:34057") then
		local val = GetAuctionBuyout(34054) * 9 * .45 + GetAuctionBuyout(34055) * 3.5 * .55
		frame:AddDoubleLine("Shatter Value:", ns.GS(val))
	end

	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
