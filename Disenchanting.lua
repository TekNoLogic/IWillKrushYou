
local myname, ns = ...


local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	local val = ns.de_values[link]
	local meanval = ns.de_means[link]

	if val ~= false and ns.de_probs[link] and ns.de_results[link] then
		frame:AddDoubleLine("Disenchant ("..ns.de_probs[link].."):", ns.de_results[link])
	end

	if val then
		frame:AddDoubleLine("Common DE Value:", val)
		if meanval then
			frame:AddDoubleLine("Average DE Value:", meanval)
		end
	end

	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
