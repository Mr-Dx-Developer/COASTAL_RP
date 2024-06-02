local QBCore = exports[Main.CoreName]:GetCoreObject()

for i=1, #Consumeables.Food, 1 do
    QBCore.Functions.CreateUseableItem(Consumeables.Food[i].ItemName, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemBySlot(item.slot) ~= nil then
            TriggerClientEvent('mt-restaurants:client:Eat', src, Consumeables.Food[i].Animation, Consumeables.Food[i].HungerAmount, Consumeables.Food[i].ReliveStress, Consumeables.Food[i].TimeEating, Consumeables.Food[i].ItemName, Consumeables.Food[i].StressAmount)
        end
    end)
end

for i=1, #Consumeables.Drink, 1 do
    QBCore.Functions.CreateUseableItem(Consumeables.Drink[i].ItemName, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.GetItemBySlot(item.slot) ~= nil then
            TriggerClientEvent('mt-restaurants:client:Drink', src, Consumeables.Drink[i].Animation, Consumeables.Drink[i].ThirstAmount, Consumeables.Drink[i].ReliveStress, Consumeables.Drink[i].HaveAlcohol, Consumeables.Drink[i].AlcoholAmount, Consumeables.Drink[i].TimeDrinking, Consumeables.Drink[i].ItemName, Consumeables.Drink[i].StressAmount)
        end
    end)
end

RegisterNetEvent('mt-restaurants:server:RemoveConsumeableItem', function(ItemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(ItemName, 1)
    if Main.InventoryName ~= 'ox_inventory' then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[ItemName], "remove")
    end
end)

RegisterNetEvent('mt-restaurants:server:addThirst', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.SetMetaData('thirst', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', src, Player.PlayerData.metadata.hunger, amount)
end)

RegisterNetEvent('mt-restaurants:server:addHunger', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.SetMetaData('hunger', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', src, amount, Player.PlayerData.metadata.thirst)
end)