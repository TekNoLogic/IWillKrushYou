
local pigments = {
	[39151] = {2447, 765, 2449},
	[39334] = {785, 2450, 2452, 3820, 2453},
	[39338] = {3369, 3355, 3356, 3357},
	[39339] = {3818, 3821, 3358, 3819},
	[39340] = {4625, 8831, 8836, 8838, 8845, 8839, 8846},
	[39341] = {13464, 13463, 13465, 13466, 13467},
	[39342] = {22786, 22785, 22789, 22787, 22791, 22793},
	[39343] = {36901, 36904},
}
local cinks  = {[39469] = 39151, [39774] = 39334, [43116] = 39338, [43118] = 39339, [43120] = 39340, [43122] = 39341, [43124] = 39342, [43126] = 39343}
local ucinks = {[43115] = 43103, [43117] = 43104, [43119] = 43105, [43121] = 43106, [43123] = 43107, [43125] = 43108, [43127] = 43109}
local ids = LibStub("tekIDmemo")
local orig = GetAuctionBuyout
function GetAuctionBuyout(item)
	local id = ids[item]
	if cinks[id] then
		local price = GetAuctionBuyout(cinks[id])
		if price then return price * 2 end
	elseif ucinks[id] then
		local price = GetAuctionBuyout(ucinks[id])
		if price then return price end
	elseif pigments[id] then
		local count, sum = 0, 0
		for _,id in pairs(pigments[id]) do
			local price = GetAuctionBuyout(id)
			if price then count, sum = count + 1, sum + price end
		end
		if count > 0 then return 5/(id == 39151 and 2.5 or 3)*sum/count end
	end
	if orig then return orig(item) end
end
