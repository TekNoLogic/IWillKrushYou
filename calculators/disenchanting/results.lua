

local myname, ns = ...


local function GetDEResult(link)
	if not link or not GetItemInfo(link) then return end
	if not ns.DEable(link) then return false end

	local id, qtytxt = ns.GetPossibleDisenchants(link)
	if not id then return end

	local _, result_link = GetItemInfo(id)
	assert(result_link, "No link found for id ".. id.. " on item "..link)
	assert(qtytxt, "No qtytext found for ".. link)

	return qtytxt.. " ".. result_link
end


ns.de_results = ns.NewMemoizingTable(GetDEResult)
