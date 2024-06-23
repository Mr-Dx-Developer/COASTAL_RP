--[[

Open qb-core/server/players.lua and find

    PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false
    }

Replace With

    PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['dmv'] = false,
        ['driver'] = false,
        ['business'] = false,
        ['weapon'] = false
    }

]]--

Config = {}

Config.School = {coords = vec3(239.94, -1380.25, 33.72), blip = {toggle = true, id = 408, scale = 0.7, color = 3, title = "Driving School"}}

Config.SpeedUnit = "kmh" -- kmh or mph

Config.Preview = {coords = vec3(251.2, -1402.97, 30.54), heading = 45.0}

Config.Rates = {theory = 80, examQuestions = 60} -- How many percent of answers has to be correct?

Config.DrivingMistakes = 8 -- max driving mistakes

Config.TpBack = true --whether to teleport player back to driving school after too much mistakes or leaving vehicle

Config.Objects = {
    {name = 'v_corp_sidetable', isVehicle = false, category = 'dmv', label = 'Theory', price = 500}, -- do not change category
    {name = 'asea', isVehicle = true, category = 'driver', label = 'Car License', price = 1500}
}

Config.Keys = { -- https://docs.fivem.net/docs/game-references/controls/
    firstOption = 161,
    secondOption = 162,
    thirdOption = 163
}

Config.DisplayKeys = {
    firstOption = "~INPUT_SELECT_WEAPON_UNARMED~",
    secondOption = "~INPUT_SELECT_WEAPON_MELEE~",
    thirdOption = "~INPUT_SELECT_WEAPON_SHOTGUN~"
}

Config.Theory = {
    {
        question = "Who goes first?",
        camera = {coords = vec3(-152.30, 84.04, 75.5), heading = 278.0, tilt = -20.0},
        vehicles = {
            {model = 'asea', coords = vec3(-130.7, 93.8, 70.47), heading = 147.4, lights = {right = true, left = false, sirens = false}, color = {0,255,0}, wheelAngle = -10.0},
            {model = 'asea', coords = vec3(-118.87, 76.15, 70.76), heading = 62.3, lights = {right = false, left = false, sirens = false}, color = {255,255,255}, wheelAngle = 0.0},
        },
        answers = { -- 3 answers
            {text = "Green car", correct = false},
            {text = "White car", correct = true},
            {text = "Does not matter", correct = false},
        }
    },
    {
        question = "What is maximum speed in parking lots?",
        camera = {coords = vec3(429.30, -666.59, 42.45), heading = 223.0-180.0, tilt = -30.0},
        vehicles = {
        },
        answers = { -- 3 answers
            {text = "10 km/h", correct = false},
            {text = "20 km/h", correct = true},
            {text = "30 km/h", correct = false},
        }
    },
    {
        question = "What should white car do?",
        camera = {coords = vec3(110.18, 355.59, 115.83), heading = 263.0, tilt = -20.0},
        vehicles = {
            {model = 'asea', coords = vec3(141.58, 356.75, 110.9), heading = 286.4, lights = {right = false, left = false, sirens = false}, color = {255,255,255}, wheelAngle = 0.0},
            {model = 'police', coords = vec3(127.05, 352.45, 111.74), heading = 286.4, lights = {right = false, left = false, sirens = true}, color = {0,0,0}, wheelAngle = 0.0},
        },
        answers = { -- 3 answers
            {text = "Stop on the side of the road", correct = true},
            {text = "Keep driving", correct = false},
            {text = "Accelerate and drive on", correct = false},
        }
    },
    {
        question = "What should red car do?",
        camera = {coords = vec3(124.68, -791.97, 34.35), heading = 62.36, tilt = -20.0},
        vehicles = {
            {model = 'asea', coords = vec3(113.31, -789.73, 30.99), heading = 68.03, lights = {right = false, left = false, sirens = false}, color = {255,0,0}, wheelAngle = 0.0},
            {model = 'bus', coords = vec3(108.50, -784.69, 31.43), heading = 76.53, lights = {right = false, left = true, sirens = false}, color = {255,255,255}, wheelAngle = 10.0},
        },
        answers = { -- 3 answers
            {text = "Let the bus pass", correct = true},
            {text = "Prevent the bus from passing", correct = false},
            {text = "Turn off the engine", correct = false},
        }
    },
    {
        question = "What is wrong in this situation?",
        camera = {coords = vec3(1235.18, 961.5, 147.46), heading = 113.38, tilt = -20.0},
        vehicles = {
            {model = 'asea', coords = vec3(1218.80, 954.37, 143.03), heading = 124.72, lights = {right = false, left = false, sirens = false}, color = {0,0,255}, wheelAngle = 0.0},
            {model = 'asea', coords = vec3(1224.05, 953.53, 142.74), heading = 130.39, lights = {right = false, left = true, sirens = false}, color = {0,255,0}, wheelAngle = 0.0},
        },
        answers = { -- 3 answers
            {text = "Blue car needs turn signal", correct = false},
            {text = "Blue car drives against traffic", correct = false},
            {text = "Green car cannot overtake", correct = true},
        }
    },
}

