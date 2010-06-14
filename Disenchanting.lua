
-- I am lazy, so I "borrowed" these constants from Enchantrix ^^
local VOID, NEXUS, ABYSS = 22450, 20725, 34057
local LRADIANT, SBRILLIANT, LBRILLIANT, SPRISMATIC, LPRISMATIC, LDREAM = 11178, 14343, 14344, 22448, 22449, 34052
local SGLIMMERING, LGLIMMERING, SGLOWING, LGLOWING, SRADIANT, SDREAM = 10978, 11084, 11138, 11139, 11177, 34053
local LNETHER, GNETHER, LETERNAL, GETERNAL, LPLANAR, GPLANAR, LCOSMIC, GCOSMIC = 11174, 11175, 16202, 16203, 22447, 22446, 34056, 34055
local LMAGIC, GMAGIC, LASTRAL, GASTRAL, LMYSTIC, GMYSTIC = 10938, 10939, 10998, 11082, 11134, 11135
local STRANGE, SOUL, VISION, DREAM, ILLUSION, ARCANE, INFINATE = 10940, 11083, 11137, 11176, 16204, 22445, 34054


local function GetUncommonVals(ilvl)
	if ilvl <= 15 then return       STRANGE, "1-2x", "80%", 1.5, .80,   LMAGIC, "1-2x", "20%", 1.5, .20
	elseif ilvl <= 20 then return   STRANGE, "2-3x", "75%", 2.5, .75,   GMAGIC, "1-2x", "20%", 1.5, .20, SGLIMMERING, "1x", "5%", 1, .05
	elseif ilvl <= 25 then return   STRANGE, "4-6x", "75%", 5.0, .75,  LASTRAL, "1-2x", "15%", 1.5, .15, SGLIMMERING, "1x", "10%", 1, .1
	elseif ilvl <= 30 then return      SOUL, "1-2x", "75%", 1.5, .75,  GASTRAL, "1-2x", "20%", 1.5, .20, LGLIMMERING, "1x", "5%", 1, .05
	elseif ilvl <= 35 then return      SOUL, "2-5x", "75%", 3.5, .75,  LMYSTIC, "1-2x", "20%", 1.5, .20,    SGLOWING, "1x", "5%", 1, .05
	elseif ilvl <= 40 then return    VISION, "1-2x", "75%", 1.5, .75,  GMYSTIC, "1-2x", "20%", 1.5, .20,    LGLOWING, "1x", "5%", 1, .05
	elseif ilvl <= 45 then return    VISION, "2-5x", "75%", 3.5, .75,  LNETHER, "1-2x", "20%", 1.5, .20,    SRADIANT, "1x", "5%", 1, .05
	elseif ilvl <= 50 then return     DREAM, "1-2x", "75%", 1.5, .75,  GNETHER, "1-2x", "20%", 1.5, .20,    LRADIANT, "1x", "5%", 1, .05
	elseif ilvl <= 55 then return     DREAM, "2-5x", "75%", 3.5, .75, LETERNAL, "1-2x", "20%", 1.5, .20,  SBRILLIANT, "1x", "5%", 1, .05
	elseif ilvl <= 60 then return  ILLUSION, "1-2x", "75%", 1.5, .75, GETERNAL, "1-2x", "20%", 1.5, .20,  LBRILLIANT, "1x", "5%", 1, .05
	elseif ilvl <= 65 then return  ILLUSION, "2-5x", "75%", 3.5, .75, GETERNAL, "2-3x", "20%", 2.5, .20,  LBRILLIANT, "1x", "5%", 1, .05
	elseif ilvl <= 80 then return    ARCANE, "2-3x", "75%", 2.5, .75,  LPLANAR, "1-2x", "22%", 1.5, .22,  SPRISMATIC, "1x", "3%", 1, .03
	elseif ilvl <= 99 then return    ARCANE, "2-3x", "75%", 2.5, .75,  LPLANAR, "2-3x", "22%", 2.5, .22,  SPRISMATIC, "1x", "3%", 1, .03
	elseif ilvl <= 120 then return   ARCANE, "2-5x", "75%", 3.5, .75,  GPLANAR, "1-2x", "22%", 1.5, .22,  LPRISMATIC, "1x", "3%", 1, .03
	elseif ilvl <= 151 then return INFINATE, "1-2x", "75%", 1.5, .75,  LCOSMIC, "1-2x", "22%", 1.5, .22,      SDREAM, "1x", "3%", 1, .03
	else return                    INFINATE, "2-5x", "75%", 3.5, .75,  GCOSMIC, "1-2x", "22%", 1.5, .22,      LDREAM, "1x", "3%", 1, .03 end
end


