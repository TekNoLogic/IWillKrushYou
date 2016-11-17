
local myname, ns = ...


-- This function handles the heavy lifting via recursion
local function CalculateMean(id, _, _, qty, weight, next_id, ...)
	if not id then return end

	-- If we don't get a buyout price, we should return nil to end the calc
	local price = GetAuctionBuyout(id)
	if not price then return end

	local weighted_price = price * qty * weight

	-- If there are no more args then we can return our price
	if not next_id then return weighted_price end

	-- If we have more args, but they return back nil, then we don't have a
	-- complete price and we should return nil
	local remainder = CalculateMean(next_id, ...)
	if not remainder then return end

	-- Everything went great, add our price to the rest and return that
	return weighted_price + remainder
end


local function GetDEMeanValue(link)
	if not link or not GetItemInfo(link) then return end
	if not ns.DEable(link) then return false end

	local mean = CalculateMean(ns.GetPossibleDisenchants(link))
	if not mean then return end

	return ns.GS(mean)
end


ns.de_means = ns.NewMemoizingTable(GetDEMeanValue)


local function OnAuctionItemListUpdate()
	ns.Wipe(ns.de_means)
end


ns.RegisterCallback("AUCTION_ITEM_LIST_UPDATE", OnAuctionItemListUpdate)
