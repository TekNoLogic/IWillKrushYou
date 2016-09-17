
local myname, ns = ...
local GetItemInfo = GetItemInfo


local function GS(cash)
	if not cash then return end
	if cash > 999999 then return "|cffffd700".. floor(cash/10000) end

	cash = cash/100
	local s = floor(cash%100)
	local g = floor(cash/100)
	if g > 0 then return string.format("|cffffd700%d.|cffc7c7cf%02d", g, s)
	else return string.format("|cffc7c7cf%d", s) end
end


local results, probs, means = {}, {}, {}
local values = setmetatable({}, {
	__index = function(t, link)
		if not link then return end

		local name, _, qual, itemLevel, _, itemType, itemSubType, _, _, texture = GetItemInfo(link)

		if not name or not ns.DEable(link) then
			t[link] = false
			return
		end

		local id1, qtytxt1, perctxt1, qty1, weight1, id2, qtytxt2, perctxt2, qty2,
			weight2, id3, _, _, qty3, weight3 = ns.GetPossibleDisenchants(link)
		if not id1 then return end

		local bo1 = GetAuctionBuyout(id1)
		local bo2 = id2 and GetAuctionBuyout(id2)
		local bo3 = id3 and GetAuctionBuyout(id3)

		if bo1 and (bo2 or not id2) and (bo3 or not id3) then
			local val1 = qty1 * weight1 * bo1
			local val2 = bo2 and qty2 * weight2 * bo2 or 0
			local val3 = bo3 and qty3 * weight3 * bo3 or 0
			means[link] = GS(val1 + val2 + val3)
		end

		-- We need to flip for low level weapons, so we get the common item
		if qual == 2 and itemType == "Weapon" and itemLevel < 380 then
			qty1, bo1, id1, qtytxt1, perctxt1 = qty2, bo2, id2, qtytxt2, perctxt2
		end
		assert(qtytxt1, "No qtytext found for ".. link)
		assert(select(2, GetItemInfo(id1)), "No link found for id ".. id1.. " on item "..link)
		results[link] = qtytxt1.." "..select(2, GetItemInfo(id1))
		probs[link] = perctxt1

		if bo1 then
			local val = GS(qty1*bo1)
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
	local meanval = means[link]

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
		frame:AddDoubleLine("Shatter Value:", GS(val))
	end

	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
