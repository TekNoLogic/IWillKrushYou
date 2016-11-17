

local myname, ns = ...


local function GetDECommonResult(link)
	if not link or not GetItemInfo(link) then return end
	if not ns.DEable(link) then return false end

	local id, _, _, qty = ns.GetPossibleDisenchants(link)

	local price = id and GetAuctionBuyout(id)
	if not price then return end

	return ns.GS(price * qty)
end


ns.de_values = ns.NewMemoizingTable(GetDECommonResult)


local function OnAuctionItemListUpdate()
	ns.Wipe(ns.de_values)
end


ns.RegisterCallback("AUCTION_ITEM_LIST_UPDATE", OnAuctionItemListUpdate)
