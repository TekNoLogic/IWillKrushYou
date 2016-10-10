
local myname, ns = ...


local GHOST_IRON = 72092
local KYPARITE = 72093
local BLACK_TRILLIUM = 72094
local WHITE_TRILLIUM = 72103
local SERPENTS_EYE = 76734
local GREEN_GEMS = {76136, 76130, 76134, 76137, 76133, 76135}
local BLUE_GEMS = {76131, 76140, 76142, 76139, 76138, 76141}


local GHOST_IRON_GREEN_RATE = 85 / 200
local GHOST_IRON_BLUE_RATE = 10 / 200
local GHOST_IRON_SHARD_RATE = 48 / 200
local KYPARITE_GREEN_RATE = 85 / 200
local KYPARITE_BLUE_RATE = 16 / 200
local KYPARITE_SHARD_RATE = 60 / 200
local TRILLIUM_GREEN_RATE = 40 / 200
local TRILLIUM_BLUE_RATE = 30 / 200
local TRILLIUM_SHARD_RATE = 60 / 200


-- Serpent's Eye is the item we'll actually use or sell, it's made by combining
-- 10 Sparkling Shards
local GHOST_IRON_EYE_RATE = GHOST_IRON_SHARD_RATE / 10
local KYPARITE_EYE_RATE = KYPARITE_SHARD_RATE / 10
local TRILLIUM_EYE_RATE = TRILLIUM_SHARD_RATE / 10


ns.prospecting_funcs[GHOST_IRON] = function()
	return
		GREEN_GEMS, GHOST_IRON_GREEN_RATE,
		BLUE_GEMS,  GHOST_IRON_BLUE_RATE,
		SERPENTS_EYE, GHOST_IRON_EYE_RATE
end


ns.prospecting_funcs[KYPARITE] = function()
	return
		GREEN_GEMS, KYPARITE_GREEN_RATE,
		BLUE_GEMS,  KYPARITE_BLUE_RATE,
		SERPENTS_EYE, KYPARITE_EYE_RATE
end


ns.prospecting_funcs[BLACK_TRILLIUM] = function()
	return
		GREEN_GEMS, TRILLIUM_GREEN_RATE,
		BLUE_GEMS,  TRILLIUM_BLUE_RATE,
		SERPENTS_EYE, TRILLIUM_EYE_RATE
end


-- Thankfully the trilliums are essentially identical
ns.prospecting_funcs[WHITE_TRILLIUM] = ns.prospecting_funcs[BLACK_TRILLIUM]
