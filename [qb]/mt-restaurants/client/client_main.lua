local QBCore = exports[Main.CoreName]:GetCoreObject()
local WashedHands = 0

RegisterNetEvent('mt-restaurants:client:WashHands', function()
    playemote('uncuff')
    QBCore.Functions.Progressbar('name_here', Lang.WashHandsProg, 5000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, { }, {}, {}, function()
        WashedHands = Main.HandsWhashed
        QBCore.Functions.Notify(Lang.WashedHands, 'success', 7500)
        playemote('c')
        print(WashedHands)
    end, function()
        playemote('c')
    end)
end)

local function MakeFoods(items, anim, ItemName, ItemAmount)
    if WashedHands <= 0 then
        QBCore.Functions.Notify(Lang.NotWashedHands, 'error', 7500)
    elseif WashedHands <= Main.HandsWhashed and WashedHands > 0 then
        playemote(anim)
        QBCore.Functions.Progressbar('name_here', Lang.MakingFoodProg, Main.FoodProgBarTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
            playemote('c')
            TriggerServerEvent('mt-restaurants:server:AddItem', ItemName, ItemAmount)
            for k, v in pairs(items) do
                TriggerServerEvent('mt-restaurants:server:RemoveItem', v.item, v.amount)
            end WashedHands = WashedHands -1
        end, function()
            playemote('c')
        end)
    end
end

RegisterNetEvent('mt-restaurants:client:MakeFoods', function(data)
    lib.callback("mt-restaurants:server:ItemsSuficientes", false, function(hasItems)
        if (hasItems) then
            MakeFoods(data.items, data.anim, data.ItemName, data.ItemAmount)
        else
            QBCore.Functions.Notify(Lang.errorRightItems, "error")
            return
        end
    end, data.items)
end)

local function MakeDrinks(items, anim, ItemName, ItemAmount)
    if WashedHands <= 0 then
        QBCore.Functions.Notify(Lang.NotWashedHands, 'error', 7500)
    elseif WashedHands <= Main.HandsWhashed and WashedHands > 0 then
        playemote(anim)
        QBCore.Functions.Progressbar('name_here', Lang.MakingDrinkProg, Main.DrinksProgBarTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
            playemote('c')
            TriggerServerEvent('mt-restaurants:server:AddItem', ItemName, ItemAmount)
            for k, v in pairs(items) do
                TriggerServerEvent('mt-restaurants:server:RemoveItem', v.item, v.amount)
            end WashedHands = WashedHands -1
        end, function()
            playemote('c')
        end)
    end
end

RegisterNetEvent('mt-restaurants:client:MakeDrinks', function(data)
    lib.callback("mt-restaurants:server:ItemsSuficientes", false, function(hasItems)
        if (hasItems) then
            MakeDrinks(data.items, data.anim, data.ItemName, data.ItemAmount)
        else
            QBCore.Functions.Notify(Lang.errorRightItems, "error")
            return
        end
    end, data.items)
end)

local function CutThings(items, anim, ItemName, ItemAmount)
    if WashedHands <= 0 then
        QBCore.Functions.Notify(Lang.NotWashedHands, 'error', 7500)
    elseif WashedHands <= Main.HandsWhashed and WashedHands > 0 then
        playemote(anim)
        QBCore.Functions.Progressbar('name_here', Lang.CuttingThingsProg, Main.CutProgBarTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
            playemote('c')
            TriggerServerEvent('mt-restaurants:server:AddItem', ItemName, ItemAmount)
            for k, v in pairs(items) do
                TriggerServerEvent('mt-restaurants:server:RemoveItem', v.item, v.amount)
            end WashedHands = WashedHands -1
        end, function()
            playemote('c')
        end)
    end
end

RegisterNetEvent('mt-restaurants:client:CutThings', function(data)
    lib.callback("mt-restaurants:server:ItemsSuficientes", false, function(hasItems)
        if (hasItems) then
            CutThings(data.items, data.anim, data.ItemName, data.ItemAmount)
        else
            QBCore.Functions.Notify(Lang.errorRightItems, "error")
            return
        end
    end, data.items)
end)

local function GrillThings(items, anim, ItemName, ItemAmount)
    if WashedHands <= 0 then
        QBCore.Functions.Notify(Lang.NotWashedHands, 'error', 7500)
    elseif WashedHands <= Main.HandsWhashed and WashedHands > 0 then
        playemote(anim)
        QBCore.Functions.Progressbar('name_here', Lang.GrillingThingsProg, Main.GrillProgBarTime, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
            playemote('c')
            TriggerServerEvent('mt-restaurants:server:AddItem', ItemName, ItemAmount)
            for k, v in pairs(items) do
                TriggerServerEvent('mt-restaurants:server:RemoveItem', v.item, v.amount)
            end
            WashedHands = WashedHands -1
        end, function()
            playemote('c')
        end)
    end
end

RegisterNetEvent('mt-restaurants:client:GrillThings', function(data)
    lib.callback("mt-restaurants:server:ItemsSuficientes", false, function(hasItems)
        if (hasItems) then
            GrillThings(data.items, data.anim, data.ItemName, data.ItemAmount)
        else
            QBCore.Functions.Notify(Lang.errorRightItems, "error")
            return
        end
    end, data.items)
end)

RegisterNetEvent('mt-restaurants:client:TakeVehicle', function(data)
    local vehicle = data.vehicle
    local coords = data.spawnloc
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "MTFN"..tostring(math.random(1000, 9999)))
        exports[Main.LegacyFuelName]:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)  
end)

RegisterNetEvent('mt-restaurants:client:DeleteVehicle', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if IsPedInAnyVehicle(PlayerPedId()) then
        QBCore.Functions.Progressbar('name_here', Lang.DeleteVehicleProg, 2000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true }, {}, {}, {}, function()
            TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
            Wait(1500)
            DeleteVehicle(veh)
            DeleteEntity(veh)
        end)
    else
        QBCore.Functions.Notify(Lang.NotInVehicle, 'error', 7500)
    end
end)

CreateThread(function()
    function PropSpawn()
        for k,v in pairs (Props.Props) do
            RequestModel(v.model)
            local iter_for_request = 1
            while not HasModelLoaded(v.model) and iter_for_request < 5 do
                Wait(500)                
                iter_for_request = iter_for_request + 1
            end
            if not HasModelLoaded(v.model) then
                SetModelAsNoLongerNeeded(v.model)
            else
                local ped = PlayerPedId()
                local created_object = CreateObjectNoOffset(v.model, v.coords.x, v.coords.y, v.coords.z - 1, 1, 0, 1)
                PlaceObjectOnGroundProperly(created_object)
                SetEntityHeading(created_object, v.coords.w)
                FreezeEntityPosition(created_object, true)
                SetModelAsNoLongerNeeded(v.model)
            end
        end
    end
    PropSpawn()
end)