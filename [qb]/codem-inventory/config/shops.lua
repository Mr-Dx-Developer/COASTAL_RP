local normal = {
    ["1"] = { name = "tosti", price = 80 },
    ["2"] = { name = "water_bottle", price = 80 },
    ["3"] = { name = "kurkakola", price = 80 },
    ["4"] = { name = "twerks_candy", price = 80 },
    ["5"] = { name = "snikkel_candy", price = 80 },
    ["6"] = { name = "sandwich", price = 80 },

    ["7"] = { name = "lighter", price = 80 },
    ["8"] = { name = "rolling_paper", price = 80 },

}

local liquor = {
    ["1"] = { name = "beer", price = 80 },
    ["2"] = { name = "whiskey", price = 80 },
    ["3"] = { name = "vodka", price = 80 },

}
local hardware = {
    ["1"] = { name = "lockpick", price = 80 },
    ["2"] = { name = "weapon_wrench", price = 80 },
    ["3"] = { name = "weapon_hammer", price = 80 },
    ["4"] = { name = "repairkit", price = 80 },
    ["5"] = { name = "screwdriverset", price = 80 },
    ["6"] = { name = "firework1", price = 80 },
    ["7"] = { name = "firework2", price = 80 },
    ["8"] = { name = "firework3", price = 80 },
    ["9"] = { name = "firework4", price = 80 },
    ["10"] = { name = "cleaningkit", price = 80 },

}
local electric = {
    ["1"] = { name = "phone", price = 80 },
    ["2"] = { name = "radio", price = 80 },
    ["3"] = { name = "binoculars", price = 80 },
    ["4"] = { name = "fitbit", price = 80 },
}

local weedshop = {
    ["1"] = { name = "joint", price = 80 },
    ["2"] = { name = "weapon_poolcue", price = 80 },
    ["3"] = { name = "weed_nutrition", price = 80 },
    ["4"] = { name = "empty_weed_bag", price = 80 },
    ["5"] = { name = "rolling_paper", price = 80 },
}

local gearshop = {
    ["1"] = { name = "diving_gear", price = 80 },
    ["2"] = { name = "jerry_can", price = 80 },
}

local leisureshop = {
    ["1"] = { name = "parachute", price = 80 },
    ["2"] = { name = "binoculars", price = 80 },
    ["3"] = { name = "diving_gear", price = 80 },
    ["4"] = { name = "diving_fill", price = 80 },
}

local weapons = {
    ["1"] = { name = "weapon_knife", price = 80 },
    ["2"] = { name = "weapon_bat", price = 80 },
    ["3"] = { name = "weapon_hatchet", price = 80 },
    ["4"] = { name = "pistol_ammo", price = 80 },
    ["5"] = { name = "weapon_pistol", price = 80 },
    ["6"] = { name = "weapon_snspistol", price = 80 },
    ["7"] = { name = "weapon_vintagepistol", price = 80 },
 --   ["8"] = { name = "firework3", price = 80 },
 --   ["9"] = { name = "firework4", price = 80 },
--    ["10"] = { name = "cleaningkit", price = 80 },

}








