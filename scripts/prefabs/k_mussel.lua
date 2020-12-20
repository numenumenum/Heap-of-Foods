local assets =
{
	Asset("ANIM", "anim/mussel.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_foodimages.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_foodimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_foodimages.xml", 256),
}

local prefabs = 
{
	"kyno_mussel_cooked",
	"spoiled_food",
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("mussel")
	inst.AnimState:SetBuild("mussel")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("cookable")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.MEAT

   	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 0
	inst.components.edible.hungervalue = 12.5
	inst.components.edible.sanityvalue = -15
	inst.components.edible.foodtype = FOODTYPE.MEAT

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_mussel"

	inst:AddComponent("cookable")
	inst.components.cookable.product = "kyno_mussel_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

local function fn_cooked()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("mussel")
	inst.AnimState:SetBuild("mussel")
	inst.AnimState:PlayAnimation("cooked")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.MEAT

	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 1
	inst.components.edible.hungervalue = 12.5
	inst.components.edible.sanityvalue = 0
	inst.components.edible.foodtype = FOODTYPE.MEAT
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_mussel_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

return Prefab("kyno_mussel", fn, assets),
Prefab("kyno_mussel_cooked", fn_cooked, assets)