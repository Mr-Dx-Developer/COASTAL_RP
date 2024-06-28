Config = {}

Config.RentalLocations = {
    [1] = {
        name = 'prision',
        pedcoords = vector4(1852.1954, 2582.2512, 45.6726, 273.8113),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 326,
        blipcolor = 50,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'prision'}
				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'prision'}

				},
			},
			distance = 2.0
		},
    },
    [2] = {
        name = 'paleto',
        pedcoords = vector4(-214.48, 6355.65, 31.49, 136.78),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 326,
        blipcolor = 50,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'paleto'}
				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'paleto'}

				},
			},
			distance = 2.0
		},
    },
    [3] = {
        name = 'airport',
        pedcoords = vector4(-1039.50, -2728.03, 13.75, 240.70),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 326,
        blipcolor = 50,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'airport'}
				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'airport'}

				},
			},
			distance = 2.0
		},
    },
    --[[ [2] = {
        name = 'airport',
        pedcoords = vector4(-1036.67, -2682.75, 14.07-1, 335.81),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 32,
        label = 'Car Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenCarMenu",
					icon = "fas fa-clipboard",
					label = "Rent Car",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'airport'}

				},
                {
					type = "client",
					event = "ksuie-vehrental:Client:ReturnCar",
					icon = "fas fa-clipboard",
					label = "Return Car",
					targeticon = 'fas fa-clipboard',
                    position = 2,
                    params = {location = 'airport'}

				},
			},
			distance = 2.0
		},
    }, ]]
    [4] = {
        name = 'docks',
        pedcoords = vector4(4876.1455078125, -1093.7674560547, 2.9330389499664, 5.1826863288879),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 410,
        label = 'Boat Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenBoatMenu",
					icon = "fas fa-clipboard",
					label = "Rent Boat",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'docks'}

				},
			},
			distance = 2.0
		},
    },

    [5] = {
        name = 'docks2',
        pedcoords = vector4(2819.5239257813, -671.96240234375, 1.1668781042099, 267.45959472656),
        icon = 'fas fa-clipboard',
        ped = 'a_m_y_hipster_03',
        scenario = "WORLD_HUMAN_CLIPBOARD",
        blip = 724,
        blipcolor = 410,
        label = 'Boat Rental',
		target = {
			options = {
				{
					type = "client",
					event = "ksuie-vehrental:Client:OpenBoatMenu",
					icon = "fas fa-clipboard",
					label = "Rent Boat",
					targeticon = 'fas fa-clipboard',
                    position = 1,
                    params = {location = 'docks2'}

				},
			},
			distance = 2.0
		},
    },
}

Config.RentalCars = {
    ["blista2"] = {
        name = "Dinka Blista Compact",
        price = 400
    },
}

Config.BoatRental = {
    ["seashark"] = {
        name = "Jet Ski",
        price = 100
    },
}

Config.SpawnSlots = {
    ['prision'] = {
        slot1 = {coords = vector4(1854.62, 2578.74, 45.67, 267.22), occupied = false},
    },
    ['paleto'] = {
        slot1 = {coords = vector4(-214.41, 6352.54, 31.49, 133.47), occupied = false},
    },
    ['airport'] = {
        slot1 = {coords = vector4(-1040.50, -2719.01, 13.68, 57.11), occupied = false},
    },
    ['legion'] = {
        slot1 = {coords = vector4(104.37, -1079.2, 29.19, 338.69), occupied = false},
        slot2 = {coords = vector4(107.75, -1079.93, 29.19, 341.92), occupied = false},
        slot3 = {coords = vector4(111.24, -1081.28, 29.19, 336.82), occupied = false}
    },
    ['airport2'] ={
        slot1 = {coords = vector4(-1039.0, -2679.08, 13.83, 326.13), occupied = false},
        slot2 = {coords = vector4(-1041.95, -2676.55, 13.83, 321.46), occupied = false},
        slot3 = {coords = vector4(-1044.79, -2674.37, 13.83, 321.08), occupied = false}
    },
    ['docks'] = {
        slot1 = {coords = vector4(4864.0009765625, -1078.7811279297, 0.87274175882339, 71.811157226563), occupied = false},
    },

    ['docks2'] = {
        slot1 = {coords = vector4(2847.8962402344, -676.19494628906, -0.47485896945, 256.17456054688), occupied = false},
    },
}