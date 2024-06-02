--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.Framework = "qbcore" -- Framework | types: qbcore, ESX, standalone
Config.NewESX = true
Config.MLO = "gabz" -- Maps | types: vanilla, gabz
Config.Target = "qb-target" -- Target | types: qb-target, qtarget, ox_target
Config.BossMenu = "qb-management" -- BossMenu | types: esx_society, qb-management, zerio-bossmenu
Config.NotificationType = "qbcore" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "qbcore" -- ProgressBar | types: progressBars, ox_lib, qbcore
Config.Clothing = "qb-clothing" -- Skin / Clothing | types: esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.Context = "qbcore" -- Context | types: ox_lib, qbcore
Config.Input = "qb-input" -- Input | types: ox_lib, qb-input
--PLAYER SETTINGS
Config.JobName = "unicorn" -- Job name for Unicorn
Config.BossGrade = 5 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = true -- Required to clean hands to make drinks etc.

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = true -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.unicorn = {
    PolyZone = {
        coords = vector3(119.98, -1289.29, 37.73), size = vec3(50.6, 40.6, 20), rotation = 211, debug = false, RemovePeds = true, radius = 50.0
    },

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(134.6066, -1276.3187, 28.3262, 315.2296),
                Scenario = "WORLD_HUMAN_SMOKING"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 2 },
        },
        SpawnPoints = {
            { Coords = vector3(137.6740, -1264.6813, 29.1603), Heading = 208.7397, Radius = 3.0 },
            { Coords = vector3(138.6378, -1275.0543, 29.0927), Heading = 296.7762, Radius = 3.0 }
        },
    },

    Bars = {
        FrontBar = {
            coords = vector3(128.05, -1283.14, 29.27),
            radius = 0.5,
            debug = false,
            camera = {
                enabled = true,
                coords = vector3(128.8118, -1283.8989, 29.7507),
                rotation = vector3(-4.29, 0.0, 8.4244),
            },
        },
    },

    Sinks = {
        FrontBar = {
            coords = vector3(130.3844, -1286.3746, 28.9845),
            radius = 0.3,
            debug = false,
            WaterStream = vector3(130.21, -1286.14, 29.399),
        },
    },

    Duty = {
        Main = { coords = vector3(128.55, -1279.34, 29.72), radius = 0.25, debug = false },
        Front = { coords = vector3(102.3134, -1299.5570, 29.6036), radius = 0.7, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(104.84, -1303.55, 28.79), radius = 0.6, debug = false },
    },

    Stashes = {

        Main = {
            name = "Unicorn_Refregiator",
            label = "Unicorn Refregiator",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(119.17, -1302.85, 28.87),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiator2 = {
            name = "Unicorn_Refregiator2",
            label = "Unicorn Refregiator 2",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(132.45, -1285.69, 28.92),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Refregiato3 = {
            name = "Unicorn_Refregiator3",
            label = "Unicorn Refregiator 3",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(129.8, -1280.72, 28.72),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiato4 = {
            name = "Unicorn_Refregiator4",
            label = "Unicorn Refregiator 4",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(129.01, -1283.98, 28.77),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Refregiato5 = {
            name = "Unicorn_Refregiator5",
            label = "Unicorn Refregiator 5",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(129.93, -1285.46, 28.77),
            radius = 0.4,
            debug = false,
            job = "unicorn"
        },

        Refregiato6 = {
            name = "Unicorn_Refregiator6",
            label = "Unicorn Refregiator 6",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(92.92, -1290.93, 29.26),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Table = {
            name = "Unicorn_Table",
            label = "Unicorn Table",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(94.77, -1289.96, 28.81),
            radius = 0.45,
            debug = false
        },

        Table2 = {
            name = "Unicorn_Table2",
            label = "Unicorn Table 2",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(113.35, -1303.02, 28.72),
            radius = 0.6,
            debug = false
        },

        Table3 = {
            name = "Unicorn_Table3",
            label = "Unicorn Table 3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(114.67, -1305.65, 28.64),
            radius = 0.45,
            debug = false
        },

        Table4 = {
            name = "Unicorn_Table4",
            label = "Unicorn Table 4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(113.76, -1299.81, 28.62),
            radius = 0.4,
            debug = false
        },

        Table5 = {
            name = "Unicorn_Table5",
            label = "Unicorn Table 5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(111.26, -1304.28, 28.64),
            radius = 0.5,
            debug = false
        },

        Table6 = {
            name = "Unicorn_Table6",
            label = "Unicorn Table 6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(114.68, -1299.18, 29.22),
            radius = 0.5,
            debug = false
        },

        Table7 = {
            name = "Unicorn_Table7",
            label = "Unicorn Table 7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(123.36, -1294.77, 28.62),
            radius = 0.55,
            debug = false
        },

        Table8 = {
            name = "Unicorn_Table8",
            label = "Unicorn Table 8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(119.95, -1296.72, 28.57),
            radius = 0.5,
            debug = false
        },

        Table9 = {
            name = "Unicorn_Table9",
            label = "Unicorn Table 9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(121.89, -1287.35, 27.81),
            radius = 0.55,
            debug = false
        },

        Table10 = {
            name = "Unicorn_Table10",
            label = "Unicorn Table 10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(120.96, -1285.21, 27.56), 
            radius = 0.55,
            debug = false
        },

        Table11 = {
            name = "Unicorn_Table11",
            label = "Unicorn Table 11",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(117.6, -1283.06, 27.76),
            radius = 0.75,
            debug = false
        },

        Table12 = {
            name = "Unicorn_Table12",
            label = "Unicorn Table 12",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(115.94, -1286.88, 27.56),
            radius = 0.8,
            debug = false
        },

        Table13 = {
            name = "Unicorn_Table13",
            label = "Unicorn Table 13",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(112.81, -1283.19, 27.71),
            radius = 0.65,
            debug = false
        },

        Table14 = {
            name = "Unicorn_Table14",
            label = "Unicorn Table 14",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(116.36, -1291.31, 27.66),
            radius = 0.5,
            debug = false
        },

        Table15 = {
            name = "Unicorn_Table15",
            label = "Unicorn Table 15",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(125.81, -1286.77, 29.27),
            radius = 0.45,
            debug = false
        },

        Table16 = {
            name = "Unicorn_Tabl16",
            label = "Unicorn Table 16",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(124.22, -1283.94, 29.37),
            radius = 0.5,
            debug = false
        },

    },

    BossMenu = {
        Main = { coords = vector3(95.77, -1293.17, 29.26), radius = 0.55, debug = false },
    },

    IceMachine = {
        FrontBar = { coords = vector3(128.01, -1281.78, 29.27), radius = 0.45, debug = false },
    },

    Registers = {
        FrontBar = { coords = vector3(129.05, -1285.03, 29.27), radius = 0.45, debug = false, amount = 0 },
        BackBar = { coords = vector3(118.92, -1303.26, 29.27), radius = 0.4, debug = false, amount = 0 },
    },

    DancePlatforms = {
        Platform1 = { coords = vector3(107.6730, -1287.2207, 27.2602), radius = 0.7, debug = false,
            dict = "anim@mp_player_intupperraining_cash", anim = "idle_a" },
        Platform2 = { coords = vector3(105.9073, -1288.1018, 27.2602), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center" },
        Platform3 = { coords = vector3(102.3427, -1287.6899, 27.2602), radius = 0.7, debug = false,
            dict = "anim@mp_player_intupperraining_cash", anim = "idle_a" },
        Platform4 = { coords = vector3(109.4097, -1286.9412, 27.2602), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center" },
        Platform5 = { coords = vector3(110.5899, -1287.9596, 27.260), radius = 0.7, debug = false,
            dict = "anim@mp_player_intupperraining_cash", anim = "idle_a" },
        Platform6 = { coords = vector3(111.1164, -1289.5334, 27.2602), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center" },
        Platform7 = { coords = vector3(110.4149, -1291.1067, 27.2602), radius = 0.7, debug = false,
            dict = "anim@mp_player_intupperraining_cash", anim = "idle_a" },
        Platform8 = { coords = vector3(108.6520, -1292.3320, 27.2602), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center" },
        Platform9 = { coords = vector3(107.1692, -1294.5430, 27.2602), radius = 0.7, debug = false,
            dict = "anim@mp_player_intupperraining_cash", anim = "idle_a" },
        Strip = { coords = vector3(106.4095, -1289.2457, 28.2497), radius = 0.7, debug = false,
            dict = "switch@trevor@mocks_lapdance", anim = "001443_01_trvs_28_idle_stripper" },
        Strip2 = { coords = vector3(107.6302, -1291.4230, 28.2497), radius = 0.7, debug = false,
            dict = "switch@trevor@mocks_lapdance", anim = "001443_01_trvs_28_idle_stripper" },
        Strip3 = { coords = vector3(109.4606, -1288.8810, 28.2497), radius = 0.7, debug = false,
            dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2" },
        Strip4 = { coords = vector3(103.1898, -1290.1368, 28.2497), radius = 0.7, debug = false,
            dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2" },
        Strip5 = { coords = vector3(105.2046, -1293.8542, 28.2497), radius = 0.7, debug = false,
            dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2" },
        DJ = { coords = vector3(120.5862, -1281.3948, 28.4805), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@djs@dixon@", anim = "dixn_dance_cntr_open_dix" },
    },

    -- Here, we're not using any teleports, so we just put it underground.. if you want it, you can change coords
    Teleports = {
        FrontBar = {
            coords = vector3(-563.8512, 287.6432, -85.6261),
            radius = 0.7,
            debug = false,
            BehindCoords = { coords = vector3(-564.5140, 287.7162, -85.3771), heading = 86.2596 },
            FrontCoords = { coords = vector3(-563.2971, 287.6181, -85.3764), heading = 102.0459 },
        },
    }
}

--Drinks
Config.Drinks = {
    PinaColada = {
        Title = "Piña Colada",
        description = "Requirements: Tall glass, Rhum, Ice, Coco Milk",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "coco_milk", count = 1, remove = true },
        },
        AddItems = {
            { item = "pina_colada", count = 1 },
        }
    },
    Mojito = {
        Title = "Mojito",
        description = "Requirements: Tall glass, Rhum, Lime, Sugar, Juice, Mint, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "mint", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
            { item = "sugar", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
        },
        AddItems = {
            { item = "mojito", count = 1 },
        }
    },
    MaiTai = {
        Title = "Mai Tai",
        description = "Requirements: Tall glass, Rhum, Lime, Juice, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
        },
        AddItems = {
            { item = "mai_tai", count = 1 },
        }
    },
    Caipirinha = {
        Title = "Caipirinha",
        description = "Requirements: Tall glass, Rhum, Lime, Sugar, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
            { item = "sugar", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
        },
        AddItems = {
            { item = "caipirinha", count = 1 },
        }
    },
    SanFrancisco = {
        Title = "San Francisco",
        description = "Requirements: Tall glass, Gin, Juice, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "gin", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
        },
        AddItems = {
            { item = "san_francisco", count = 1 },
        }
    },
    BlueLagoon = {
        Title = "Blue Lagoon",
        description = "Requirements: Tall glass, Vodka, Lemon, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "vodka", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lemon", count = 1, remove = true },
        },
        AddItems = {
            { item = "blue_lagoon", count = 1 },
        }
    }
}

--Food
Config.Food = {
    BowlChips = {
        Title = "Bowl of nuts",
        description = "Requirements: Bowl, Nuts",
        RequiredItems = {
            { item = "bowl", count = 1, remove = true },
            { item = "nuts", count = 1, remove = true },
        },
        AddItems = {
            { item = "bowl_nuts", count = 1 },
        }
    },
    BowlBeans = {
        Title = "Bowl of nuts",
        description = "Requirements: Bowl, Nuts",
        RequiredItems = {
            { item = "bowl", count = 1, remove = true },
            { item = "nuts", count = 1, remove = true },
        },
        AddItems = {
            { item = "bowl_beans", count = 1 },
        }
    },
}


--Sink
Config.Sink = {
    CleanTallGlass = {
        Title = "Clean Tall Glass",
        description = "Requirements: Dirty Tall Glass",
        prop = `prop_sh_tall_glass`,
        RequiredItems = {
            { item = "glass_tall_dirty", count = 1, remove = true },
        },
        AddItems = {
            { item = "glass_tall", count = 1 },
        }
    },
    CleanBowl = {
        Title = "Clean Bowl",
        description = "Requirements: Dirty Bowl",
        prop = `prop_bar_beans`,
        RequiredItems = {
            { item = "bar_bowl_dirty", count = 1, remove = true },
        },
        AddItems = {
            { item = "bar_bowl", count = 1 },
        }
    },
}

--IceMachine
Config.IceMachine = {
    Ice = {
        Title = "Get Ice Cube",
        description = "Get ice cube to drinks!",
        RequiredItems = {
            --{ item = "glass_tall_dirty", count = 1, remove = false },
        },
        AddItems = {
            { item = "ice", count = 1 },
        }
    },
}

--BLIPS
Config.Blips = {
    Unicorn = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(127.7439, -1296.4795, 29.2693), -- Blip coords
        Sprite = 121, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 27, -- colour
        Name = "Vanilla Unicorn" -- Blip name
    },
}

--Job BLIPS
Config.JobBlips = {
    PawnShop = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(-1311.47, -1172.07, 3.9), -- Blip coords
        Sprite = 59, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 5, -- colour
        Name = "Vanilla Unicorn - Shop" -- Blip name
    },
}

--Shop
Config.Shop = {
    Header = "Vanilla Unicorn Shop",
    Items = {
        { label = 'Coco Milk', item = 'coco_milk', description = "Buy Coco Milk for: $", price = 7, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Dirty Tall Glass', item = 'glass_tall_dirty', description = "Buy Dirty Tall Glass for: $", price = 2,
            MinAmount = 1, MaxAmount = 20 },
        { label = 'Juice', item = 'juice', description = "Buy Juice for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Lemon', item = 'lemon', description = "Buy Lemon for: $", price = 6, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Lime', item = 'lime', description = "Buy Lime for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Mint', item = 'mint', description = "Buy Mint for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'rhum', item = 'Rhum', description = "Buy Rhum for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Sugar', item = 'sugar', description = "Buy Sugar for: $", price = 4, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Vodka', item = 'vodka', description = "Buy Vodka for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Dirty bowl', item = 'bar_bowl_dirty', description = "Buy Dirty Bowl for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Nuts', item = 'nuts', description = "Buy Nuts for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Beans', item = 'beans', description = "Buy Beans for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
    },
    Ped = {
        { model = "mp_m_shopkeep_01", coords = vec4(-1312.43, -1171.91, 3.9, 284.6), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

-- Consumables / Drinking / Eating
Config.Consumables = {
    bar_nuts = { -- Item name
        Log = "He ate nuts",
        Remove = true, -- Remove item
        RemoveItem = "bar_nuts", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_bar_nuts',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    bar_beans = { -- Item name
        Log = "He ate beans",
        Remove = true, -- Remove item
        RemoveItem = "bar_beans", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_bar_beans',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    pina_colada = { -- Item name
        Log = "Drank Pina colada",
        Remove = true, -- Remove item
        RemoveItem = "pina_colada", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    mojito = { -- Item name
        Log = "Drank mojito",
        Remove = true, -- Remove item
        RemoveItem = "mojito", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    mai_tai = { -- Item name
        Log = "Drank mai_tai",
        Remove = true, -- Remove item
        RemoveItem = "mai_tai", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    caipirinha = { -- Item name
        Log = "Drank caipirinha",
        Remove = true, -- Remove item
        RemoveItem = "caipirinha", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    san_francisco = { -- Item name
        Log = "Drank san_francisco",
        Remove = true, -- Remove item
        RemoveItem = "san_francisco", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    blue_lagoon = { -- Item name
        Log = "Drank blue_lagoon",
        Remove = true, -- Remove item
        RemoveItem = "blue_lagoon", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
}

Config.ChairsDebug = false
Config.Chairs = {
    --TABLE 1
    {
        coords = vector3(108.1647, -1293.3772, 27.8831), offsetZ = -0.10, heading = 23.9221, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.8822, -1292.7703, 27.2602, 26.7122)
    },
    {
        coords = vector3(109.8825, -1292.3513, 27.8831), offsetZ = -0.10, heading = 41.2316, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(109.5518, -1291.8939, 27.2602, 23.7923)
    },
    {
        coords = vector3(111.6231, -1290.8160, 27.8831), offsetZ = -0.10, heading = 70.5656, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.9927, -1290.5118, 27.2602, 70.5656)
    },
    {
        coords = vector3(111.9545, -1288.4238, 27.8831), offsetZ = -0.10, heading = 115.0771, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.2678, -1288.5551, 27.2602, 115.0771)
    },

    {
        coords = vector3(110.6030, -1286.7766, 27.8831), offsetZ = -0.10, heading = 150.6991, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.2512, -1287.1630, 27.2602, 150.6991)
    },
    {
        coords = vector3(108.5261, -1286.0763, 27.8831), offsetZ = -0.10, heading = 185.2940, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(108.4963, -1286.7618, 27.2602, 185.2940)
    },
    {
        coords = vector3(106.3941, -1286.8787, 27.8831), offsetZ = -0.10, heading = 209.5410, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(106.6128, -1287.3651, 27.2602, 209.5410)
    },
    {
        coords = vector3(104.7855, -1287.7676, 27.8831), offsetZ = -0.10, heading = 214.6654, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(104.9925, -1288.2598, 27.2602, 214.6654)
    },
    --TABLE 2
    {
        coords = vector3(126.5513, -1282.6707, 29.0320), offsetZ = -0.10, heading = 302.2742, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(126.1233, -1282.9052, 28.2693, 136.9819)
    },
    {
        coords = vector3(127.4068, -1284.1040, 29.0320), offsetZ = -0.10, heading = 306.9974, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(126.8756, -1284.4230, 28.2693, 125.6510)
    },
    {
        coords = vector3(128.0748, -1285.2928, 29.0320), offsetZ = -0.10, heading = 311.9296, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(127.6198, -1285.5469, 28.2693, 131.0379)
    },
    {
        coords = vector3(128.7359, -1286.4358, 29.0320), offsetZ = -0.10, heading = 297.2738, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.2783, -1286.5674, 28.2693, 112.0810)
    },
    {
        coords = vector3(129.3718, -1287.6024, 29.0320), offsetZ = -0.10, heading = 306.9953, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.9819, -1287.8413, 28.2693, 112.8866)
    },
    --TABLE 3
    {
        coords = vector3(111.2984, -1281.9708, 27.8831), offsetZ = -0.10, heading = 219.5883, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.7564, -1282.2496, 27.2602, 219.5883)
    },
    {
        coords = vector3(112.0964, -1281.3516, 27.8831), offsetZ = -0.10, heading = 215.1264, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.3105, -1281.8635, 27.2602, 215.1264)
    },
    {
        coords = vector3(112.9852, -1281.2357, 27.8831), offsetZ = -0.10, heading = 172.7675, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.9320, -1281.7758, 27.2732, 172.7675)
    },
    {
        coords = vector3(113.8083, -1281.5759, 27.8831), offsetZ = -0.10, heading = 139.0775, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.6159, -1282.0721, 27.2602, 139.0775)
    },
    {
        coords = vector3(114.5037, -1282.3319, 27.8831), offsetZ = -0.10, heading = 117.3981, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.9795, -1282.5240, 27.2555, 117.3981)
    },
    {
        coords = vector3(114.6765, -1283.1757, 27.8831), offsetZ = -0.10, heading = 97.9669, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.1222, -1283.1890, 27.2602, 97.9669)
    },
    {
        coords = vector3(114.4474, -1284.0256, 27.8831), offsetZ = -0.10, heading = 58.8751, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.9048, -1283.8523, 27.2602, 58.8751)
    },
    {
        coords = vector3(113.7528, -1284.7189, 27.8831), offsetZ = -0.10, heading = 27.7402, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.4484, -1284.2874, 27.2558, 27.7402)
    },
    --TABLE 4
    {
        coords = vector3(117.4467, -1285.7456, 27.8831), offsetZ = -0.10, heading = 119.3560, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.0087, -1286.0909, 27.2602, 119.3560)
    },
    {
        coords = vector3(117.6893, -1286.5349, 27.8831), offsetZ = -0.10, heading = 84.6532, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.2066, -1286.7260, 27.2602, 84.6532)
    },
    {
        coords = vector3(117.6166, -1287.5283, 27.8831), offsetZ = -0.10, heading = 68.0536, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.0873, -1287.3387, 27.2530, 68.0536)
    },
    {
        coords = vector3(117.1280, -1288.2144, 27.8831), offsetZ = -0.10, heading = 50.2997, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.7853, -1287.7629, 27.2602, 50.2997)
    },
    {
        coords = vector3(116.2531, -1288.5225, 27.8831), offsetZ = -0.10, heading = 13.2617, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.0894, -1288.0840, 27.2602, 13.2617)
    },
    {
        coords = vector3(115.3421, -1288.5520, 27.8831), offsetZ = -0.10, heading = 343.5023, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.4196, -1288.0643, 27.2557, 343.5023)
    },
    --TABLE 5
    {
        coords = vector3(115.8832, -1283.8962, 27.8831), offsetZ = -0.10, heading = 310.6576, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.3415, -1283.7357, 27.2602, 310.6576)
    },
    {
        coords = vector3(115.5955, -1283.0723, 27.8831), offsetZ = -0.10, heading = 286.9614, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.1517, -1282.9298, 27.2602, 286.9614)
    },
    {
        coords = vector3(115.9035, -1282.0033, 27.8831), offsetZ = -0.10, heading = 240.2723, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.3784, -1282.2937, 27.2602, 240.2723)
    },
    {
        coords = vector3(116.5056, -1281.4192, 27.8831), offsetZ = -0.10, heading = 215.6932, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.7231, -1281.9430, 27.2554, 215.6932)
    },
    {
        coords = vector3(117.2883, -1281.1525, 27.8831), offsetZ = -0.10, heading = 183.4660, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.3762, -1281.7017, 27.2602, 183.4660)
    },
    {
        coords = vector3(118.1986, -1281.3113, 27.8831), offsetZ = -0.10, heading = 160.0094, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.0707, -1281.8589, 27.2602, 160.0094)
    },
    {
        coords = vector3(118.9634, -1281.8427, 27.8831), offsetZ = -0.10, heading = 128.0857, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.5246, -1282.1819, 27.2589, 128.0857)
    },
    {
        coords = vector3(119.3103, -1282.6425, 27.8831), offsetZ = -0.10, heading = 99.1393, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.8130, -1282.7972, 27.2554, 99.1393)
    },
    --TABLE 6
    {
        coords = vector3(120.3339, -1284.1119, 27.8831), offsetZ = -0.10, heading = 209.9036, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.6591, -1284.5745, 27.2587, 209.9036)
    },
    {
        coords = vector3(121.4663, -1283.8474, 27.8831), offsetZ = -0.10, heading = 175.8504, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.2868, -1284.3159, 27.2602, 175.8504)
    },
    {
        coords = vector3(122.1494, -1284.5983, 27.8831), offsetZ = -0.10, heading = 125.3508, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.6713, -1284.8397, 27.2604, 125.3508)
    },
    {
        coords = vector3(122.4534, -1285.5507, 27.8831), offsetZ = -0.10, heading = 73.2978, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.9277, -1285.4055, 27.2557, 73.2978)
    },
    {
        coords = vector3(121.6319, -1286.3036, 27.8831), offsetZ = -0.10, heading = 37.6982, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.3505, -1285.8153, 27.2602, 37.6982)
    },
    --TABLE 7
    {
        coords = vector3(123.0713, -1286.7272, 27.8831), offsetZ = -0.10, heading = 187.9797, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.9451, -1287.2068, 27.2602, 187.9797)
    },
    {
        coords = vector3(123.8439, -1287.5515, 27.8831), offsetZ = -0.10, heading = 182.2098, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.2552, -1287.7681, 27.2602, 182.2098)
    },
    {
        coords = vector3(124.1546, -1288.4507, 27.8831), offsetZ = -0.10, heading = 76.7260, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.6182, -1288.3331, 27.2602, 76.7260)
    },
    {
        coords = vector3(123.4008, -1289.1797, 27.8831), offsetZ = -0.10, heading = 37.9876, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.0324, -1288.7502, 27.2602, 37.9876)
    },
    --TABLE 8
    {
        coords = vector3(124.3408, -1293.7279, 28.8183), offsetZ = -0.10, heading = 121.6098, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.8481, -1294.0190, 28.2693, 121.6098)
    },
    {
        coords = vector3(124.8770, -1294.6318, 28.8484), offsetZ = -0.10, heading = 115.1720, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.3108, -1294.7925, 28.2694, 115.1720)
    },
    {
        coords = vector3(124.4872, -1295.8425, 28.8484), offsetZ = -0.10, heading = 54.0744, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.1556, -1295.4296, 28.2694, 54.0744)
    },
    {
        coords = vector3(123.5813, -1296.3651, 28.8484), offsetZ = -0.10, heading = 26.8883, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.4196, -1295.8546, 28.2694, 26.8883)
    },
    {
        coords = vector3(122.4040, -1295.9778, 28.8484), offsetZ = -0.10, heading = 308.4721, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.8666, -1295.6416, 28.2694, 308.4721)
    },
    {
        coords = vector3(121.9062, -1295.1108, 28.8484), offsetZ = -0.10, heading = 311.0298, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.4075, -1294.8466, 28.2694, 311.0298)
    },
    --TABLE 9
    {
        coords = vector3(120.8525, -1295.6863, 28.8484), offsetZ = -0.10, heading = 124.4409, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.5119, -1296.0554, 28.2694, 124.4409)
    },
    {
        coords = vector3(121.4925, -1296.6168, 28.8484), offsetZ = -0.10, heading = 110.0061, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.9953, -1296.8926, 28.2694, 110.0061)
    },
    {
        coords = vector3(121.1351, -1297.8300, 28.8484), offsetZ = -0.10, heading = 22.9529, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.7976, -1297.3656, 28.2694, 22.9529)
    },
    {
        coords = vector3(120.2928, -1298.3162, 28.8484), offsetZ = -0.10, heading = 18.9943, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.9361, -1297.8619, 28.2694, 18.9943)
    },
    {
        coords = vector3(119.0261, -1297.9738, 28.8484), offsetZ = -0.10, heading = 306.0406, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.4664, -1297.5934, 28.2694, 306.0406)
    },
    {
        coords = vector3(118.5218, -1297.0306, 28.8484), offsetZ = -0.10, heading = 292.2786, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.0106, -1296.7721, 28.2694, 292.2786)
    },
    --TABLE 10
    {
        coords = vector3(112.7460, -1300.3533, 28.8484), offsetZ = -0.10, heading = 209.3583, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.0902, -1300.7990, 28.2927, 209.3583)
    },
    {
        coords = vector3(111.8175, -1300.9615, 28.8484), offsetZ = -0.10, heading = 207.3478, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.2105, -1301.3729, 28.2927, 207.3478)
    },
    {
        coords = vector3(111.0221, -1301.5034, 28.8484), offsetZ = -0.10, heading = 216.8274, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.3143, -1301.8555, 28.2927, 216.8274)
    },
    {
        coords = vector3(110.2212, -1302.0726, 28.8484), offsetZ = -0.10, heading = 260.2877, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.7265, -1302.2605, 28.3296, 260.2877)
    },
    {
        coords = vector3(110.5166, -1303.0498, 28.8484), offsetZ = -0.10, heading = 306.0406, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.0717, -1302.8835, 29.2924, 319.6523)
    },
    {
        coords = vector3(111.9851, -1305.6008, 28.8484), offsetZ = -0.10, heading = 307.5330, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.4165, -1305.3024, 28.3443, 307.5330)
    },
    {
        coords = vector3(112.7056, -1306.3507, 28.8484), offsetZ = -0.10, heading = 357.1729, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.8100, -1305.8630, 28.2927, 357.1729)
    },
    {
        coords = vector3(113.7458, -1305.9983, 28.8484), offsetZ = -0.10, heading = 26.2957, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.4625, -1305.6075, 28.2927, 26.2957)
    },
    {
        coords = vector3(115.5091, -1305.0121, 28.8484), offsetZ = -0.10, heading = 34.8896, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.1573, -1304.5172, 28.2927, 7.6775)
    },
    {
        coords = vector3(116.2858, -1304.3356, 28.8484), offsetZ = -0.10, heading = 73.7213, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.8083, -1304.1415, 28.2927, 73.7213)
    },
    {
        coords = vector3(115.9479, -1303.3240, 28.8484), offsetZ = -0.10, heading = 115.2382, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.4993, -1303.5592, 28.2927, 115.2382)
    },
    --TABLE 11
    {
        coords = vector3(117.2455, -1292.7332, 27.8831), offsetZ = -0.10, heading = 38.8528, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.9475, -1292.2291, 27.2602, 26.8228)
    },
    {
        coords = vector3(116.2019, -1293.0452, 27.8831), offsetZ = -0.10, heading = 348.4792, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.3668, -1292.5144, 27.2513, 342.3091)
    },
    {
        coords = vector3(115.5133, -1292.2919, 27.8831), offsetZ = -0.10, heading = 307.0855, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.9724, -1291.9591, 27.2555, 304.1265)
    },
    --SOFA1
    {
        coords = vector3(124.0078, -1279.5321, 28.8507), offsetZ = -0.10, heading = 208.5998, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.3146, -1279.9835, 28.2693, 208.5998)
    },
    {
        coords = vector3(125.0815, -1278.8871, 28.8507), offsetZ = -0.10, heading = 204.0523, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.3629, -1279.3873, 28.2693, 204.0523)
    },
    --SOFA2
    {
        coords = vector3(98.7329, -1290.4625, 28.8507), offsetZ = -0.10, heading = 119.2904, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(98.2758, -1290.8250, 28.2635, 125.6112)
    },
    {
        coords = vector3(98.0714, -1289.4818, 28.8507), offsetZ = -0.10, heading = 119.2904, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(97.5673, -1289.7594, 28.2635, 48.4941)
    },
    --CHAIR1
    {
        coords = vector3(95.2360, -1293.4696, 28.8567), offsetZ = -0.10, heading = 330.2567, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(94.6510, -1292.7789, 28.2635, 52.0339)
    },


}
