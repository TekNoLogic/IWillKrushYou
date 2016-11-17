
local myname, ns = ...


local origs = {}
local function OnTooltipSetItem(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local name, link = frame:GetItem()
	local id = link and ns.ids[link]
	if id then ns.SendMessage("_TOOLTIP_SHOWN", frame, id) end
	if origs[frame] then return origs[frame](frame, ...) end
end


for _,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
