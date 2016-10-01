﻿
local myname, ns = ...


-- Draenor fish follow a simple formula:
--    Small fish x5 -> Flesh x5
--   Normal fish x5 -> Flesh x10
-- Enormous fish x5 -> Flesh x20
local flesh = [[
	Jawless Skulker
	111650 109138 1
	111669 109138 2
	111676 109138 4

	Fat Sleeper
	111651 109139 1
	111668 109139 2
	111675 109139 4

	Blind Lake Sturgeon
	111652 109140 1
	111667 109140 2
	111674 109140 4

	Fire Ammonite
	111656 109141 1
	111666 109141 2
	111673 109141 4

	Sea Scorpion
	111658 109142 1
	111665 109142 2
	111672 109142 4

	Abysal Gulper Eel
	111659 109143 1
	111664 109143 2
	111671 109143 4

	Blackwater Whiptail
	111662 109144 1
	111663 109144 2
	111670 109144 4
]]



-- Crescent sabrefish
-- 109137

local function GetFilletedPrice(id)
	local flesh_id, qty = flesh:match(id.." (%d+) (%d)")
	if not flesh_id then return false end

	local price = GetAuctionBuyout(tonumber(flesh_id))
	if not price then return end

	return ns.GS(price * tonumber(qty))
end


local values = setmetatable({}, {
	__index = function(t, link)
		local id = ns.ids[link]
		if not id then
			t[link] = false
			return false
		end

		local v = GetFilletedPrice(id)
		t[link] = v
		return v
	end
})


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function() wipe(values) end)


local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	local val = values[link]

	if val then
		frame:AddDoubleLine("Fillet value:", val)
	end

	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
