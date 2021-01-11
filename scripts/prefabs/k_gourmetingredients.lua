local assets =
{
    Asset("ANIM", "anim/quagmire_flour.zip"),
	Asset("ANIM", "anim/quagmire_syrup.zip"),
	Asset("ANIM", "anim/quagmire_spotspice_ground.zip"),
	Asset("ANIM", "anim/quagmire_spotspice_sprig.zip"),
	Asset("ANIM", "anim/quagmire_meat_small.zip"),
	Asset("ANIM", "anim/quagmire_mushrooms.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_foodimages.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_foodimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_foodimages.xml", 256),
}

local prefabs = 
{
	"spoiled_food",
	"kyno_bacon_cooked",
	"kyno_white_cap_cooked",
}

local function flourfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("quagmire_flour")
    inst.AnimState:SetBuild("quagmire_flour")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("gourmet_flour")
	inst:AddTag("gourmet_ingredient")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_flour"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function syrupfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("quagmire_syrup")
    inst.AnimState:SetBuild("quagmire_syrup")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("gourmet_syrup")
	inst:AddTag("gourmet_ingredient")
	inst:AddTag("show_spoilage")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_syrup"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
	
	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 3
	inst.components.edible.hungervalue = 9.375
	inst.components.edible.sanityvalue = 0
	inst.components.edible.foodtype = FOODTYPE.GOODIES

	MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function sprigfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("quagmire_spotspice_sprig")
    inst.AnimState:SetBuild("quagmire_spotspice_sprig")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("gourmet_sprig")
	inst:AddTag("gourmet_ingredient")
	inst:AddTag("show_spoilage")
	inst:AddTag("veggie")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_spotspice_leaf"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
	
	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 0
	inst.components.edible.hungervalue = 4.6875
	inst.components.edible.sanityvalue = 0
	inst.components.edible.foodtype = FOODTYPE.SEEDS
	
	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function spicefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("quagmire_spotspice_ground")
    inst.AnimState:SetBuild("quagmire_spotspice_ground")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("gourmet_spotspice")
	inst:AddTag("gourmet_ingredient")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_spotspice"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function baconfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("quagmire_meat_small")
	inst.AnimState:SetBuild("quagmire_meat_small")
	inst.AnimState:PlayAnimation("raw")

	inst:AddTag("meat")
	inst:AddTag("cookable")
	inst:AddTag("gourmet_ingredient")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("bait")
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "SMALLMEAT"
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 1

   	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 0
	inst.components.edible.hungervalue = 12.5
	inst.components.edible.sanityvalue = -10
	inst.components.edible.foodtype = FOODTYPE.MEAT
	inst.components.edible.ismeat = true

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_bacon"

	inst:AddComponent("cookable")
	inst.components.cookable.product = "kyno_bacon_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

local function bacon_cookedfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("quagmire_meat_small")
	inst.AnimState:SetBuild("quagmire_meat_small")
	inst.AnimState:PlayAnimation("cooked")

	inst:AddTag("meat")
	inst:AddTag("gourmet_ingredient")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("bait")
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "COOKEDSMALLMEAT"
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 1

   	inst:AddComponent("edible")
	inst.components.edible.healthvalue = 3
	inst.components.edible.hungervalue = 12.5
	inst.components.edible.sanityvalue = 5
	inst.components.edible.foodtype = FOODTYPE.MEAT
	inst.components.edible.ismeat = true

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_bacon_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

local function mushfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("quagmire_mushrooms")
	inst.AnimState:SetBuild("quagmire_mushrooms")
	inst.AnimState:PlayAnimation("raw")

	inst:AddTag("veggie")
	inst:AddTag("cookable")
	inst:AddTag("gourmet_ingredient")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("bait")
	inst:AddComponent("tradable")
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "RED_CAP"

   	inst:AddComponent("edible")
	inst.components.edible.healthvalue = -10
	inst.components.edible.hungervalue = 9.375
	inst.components.edible.sanityvalue = 0
	inst.components.edible.foodtype = FOODTYPE.VEGGIE

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_white_cap"

	inst:AddComponent("cookable")
	inst.components.cookable.product = "kyno_white_cap_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

local function mush_cookedfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst)

	inst.AnimState:SetBank("quagmire_mushrooms")
	inst.AnimState:SetBuild("quagmire_mushrooms")
	inst.AnimState:PlayAnimation("cooked")

	inst:AddTag("veggie")
	inst:AddTag("gourmet_ingredient")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("bait")
	inst:AddComponent("tradable")
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "RED_CAP_COOKED"

   	inst:AddComponent("edible")
	inst.components.edible.healthvalue = -5
	inst.components.edible.hungervalue = 12.5
	inst.components.edible.sanityvalue = 0
	inst.components.edible.foodtype = FOODTYPE.VEGGIE

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_foodimages.xml"
	inst.components.inventoryitem.imagename = "kyno_white_cap_cooked"

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	MakeHauntableLaunchAndPerish(inst)

	return inst
end

return Prefab("kyno_flour", flourfn, assets, prefabs),
Prefab("kyno_spotspice_leaf", sprigfn, assets, prefabs),
Prefab("kyno_spotspice", spicefn, assets, prefabs),
Prefab("kyno_syrup", syrupfn, assets, prefabs),
Prefab("kyno_bacon", baconfn, assets, prefabs),
Prefab("kyno_bacon_cooked", bacon_cookedfn, assets),
Prefab("kyno_white_cap", mushfn, assets),
Prefab("kyno_white_cap_cooked", mush_cookedfn, assets)