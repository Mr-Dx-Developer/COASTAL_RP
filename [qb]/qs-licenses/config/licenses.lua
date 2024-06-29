Config = Config or {}

Config.Shops = {
    [1] = {
        name = 'id_card',
        text =  "[E] - Identity License",
        label = 'ID Card',
        type = "ID Card",
        progbar = "Buying license...",
        price = 150,
        isjob = false, --job name or false.
        timer = 2500,
        location = vec3(-545.08, -204.13, 38.22),
        blip = {
            enable = true,
            name = 'Identity License',
            sprite = 409,
            color = 0,
            scale = 0.7
        },
    },

    [2] = {
        name = 'id_card',
        isjob = false, --job name or false.
        text =  "[E] - Gun license",
        label = 'Gun license',
        type = "Gun license",
        price = 20000,
        progbar = "Buying license...",
        timer = 2500,
        location = vec3(19.691, -1105.878, 29.797),
        blip = {
            enable = false,
            name = 'Gun license',
            sprite = 89,
            color = 1,
            scale = 0.5
        },
    },

    [3] = {
        name = 'id_card',
        isjob = false, --job name or false.
        text =  "[E] - Driver's license",
        label = 'Driver license',
        type = "Driver license",
        price = 10,
        progbar = "Buying license...",
        timer = 10000,
        location = vec3(239.78, -1380.27, 33.74),
        blip = {
            enable = true,
            name = 'Licencia de Conducir',
            sprite = 67,
            color = 3,
            scale = 0.6
        },
    },
}