LocationsConfig = {}

LocationsConfig.Stations = {
    ["FoodStations"] = { -- Food stations
        ["BurgerShotFood"] = { -- Station ID
            StationName = "BurgerShotFood", -- Name of the station need to be the same as station ID
            Job = "burgershot", -- Atorized job name
            Coords = vector3(-1197.51, -899.23, 13.58), -- Zone coords (need to be vector3)
            Length = 1, -- Length value for polyzone
            Width = 1, -- Width value for polyzone
            TargetIcon = "fas fa-circle", -- Target Icon
            Animation = "mechanic4", -- Only can use dpemotes animations.
            Revenus = {
                ["bs_slimshady"] = {
                    ItemName = "bs_slimshady", -- Food Item name
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "batatas_cortadas", -- Ingredient item name
                            amount = 1, -- How many ingredients you need to make 1 food
                        },
                        [2] = {
                            item = "carne_hambuger_grelhada",
                            amount = 2,
                        },
                        [3] = {
                            item = "cebola_cortada",
                            amount = 1,
                        },
                    },
                },
                ["bs_royalshot"] = {
                    ItemName = "bs_royalshot",
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "batatas_cortadas",
                            amount = 1,
                        },
                        [2] = {
                            item = "carne_hambuger_grelhada",
                            amount = 1,
                        },
                        [3] = {
                            item = "cebola_cortada",
                            amount = 1,
                        },
                        [4] = {
                            item = "alface_cortada",
                            amount = 1,
                        },
                    },
                },
            }
        },
        ["BurgerShotFood2"] = { -- Station ID
            StationName = "BurgerShotFood2", -- Name of the station need to be the same as station ID
            Job = "burgershot", -- Atorized job name
            Coords = vector3(-1199.25, -902.54, 13.18), -- Zone coords (need to be vector3)
            Length = 1, -- Length value for polyzone
            Width = 1, -- Width value for polyzone
            TargetIcon = "fas fa-circle", -- Target Icon
            Animation = "mechanic4", -- Only can use dpemotes animations.
            Revenus = {
                ["bs_slimshady"] = {
                    ItemName = "bs_slimshady", -- Food Item name
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "batatas_cortadas", -- Ingredient item name
                            amount = 1, -- How many ingredients you need to make 1 food
                        },
                        [2] = {
                            item = "carne_hambuger_grelhada",
                            amount = 2,
                        },
                        [3] = {
                            item = "cebola_cortada",
                            amount = 1,
                        },
                    },
                },
                ["bs_royalshot"] = {
                    ItemName = "bs_royalshot",
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "batatas_cortadas",
                            amount = 1,
                        },
                        [2] = {
                            item = "carne_hambuger_grelhada",
                            amount = 1,
                        },
                        [3] = {
                            item = "cebola_cortada",
                            amount = 1,
                        },
                    },
                },
            }
        },
    },
    ["DrinkStations"] = { -- Drink stations
        ["BurgerShotDrinks"] = { -- Station ID
            StationName = "BurgerShotDrinks", -- Name of the station need to be the same as station ID
            Job = "burgershot", -- Atorized job name
            Coords = vector3(-1199.19, -896.07, 13.74), -- Zone coords (need to be vector3)
            Length = 1, -- Length value for polyzone
            Width = 1, -- Width value for polyzone
            Animation = "handshake", -- Only can use dpemotes animations.
            TargetIcon = "fas fa-circle",
            Revenus = {
                ["bs_coke"] = {
                    ItemName = "bs_coke",
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "water_bottle",
                            amount = 2,
                        },
                        [2] = {
                            item = "kurkakola",
                            amount = 1,
                        },
                    },
                },
                ["bs_sprite"] = {
                    ItemName = "bs_sprite",
                    ReciveAmount = 1,
                    Itens = {
                        [1] = {
                            item = "water_bottle",
                            amount = 2,
                        },
                        [2] = {
                            item = "water_bottle",
                            amount = 4,
                        },
                    },
                },
            }
        },
    },
    ["CuttingStations"] = { -- Cut stations
        ["BurgerShotCut"] = { -- Station ID
            StationName = "BurgerShotCut", -- Name of the station need to be the same as station ID
            Job = "burgershot", -- Atorized job name
            Coords = vector3(-1198.64, -898.72, 13.24), -- Zone coords (need to be vector3)
            Length = 1, -- Length value for polyzone
            Width = 1, -- Width value for polyzone
            TargetIcon = "fas fa-circle", -- Target Icon
            Animation = "mechanic4", -- Only can use dpemotes animations. CRIAR A ANIMAÇÃO COM A FACA NO DPEMOTES
            Itens = {
                [1] = {
                    ItemName = "batatas_cortadas",
                    ReciveAmount = math.random(3,5),
                    Itens = {
                        [1] = {
                            item = "batatas",
                            amount = 1,
                        },
                    },
                },
                [2] = {
                    ItemName = "alface_cortada",
                    ReciveAmount = math.random(3,5),
                    Itens = {
                        [1] = {
                            item = "alface",
                            amount = 1,
                        },
                    },
                },
                [3] = {
                    ItemName = "cebola_cortada",
                    ReciveAmount = math.random(3,5),
                    Itens = {
                        [1] = {
                            item = "cebola",
                            amount = 1,
                        },
                    },
                },
            }
        },
    },
    ["GrillStations"] = { -- Grill stations
        ["BurgerShotGrill"] = { -- Station ID
            StationName = "BurgerShotGrill", -- Name of the station need to be the same as station ID
            Job = "burgershot", -- Atorized job name
            Coords = vector3(-1186.8, -900.59, 13.8), -- Zone coords (need to be vector3)
            Length = 1, -- Length value for polyzone
            Width = 1, -- Width value for polyzone
            TargetIcon = "fas fa-circle", -- Target Icon
            Animation = "bbq", -- Only can use dpemotes animations. the animation can be meatgrill or friethings -- CRIAR A ANIMAÇÃO COM A FACA NO DPEMOTES
            Itens = {
                [1] = {
                    ItemName = "sandwich",
                    ReciveAmount = math.random(3,5),
                    Itens = {
                        [1] = {
                            item = "water",
                            amount = 1,
                        },
                        [2] = {
                            item = "cola",
                            amount = 1,
                        },
                    },
                },
            }
        },
    },
}

