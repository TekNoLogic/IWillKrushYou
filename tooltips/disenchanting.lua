
local myname, ns = ...


local function OnTooltipShown(self, message, frame, id)
  local val = ns.de_values[link]
  if not val then return end

  local prob, result = ns.de_probs[link], ns.de_results[link]
	if prob and result then
		frame:AddDoubleLine("Disenchant ("..prob.."):", result)
	end

	frame:AddDoubleLine("Common DE Value:", val)
	if ns.de_means[link] then
		frame:AddDoubleLine("Average DE Value:", ns.de_means[link])
	end
end


ns.RegisterCallback("_TOOLTIP_SHOWN", OnTooltipShown)
