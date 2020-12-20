local kyno_foods =
{
	-- Shipwrecked Foods.
	coffee =
	{
		test = function(cooker, names, tags) return names.kyno_coffeebeans_cooked and (names.kyno_coffeebeans_cooked == 4 or 
		(names.kyno_coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener))) and not names.kyno_coffeebeans end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		secondaryfoodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_MED,
		health = 3,
		hunger = 9.375,
		sanity = -5,
		cooktime = 0.5,
		oneat_desc = "Speeds the body",
		floater = {"med", nil, 0.65},
	},
	
	bisque =
	{
		test = function(cooker, names, tags) return (names.cutlichen and names.cutlichen == 2) and tags.fish and tags.frozen end,
		priority = 30,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 30,
		hunger = 18.75,
		sanity = 5,
		cooktime = 1,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
	
	jellyopop = 
	{
		test = function(cooker, names, tags) return tags.fish and tags.frozen and names.twigs end,
		priority = 20,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_SUPERFAST,
		health = 20,
		hunger = 12.5,
		sanity = 0,
		cooktime = 0.5,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		potlevel = "med",
		floater = {"med", nil, 0.65},
	},
	
	musselbouillabaise =
	{
		test = function(cooker, names, tags) return (names.kyno_mussel and names.kyno_mussel == 3)
		and tags.veggie and not names.twigs and not tags.sweetener and not names.kyno_mussel_cooked end,
		priority = 30,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 60,
		hunger = 37.5,
		sanity = 15,
		cooktime = 2,
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
	},
	
	sharkfinsoup = 
	{
		test = function(cooker, names, tags) return (names.kyno_shark_fin or names.ecp_shark_fin) end,
		priority = 20,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 40,
		hunger = 12.5,
		sanity = -10,
		cooktime = 1,
		potlevel = "med",
		floater = {"med", nil, 0.65},
	},
	
	sweetpotatosouffle =
	{
		test = function(cooker, names, tags) return (names.potato or names.potato_cooked) and (names.onion or names.onion_cooked) and (tags.sweetener == 2) end,
		priority = 30,
		foodtype = FOODTYPE.VEGGIE,
		secondaryfoodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 20,
		hunger = 37.5,
		sanity = 15,
		cooktime = 2,
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
	},
	
	caviar = 
	{
		test = function(cooker, names, tags) return (names.kyno_roe or names.kyno_roe_cooked) and tags.veggie and not tags.sweetener and not tags.dairy end,
		priority = 30,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 3,
		hunger = 12.5,
		sanity = 33,
		cooktime = 2,
		floater = {"med", nil, 0.65},
	},
	
	tropicalbouillabaisse =
	{
		test = function(cooker, names, tags) return tags.fish and (names.eel or names.eel_cooked or names.pondeel) and (names.wobster_sheller_land) 
		and (names.barnacle or names.barnacle_cooked) end,
		priority = 35,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 60,
		hunger = 37.5,
		sanity = 15,
		cooktime = 2,
		floater = {"med", nil, 0.65},
	},
	
	-- Hamlet Foods.
	feijoada =
	{
		test = function(cooker, names, tags) return (names.kyno_beanbugs or names.kyno_beanbugs_cooked == 3) and tags.meat end,
		priority = 30,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_FASTISH,
		health = 20,
		hunger = 75,
		sanity = 15,
		cooktime = 3.5,
		floater = {"med", nil, 0.65},
	},
	
	gummy_cake =
	{
		test = function(cooker, names, tags) return (names.kyno_gummybug or names.kyno_gummybug_cooked) and tags.sweetener end,
		priority = 1,
		foodtype = FOODTYPE.GOODIES,
		perishtime = TUNING.PERISH_PRESERVED,
		health = -3,
		hunger = 150,
		sanity = -5,
		cooktime = 2,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
	
	hardshell_tacos =
	{
		test = function(cooker, names, tags) return (names.slurtle_shellpieces == 2) and tags.veggie end,
		priority = 1,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_SLOW,
		health = 20,
		hunger = 37.5,
		sanity = 5,
		cooktime = 2,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
	
	icedtea = 
	{
		test = function(cooker, names, tags) return (names.rabbit == 2) and tags.sweetener and tags.frozen and not tags.meat and not tags.egg and not tags.fish end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		perishtime = TUNING.PERISH_FAST,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		health = 3,
		hunger = 12.5,
		sanity = 33,
		cooktime = 0.5,
		floater = {"med", nil, 0.65},
		prefabs = { "buff_sleepresistance" },
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_RESISTANCE,
        oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
				(eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled()) and
					not (eater.components.health ~= nil and eater.components.health:IsDead()) and
					not eater:HasTag("playerghost") then
                if eater.components.grogginess ~= nil then
                    eater.components.grogginess:ResetGrogginess()
                end
                if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() then
                    eater.components.debuffable:AddDebuff("shroomsleepresist", "buff_sleepresistance")
                end
            end
        end,
	},
	
	tea = 
	{
		test = function(cooker, names, tags) return (names.rabbit == 2) and tags.sweetener and not tags.frozen and not tags.meat and not tags.egg and not tags.fish end,
		priority = 25,
		foodtype = FOODTYPE.GOODIES,
		perishtime = TUNING.PERISH_FAST,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		health = 3,
		hunger = 12.5,
		sanity = 33,
		cooktime = 0.5,
		floater = {"med", nil, 0.65},
		prefabs = { "buff_sleepresistance" },
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_RESISTANCE,
        oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
				(eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled()) and
					not (eater.components.health ~= nil and eater.components.health:IsDead()) and
					not eater:HasTag("playerghost") then
                if eater.components.grogginess ~= nil then
                    eater.components.grogginess:ResetGrogginess()
                end
                if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() then
                    eater.components.debuffable:AddDebuff("shroomsleepresist", "buff_sleepresistance")
                end
            end
        end,
	},
	
	nettlelosange = 
	{
		test = function(cooker, names, tags) return (names.firenettles == 3) end,
		priority = 0,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_FAST,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		health = 20,
		hunger = 25,
		sanity = -10,
		cooktime = .5,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
	
	snakebonesoup = 
	{
		test = function(cooker, names, tags) return (names.boneshard == 2) and (tags.meat == 2) end,
		priority = 20,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_MED,
		health = 40,
		hunger = 25,
		sanity = 10,
		cooktime = 1,
		floater = {"med", nil, 0.65},
	},
	
	steamedhamsandwich = 
	{
		test = function(cooker, names, tags) return (names.meat or names.meat_cooked) and tags.veggie and names.foliage end,
		priority = 5,
		foodtype = FOODTYPE.MEAT,
		perishtime = TUNING.PERISH_FAST,
		health = 40,
		hunger = 37.5,
		sanity = 15,
		cooktime = 2,
		floater = {"med", nil, 0.65},
	},
	
	-- Unimplemented Foods. 
	
	bubbletea = 
	{
		test = function(cooker, names, tags) return names.robin_winter and (tags.sweetener == 2) and tags.frozen and not tags.meat and not tags.egg and not tags.fish end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		perishtime = TUNING.PERISH_FAST,
		health = 20,
		hunger = 12.5,
		sanity = 33,
		cooktime = 0.5,
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
		prefabs = { "buff_sleepresistance" },
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_RESISTANCE,
        oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
				(eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled()) and
					not (eater.components.health ~= nil and eater.components.health:IsDead()) and
					not eater:HasTag("playerghost") then
                if eater.components.grogginess ~= nil then
                    eater.components.grogginess:ResetGrogginess()
                end
                if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() then
                    eater.components.debuffable:AddDebuff("shroomsleepresist", "buff_sleepresistance")
                end
            end
        end,
	},
	
	frenchonionsoup = 
	{
		test = function(cooker, names, tags) return (names.onion or names.onion_cooked == 2) and tags.veggie and names.foliage end,
		priority = 5,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_MED,
		health = 40,
		hunger = 37.5,
		sanity = 5,
		cooktime = 1,
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
	},
	
	slaw = 
	{
		test = function(cooker, names, tags) return (names.onion or names.onion_cooked) and (names.garlic or names.garlic_cooked) and 
		(names.potato or names.potato_cooked) and names.foliage end,
		priority = 20,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_MED,
		health = 20,
		hunger = 25,
		sanity = 10,
		cooktime = 1.5,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
	
	lotusbowl = 
	{
		test = function(cooker, names, tags) return (names.petals and names.petals == 2) and tags.veggie and not names.foliage end,
		priority = 30,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_FASTISH,
		health = 3,
		hunger = 12.5,
		sanity = 5,
		cooktime = 0.5,
		floater = {"med", nil, 0.65},
	},
	
	poi = 
	{
		test = function(cooker, names, tags) return (names.petals and names.petals == 2) and (names.foliage == 2) end,
		priority = 30,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_FASTISH,
		health = 3,
		hunger = 25,
		sanity = 10,
		cooktime = 1,
		floater = {"med", nil, 0.65},
	},
	
	jellybean_sanity =
	{
		test = function(cooker, names, tags) return names.royal_jelly and (names.green_cap or names.green_cap_cooked == 3) and not tags.inedible and not tags.monster end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		perishtime = nil,
		health = 2,
		hunger = 0, 
		sanity = 5,
		cooktime = 2.5,
		stacksize = 3,
		oneat_desc = "Restores sanity over time",
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
        prefabs = { "kyno_sanityregenbuff" },
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("kyno_sanityregenbuff", "kyno_sanityregenbuff")
            end
        end,
	},
	
	jellybean_hunger =
	{
		test = function(cooker, names, tags) return names.royal_jelly and names.butter and tags.sweetener and not tags.inedible and not tags.monster end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		perishtime = nil,
		health = 2,
		hunger = 5, 
		sanity = 0,
		cooktime = 2.5,
		stacksize = 3,
		oneat_desc = "Restores hunger over time",
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
        prefabs = { "kyno_hungerregenbuff" },
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("kyno_hungerregenbuff", "kyno_hungerregenbuff")
            end
        end,
	},
	
	jellybean_super =
	{
		test = function(cooker, names, tags) return (names.royal_jelly == 4) and not tags.inedible and not tags.monster end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		perishtime = nil,
		health = 2,
		hunger = 2, 
		sanity = 2,
		cooktime = 2.5,
		stacksize = 3,
		oneat_desc = "Restores all over time",
		floater = {"med", nil, 0.65},
		tags = {"masterfood"},
        prefabs = { "kyno_superregenbuff" },
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("kyno_superregenbuff", "kyno_superregenbuff")
            end
        end,
	},
	
	-- Secret and Custom Foods. Why are you here by the way?
	
	bowlofgears = 
	{
		test = function(cooker, names, tags) return (names.gears and names.gears == 2) and not tags.frozen end,
		priority = 1,
		foodtype = FOODTYPE.GEARS,
		perishtime = nil,
		health = 135,
		hunger = 150,
		sanity = 150,
		cooktime = 2,
		oneat_desc = "Upgrades the chassis",
		floater = {"med", nil, 0.65},
	},
	
	longpigmeal = 
	{
		test = function(cooker, names, tags) return (names.kyno_humanmeat or names.kyno_humanmeat_cooked or names.kyno_humanmeat_dried) and not names.twigs end,
		priority = 1,
		foodtype = FOODTYPE.MEAT,
		secondaryfoodtype = FOODTYPE.MONSTER,
		perishtime = TUNING.PERISH_MED,
		health = -400,
		hunger = 150,
		sanity = -300,
		cooktime = 1,
		oneat_desc = "Hurts the body",
		floater = {"med", nil, 0.65},
	},
	
	gorge_bread = 
	{
		test = function(cooker, names, tags) return (names.kyno_flour and names.kyno_flour == 3) end,
		priority = 1,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_MED,
		health = 3,
		hunger = 12.5,
		sanity = 0,
		cooktime = 1,
		floater = {"med", nil, 0.65},
	},
	
	gorge_potato_chips = 
	{
		test = function(cooker, names, tags) return (names.potato or names.potato_cooked == 3) and names.kyno_spotspice end,
		priority = 35,
		foodtype = FOODTYPE.VEGGIE,
		perishtime = TUNING.PERISH_FAST,
		health = 3,
		hunger = 25,
		sanity = 5,
		cooktime = .75,
		potlevel = "high",
		floater = {"med", nil, 0.65},
	},
}

for k, recipe in pairs(kyno_foods) do
	recipe.name = k
	recipe.weight = 1
	recipe.cookbook_atlas = "images/cookbookimages/kyno_cookbook.xml"
	recipe.cookbook_tex = k..".tex"
end

return kyno_foods