LocationsConfig.Garages = {
    ["BurgerShot"] = { -- Station ID need to be the same as Station Name
        StationName = "BurgerShot", -- Station Name need to be the same as Station ID
        Job = "burgershot", -- Authorized job
        PedModel = "a_m_y_golfer_01", -- Ped model
        PedHash = 0xD71FE131, -- Ped hash
        PedLoc = vector3(-1173.92, -898.35, 12.76), -- Location where ped will spawn
        SpawnLoc = vector4(-1170.94, -892.22, 13.93, 29.48), -- location where vehicle will spawn
        Heading = 284.46, -- ped heading
        Width = 1, -- polyzone width
        Length = 1, -- polyzone length
        TargetIcon = "fas fa-car", -- Targget icon
        Vehicles = { -- List of vehicles
            [1] = {
                VehicleLable = "Scooter", -- Vehicle label name
                VehicleSpawnName = "faggio3", -- Vehicle spawn name
            },
            [2] = {
                VehicleLable = "Reclame Auto",
                VehicleSpawnName = "stalion2",
            },
            [3] = {
                VehicleLable = "Bestel Bus",
                VehicleSpawnName = "rumpo2",
            },
        }
    },
}

LocationsConfig.ClothingSpots = {
    ["BurgerShot"] = { -- Station ID
        StationName = "BurgerShotClothes", -- Station name need to be the same as station ID
        Coords = vector3(-1200.69, -887.2, 14.0), -- Station coords
        Width = 1, -- Polyzone Width
        Length = 1, -- Polyzone Length
        TargetIcon = "fas fa-shirt", -- Target Icon
        Job = "burgershot", -- Job
    },
}

LocationsConfig.Registers = {
    ["BurgerShotRegister"] = { -- Station ID
        StationName = "BurgerShotRegister", -- Station name need to be the same as station ID
        Coords = vector3(-1190.61, -895.63, 13.8), -- Station coords
        Width = 0.50, -- Polyzone Width
        Length = 0.50, -- Polyzone Length 
        TargetIcon = "fas fa-clipboard", -- Target Icon
        Job = "burgershot", -- Job
    },
    ["BurgerShotRegister2"] = { -- Station ID
        StationName = "BurgerShotRegister2", -- Station name need to be the same as station ID
        Coords = vector3(-1189.01, -894.55, 13.8), -- Station coords
        Width = 0.50, -- Polyzone Width
        Length = 0.50, -- Polyzone Length 
        TargetIcon = "fas fa-clipboard", -- Target Icon
        Job = "burgershot", -- Job
    },
    ["BurgerShotRegister3"] = { -- Station ID
        StationName = "BurgerShotRegister3", -- Station name need to be the same as station ID
        Coords = vector3(-1187.61, -893.51, 13.8), -- Station coords
        Width = 0.50, -- Polyzone Width
        Length = 0.50, -- Polyzone Length 
        TargetIcon = "fas fa-clipboard", -- Target Icon
        Job = "burgershot", -- Job
    },
}

LocationsConfig.WashHands = {
    ["BurgerShotWHands"] = { -- Station ID
        StationName = "BurgerShotWHands", -- Station name need to be the same as station ID
        Coords = vector3(-1186.64, -902.98, 13.8), -- Station coords
        Width = 1, -- Polyzone Width
        Length = 1, -- Polyzone Length 
        TargetIcon = "fas fa-hands", -- Target Icon
        Job = "burgershot", -- Job
    },
}

LocationsConfig.ToogleDuty = {
    ["BurgerShot"] =  { -- Station ID
        StationName = "BurgerShotDuty", -- Station name need to be the same as station ID
        Job = "burgershot", -- Job
        Coords = vector3(-1177.53, -897.78, 13.8), -- Station coords
        Width = 1, -- Polyzone Width
        Length = 1, -- Polyzone Length 
        TargetIcon = "fas fa-clipboard", -- Target Icon
    },
}

LocationsConfig.MapBlips = {
    [1] = { blipvariantid = BSBlip, blipcolour = 75, blipsprite = 106, blipdisplay = 2, blipscale = 0.5, blipcoords = vector3(-1179.61, -885.8, 13.81), blipname = "BurgerShot" },

    -- blipvariantid - is the variant id need to be a unique id!!
    -- blipcolour - is the colour of the blip
    -- blipsprite - is the blip sprite ID
    -- blipdisplay - is the size of blip on Map
    -- blipcoords - is the coordinates of the blip
    -- blipname - is the name that shows at map
}