Config.ExamQuestions = {
    driver = {
        {
            question = "How will you check if the horn is working?",
            answers = { -- 3 answers
                {text = "Press the horn with ignition on", correct = true},
                {text = "Press the horn without ignition on", correct = false},
                {text = "Check the sound pad under the hood", correct = false},
            }
        },
        {
            question = "How will you check if the brake is working?",
            answers = { -- 3 answers
                {text = "Check errors on the dash", correct = false},
                {text = "Press the brake pedal while driving", correct = true},
                {text = "Press the brake pedal while still", correct = false},
            }
        },
        {
            question = "What device is used to measure tire pressure?",
            answers = { -- 3 answers
                {text = "Manometer", correct = true},
                {text = "Thermometer", correct = false},
                {text = "Caliper", correct = false},
            }
        },
    }
}

Config.Driving = {
    {
        checkpoint = vec3(251.2, -1402.97, 30.54),
        text = "We are going to start our exam. Speed in the parking lot is 20km/h. Carefully follow checkpoints and good luck!"
    },
    {
        checkpoint = vec3(224.75, -1408.02, 29.12),
        text = "Now we are entering city, speed limit is 50 km/h.",
        speedUntil = 20,
    },
    {
        checkpoint = vec3(183.95, -1395.63, 28.8),
        text = "Be careful over here!",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(214.6, -1149.89, 28.89),
        text = "Take a turn to the left.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(84.37, -1136.00, 28.72),
        text = "Take a turn to the left once again.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(54.98, -1247.52, 28.9),
        text = "Let's enter the freeway!",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(174.02, -1242.19, 37.85),
        text = "Take a look at your mirrors and take off! Speed in the freeway is 110 km/h.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(611.60, -1236.21, 40.48),
        text = "Let's get off the freeway. Speed limit is again 50 km/h.",
        speedUntil = 110,
    },
    {
        checkpoint = vec3(776.73, -1244.92, 26.28),
        text = "Take a turn to the right.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(786.68, -1416.46, 26.65),
        text = "Take a turn to the right once again.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(465.81, -1423.39, 28.91),
        text = "Take a turn to the left.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(338.97, -1494.63, 28.85),
        text = "Take a turn to the left once again.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(223.72, -1420.66, 28.77),
        text = "Let's get back to driving school's parking lot. Speed limit is 20 km/h.",
        speedUntil = 50,
    },
    {
        checkpoint = vec3(237.69, -1411.63, 30.13),
        text = "",
        speedUntil = 20,
    },
}

Config.Translations = {
    enter = "Press ~INPUT_PICKUP~ to enter",
    noTheory = "[~r~LOCKED~w~]~c~ Complete theory first~w~",
    beginExam = "~INPUT_CELLPHONE_SELECT~ Begin exam",
    completed = "[~g~Completed~w~]~c~ You have this license~w~",
    menu = "Category: ~b~%s~w~\nPrice: ~g~$%s~w~\n%s\n~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ Browse categories\n~INPUT_CELLPHONE_CANCEL~ Leave",
    speeding = "Mistake! You are speeding! %s/%s",
    tooFar = "Mistake! You went to far! %s/%s",
    kickedOut = "You have been kicked out of a vehicle for too much mistakes!",
    passed = "Exam has been passed! You got %s. Claim document at city hall!",
    passedTheory = "[~g~Completed~w~]~c~ You passed the theory~w~",
    tooManyMistakes = "You have made too many mistakes on these questions!",
    notEnough = "Not enough money!",
    theory = "Success! You passed theory exam."
}

function notify(text)
    TriggerEvent('QBCore:Notify', text)
end


