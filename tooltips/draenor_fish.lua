
local myname, ns = ...


local function OnTooltipShown(self, message, frame, id)
	local val = ns.draenor_fish[id]
	if not val then return end

	frame:AddDoubleLine("Fillet value:", val)
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
