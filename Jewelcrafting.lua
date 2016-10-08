
local WRATH_GREEN_GEMS = {36917, 36929, 36920, 36932, 36923, 36926}
local WRATH_BLUE_GEMS = {36918, 36930, 36921, 36933, 36924, 36927}
local WRATH_PURPLE_GEMS = {36919, 36931, 36922, 36934, 36925, 36928}
local CAT_GREEN_GEMS = {52177, 52181, 52179, 52182, 52178, 52180}
local CAT_BLUE_GEMS = {52190, 52193, 52195, 52192, 52191, 52194}
local PANDA_GREEN_GEMS = {76136, 76130, 76134, 76137, 76133, 76135}
local PANDA_BLUE_GEMS = {76131, 76140, 76142, 76139, 76138, 76141}
local CUTS = {
	[23077] = {23094, 23095, 23097, 23096, 28595},
	[21929] = {23098, 23099, 23100, 23101, 31866, 31869},
	[23112] = {23113, 23114, 23115, 23116, 28290, 31860},
	[23079] = {23103, 23104, 23105, 23106},
	[23117] = {23118, 23119, 23120, 23121},
	[23107] = {23108, 23109, 23110, 23111, 31862, 31864},
	[23436] = {24027, 24028, 24029, 24030, 24031, 24032, 24036},
	[23439] = {24058, 24059, 24060, 24061, 31867, 31868, 35316},
	[23440] = {24047, 24048, 24050, 24051, 24052, 24053, 31861, 35315},
	[23437] = {24062, 24065, 24066, 24067, 33782, 35318},
	[23438] = {24033, 24035, 24037, 24039},
	[23441] = {24054, 24055, 24056, 24057, 31863, 31865, 35707},
	[24478] = {32833},
	[24479] = {32836},
	[25867] = {25896, 25897, 25898, 25899, 25901, 32409, 35501},
	[25868] = {25890, 25893, 25894, 25895, 32410, 34220, 35503},
	[32227] = {32193, 32194, 32195, 32196, 32197, 32198, 32199},
	[32231] = {32217, 32218, 32219, 32220, 32221, 32222, 35760},
	[32229] = {32204, 32205, 32206, 32207, 32208, 32209, 32210, 35761},
	[32249] = {32223, 32224, 32225, 32226, 35758, 35759},
	[32228] = {32200, 32201, 32202, 32203},
	[32230] = {32211, 32212, 32213, 32214, 32215, 32216},
	[36917] = {39900, 39905, 39906, 39907, 39908, 39909, 39910, 39911},
	[36929] = {39946, 39947, 39948, 39949, 39950, 39951, 39952, 39953, 39954, 39955, 39956, 39957, 39958, 39959, 39960, 39961, 39962, 39963, 39964, 39965, 39966, 39967},
	[36920] = {39912, 39914, 39915, 39916, 39917, 39918},
	[36932] = {39982, 39968, 39974, 39975, 39976, 39977, 39978, 39979, 39980, 39981, 39983, 39984, 39985, 39986, 39988, 39989, 39990, 39991, 39992},
	[36923] = {39919, 39920, 39927, 39932},
	[36926] = {39933, 39934, 39935, 39936, 39937, 39938, 39939, 39940, 39941, 39942, 39943, 39944, 39945},
	[36918] = {39996, 39997, 39998, 39999, 40000, 40001, 40002, 40003},
  [36930] = {40037, 40038, 40039, 40040, 40041, 40043, 40044, 40045, 40046, 40047, 40048, 40049, 40050, 40051, 40052, 40053, 40054, 40055, 40056, 40057, 40058, 40059},
  [36921] = {40012, 40016, 40017, 40014, 40013, 40015},
  [36933] = {40085, 40086, 40088, 40089, 40090, 40091, 40092, 40094, 40095, 40096, 40098, 40099, 40100, 40101, 40102, 40103, 40104, 40105, 40106},
  [36924] = {40008, 40009, 40010, 40011},
  [36927] = {40022, 40023, 40024, 40025, 40026, 40027, 40028, 40029, 40030, 40031, 40032, 40033, 40034},
	[36919] = {40111, 40112, 40113, 40115, 40116, 40117, 40118, 40118},
	[36931] = {40142, 40143, 40144, 40145, 40146, 40147, 40148, 40149, 40150, 40151, 40152, 40153, 40154, 40155, 40156, 40157, 40158, 40159, 40160, 40161, 40162, 40163},
	[36922] = {40123, 40124, 40125, 40126, 40127, 40128},
	[36934] = {40164, 40165, 40166, 40167, 40168, 40169, 40170, 40171, 40172, 40173, 40174, 40175, 40176, 40177, 40178, 40179},
	[36925] = {40119, 40120, 40121, 40122},
	[36928] = {40129, 40130, 40131, 40132, 40133, 40134, 40135, 40136, 40137, 40138, 40139, 40140, 40141, 40180, 40181, 40182},
	[76136] = {76560, 76562, 76561, 76563, 76564},
	[76130] = {76534, 76530, 76533, 76532, 76531, 76529, 76528, 76535, 76536, 76545, 76544, 76543, 76542, 76541, 76539, 76538, 76527, 76526, 76540, 76546, 76547},
	[76134] = {76566, 76567, 76565, 76568, 76569},
	[76137] = {76525, 76510, 76523, 76508, 76509, 76511, 76512, 76513, 76514, 76517, 76518, 76519, 76520, 76521, 76522, 76507, 76515, 76524},
	[76133] = {76506, 76504, 76505, 76502},
	[76135] = {76556, 76555, 76553, 76552, 76551, 76549, 76548, 76554, 76550, 76559, 76558, 76557, 89678, 89675},
	[76131] = {76693, 76692, 76694, 76695, 76696},
	[76140] = {76675, 76663, 76661, 76660, 76659, 76658, 76677, 76678, 76679, 76676, 76662, 76664, 76674, 76673, 76672, 76670, 76669, 76668, 76667, 76666, 76665, 76671},
	[76142] = {76701, 76697, 76698, 76699, 76700},
	[76139] = {76647, 76651, 76652, 76653, 76654, 76655, 76656, 76657, 76648, 76649, 76650, 76646, 76645, 76644, 76643, 76641, 76640, 76642},
	[76138] = {76636, 76637, 76638, 76639},
	[76141] = {76680, 76681, 89680, 89674, 76691, 76690, 76689, 76687, 76688, 76686, 76685, 76684, 76683, 76682},
}

