
local myname, ns = ...


local function AveragePrice(ids)
	local num = #ids
	local sum, skipped = 0, 0

	for _,id in pairs(ids) do
		local price = GetAuctionBuyout(id)
		if price and price > 0 then
			sum = sum + price
		else
			skipped = skipped + 1
		end
	end

	if skipped == num then return 0 end
	return sum/(num - skipped)
end


local prices = ns.NewMemoizingTable(function(i)
	local t = type(i)
	if t == "table" then return AveragePrice(i) end
	if t == "number" then return GetAuctionBuyout(i) or 0 end
	return 0
end)


local function ComputeValue(result, multiplier, ...)
	local v = prices[result] * multiplier
	if select("#", ...) == 0 then
		return v
	else
		return v + ComputeValue(...)
	end
end


ns.prospecting_funcs = {}
ns.crush_values = ns.NewMemoizingTable(function(i)
	local f = ns.prospecting_funcs[i]
	if f then
		return ComputeValue(f())
	else
		return false
	end
end)


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function()
	wipe(crush_values)
	wipe(prices)
end)
