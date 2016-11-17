
local myname, ns = ...


local stacks = ns.NewMemoizingTable(function(id)
	local _, _, _, _, _, _, _, stack = GetItemInfo(id)
	return stack
end)


local function OnTooltipShown(self, message, frame, id)
	local val = ns.crush_values[id]
	if not val then return end
	if val == 0 then return end

	frame:AddDoubleLine("Average crush value:", ns.GS(val))
	frame:AddDoubleLine("Average stack crush value:", ns.GS(val*stacks[id]))
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
