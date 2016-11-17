
local myname, ns = ...


local function OnTooltipShown(self, message, frame, id)
  if ns.bop_items[id] then
    local name = GetItemInfo(ns.bop_items[id]) or "<unknown>"
    frame:AddDoubleLine("Best trade-in:", name, nil,nil,nil, 1,1,1)
  end
	
	if ns.bop_values[id] then
		frame:AddDoubleLine("Trade-in value:", ns.GS(ns.bop_values[id]))
	end
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
