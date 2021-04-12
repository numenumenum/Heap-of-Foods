--[[
-- Common Rooms
"BGBadlands","Badlands","Lightning","HoundyBadlands","BuzzardyBadlands","Moundfield",
"BGDeciduous","DeepDeciduous","DeciduousMole","DeciduousClearing","PondyGrass","MolesvilleDeciduous","MagicalDeciduous",
"BGGrassBurnt","BGGrass","MandrakeHome","GrassyMoleColony","FlowerPatch","EvilFlowerPatch","Waspnests","WalrusHut_Grassy","Walrusfield","PigTown","PigVillage","PigKingdom","PigCamp",
"BGDirt","BGNoise",
"BGCrappyForest","BGForest","BGDeepForest","BurntForest","CrappyDeepForest","DeepForest","Forest","ForestMole","CrappyForest","BurntClearing","Clearing","SpiderForest","SpiderCity","Graveyard",  
"BGMarsh","Marsh","SpiderMarsh","SlightlyMermySwamp","SpiderVillageSwamp","Mermfield","Tentacleland",
"BGRocky","Rocky","GenericRockyNoThreat","MolesvilleRocky","BGChessRocky","RockyBuzzards","SpiderVillage","WalrusHut_Rocky","Tallbirdfield","TallbirdNests","PigCity",
"BGSavanna","Plain","BarePlain","WalrusHut_Plains","BeefalowPlain",

-- Common rooms for each mobs.
Spiders = {"SpiderMarsh","SpiderForest","SpiderCity","SpiderVillage","SpiderVillageSwamp","SpiderfieldEasy","Spiderfield",},
Wasps = {"BeeClearing","FlowerPatch","EvilFlowerPatch","Waspnests",}, -- everywhere were bees are
Merms = {"SlightlyMermySwamp","MermTown","Mermfield",},
Tentacles = {"BGMarsh","Marsh","Tentacleland",},
Walrus = {"WalrusHut_Plains","WalrusHut_Grassy","WalrusHut_Rocky","Walrusfield",},
Hounds = {"HoundyBadlands","Moundfield",},
Clockworks = {"ChessArea","MarbleForest","ChessMarsh","ChessForest","ChessBarrens","BGChessRocky","Chessfield",},
GuardPigs = {}, -- They don't have a room.
Bees = {"BeeClearing","FlowerPatch","EvilFlowerPatch","Waspnests",},
Tallbirds = {"TallbirdNests","Tallbirdfield",},
Beefalos = {"BeefalowPlain",},
Pigs = {"PigTown","PigVillage","PigKingdom","PigCity","PigCamp",},
Rabbits = {"BGSavanna","Plain","BarePlain",},
Moles = {"GrassyMoleColony","DeciduousMole","MolesvilleDeciduous","ForestMole","MolesvilleRocky",},
Voaltgoats = {"Lightning",},
Catcoons = {"BGDeciduous","DeepDeciduous","MagicalDeciduous","DeciduousMole","PondyGrass",}
]]--

GLOBAL.require("map/terrain")

local function mymathclamp(num, min, max)
    return num <= min and min or (num >= max and max or num)
end
local function myround(num, idp)
    return GLOBAL.tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

-- Roomincrease is an array of the rooms where you want to add your prefab and a percentage how many.
-- {BGMarsh=0.8,Badlands=2,BGSavanna=1} this would result in 0.8% of the space in BGMarsh, 2% of space in Badlands and 1% of space in BGSavanna.
-- The percentage is percentage of total available space! I suggest at max 10, not more! A more common value would be ~ 0.8 The code does not allow values above 20.
local function AddThingtoWorldGeneration(prefab,roomincrease)
    local Increase = 0
    for roomstr,add in pairs(roomincrease) do
        Increase = add/100
        if Increase > 0 and Increase <= 0.2 then
            local oldpercent = 0
            local oldsum = 0
            local prefabvalue = 0
            AddRoomPreInit(roomstr, -- If the room does not exist, it is added... so in case we want to support mod rooms, we shoudl call all active rooms first, and test if this room is active at the moment.
                function(room)
                    if room.contents then
                        oldpercent = room.contents.distributepercent or 0
                        if not room.contents.distributeprefabs or oldpercent==0 then
                            room.contents.distributeprefabs = {}
                            prefabvalue = 1 -- Here this value does not matter, cause it is the only one.
                            room.contents.distributeprefabs[prefab] = (room.contents.distributeprefabs[prefab] and room.contents.distributeprefabs[prefab] + prefabvalue) or prefabvalue
                            room.contents.distributepercent = Increase
                        else
                            oldsum = 0
                            for distprefab,number in pairs(room.contents.distributeprefabs) do
                                if type(number)=="table" then -- Eg: smallmammal = {weight = 0.025, prefabs = {"rabbithole", "molehill"}},
                                    -- print("number ist eine table bei: "..tostring(distprefab).." in room: "..tostring(roomstr))
                                    for k,v in pairs(number) do
                                        -- print("k: "..tostring(k).." v: "..tostring(v))
                                        if type(v)=="number" and k=="weight" then
                                            oldsum = oldsum + v
                                        end
                                    end
                                elseif type(number)=="number" then
                                    oldsum = oldsum + number
                                end
                            end
                            room.contents.distributepercent = mymathclamp(oldpercent + Increase,0,1)
                            prefabvalue = myround((oldsum * (room.contents.distributepercent / oldpercent)) - oldsum,8)
                            room.contents.distributeprefabs[prefab] = (room.contents.distributeprefabs[prefab] and room.contents.distributeprefabs[prefab] + prefabvalue) or prefabvalue
                        end
                        -- print("Increaser Debug: "..roomstr..": added "..prefab..". oldpercent: "..oldpercent..", oldsum: "..oldsum..", newpercent: "..room.contents.distributepercent..", prefabvalue: "..prefabvalue..", newvalue: "..room.contents.distributeprefabs[prefab])
                    end
                end
            )
            print("Increaser: Add "..tostring(myround(Increase*100,2)).."% "..prefab.." to room: "..roomstr)
        elseif Increase > 0.2 then
            print("Increaser: Value of Increase is too high for "..prefab..", reduce it!")
        end
    end
end

AddThingtoWorldGeneration("kyno_aloe_ground",{BGGrass=0.8})
GLOBAL.terrain.filter.kyno_aloe_ground = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}

AddThingtoWorldGeneration("kyno_wildwheat",{BGSavanna=2,BeefalowPlain=2,WalrusHut_Plains=2,Plain=2,BarePlain=2})
GLOBAL.terrain.filter.kyno_wildwheat = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}

AddThingtoWorldGeneration("kyno_spotbush",{BGDeciduous=2,DeepDeciduous=2,MagicalDeciduous=2,DeciduousMole=2,PondyGrass=2})
GLOBAL.terrain.filter.kyno_spotbush = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}

AddThingtoWorldGeneration("kyno_radish_ground",{BGDeciduous=0.8,DeepDeciduous=0.8,MagicalDeciduous=0.8,DeciduousMole=0.8,PondyGrass=0.8})
GLOBAL.terrain.filter.kyno_radish_ground = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}