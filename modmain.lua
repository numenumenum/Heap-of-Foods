-- Common Dependencies.
local require = GLOBAL.require
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local AllRecipes = GLOBAL.AllRecipes
local Recipe = GLOBAL.Recipe
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mod Dependencies.
modimport("scripts/kyno_foodstrings")
modimport("scripts/kyno_foodpostinits")
-- Fix for Custom Foods on Drying Rack.
modimport("scripts/kyno_meatrackfix")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix For Inventory Icons.
local atlas = (src and src.components.inventoryitem and src.components.inventoryitem.atlasname and resolvefilepath(src.components.inventoryitem.atlasname) ) or "images/inventoryimages.xml"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Assets.
Assets =
{	
	Asset("ANIM", "anim/kyno_humanmeat.zip"),

	Asset("IMAGE", "images/minimapimages/kyno_foodminimap.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_foodminimap.xml"),
	
	Asset("IMAGE", "images/cookbookimages/kyno_cookbook.tex"),
	Asset("ATLAS", "images/cookbookimages/kyno_cookbook.xml"),
	Asset("ATLAS_BUILD", "images/cookbookimages/kyno_cookbook.xml", 256),
	
	Asset("IMAGE", "images/inventoryimages/kyno_foodimages.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_foodimages.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_foodimages.xml", 256),
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prefabs.
PrefabFiles =
{	
	"k_newfoods",
	"k_coffeebeans",
	"k_coffeebuff",
	"k_realcoffeebush",
	"k_realdugcoffeebush",
	"k_sharkfin",
	"k_roe",
	"k_mussel",
	"k_bugs",
	"k_hungerregenbuff",
	"k_sanityregenbuff",
	"k_superregenbuff",
	"k_humanmeat",
	"k_gourmetingredients",
	"ash",
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- New Crock Pot Ingredients.
AddIngredientValues({"trunk_summer"}, {meat=2}, {trunk=1}, true)
AddIngredientValues({"trunk_winter"}, {meat=2}, {trunk=1}, true)
AddIngredientValues({"trunk_cooked"}, {meat=2}, {trunk=1}, true)
AddIngredientValues({"slurtle_shellpieces"}, {inedible=1}, {shell=1}, true)
AddIngredientValues({"rabbit"}, {rabbit=1}, true)
AddIngredientValues({"firenettles"}, {veggie=0.5}, true)
AddIngredientValues({"foliage"}, {veggie=0.5}, true)
AddIngredientValues({"succulent_picked"}, {veggie=0.5}, true)
AddIngredientValues({"robin_winter"}, {robin_winter=1}, true)
AddIngredientValues({"petals"}, {veggie=0.5}, true)
AddIngredientValues({"gears"}, {gears=1}, true)
AddIngredientValues({"rocks"}, {rocks=1}, {elemental=1}, {inedible=1}, true)
AddIngredientValues({"kyno_coffeebeans_cooked"}, {seeds=1}, {fruit=0.5}, true)
AddIngredientValues({"kyno_coffeebeans"}, {seeds=1}, {fruit=0.5}, true)
AddIngredientValues({"kyno_shark_fin"}, {fish=1}, true)
AddIngredientValues({"kyno_roe_cooked"}, {meat=0.5}, {roe=1}, true)
AddIngredientValues({"kyno_roe"}, {meat=0.5}, {roe=1}, true)
AddIngredientValues({"kyno_mussel_cooked"}, {fish=0.5}, {mussel=1}, true)
AddIngredientValues({"kyno_mussel"}, {fish=0.5}, {mussel=1}, true)
AddIngredientValues({"kyno_beanbugs"}, {bug=1}, {veggie=0.5}, true)
AddIngredientValues({"kyno_beanbugs_cooked"}, {bug=1}, {veggie=0.5}, true)
AddIngredientValues({"kyno_gummybug"}, {bug=1}, {veggie=0.5}, true)
AddIngredientValues({"kyno_gummybug_cooked"}, {bug=1}, {veggie=0.5}, true)
AddIngredientValues({"kyno_humanmeat_cooked"}, {meat=1}, {monster=1}, true, true)
AddIngredientValues({"kyno_humanmeat"}, {meat=1}, {monster=1}, true, true)
AddIngredientValues({"kyno_humanmeat_dried"}, {meat=1}, {monster=1}, true, true)
AddIngredientValues({"kyno_syrup"}, {sweetener=0.5}, {syrup=1}, true)
AddIngredientValues({"kyno_flour"}, {inedible=1}, {flour=1}, true)
AddIngredientValues({"kyno_spotspice"}, {inedible=1}, {spotspice=1}, true)
AddIngredientValues({"kyno_bacon"}, {meat=0.5}, {bacon=1}, true)
AddIngredientValues({"kyno_bacon_cooked"}, {meat=0.5}, {bacon=1}, true)
AddIngredientValues({"gorge_bread"}, {bread=1}, true)
AddIngredientValues({"kyno_white_cap"}, {veggie=0.5}, {mushroom=1}, true)
AddIngredientValues({"kyno_white_cap_cooked"}, {veggie=0.5}, {mushroom=1}, true)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Minimap Icons.
AddMinimapAtlas("images/minimapimages/kyno_foodminimap.xml")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Icons For Cookbook.
RegisterInventoryItemAtlas("images/inventoryimages.xml", "slurtle_shellpieces.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "rabbit.tex")
RegisterInventoryItemAtlas("images/inventoryimages1.xml", "firenettles.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "foliage.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "succulent_picked.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "robin_winter.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "petals.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "gears.tex")
RegisterInventoryItemAtlas("images/inventoryimages.xml", "rocks.tex")

RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_coffeebeans_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_coffeebeans.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_shark_fin.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "ecp_shark_fin.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_roe_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_roe.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_mussel_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_mussel.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_beanbugs_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_beanbugs.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_gummybug_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_gummybug.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_humanmeat_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_humanmeat.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_humanmeat_dried.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_syrup.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_flour.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_spotspice.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_bacon.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_bacon_cooked.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "gorge_bread.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_white_cap.tex")
RegisterInventoryItemAtlas("images/inventoryimages/kyno_foodimages.xml", "kyno_white_cap_cooked.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ingredient Recipes.
local KynFlour = AddRecipe("kyno_flour", {Ingredient("seeds", 1), Ingredient("cutgrass", 1)},
RECIPETABS.FARM, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_flour.tex")

local KynSpice = AddRecipe("kyno_spotspice", {Ingredient("foliage", 1), Ingredient("garlic", 1)},
RECIPETABS.FARM, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_spotspice_ground.tex")

local KynSyrup = AddRecipe("kyno_syrup", {Ingredient("honey", 1)},
RECIPETABS.FARM, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_syrup.tex")

local KynBacon = AddRecipe("kyno_bacon", {Ingredient("smallmeat", 1)},
RECIPETABS.FARM, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_smallmeat.tex")

local KynMush = AddRecipe("kyno_white_cap", {Ingredient("red_cap", 1)},
RECIPETABS.FARM, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_mushrooms.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Import The Foods.
for k, v in pairs(require("kyno_foodrecipes")) do
	if not v.tags then
		AddCookerRecipe("cookpot", v)
		AddCookerRecipe("archive_cookpot", v)
	end
	AddCookerRecipe("portablecookpot", v)
end

for k, v in pairs(require("kyno_foodspicer")) do
	AddCookerRecipe("portablespicer", v)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix For Spiced Foods and Potlevel.
local spices = { "chili", "garlic", "sugar", "salt" }
local cookers = { "cookpot", "portablecookpot", "portablespicer", "archive_cookpot", "kyno_archive_cookpot" }

for i, cooker in ipairs(cookers) do 
	if not cookerrecipes[cooker] then
		cookerrecipes[cooker] = {}
	end
end

local kynofoods =
{
	-- Shipwrecked.
	coffee = require("kyno_foodrecipes").coffee,
	bisque = require("kyno_foodrecipes").bisque,
	jellyopop = require("kyno_foodrecipes").jellyopop,
	musselbouillabaise = require("kyno_foodrecipes").musselbouillabaise,
	sharkfinsoup = require("kyno_foodrecipes").sharkfinsoup,
	sweetpotatosouffle = require("kyno_foodrecipes").sweetpotatosouffle,
	caviar = require("kyno_foodrecipes").caviar,
	tropicalbouillabaisse = require("kyno_foodrecipes").tropicalbouillabaisse,
	
	-- Hamlet.
	feijoada = require("kyno_foodrecipes").feijoada,
	gummy_cake = require("kyno_foodrecipes").gummy_cake,
	hardshell_tacos = require("kyno_foodrecipes").hardshell_tacos,
	icedtea = require("kyno_foodrecipes").icedtea,
	tea = require("kyno_foodrecipes").tea,
	nettlelosange = require("kyno_foodrecipes").nettlelosange,
	snakebonesoup = require("kyno_foodrecipes").snakebonesoup,
	steamedhamsandwich = require("kyno_foodrecipes").steamedhamsandwich,
	
	-- Unimplemented.
	bubbletea = require("kyno_foodrecipes").bubbletea,
	frenchonionsoup = require("kyno_foodrecipes").frenchonionsoup,
	slaw = require("kyno_foodrecipes").slaw,
	lotusbowl = require("kyno_foodrecipes").lotusbowl,
	poi = require("kyno_foodrecipes").poi,
	jellybean_sanity = require("kyno_foodrecipes").jellybean_sanity,
	jellybean_hunger = require("kyno_foodrecipes").jellybean_hunger,
	jellybean_super = require("kyno_foodrecipes").jellybean_super,
	
	-- Secret Custom.
	bowlofgears = require("kyno_foodrecipes").bowlofgears,
	longpigmeal = require("kyno_foodrecipes").longpigmeal,
	
	-- The Gorge.
	gorge_bread = require("kyno_foodrecipes").gorge_bread,
	gorge_potato_chips = require("kyno_foodrecipes").gorge_potato_chips,
	gorge_vegetable_soup = require("kyno_foodrecipes").gorge_vegetable_soup,
	gorge_jelly_sandwich = require("kyno_foodrecipes").gorge_jelly_sandwich,
	gorge_fish_stew = require("kyno_foodrecipes").gorge_fish_stew,
	gorge_onion_cake = require("kyno_foodrecipes").gorge_onion_cake,
	gorge_potato_pancakes = require("kyno_foodrecipes").gorge_potato_pancakes,
	gorge_potato_soup = require("kyno_foodrecipes").gorge_potato_soup,
	gorge_fishball_skewers = require("kyno_foodrecipes").gorge_fishball_skewers,
	gorge_meat_skewers = require("kyno_foodrecipes").gorge_meat_skewers,
	gorge_stone_soup = require("kyno_foodrecipes").gorge_stone_soup,
	gorge_croquette = require("kyno_foodrecipes").gorge_croquette,
	gorge_roast_vegetables = require("kyno_foodrecipes").gorge_roast_vegetables,
	gorge_meatloaf = require("kyno_foodrecipes").gorge_meatloaf,
	gorge_carrot_soup = require("kyno_foodrecipes").gorge_carrot_soup,
	gorge_fishpie = require("kyno_foodrecipes").gorge_fishpie,
	gorge_fishchips = require("kyno_foodrecipes").gorge_fishchips,
	gorge_meatpie = require("kyno_foodrecipes").gorge_meatpie,
	gorge_sliders = require("kyno_foodrecipes").gorge_sliders,
	gorge_jelly_roll = require("kyno_foodrecipes").gorge_jelly_roll,
	gorge_carrot_cake = require("kyno_foodrecipes").gorge_carrot_cake,
	gorge_garlicmashed = require("kyno_foodrecipes").gorge_garlicmashed,
	gorge_garlicbread = require("kyno_foodrecipes").gorge_garlicbread,
	gorge_tomato_soup = require("kyno_foodrecipes").gorge_tomato_soup,
	gorge_sausage = require("kyno_foodrecipes").gorge_sausage,
	gorge_candiedfish = require("kyno_foodrecipes").gorge_candiedfish,
	gorge_stuffedmushroom = require("kyno_foodrecipes").gorge_stuffedmushroom,
	gorge_bruschetta = require("kyno_foodrecipes").gorge_bruschetta,
	gorge_hamburger = require("kyno_foodrecipes").gorge_hamburger,
	gorge_fishburger = require("kyno_foodrecipes").gorge_fishburger,
	gorge_mushroomburger = require("kyno_foodrecipes").gorge_mushroomburger,
}

kynofoods.coffee.potlevel = "med"
kynofoods.bisque.potlevel = "high"
kynofoods.jellyopop.potlevel = "med"
kynofoods.musselbouillabaise.potlevel = "med"
kynofoods.sharkfinsoup.potlevel = "med"
kynofoods.sweetpotatosouffle.potlevel = "med"
kynofoods.caviar.potlevel = "med"
kynofoods.tropicalbouillabaisse.potlevel = "med"
kynofoods.feijoada.potlevel = "med"
kynofoods.gummy_cake.potlevel = "high"
kynofoods.hardshell_tacos.potlevel = "high"
kynofoods.icedtea.potlevel = "med"
kynofoods.tea.potlevel = "med"
kynofoods.nettlelosange.potlevel = "high"
kynofoods.snakebonesoup.potlevel = "med"
kynofoods.steamedhamsandwich.potlevel = "med"
kynofoods.bubbletea.potlevel = "med"
kynofoods.frenchonionsoup.potlevel = "med"
kynofoods.slaw.potlevel = "high"
kynofoods.lotusbowl.potlevel = "med"
kynofoods.poi.potlevel = "med"
kynofoods.jellybean_sanity.potlevel = "med"
kynofoods.jellybean_hunger.potlevel = "med"
kynofoods.jellybean_super.potlevel = "med"
kynofoods.bowlofgears.potlevel = "med"
kynofoods.longpigmeal.potlevel = "med"
kynofoods.gorge_bread.potlevel = "med"
kynofoods.gorge_potato_chips.potlevel = "med"
kynofoods.gorge_vegetable_soup.potlevel = "med"
kynofoods.gorge_jelly_sandwich.potlevel = "med"
kynofoods.gorge_fish_stew.potlevel = "med"
kynofoods.gorge_onion_cake.potlevel = "med"
kynofoods.gorge_potato_pancakes.potlevel = "med"
kynofoods.gorge_potato_soup.potlevel = "med"
kynofoods.gorge_fishball_skewers.potlevel = "med"
kynofoods.gorge_meat_skewers.potlevel = "med"
kynofoods.gorge_stone_soup.potlevel = "med"
kynofoods.gorge_croquette.potlevel = "med"
kynofoods.gorge_roast_vegetables.potlevel = "med"
kynofoods.gorge_meatloaf.potlevel = "low"
kynofoods.gorge_carrot_soup.potlevel = "med"
kynofoods.gorge_fishpie.potlevel = "med"
kynofoods.gorge_fishchips.potlevel = "med"
kynofoods.gorge_meatpie.potlevel = "med"
kynofoods.gorge_sliders.potlevel = "med"
kynofoods.gorge_jelly_roll.potlevel = "med"
kynofoods.gorge_carrot_cake.potlevel = "med"
kynofoods.gorge_garlicmashed.potlevel = "med"
kynofoods.gorge_garlicbread.potlevel = "med"
kynofoods.gorge_tomato_soup.potlevel = "med"
kynofoods.gorge_sausage.potlevel = "med"
kynofoods.gorge_candiedfish.potlevel = "low"
kynofoods.gorge_stuffedmushroom.potlevel = "low"
kynofoods.gorge_bruschetta.potlevel = "med"
kynofoods.gorge_hamburger.potlevel = "med"
kynofoods.gorge_fishburger.potlevel = "med"
kynofoods.gorge_mushroomburger.potlevel = "med"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix For Food On Stations.
for name, recipe in pairs(kynofoods) do
	table.insert(cookerrecipes["cookpot"], name)
	table.insert(cookerrecipes["portablecookpot"], name)
	table.insert(cookerrecipes["archive_cookpot"], name)
	table.insert(cookerrecipes["kyno_archive_cookpot"], name)
	AddPrefabPostInit(name, function(inst)
		inst.AnimState:OverrideSymbol("swap_food", name, name)
	end)
	for _, spicename in ipairs(spices) do
		local spiced_name = name.."_spice_"..spicename
		table.insert(cookerrecipes["portablespicer"], spiced_name)
		AddPrefabPostInit(spiced_name, function(inst)
			inst.AnimState:OverrideSymbol("swap_food", name, name)
		end)
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prevent Food From Spoiling In Stations.
local KEEP_FOOD_K = GetModConfigData("keep_food_spoilage_k")
if KEEP_FOOD_K == 1 then
    AddPrefabPostInit("cookpot", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
	AddPrefabPostInit("archive_cookpot", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
	AddPrefabPostInit("portablecookpot", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
	AddPrefabPostInit("portablespicer", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
end

-- Dragonfly Drops Coffee Plants.
local DF_COFFEE = GetModConfigData("df_coffee")
if DF_COFFEE == 0 then
	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
		end
	end)
elseif DF_COFFEE == 1 then
	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
		end
	end)
elseif DF_COFFEE == 2 then
	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
		end
	end)
elseif DF_COFFEE == 3 then
	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00) 
			inst.components.lootdropper:AddChanceLoot("dug_kyno_coffeebush", 1.00)
		end
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inventory Icons.
if GLOBAL.TheNet:GetIsMasterSimulation() then
    local foods_atlas = MODROOT.."images/inventoryimages/kyno_foodimages.xml"
    for _, foods in pairs({"kyno_coffeebeans_cooked", "kyno_coffeebeans", "dug_kyno_coffeebush", "kyno_shark_fin", "kyno_roe_cooked", "kyno_roe", 
	"kyno_mussel_cooked", "kyno_mussel", "kyno_beanbugs_cooked", "kyno_beanbugs", "kyno_gummybug_cooked", "kyno_gummybug", "kyno_humanmeat_cooked",
	"kyno_humanmeat", "kyno_humanmeat_dried", "coffee", "bisque", "jellyopop", "musselbouillabaise", "sharkfinsoup", "sweetpotatosouffle", "caviar", "tropicalbouillabaisse", 
	"feijoada", "gummy_cake", "hardshell_tacos", "icedtea", "tea", "nettlelosange", "snakebonesoup", "steamedhamsandwich", "bubbletea", "frenchonionsoup", "slaw", 
	"lotusbowl", "poi", "jellybean_sanity", "jellybean_hunger", "jellybean_super", "bowlofgears", "longpigmeal", "kyno_syrup", "kyno_flour", "kyno_spotspice", "kyno_bacon",
	"kyno_bacon_cooked", "gorge_bread", "gorge_potato_chips", "gorge_vegetable_soup", "gorge_jelly_sandwich", "gorge_fish_stew", "gorge_onion_cake",
	"gorge_potato_pancakes", "gorge_potato_soup", "gorge_fishball_skewers", "gorge_meat_skewers", "gorge_stone_soup", "gorge_croquette", "gorge_roast_vegetables",
	"gorge_meatloaf", "gorge_carrot_soup", "gorge_fishpie", "gorge_fishchips", "gorge_meatpie", "gorge_sliders", "gorge_jelly_roll", "gorge_carrot_cake", "gorge_garlicmashed",
	"gorge_garlicbread", "gorge_tomato_soup", "gorge_sausage", "gorge_candiedfish", "gorge_stuffedmushroom", "gorge_bruschetta", "gorge_hamburger", "gorge_fishburger",
	"gorge_mushroomburger", "kyno_white_cap", "kyno_white_cap_cooked"}) do
        local foods_name = foods
        AddPrefabPostInit(foods_name, function(inst)
            inst.components.inventoryitem.imagename = foods_name
            inst.components.inventoryitem.atlasname = foods_atlas
        end)
    end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------