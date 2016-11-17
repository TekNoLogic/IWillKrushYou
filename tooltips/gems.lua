
local myname, ns = ...


local function OnTooltipShown(self, message, frame, id)
	local val = ns.crush_values[id]
	if not val then return end
	if val == 0 then return end

	frame:AddDoubleLine("Average crush value:", ns.GS(val))
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