local function GS(cash)
	if not cash then return end
	if cash > 999999 then return "|cffffd700".. floor(cash/10000) end

	cash = cash/100
	local s = floor(cash%100)
	local g = floor(cash/100)
	if g > 0 then return string.format("|cffffd700%d.|cffc7c7cf%02d", g, s)
	else return string.format("|cffc7c7cf%d", s) end
end


local values = setmetatable({}, {
	__index = function(t, link)
		if not link then return end
		local id = tonumber((link:match("item:(%d+):")))
		if not id or not CUTS[id] then return end

		local val, count = 0, 0
		for _,cutid in pairs(CUTS[id]) do
			local sell = GetAuctionBuyout(cutid)
			if sell and sell > 0 then val, count = val + sell, count + 1 end
		end
		if count > 0 then
			local base_ah = GetAuctionBuyout(id)
			if base_ah then
				val = string.format("%s |cffffffff(%.2f%% profit)", GS(val/count), ((val/count)/base_ah - 1) * 100)
			else
				val = GS(val/count)
			end
			t[link] = val
			return val
		end
	end,
})


local function gemavg(gems)
	local sum, skipped = 0, 0

	for _,id in pairs(gems) do
		local price = GetAuctionBuyout(id)
		if price and price > 0 then sum = sum + price else skipped = skipped + 1 end
	end

	return skipped < 6 and sum/(6 - skipped) or 0
end


local WrathGreenGemDEvalue
local function WrathGreenGemDE()
	-- All gems but green and purple have a 1 gem, 2 crystal earth recipe that can be DE'd
	-- 2x green + 2x purple + Eternal Earth == Jade Dagger Pendant (DE to a dream shard)
	if not WrathGreenGemDEvalue then
		local ROYB_DE = GetAuctionBuyout(34054) * 0.75 * 2 + GetAuctionBuyout(34056) * 0.22 * 1.5 + GetAuctionBuyout(34053) * 0.03
		local GP_DE = GetAuctionBuyout(34052)
		local cryst_earth = math.min(GetAuctionBuyout(37701), GetAuctionBuyout(35624)/10)
		WrathGreenGemDEvalue = (ROYB_DE + GP_DE - cryst_earth*12)/4
	end
	return WrathGreenGemDEvalue
