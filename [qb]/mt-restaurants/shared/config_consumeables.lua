Consumeables = {}

Consumeables.Food = {
    { ItemName = "sandwich", Animation = "eat", HungerAmount = math.random(5,30), ReliveStress = true, StressAmount = math.random(10, 15), TimeEating = 7500 },
    { ItemName = "bs_slimshady", Animation = "eat", HungerAmount = math.random(5,30), ReliveStress = false, StressAmount = math.random(10, 15), TimeEating = 7500 },

    -- ItemName - items spawn name
    -- Animation - Animation name from dpemotes
    -- HungerAmount - How much hunger you recive eating that shit
    -- ReliveStressm - if true it will relive your stress
    -- StressAmount - How much stress it relieve eating
    -- TimeEating - ProgBar time eating
}

Consumeables.Drink = {
    { ItemName = "generator", Animation = "soda", ThirstAmount = math.random(5,30), ReliveStress = true, StressAmount = math.random(10, 15), HaveAlcohol = false, AlcoholAmount = 4, TimeDrinking = 7500 },
    { ItemName = "bs_sprite", Animation = "soda", ThirstAmount = math.random(5,30), ReliveStress = true, StressAmount = math.random(10, 15), HaveAlcohol = true, AlcoholAmount = 4, TimeDrinking = 7500 },

    -- ItemName - items spawn name
    -- Animation - Animation name from dpemotes
    -- HungerAmount - How much hunger you recive drinking that shit
    -- ReliveStressm - if true it will relive your stress
    -- StressAmount - How much stress it relieve drinking
    -- TimeEating - ProgBar time drinkig
}