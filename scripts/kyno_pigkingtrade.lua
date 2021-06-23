local salt_table = 
{
    "butter",
    "berries",
    "honey",
}
local function SaltTrader(inst)	
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	local num = math.random(#salt_table)
	
	if inst.components.inventoryitem ~= nil and not inst.components.tradable then
		inst:AddComponent("tradable")
	else
		inst.components.tradable.goldvalue = 0.5
		inst.components.tradable.tradefor = { salt_table[num] }
	end
end
AddPrefabPostInit("kyno_salt", SaltTrader)