end


local PandaGreenGemDEvalue
local function PandaGreenGemDE()
	-- Spend 3 gems, get a piece of DEable armor
	-- We get the ilvl 381-390 DE here:
	--   85% 1-4x Spirit Dust
	--   15%   1x Mysterious Essence
	-- wowhead says 1-9 and 1-4 though...
	if not PandaGreenGemDEvalue then
		local DE = GetAuctionBuyout(74249) * 0.85 * 2.5 + GetAuctionBuyout(74250) * 0.15
		PandaGreenGemDEvalue = DE/3
	end
	return PandaGreenGemDEvalue
end


-- Rates are the cumulative sum of all results divided by total prospects, from wowhead
-- Since this is the number of prospects that yield the item, not the number of items
-- received from the prospect, we have to multiply the result rate by the avearage yield
-- It is safe to assume that every quantity has equal frequency, so 2-5x is 3.5x avg
local   FEL_IRON_GREEN_RATE,   FEL_IRON_BLUE_RATE = 1.027, 0.060
local ADAMANTITE_GREEN_RATE, ADAMANTITE_BLUE_RATE = 1.100, 0.195
local     COBALT_GREEN_RATE,     COBALT_BLUE_RATE = 1.5*1.5, 0.074
local   SARONITE_GREEN_RATE,   SARONITE_BLUE_RATE = 1.1*1.5, 0.240
local   TITANIUM_GREEN_RATE,   TITANIUM_BLUE_RATE, TITANIUM_PURPLE_RATE, TITANIUM_DUST_RATE = 1.5, 0.25, 0.27, 0.58
local   OBSIDIUM_GREEN_RATE,   OBSIDIUM_BLUE_RATE = 1.415*1.5, 0.075
local ELEMENTIUM_GREEN_RATE, ELEMENTIUM_BLUE_RATE = 1.082*1.5, 0.269
local     PYRITE_GREEN_RATE,     PYRITE_BLUE_RATE = 1.000, 0.450*1.5
local GHOST_IRON_GREEN_RATE, GHOST_IRON_BLUE_RATE, GHOST_IRON_SHARD_RATE = 1.415*1.5, 0.272, 0.802*1.5
local   KYPARITE_GREEN_RATE,   KYPARITE_BLUE_RATE,   KYPARITE_SHARD_RATE = 1.426*1.5, 0.275*1.5, 1.000*1.5
local   TRILLIUM_GREEN_RATE,   TRILLIUM_BLUE_RATE,   TRILLIUM_SHARD_RATE = 1.000*1.0, 0.750*1.0, 1.000*1.5
local function gemOutputValue(id)
	if     id == 36909 then return gemavg(WRATH_GREEN_GEMS) *     COBALT_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *     COBALT_BLUE_RATE
	elseif id == 36912 then return gemavg(WRATH_GREEN_GEMS) *   SARONITE_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   SARONITE_BLUE_RATE
	elseif id == 36910 then return gemavg(WRATH_GREEN_GEMS) *   TITANIUM_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   TITANIUM_BLUE_RATE
	elseif id == 53038 then return gemavg(CAT_GREEN_GEMS)   *   OBSIDIUM_GREEN_RATE + gemavg(CAT_BLUE_GEMS)   *   OBSIDIUM_BLUE_RATE
	elseif id == 52185 then return gemavg(CAT_GREEN_GEMS)   * ELEMENTIUM_GREEN_RATE + gemavg(CAT_BLUE_GEMS)   * ELEMENTIUM_BLUE_RATE
	elseif id == 52183 then return gemavg(CAT_GREEN_GEMS)   *     PYRITE_GREEN_RATE + gemavg(CAT_BLUE_GEMS)   *     PYRITE_BLUE_RATE
	elseif id == 72092 then return gemavg(PANDA_GREEN_GEMS) * GHOST_IRON_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) * GHOST_IRON_BLUE_RATE
	elseif id == 72093 then return gemavg(PANDA_GREEN_GEMS) *   KYPARITE_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   KYPARITE_BLUE_RATE
	elseif id == 72094 then return gemavg(PANDA_GREEN_GEMS) *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE
	elseif id == 72103 then return gemavg(PANDA_GREEN_GEMS) *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE end
