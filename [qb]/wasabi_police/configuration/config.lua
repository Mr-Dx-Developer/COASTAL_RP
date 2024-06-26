-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local seconds, minutes = 1000, 60000
Config = {}

Config.jobMenu = 'F6'          -- Default job menu key
Config.useTarget = false        -- Enable target for police functions (Supports qtarget, qb-target, and ox_target)
Config.MobileMenu = {          -- THIS WILL USE A OX_LIB MENU RATHER THAN OX_LIB CONTEXT MENU!
    enabled = false,           -- Use a mobile menu from ox_lib rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'             -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.UseRadialMenu = false   -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB 3.0 OR HIGHER - Editable in client/radial.lua)

Config.customCarlock = false   -- If you use wasabi_carlock OR qb-carlock set to true(Add your own carlock system in client/cl_customize.lua)
Config.billingSystem = false   -- Current options: 'esx' (For esx_billing) / 'qb' (QBCore) / 'okok' (For okokBilling) (Easy to add more/fully customize in client/cl_customize.lua)

Config.OldQBManagement = true -- If you use older qb-management

Config.AdvancedParking = false -- Delete vehicles with their exports(Script named advanced parking)
Config.Jail = {
    enabled = true,           -- Enable jail feature?
    input = true,              -- Enable input? Some needs it
    jail = 'rcore',                 -- Current options: 'qb' (For qb-prison) / 'rcore' (For rcore-prison) / 'tk_jail' (For tk_jail) / 'hd_jail' (For hd_jail) / 'myPrison' (For myPrison) / 'qalle-jail' (For qalle-jail) / 'plouffe ' (For Plouffe Jail) / 'mx' (For mxJail) / 'custom' (For custom)
}
-- NOTE: If using qb-prison, you must make one small change to qb-prison.
-- SEE https://docs.wasabiscripts.com/scripts/wasabi_police/customizations#qb-prison-integration

Config.searchPlayers = true     -- Allow police jobs to search players for items (Must have inventory in bridge or one already supported in cl_customize.lua - or add your own!)
Config.weaponsAsItems = true     -- (If you're unsure leave as true!)This is typically for older ESX and inventories that still use weapons as weapons and not items

Config.spikeStripsEnabled = true -- Enable functionality of spike strips (Disable if you use difference script for spike strips)

--[[ These resources can trigger:
    wasabi_police:handcuffPlayer
    wasabi_police:escortPlayer
    wasabi_police:inVehiclePlayer
    wasabi_police:outVehiclePlayer
]]
Config.AllowedResources = {
    'qb-core',
    'qb-radialmenu', -- For civilians to be able to use radial menu features(Already had compatibility without edit)
}

Config.AllowedJobs = { -- THIS HAS NOTHING TO DO with Config.policeJobs, only with triggering events above
    --'bloods'
}

Config.GrantWeaponLicenses = {
    enabled = true,          -- If you want police to have option to grant/revoke weapons licenses
    license_name = 'weapon', -- Name of license
    minGrade = 0,            -- Min grade to use this function
    menuPosition =
    'bottom-right'           -- Choose where menu of player select is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}

Config.GSR = {                 -- Gunshot residue settings
    enabled = true,           -- Enabled?
    cleanInWater = true,       -- Can clean GSR while in water?
    timeToClean = 5 * seconds, -- How long to clean GSR in water if enabled
    autoClean = 600,           -- (IN SECONDS)How long before residue clears itself? Set to false if undesired to auto clean GSR
    command = 'gsr'            -- Command for testing for GSR? Set to false if undesired
}

Config.tackle = {
    enabled = true,    -- Enable tackle?
    policeOnly = true, -- Police jobs only use tackle?
    hotkey = 'G'       -- What key to press while sprinting to start tackle of target
}

Config.seizeCash = {   -- ONLY FOR QBCORE WITHOUT CASH AS ITEM
    enabled = true,    -- Enabled?
    item = 'moneybag'  -- Item to add after seizedCash
}

Config.handcuff = {                             -- Config in regards to cuffing
    defaultCuff = 'hard',                       -- Default cuff type (Options: 'soft' / 'hard') Changing this will be the default hotkey cuff type
    persistentCuff = true,                      -- Verify player's cuffed status during login (Install '_EXTRA_ESX_INSTALL/ESX_PERSISTENT_CUFF.sql' if using ESX)
    timer = 20 * minutes,                       -- Time before player is automatically unrestrained(Set to false if not desired)
    hotkey = 'J',                               -- What key to press to handcuff people(Set to false for no hotkey)
    skilledEscape = {
        enabled = true,                         -- Allow criminal to simulate resisting by giving them a chance to break free from cuffs via skill check
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    },
    cuffItem = {                                -- Have handcuffs as usable item? (ITEM NAME MUST BE IN ITEMS / YOU MUST ADD YOURSELF)
        enabled = true,                        -- Enable a handcuff usable item?? Must be in items table/database with name defined below
        required = true,                        -- Requires handcuff item to be in inventory when any handcuff function is used
        item = 'handcuffs'                      -- Item name (DONT FORGET to make sure its in your items)
    },
    lockpicking = {                             -- Lockpicking someone else out of handcuffs
        enabled = false,                        -- Enable handcuffs to be able to be lockpicked off(MUST HAVE LOCKPICK ITEM IN ITEMS)
        item = 'bobby_pin',
        breakChance = 50,                       -- Chance of lockpick breaking if failed (Set to 100 for 100% or 0 for never breaking)
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    }
}

Config.policeJobs = { -- Police jobs
    'police',
    --    'sheriff'
}

Config.GPSBlips = {  -- Warning: May experience high usage when at high player count. Possibly turn up refreshrate as remedy!
    enabled = true, -- Enabled?
    refreshrate = 3, -- In Seconds Note: it could impact the server performance
    item = false,    -- Item required? Note: You have to use it then
    blip = {
        sprite = 1,
        color = 29,
        scale = 1.0,
        short = false,
    }
}

Config.Props = { -- What props are avaliable in the "Place Objects" section of the job menu

    {
        title = 'Barrier',             -- Label
        description = '',              -- Description (optional)
        model = `prop_barrier_work05`, -- Prop name within `
        groups = {                     -- ['job_name'] = min_rank
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Barricade',
        description = '',
        model = `prop_mp_barrier_01`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Traffic Cones',
        description = '',
        model = `prop_roadcone02a`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Spike Strip',
        description = '',
        model = `p_ld_stinger_s`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },

}

Config.Locations = {
    LSPD = {
        blip = {
            enabled = true,
            coords = vec3(464.57, -992.0, 30.69),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Mission Row PD'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(451.427, -983.36, 30.689), -- Location of where to go on and off duty(If not using target)
            heading = 84.34,                                                                -- Heading of armoury NPC
            ped = 's_f_y_cop_01',
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(442.517, -986.257, 30.724),
                heading = 4.31,
                width = 2.0,
                length = 1.0,
                minZ = 30.02 - 0.9,
                maxZ = 30.80 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(438.565, -974.995, 30.689), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(440.535, -975.958, 35.062),
                heading = 269.1,
                width = 2.0,
                length = 1.0,
                minZ = 30.02 - 0.9,
                maxZ = 30.85 + 0.9
            }
        },

        armoury = {
            enabled = true,                                                                 -- Set to false if you don't want to use
            coords = vec3(460.69, -1001.875, 30.718 - 0.9),                                    -- Coords of armoury
            heading = 271.24,                                                                -- Heading of armoury NPC
            ped = 's_f_y_cop_01',
            label = '[E] - Access Armoury',                                                 -- String of text ui
            jobLock = 'police',                                                             -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {              ---  Trainee                                                           
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                --[[     ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 }, ]]
                   

                },
                [1] = {    ---  Trooper
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                --    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                --    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                --    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                --    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                --    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                --    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },
                    
                },
                [2] = { ----  Trooper First Class
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    
                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                --    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                --    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                --    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                --    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },


                },
                [3] = {    ----  Sergeant
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                --    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                --    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },
                


                },
                [4] = {       ------   Master Sergeant                                                
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                --    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                --    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },


                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },

                   

                },
                [5] = {           ----   Lieutenant                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },

                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },


                   

                },
                [6] = {           ---- Captain                                                                   
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },

                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },


                   

                },
                [7] = {     ---  Commander                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },

                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },

                   

                },
                
                [8] = {         --- Colonel                                                                
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },

                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },

                   

                },
                [9] = {          --- Assistant Chief                                                               
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },

                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },


                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },

                   

                },
                [10] = {       ---- Chief                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },
                    ['specialbadge'] = { label = 'Police Badge', multiple = false, price = 50 },
                    ['vehicle_gps'] = { label = 'Police Badge', multiple = false, price = 50 },
                    ['vehicle_tablet'] = { label = 'Police Badge', multiple = false, price = 50 },



                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    

                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['pistol_ammo'] = { label = 'Pistol ammo', multiple = true, price = 5 },
                    ['rifle_ammo'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['smg_ammo'] = { label = 'SMG ammo', multiple = true, price = 5 },
                    ['shotgun_ammo'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['snp_ammo'] = { label = 'Sniper ammo', multiple = true, price = 5 },

                    ['pistol_defaultclip'] = { label = 'Pistol Clip', multiple = false, price = 20 },
                    ['pistol_extendedclip'] = { label = 'Pistol EXT Clip', multiple = false, price = 20 },
                    ['at_clip_drum_pistol'] = { label = '50 Round Drum', multiple = false, price = 20 },
                    ['at_clip_100_pistol'] = { label = '100 Round Mag', multiple = false, price = 20 },
                    ['pistol_suppressor'] = { label = 'Pistol Suppressor', multiple = false, price = 20 },

                    ['rifle_flashlight'] = { label = 'Rifle Flashlight', multiple = false, price = 20 },
                    ['rifle_suppressor'] = { label = 'Rifle Suppressor', multiple = false, price = 20 },
                    ['rifle_grip'] = { label = 'Rifle Grip', multiple = false, price = 20 },

                    ['smg_extendedclip'] = { label = 'SMG EXT Clip', multiple = false, price = 20 },
                    ['smg_drum'] = { label = 'SMG Drum', multiple = false, price = 20 },
                    ['smg_scope'] = { label = 'SMG Scope', multiple = false, price = 20 },
                    ['smg_luxuryfinish'] = { label = 'SMG Finish', multiple = false, price = 20 },






                },

            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = true,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(465.692, -998.335, 30.689), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(467.481, -990.263, 35.062),
                heading = 89.8,
                width = 2.0,
                length = 1.0,
                minZ = 30.02 - 0.9,
                maxZ = 30.85 + 0.9
            }
        },

        evidenceLocker = {
            enabled = true,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(477.776, -987.979, 30.689), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(465.022, -1001.598, 30.463),
                heading = 267.0,
                width = 2.0,
                length = 1.0,
                minZ = 26.02 - 0.9,
                maxZ = 26.38 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
}
