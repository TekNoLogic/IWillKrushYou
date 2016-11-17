
local myname, ns = ...


local function OnTooltipShown(self, message, frame, id)
  local val = ns.de_values[id]
  if not val then return end

  local prob, result = ns.de_probs[id], ns.de_results[id]
	if prob and result then
		frame:AddDoubleLine("Disenchant ("..prob.."):", result)
	end

	frame:AddDoubleLine("Common DE Value:", val)
	if ns.de_means[id] then
		frame:AddDoubleLine("Average DE Value:", ns.de_means[id])
	end
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