end

local function sparkShardValue()
	local eye = GetAuctionBuyout(76734)
	if eye then return eye/10
	else return GetAuctionBuyout(90407) or 0 end
end

-- IDs of ores that don't need extra calculations factored in
local simpleCalcs = {
	[36909] = true,
	[36912] = true,
	[53038] = true,
	[52185] = true,
}
local origs = {}
local OnTooltipSetItem = function(frame, ...)
	assert(frame, "arg 1 is nil, someone isn't hooking correctly")

	local _, link = frame:GetItem()
	if link then
		local val = values[link]
		if val and val ~= 0 then
			frame:AddDoubleLine("Average cut value:", val)
		else
			local id = tonumber((link:match("item:(%d+):")))

			local val = 0
			local outputval = gemOutputValue(id)
			if simpleCalcs[id] then val = outputval * 4
			elseif id == 36910 then val = (outputval + gemavg(WRATH_PURPLE_GEMS) * TITANIUM_PURPLE_RATE + GetAuctionBuyout(46849) * TITANIUM_DUST_RATE) * 4
			elseif id == 52183 then val = (outputval + GetAuctionBuyout(52327)) * 4
			elseif id == 72092 then val = (outputval + sparkShardValue() * GHOST_IRON_SHARD_RATE) * 4
			elseif id == 72093 then val = (outputval + sparkShardValue() *   KYPARITE_SHARD_RATE) * 4
			elseif id == 72094 then val = (outputval + sparkShardValue() *   TRILLIUM_SHARD_RATE) * 4
			elseif id == 72103 then val = (outputval + sparkShardValue() *   TRILLIUM_SHARD_RATE) * 4 end

			local deval = 0
			if     id == 36909 then deval = (WrathGreenGemDE() *     COBALT_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *     COBALT_BLUE_RATE)/5
			elseif id == 36912 then deval = (WrathGreenGemDE() *   SARONITE_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   SARONITE_BLUE_RATE)/5
			elseif id == 36910 then deval = (WrathGreenGemDE() *   TITANIUM_GREEN_RATE + gemavg(WRATH_BLUE_GEMS) *   TITANIUM_BLUE_RATE + gemavg(WRATH_PURPLE_GEMS) * TITANIUM_PURPLE_RATE  + GetAuctionBuyout(46849) * TITANIUM_DUST_RATE)/5
			elseif id == 72092 then deval = (PandaGreenGemDE() * GHOST_IRON_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) * GHOST_IRON_BLUE_RATE)/5
			elseif id == 72093 then deval = (PandaGreenGemDE() *   KYPARITE_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   KYPARITE_BLUE_RATE)/5
			elseif id == 72094 then deval = (PandaGreenGemDE() *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE)/5
			elseif id == 72103 then deval = (PandaGreenGemDE() *   TRILLIUM_GREEN_RATE + gemavg(PANDA_BLUE_GEMS) *   TRILLIUM_BLUE_RATE)/5 end

			if val and val ~= 0 then frame:AddDoubleLine("Average crush value:", GS(val/20).."|cffffffff/ea - "..GS(val).."|cffffffff/stk") end
			if deval and deval ~= 0 then frame:AddDoubleLine("Crush & DE value:", GS(deval).."|cffffffff/ea") end

			if id == 44943 then
				local val = gemavg(WRATH_BLUE_GEMS) * 2.600 + (GetAuctionBuyout(42225) or 0) * 0.10
				frame:AddDoubleLine("Average value of contents:", GS(val).."|cffffffff/ea")
			end
		end
	end
	if origs[frame] then return origs[frame](frame, ...) end
end

for i,frame in pairs{GameTooltip, ItemRefTooltip} do
	origs[frame] = frame:GetScript("OnTooltipSetItem")
	frame:SetScript("OnTooltipSetItem", OnTooltipSetItem)
end


local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
f:SetScript("OnEvent", function() for i in pairs(values) do values[i] = nil end; WrathGreenGemDEvalue = nil end)
