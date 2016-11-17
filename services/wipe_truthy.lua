
local myname, ns = ...


-- Wipes a table, but leaves `false` values in place
function ns.Wipe(t)
  for i,v in pairs(t) do
    if v ~= false then t[i] = nil end
  end
end
