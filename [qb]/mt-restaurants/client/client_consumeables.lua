local QBCore = exports[Main.CoreName]:GetCoreObject()
alcoholCount = 0

RegisterNetEvent('mt-restaurants:client:Eat', function(Animation, HungerAmount, ReliveStress, TimeEating, ItemName, StressAmount)
    playemote(Animation)
    print(TimeEating)
    QBCore.Functions.Progressbar('name_here', Lang.EatingProgBar, TimeEating, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
        playemote('c')
        if ReliveStress then
            TriggerServerEvent('hud:server:RelieveStress', StressAmount)
            TriggerServerEvent("mt-restaurants:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerAmount)
            TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
        else
            TriggerServerEvent("mt-restaurants:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerAmount)
            TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
        end
    end, function()
        playemote('c')
    end)
end)

RegisterNetEvent('mt-restaurants:client:Drink', function(Animation, ThirstAmount, ReliveStress, HaveAlcohol, AlcoholAmount, TimeDrinking, ItemName, StressAmount)
    playemote(Animation)
    QBCore.Functions.Progressbar('name_here', Lang.DrinkingProgBar, TimeDrinking, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
        playemote('c')
        if ReliveStress and HaveAlcohol then
            TriggerServerEvent('hud:server:RelieveStress', StressAmount)
            TriggerServerEvent("mt-restaurants:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstAmount)
            TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
            alcoholCount += 1
            if alcoholCount >= 1 and alcoholCount < 4 then
                DrunkEffect()
                TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            elseif alcoholCount >= 4 then
                DrunkEffect()
                TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            end
        elseif ReliveStress then
                TriggerServerEvent('hud:server:RelieveStress', StressAmount)
                TriggerServerEvent("mt-restaurants:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstAmount)
                TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
        elseif HaveAlcohol then
            TriggerServerEvent("mt-restaurants:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstAmount)
            TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
            alcoholCount += 1
            if alcoholCount >= 1 and alcoholCount < 4 then
                DrunkEffect()
                TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            elseif alcoholCount >= 4 then
                DrunkEffect()
                TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            end
        else
            TriggerServerEvent("mt-restaurants:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstAmount)
            TriggerServerEvent('mt-restaurants:server:RemoveConsumeableItem', ItemName)
        end
    end, function()
        playemote('c')
    end)
end)
