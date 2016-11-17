

local myname, ns = ...


local function GetDEProbability(link)
	if not link or not GetItemInfo(link) then return end
	if not ns.DEable(link) then return false end

	local id, _, txt = ns.GetPossibleDisenchants(link)
	if not id then return end

	return txt
end


ns.de_probs = ns.NewMemoizingTable(GetDEProbability)
