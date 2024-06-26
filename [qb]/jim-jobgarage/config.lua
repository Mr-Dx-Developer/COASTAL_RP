print("^2Jim^7-^2JobGarage ^7v^41^7.^44^7.^43 ^7- ^2Job Garage Script by ^1Jimathy^7")

Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Fuel = "LegacyFuel", -- Set this to your fuel script folder

	CarDespawn = false, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(446.184, -972.932, 25.706, 274.612),
				out = vector4(450.194, -967.738, 25.706, 180.994),
				list = {
					["mach1rb"] = {
						CustomName = "PD Mustang",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["pd1"] = {
						CustomName = "PD Crown Vic",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["Char"] = {
						CustomName = "PD Charger",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["poldemonrb"] = {
						CustomName = "PD Demon",
						colors = { 255, 255 },
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["zr1RB"] = {
						CustomName = "PD ZR1",
						colors = { 255, 255 },
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					
					 
					["Explorer"] = {
						CustomName = "PD Explorer",
						colors = { 255, 255 },
						livery = 1,
						--bulletproof = true,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["polbikeb2"] = {
						CustomName = "PD Bike",
						livery = 3,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["r1custom"] = {
						CustomName = "pd bike",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["rmod69police"] = {
						CustomName = "PD 69",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["socharger"] = {
						CustomName = "PD Charger",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["sodurango"] = {
						CustomName = "PD Durango",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["soexplorer"] = {
						CustomName = "PD Explorer",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					
					["sotaurus"] = {
						CustomName = "PD Taurus",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["sotruck"] = {
						CustomName = "PD Truck",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					}
					
					
				},
			},
		},
			{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "police", -- set this to required job grade
			garage = {
				spawn = vector4(476.828, -1003.302, 45.911, 93.49),  -- Where the vehicle will spawn
				out = vector4(468.58, -999.911, 45.911, 280.735),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					--[[ ["polmav"] = {
						CustomName = "Polmav Super",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}, ]]
					["as350"] = {
						CustomName = "Heli",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					}
				},
			},    
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(351.58, -587.45, 74.16, 160.5),  -- Where the vehicle will spawn
				out = vector4(337.3927, -586.7730, 74.1617, 250.08),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["ec145med"] = {
						CustomName = "EMS Heli",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(288.771, -1434.144, 29.806, 53.51),  -- Where the vehicle will spawn
				out = vector4(284.791, -1438.979, 29.967, 319.326),  -- Where you select the vehicles from
				list = {
					
					["emsnspeedo"] = {
						CustomName = "EMS Speedo",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						
					},
					["f450ambo"] = {
						CustomName = "EMS F450",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						
					}
					
				}
			},
		},









		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "mechanic", -- set this to required job grade
			garage = {
				spawn = vector4(-362.97, -122.45, 38.7, 153.84),  -- Where the vehicle will spawn
				out = vector4(-353.55, -125.96, 39.43, 67.7),  -- Where you select the vehicles from
				list = {
					["flatbed"] = {
						CustomName = "Flatbed",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							
							
						},
					}, 
					
				},
			},
		},
	},
}