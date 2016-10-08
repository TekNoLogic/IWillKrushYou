
local myname, ns = ...


local stacks = ns.NewMemoizingTable(function(id)
	local _, _, _, _, _, _, _, stack = GetItemInfo(id)
	return stack
end)


local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	if link then
		local id = tonumber((link:match("item:(%d+):")))
		local val = ns.crush_values[id]

		if val and val ~= 0 then
			frame:AddDoubleLine("Average crush value:", ns.GS(val))
			frame:AddDoubleLine("Average stack crush value:", ns.GS(val*stacks[id]))
		end
	end
	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
