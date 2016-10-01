
local myname, ns = ...


-- Draenor fish follow a simple formula:
--    Small fish x5 -> Flesh x5
--   Normal fish x5 -> Flesh x10
-- Enormous fish x5 -> Flesh x20
local flesh = [[
	Blind Lake Sturgeon
	111652 109140 1
	111667 109140 2
	111674 109140 4

	Blackwater Whiptail
	111662 109144 1
	111663 109144 2
	111670 109144 4
]]


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
