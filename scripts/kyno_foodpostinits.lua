------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Favorite Mod Foods.

AddPrefabPostInit("wilson", function(inst)
	inst:AddTag("wislanhealer")
	
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("caviar", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("willow", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("feijoada", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)
	
AddPrefabPostInit("wolfgang", function(inst)
	inst:AddTag("mightyman")
	
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_potato_soup", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wendy", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("icedtea", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wx78", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("bowlofgears", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wickerbottom", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("tea", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("woodie", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_sliders", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("waxwell", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_crab_roll", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wes", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("sharkfinsoup", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wathgrithr", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_pot_roast", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("webber", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("steamedhamsandwich", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("winona", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("coffee", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wortox", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("jellyopop", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wormwood", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gummy_cake", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("wurt", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_vegetable_soup", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)

AddPrefabPostInit("walter", function(inst)
	if inst.components.foodaffinity then
		inst.components.foodaffinity:AddPrefabAffinity("gorge_hamburger", TUNING.AFFINITY_15_CALORIES_HUGE)
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix For Spiced Coffee.
local spiced_buffs = {SPICE_CHILI = "buff_attack", SPICE_GARLIC = "buff_playerabsorption", SPICE_SUGAR = "buff_workeffectiveness"}
local function OnEatCoffee(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.coffeebuff_duration = 480
        eater.components.debuffable:AddDebuff("kyno_coffeebuff", "kyno_coffeebuff")
        local spiced_buff = spiced_buffs[inst.components.edible.spice]
        if spiced_buff then
            eater.components.debuffable:AddDebuff(spiced_buff, spiced_buff)
        end
		if eater.components.talker and eater:HasTag("wislanhealer") then 
			eater.components.talker:Say("Swift!")
		elseif
			eater.components.talker and eater:HasTag("pyromaniac") then
				eater.components.talker:Say("More speed to burn!")
		elseif
			eater.components.talker and eater:HasTag("mightyman") then
				eater.components.talker:Say("Wolfgang is faster!")
		elseif
			eater.components.talker and eater:HasTag("ghostlyfriend") then
				eater.components.talker:Say("Time to speed my death.")
		elseif
			eater.components.talker and eater:HasTag("electricdamageimmune") then
				eater.components.talker:Say("MOVEMENT SPEED: HIGH LEVELS")
		elseif
			eater.components.talker and eater:HasTag("insomniac") then
				eater.components.talker:Say("It helps me stay awake.")
		elseif
			eater.components.talker and eater:HasTag("woodcutter") then
				eater.components.talker:Say("More speed, more trees down!")
		elseif
			eater.components.talker and eater:HasTag("shadowmagic") then
				eater.components.talker:Say("Ahh. The good old caffeine.")
		elseif
			eater.components.talker and eater:HasTag("valkyrie") then
				eater.components.talker:Say("Speed for the battle!")
		elseif
			eater.components.talker and eater:HasTag("dualsoul") then
				eater.components.talker:Say("Weee!")
		elseif
			eater.components.talker and eater:HasTag("masterchef") then
				eater.components.talker:Say("Mon dieu! It makes me faster to cook!")
		elseif
			eater.components.talker and eater:HasTag("soulstealer") then
				eater.components.talker:Say("Hyuyu! I can pursuit Krampus now!")
		elseif
			eater.components.talker and eater:HasTag("handyperson") then
				eater.components.talker:Say("The classic drink of workers.")
		elseif
			eater.components.talker and eater:HasTag("plantkin") then
				eater.components.talker:Say("Zooomm!")
		elseif
			eater.components.talker and eater:HasTag("playermerm") then
				eater.components.talker:Say("Glurp!!! I'm fast!")
		elseif
			eater.components.talker and eater:HasTag("pinetreepioneer") then
				eater.components.talker:Say("Let's go Woby!!!")
		end
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "kyno_coffeebuff", 1.83)
        eater:DoTaskInTime(480, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "kyno_coffeebuff")
        end)
    end
end

AddPrefabPostInit("coffee", function(inst)
	inst:AddTag("honeyed")
	if inst.components.edible then
		inst.components.edible:SetOnEatenFn(OnEatCoffee)
	end
end)

AddPrefabPostInit("coffee_spice_garlic", function(inst)
	inst:AddTag("honeyed")
	if inst.components.edible then
		inst.components.edible:SetOnEatenFn(OnEatCoffee)
	end
end)

AddPrefabPostInit("coffee_spice_sugar", function(inst)
	inst:AddTag("honeyed")
	if inst.components.edible then
		inst.components.edible:SetOnEatenFn(OnEatCoffee)
	end
end)

AddPrefabPostInit("coffee_spice_chili", function(inst)
	inst:AddTag("honeyed")
	if inst.components.edible then
		inst.components.edible:SetOnEatenFn(OnEatCoffee)
	end
end)

AddPrefabPostInit("coffee_spice_salt", function(inst)
	inst:AddTag("honeyed")
	if inst.components.edible then
		inst.components.edible:SetOnEatenFn(OnEatCoffee)
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ashes are Now a Fertilizer. Also using the Nutrients of Manure as placeholder for now, check "ash.lua".
local ACTIONS = GLOBAL.ACTIONS
AddPrefabPostInit("ash", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
    inst:AddTag("coffeefertilizer")
end)

-- Coffee Plant can be Only Fertilized by Ashes.
AddComponentAction("USEITEM", "fertilizer", function(inst, doer, target, actions)
    if actions[1] == ACTIONS.FERTILIZE and inst:HasTag("coffeefertilizer") ~= target:HasTag("kyno_coffeebush") then
        actions[1] = nil
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rockjaws Drops Shark Fin.
AddPrefabPostInit("shark", function(inst)
	if GLOBAL.TheWorld.ismastersim and not GLOBAL.KnownModIndex:IsModEnabled("workshop-2174681153") then
		inst.components.lootdropper:AddChanceLoot("kyno_shark_fin", 1.00) 
	end
end)

-- Cookie Cutters Drops Mussel.
AddPrefabPostInit("cookiecutter", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.lootdropper:AddChanceLoot("kyno_mussel", 0.50) 
	end
end)

-- Beefalos Drops Bean Bugs.
AddPrefabPostInit("beefalo", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.lootdropper:AddChanceLoot("kyno_beanbugs", 1.00) 
		inst.components.lootdropper:AddChanceLoot("kyno_beanbugs", 0.50) 
	end
end)

AddPrefabPostInit("babybeefalo", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.lootdropper:AddChanceLoot("kyno_beanbugs", 0.10) 
	end
end)

-- Catcoon Drops Gummy Slug
AddPrefabPostInit("catcoon", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.lootdropper:AddChanceLoot("kyno_gummybug", 0.35) 
	end
end)

-- Some Birds Spawns Roe Periodically.
AddPrefabPostInit("puffin", function(inst)
	if inst.components.periodicspawner ~= nil then
		inst.components.periodicspawner:SetPrefab("kyno_roe")
		inst.components.periodicspawner:SetDensityInRange(20, 2)
		inst.components.periodicspawner:SetMinimumSpacing(3)
	end
end)

AddPrefabPostInit("robin_winter", function(inst)
	if inst.components.periodicspawner ~= nil then
		inst.components.periodicspawner:SetPrefab("kyno_roe")
		inst.components.periodicspawner:SetDensityInRange(20, 2)
		inst.components.periodicspawner:SetMinimumSpacing(3)
	end
end)

AddPrefabPostInit("canary", function(inst)
	if inst.components.periodicspawner ~= nil then
		inst.components.periodicspawner:SetPrefab("kyno_roe")
		inst.components.periodicspawner:SetDensityInRange(20, 2)
		inst.components.periodicspawner:SetMinimumSpacing(3)
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Theorically Tea Cool Down and Turns into Iced Tea.
AddPrefabPostInit("tea", function(inst)
	if inst.components.perishable ~= nil then
		inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "icedtea"
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- It's Cursed. Players Have a Chance to Drop Long Pig. Except WX-78, Wurt, Wortox and Wormwood.
local function ondeath_longpig(inst)
	if math.random()<0.15 then
		GLOBAL.SpawnPrefab("kyno_humanmeat").Transform:SetPosition(inst.Transform:GetWorldPosition())
	end
end

AddPrefabPostInit("wilson", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("willow", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("wolfgang", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("wendy", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("wickerbottom", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("woodie", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("waxwell", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("wes", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("webber", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("wathgrithr", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("winona", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("warly", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)

AddPrefabPostInit("walter", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeath_longpig)
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------