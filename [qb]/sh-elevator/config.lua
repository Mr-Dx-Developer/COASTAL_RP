return {
    texts = {
        open = '[~g~E~w~] - Elevator'
    },

    draw_dist = 3.0,
    interact_dist = 1.5,

    elevators = {
        ['Life Invader'] = {
            {
                number = 0, -- floor
                name = 'Ground Floor', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1077.96, -254.81, 37.76),
            },
            {
                number = 1, -- floor
                name = 'Floor One', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1078.06, -254.56, 44.02),
            },
            {
                number = 2, -- floor
                name = 'Roof', -- or false
                code = '1234', -- restrict floor by password
                pos = vector3(-1072.81, -246.69, 54.01),
            },
        },
        ['Example'] = {
            {
                number = 0, -- floor
                name = false, -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1067.68, -284.49, 37.71),
            },
            {
                number = 1, -- floor
                name = 'Roof', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1066.94, -286.98, 50.02),
            },
        },
        ['Hospital Lift'] = {
            {
                number = 0, -- floor
                name = 'Ground Floor', -- or false
                code = '1472', -- restrict floor by password
                pos = vector3(355.69, -1411.306, 32.429),
            },
            {
                number = 1, -- floor
                name = 'Roof', -- or false
                code = '1472', -- restrict floor by password
                pos = vector3(336.184, -1432.63, 46.514),
            },
        },
    },
}