Config.Shops = {
    ["policeshop"] = {
        label = "Police Shop",
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 1,
            scale = 0.5,
            color = 5,
        },
        job = {
            ["police"] = {
                [1] = true,
                [2] = true,
                [3] = true,
                [4] = true,
                [5] = true,
                [6] = true,
                [7] = true,
                [8] = true,
                [9] = true,
                [10] = true,
                [11] = true,
                [12] = true
            }
        },
        items = {
            ["1"] = { name = "weapon_pistol", price = 10, grade = 5 },
            ["2"] = { name = "weapon_flashlight", price = 10, grade = 4 },
            ["3"] = { name = "handcuffs", price = 10, grade = 6 },
            ["4"] = { name = "weapon_stungun", price = 10, },
            ["5"] = { name = "weapon_assaultsmg", price = 10, },
            ["6"] = { name = "weapon_smg", price = 10, },
            ["7"] = { name = "weapon_pistol50", price = 10, },
            ["8"] = { name = "bandage", price = 10, },
            ["9"] = { name = "pistol_ammo", price = 10, },
            ["10"] = { name = "smg_ammo", price = 10, },
            ["11"] = { name = "bobby_pin", price = 1, },
        },
        coords = vector3(458.489, -997.101, 35.062)
    },
    ["market"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(24.47, -1346.62, 29.5),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market2"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(-3039.54, 584.38, 7.91),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market3"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(-3242.97, 1000.01, 12.83),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market4"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(1728.07, 6415.63, 35.04),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market5"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(1959.82, 3740.48, 32.34),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market6"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(549.13, 2670.85, 42.16),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market7"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(2677.47, 3279.76, 55.24),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market8"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(2556.66, 380.84, 108.62),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market9"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(372.66, 326.98, 103.57),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market10"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(-47.02, -1758.23, 29.42),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market11"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(-706.06, -913.97, 19.22),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market12"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(-1820.02, 794.03, 138.09),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market13"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(1164.71, -322.94, 69.21),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },
    ["market14"] = {
        label = "Market",
        job = 'all',
        items = normal,
        coords = vector3(1697.87, 4922.96, 42.06),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 15,
        },
    },



    ["liquor"] = {
        label = "liquor",
        job = 'all',
        items = liquor,
        coords = vector3(-1221.58, -908.15, 12.33),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 46,
        },
    },
    ["liquor2"] = {
        label = "liquor",
        job = 'all',
        items = liquor,
        coords = vector3(-1486.59, -377.68, 40.16),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 46,
        },
    },
    ["liquor3"] = {
        label = "liquor",
        job = 'all',
        items = liquor,
        coords = vector3(-2966.39, 391.42, 15.04),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 46,
        },
    },
    ["liquor4"] = {
        label = "liquor",
        job = 'all',
        items = liquor,
        coords = vector3(1165.17, 2710.88, 38.16),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 46,
        },
    },
    ["liquor5"] = {
        label = "liquor",
        job = 'all',
        items = liquor,
        coords = vector3(1134.2, -982.91, 46.42),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 46,
        },
    },



    ["hardware"] = {
        label = "hardware",
        job = 'all',
        items = hardware,
        coords = vector3(45.68, -1749.04, 29.61),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 5,
        },
    },
    ["hardware2"] = {
        label = "hardware",
        job = 'all',
        items = hardware,
        coords = vector3(2747.71, 3472.85, 55.67),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 5,
        },
    },
    ["hardware3"] = {
        label = "hardware",
        job = 'all',
        items = hardware,
        coords = vector3(-421.83, 6136.13, 31.88),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 5,
        },
    },


    ["ammunation"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(-661.96, -933.53, 21.83),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation2"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(809.68, -2159.13, 29.62),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation3"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(1692.67, 3761.38, 34.71),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation4"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(-331.23, 6085.37, 31.45),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation5"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(253.63, -51.02, 69.94),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation6"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(23.0, -1105.67, 29.8),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation7"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(2567.48, 292.59, 108.73),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation8"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(-1118.59, 2700.05, 18.55),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation9"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(841.92, -1035.32, 28.19),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation10"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(-1304.19, -395.12, 36.7),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },
    ["ammunation11"] = {
        label = "ammunation",
        job = 'all',
        items = weapons,
        coords = vector3(-3173.31, 1088.85, 20.84),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 110,
            scale = 0.5,
            color = 5,
        },
    },

    ["weedshop"] = {
        label = "weedshop",
        job = 'all',
        items = weedshop,
        coords = vector3(-1168.26, -1573.2, 4.66),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 140,
            scale = 0.5,
            color = 5,
        },
    },

    ["seaword"] = {
        label = "seaword",
        job = 'all',
        items = gearshop,
        coords = vector3(-1687.03, -1072.18, 13.15),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 140,
            scale = 0.5,
            color = 5,
        },
    },

    ["leisureshop"] = {
        label = "leisureshop",
        job = 'all',
        items = leisureshop,
        coords = vector3(-1505.91, 1511.95, 115.29),
        Blip = {
            enable = true, -- show blip = true  -- hide blip false
            id = 52,
            scale = 0.5,
            color = 5,
        },
    },
}
