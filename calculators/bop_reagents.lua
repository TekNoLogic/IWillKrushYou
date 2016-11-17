
local myname, ns = ...


local PRIMAL_SPIRIT = 120945
local BLOOD_OF_SARGERAS = 124124
local PRIMAL_TRADES = {
  [108996] = 1/5,  -- Alchemical Catalyst
  [113261] = 1/15, -- Sorcerous Fire
  [113262] = 1/15, -- Sorcerous Water
  [113263] = 1/15, -- Sorcerous Earth
  [113264] = 1/15, -- Sorcerous Air
  [118472] = 1/25, -- Savage Blood
  [127759] = 1/25, -- Felblight
}
local BLOOD_TRADES = {
  [123918] = 10, -- Leystone Ore
  [123919] =  5, -- Felslate
  [124101] = 10, -- Aethril
  [124102] = 10, -- Dreamleaf
  [124103] = 10, -- Foxflower
  [124104] = 10, -- Fjarnskaggl
  [124105] =  3, -- Starlight Rose
  [124107] = 10, -- Cursed Queenfish
  [124108] = 10, -- Mossgill Perch
  [124109] = 10, -- Highmountain Salmon
  [124110] = 10, -- Stormray
  [124111] = 10, -- Runescale Koi
  [124112] = 10, -- Black Barracuda
  [124113] = 10, -- Stonehide Leather
  [124115] = 10, -- Stormscale
  [124117] = 10, -- Lean Shank
  [124118] = 10, -- Fatty Bearsteak
  [124119] = 10, -- Big Gamy Ribs
  [124120] = 10, -- Leyblood
  [124121] = 10, -- Wildfowl Egg
  [124437] = 10, -- Shal'dorei Silk
  [124438] = 20, -- Unbroken Claw
  [124439] = 20, -- Unbroken Tooth
  [124440] = 10, -- Arkhana
  [124441] =  3, -- Leylight Shard
}
local TRADES = {
  [PRIMAL_SPIRIT] = PRIMAL_TRADES,
  [BLOOD_OF_SARGERAS] = BLOOD_TRADES,
}


local function GetBestTrade(trades)
  local best_price = 0
  local best_id
  for item_id,count in pairs(trades) do
    local price = GetAuctionBuyout and GetAuctionBuyout(item_id)
    if price and best_price < (price * count) then
      best_id = item_id
      best_price = price * count
    end
  end

  return best_id, best_price
end


local function GetBestPrice(trades)
  local best_id, best_price = GetBestTrade(trades)
  return best_price
end


ns.bop_values = ns.NewMemoizingTable(function(id)
  if TRADES[id] then return GetBestPrice(TRADES[id]) end
  return false
end)


ns.bop_items = ns.NewMemoizingTable(function(id)
  if TRADES[id] then return GetBestTrade(TRADES[id]) end
  return false
end)


local function Wipe(t)
  for i,v in pairs(t) do
    if v ~= false then t[i] = nil end
  end
end


local function OnAuctionItemListUpdate()
	Wipe(ns.bop_values)
	Wipe(ns.bop_items)
end


ns.RegisterCallback("AUCTION_ITEM_LIST_UPDATE", OnAuctionItemListUpdate)
