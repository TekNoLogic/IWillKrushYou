
local myname, ns = ...


local LAYSTONE = 123918
local FELSLATE = 123919
local GEM_CHIP = 129100

-- These rates are the average number of gems obtained from prospecting ONE ore
-- Obtained via experimentation during patch 7.0.3
-- Felslate updated with data from 7.1
local LAYSTONE_GREEN_RATE = 12 / 200
local LAYSTONE_BLUE_RATE = 1.5 / 200
local LAYSTONE_CHIP_RATE = 40 / 200
local FELSLATE_GREEN_RATE = 45 / 200
local FELSLATE_BLUE_RATE = 7 / 200
local FELSLATE_CHIP_RATE = 40 / 200
local GREEN_GEMS = {130172, 130173, 130174, 130175, 130176, 130177}
local BLUE_GEMS = {130178, 130179, 130180, 130181, 130182, 130183}


ns.prospecting_funcs[LAYSTONE] = function()
	return
		GREEN_GEMS, LAYSTONE_GREEN_RATE,
		BLUE_GEMS,  LAYSTONE_BLUE_RATE,
		GEM_CHIP,   LAYSTONE_CHIP_RATE
end


ns.prospecting_funcs[FELSLATE] = function()
	return
		GREEN_GEMS, FELSLATE_GREEN_RATE,
		BLUE_GEMS,  FELSLATE_BLUE_RATE,
		GEM_CHIP,   FELSLATE_CHIP_RATE
end
