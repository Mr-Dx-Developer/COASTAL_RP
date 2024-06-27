Config = {}

Config.Locations = {        -- Locations of where the ped spawns. Chosen randomly every night at 22:00. Add as many as you like.
    [1] = vector4(-67.20, 6224.76, 41.28, 216.40),
    [2] = vector4(2545.28, 2592.14, 36.96, 114.09),
}

Config.Model = 'cs_joeminuteman' -- The model of the ped.


Config.Goodies = {
    label = "Blackmarket",
    slots = 14,
    items = {
        [1] = {
            name = "drill",
            price = 10000,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "cuff_cutter",
            price = 10000,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "advancedlockpick",
            price = 5000,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "armor",
            price = 2500,
            amount = 100,
            info = {  },
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "tracker_remover",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "nightvision",
            price = 8000,
            amount = 10,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "c4_bomb",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "handcuffs",
            price = 500,
            amount = 20,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "heavyarmor",
            price = 10000,
            amount = 6,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "harness",
            price = 2000,
            amount = 10,
            info = {},
            type = "item",
            slot = 10,
        },
    }
}




---------------------
-- SHOP OPEN/CLOSE --
---------------------

Config.Open = 22
Config.Close = 5 



Config.GBMarketLocation = {
    Coords = vector4(-149.0933380127, 308.29916381836, 92.760902404785, 227.18499755859),
    ModelName = "a_m_y_epsilon_02",
    ModelHash = 0xAA82FF9B,
    SetBlipSprite = 303,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 40,
    BlipName = "Syndicate Dealer"
}

Config.GBMarketIcons = {
    EyeIcon = "fa-solid fa-face-smile-horns",
    Header = "fa-solid fa-person-rifle",
    Miscellanceous = "fa-solid fa-icons"
}

Config.GBMarketText = {
    TargetLabel = "Syndicate Seller",
    PedHeader = "Syndicate Dealer",
    Miscellanceous = "Miscellanceous",

}


Config.GBMarketMiscellanceousShop = {
    label = "Black Market Miscellanceous Shop",
    slots = 3,
    items = {
        [1] = {
            name = "ammo-rifle",
            price = 40,
            amount = 100,
            info = {  },
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "ammo-rifle2",
            price = 40,
            amount = 100,
            info = {  },
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "ammo-rifle3",
            price = 45,
            amount = 100,
            info = {  },
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "ammo-rifle4",
            price = 50,
            amount = 100,
            info = {  },
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "ammo-rifle5",
            price = 60,
            amount = 100,
            info = {  },
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "ammo-rifle5",
            price = 60,
            amount = 100,
            info = {  },
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "ammo-sniper",
            price = 1000,
            amount = 100,
            info = {  },
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "armor",
            price = 6000,
            amount = 100,
            info = {  },
            type = "item",
            slot = 7,
        },
        [9] = {
            name = "heavyarmor",
            price = 15000,
            amount = 100,
            info = {  },
            type = "item",
            slot = 9,
        },
    }
}