local function GetPossibleDisenchants(item)
	local _, link, qual, ilvl, _, itemtype = GetItemInfo(item)
	if not link or qual < 2 or (itemtype ~= "Weapon" and itemtype ~= "Armor") then return end

	if qual == 4 then -- Epic
		if ilvl > 75 and ilvl <= 80 and itemtype == "Weapon" then return NEXUS, "1-2x", "33%/66%", 5/3
		elseif ilvl <= 45  then return   SRADIANT, "2-4x",    "100%", 3.0, 1
		elseif ilvl <= 50  then return   LRADIANT, "2-4x",    "100%", 3.0, 1
		elseif ilvl <= 55  then return SBRILLIANT, "2-4x",    "100%", 3.0, 1
		elseif ilvl <= 60  then return      NEXUS,   "1x",    "100%", 1.0, 1
		elseif ilvl <= 80  then return      NEXUS, "1-2x",    "100%", 1.5, 1
		elseif ilvl <= 100 then return       VOID, "1-2x",    "100%", 1.5, 1
		elseif ilvl <= 164 then return       VOID, "1-2x", "33%/66%", 5/3, 1
		elseif ilvl <= 200 then return      ABYSS,   "1x",    "100%", 1.0, 1
		else return                         ABYSS, "1-2x",    "100%", 1.5, 1 end

	elseif qual == 3 then -- Rare
		local _, _, itemid = string.find(link, "item:(%d+):")
		itemid = tonumber(itemid)

		if     ilvl <=  25 then return SGLIMMERING, "1x",  "100%", 1, 1
		elseif ilvl <=  30 then return LGLIMMERING, "1x",  "100%", 1, 1
		elseif ilvl <=  35 then return    SGLOWING, "1x",  "100%", 1, 1
		elseif ilvl <=  40 then return    LGLOWING, "1x",  "100%", 1, 1
		elseif ilvl <=  45 then return    SRADIANT, "1x",  "100%", 1, 1
		elseif ilvl <=  50 then return    LRADIANT, "1x",  "100%", 1, 1
		elseif ilvl <=  55 then return  SBRILLIANT, "1x",  "100%", 1, 1
		elseif ilvl <=  65 then return  LBRILLIANT, "1x", "99.5%", 1, .995, NEXUS, "1x", "0.5%", 1, 0.005
		elseif ilvl <=  99 then return  SPRISMATIC, "1x", "99.5%", 1, .995, NEXUS, "1x", "0.5%", 1, 0.005
		elseif ilvl <= 120 then return  LPRISMATIC, "1x", "99.5%", 1, .995,  VOID, "1x", "0.5%", 1, 0.005
		elseif ilvl <= 165 then return      SDREAM, "1x", "99.5%", 1, .995, ABYSS, "1x", "0.5%", 1, 0.005
		else return                         LDREAM, "1x", "99.5%", 1, .995, ABYSS, "1x", "0.5%", 1, 0.005 end -- Not sure the exact numbers in Wrath yet, so we'll stick to the pattern

	elseif qual == 2 then -- Uncommon
		if itemtype == "Armor" then
			return GetUncommonVals(ilvl)
		elseif itemtype == "Weapon" then
			local r1i, r1ta, r1tp, r1a, r1p, r2i, r2ta, r2tp, r2a, r2p, r3i, r3ta, r3tp, r3a, r3p = GetUncommonVals(ilvl)
			return r1i, r1ta, r2tp, r1a, r2p, r2i, r2ta, r1tp, r2a, r1p, r3i, r3ta, r3tp, r3a, r3p
		end
	end
end



local GetItemInfo = GetItemInfo
local notDEable = {
	["32540"] = true,
	["32541"] = true,
	["18665"] = true,
	["21766"] = true,
	["5004"] = true,
	["20408"] = true,
	["20406"] = true,
	["20407"] = true,
	["14812"] = true,
	["31336"] = true,
	["32660"] = true,
	["32662"] = true,
	["11288"] = true,
	["11290"] = true,
	["12772"] = true,
	["11287"] = true,
	["11289"] = true,
	["29378"] = true,
}


local function DEable(link)
	local id = type(link) == "number" and link or select(3, link:find("item:(%d+):"))
	if id and notDEable[id] then return end

	local _, _, qual, itemLevel, _, itemType = GetItemInfo(link)
	return (itemType == "Armor" or itemType == "Weapon") and qual > 1 and qual < 5
end


local function GS(cash)
	if not cash then return end
	if cash > 999999 then return "|cffffd700".. floor(cash/10000) end

	cash = cash/100
	local s = floor(cash%100)
	local g = floor(cash/100)
	if g > 0 then return string.format("|cffffd700%d.|cffc7c7cf%02d", g, s)
	else return string.format("|cffc7c7cf%d", s) end
end


local results, probs, means = {}, {}, {}
local values = setmetatable({}, {
	__index = function(t, link)
		if not link then return end

		local name, _, qual, itemLevel, _, itemType, itemSubType, _, _, texture = GetItemInfo(link)

		if not name or not DEable(link) then
			t[link] = false
			return
		end

		local id1, qtytxt1, perctxt1, qty1, weight1, id2, qtytxt2, perctxt2, qty2, weight2, id3, _, _, qty3, weight3 = GetPossibleDisenchants(link)
		if not id1 then return end
		local bo1, bo2, bo3 = GetAuctionBuyout(id1), id2 and GetAuctionBuyout(id2), id3 and GetAuctionBuyout(id3)
		if not bo1 or (id2 and not bo2) or (id3 and not bo3) then return end
		means[link] = (qty1*weight1*bo1 or 0) + (bo2 and qty2*weight2*bo2 or 0) + (bo3 and qty3*weight3*bo3 or 0)
		local mode = GS(qty1*bo1)

		if qual == 2 and itemType == "Weapon" then id1, qtytxt1, perctxt1 = id2, qtytxt2, perctxt2 end
		results[link] = qtytxt1.." "..select(2, GetItemInfo(id1))
		probs[link] = perctxt1

		val = string.format("%s (%s \206\188)", mode, GS(means[link]))
		t[link] = val
		return val
	end,
})
PANDATAGS_DE_VALS, PANDATAGS_DE_VALS2 = values, means


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function() for i in pairs(values) do values[i] = nil end end)

local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	local val = values[link]
	if val and val ~= 0 then
		frame:AddDoubleLine("Disenchant ("..(probs[link] or "???").."):", results[link] or "???")
		frame:AddDoubleLine("Estimated DE Value:", val)
	end
	if link and link:match("item:34057") then
		local val = GetAuctionBuyout(34054) * 9 * .45 + GetAuctionBuyout(34055) * 3.5 * .55
		frame:AddDoubleLine("Shatter Value:", GS(val))
	end
	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end
