local QBCore = exports[Main.CoreName]:GetCoreObject()
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            TriggerServerEvent("QBCore:ToggleDuty")
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("mt-restaurants:client:ToogleDuty", function()
    if onDuty then onDuty = false TriggerServerEvent("QBCore:ToggleDuty") else onDuty = false TriggerServerEvent("QBCore:ToggleDuty") end
end)

RegisterNetEvent('mt-restaurants:client:FoodsMenu', function(job, station, animation)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if onDuty and PlayerData.job.name == job then
        local Menu = { title = Lang.FoodStationMenuHeader, id = 'restaurants_menu_foods', options = {} }
        for k, v in pairs(LocationsConfig.Stations.FoodStations[station]["Revenus"]) do
            local text = ""
            if Main.InventoryName == 'ox_inventory' then
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. itemNames[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = itemNames[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..itemNames[v.ItemName].name..".png"),
                    description = text,
                    event = 'mt-restaurants:client:MakeFoods',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            else
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = QBCore.Shared.Items[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..QBCore.Shared.Items[v.ItemName].image),
                    description = text,
                    event = 'mt-restaurants:client:MakeFoods',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            end
        end
        lib.registerContext(Menu)
        lib.showContext(Menu.id)
    else
        QBCore.Functions.Notify(Lang.NotOnDuty, 'error', 7500)
    end
end)

RegisterNetEvent('mt-restaurants:client:DrinksMenu', function(job, station, animation)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if onDuty and PlayerData.job.name == job then
        local Menu = { title = Lang.DrinksStationMenuHeader, id = 'restaurants_menu_drinks', options = {} }
        for k, v in pairs(LocationsConfig.Stations.DrinkStations[station]["Revenus"]) do
            local text = ""
            if Main.InventoryName == 'ox_inventory' then
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. itemNames[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = itemNames[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..itemNames[v.ItemName].name..".png"),
                    description = text,
                    event = 'mt-restaurants:client:MakeFoods',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            else
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = QBCore.Shared.Items[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..QBCore.Shared.Items[v.ItemName].image),
                    description = text,
                    event = 'mt-restaurants:client:MakeDrinks',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            end
        end
        lib.registerContext(Menu)
        lib.showContext(Menu.id)
    else
        QBCore.Functions.Notify(Lang.NotOnDuty, 'error', 7500)
    end
end)

RegisterNetEvent('mt-restaurants:client:CutMenu', function(job, station, animation)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if onDuty and PlayerData.job.name == job then
        local Menu = { title = Lang.CutMenuHeader, id = 'restaurants_menu_cut', options = {} }
        for k, v in pairs(LocationsConfig.Stations.CuttingStations[station]["Itens"]) do
            local text = ""
            if Main.InventoryName == 'ox_inventory' then
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. itemNames[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = itemNames[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..itemNames[v.ItemName].name..".png"),
                    description = text,
                    event = 'mt-restaurants:client:MakeFoods',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            else
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = QBCore.Shared.Items[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..QBCore.Shared.Items[v.ItemName].image),
                    description = text,
                    event = 'mt-restaurants:client:MakeDrinks',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            end
        end
        lib.registerContext(Menu)
        lib.showContext(Menu.id)
    else
        QBCore.Functions.Notify(Lang.NotOnDuty, 'error', 7500)
    end
end)

RegisterNetEvent('mt-restaurants:client:GrillingMenu', function(job, station, animation)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if onDuty and PlayerData.job.name == job then
        local Menu = { title = Lang.GrillingMenuHeader, id = 'restaurants_menu_grill', options = {} }
        for k, v in pairs(LocationsConfig.Stations.GrillStations[station]["Itens"]) do
            local text = ""
            if Main.InventoryName == 'ox_inventory' then
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. itemNames[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = itemNames[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..itemNames[v.ItemName].name..".png"),
                    description = text,
                    event = 'mt-restaurants:client:MakeFoods',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            else
                for k, v in pairs(v.Itens) do
                    text = text .. "• " .. QBCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x \n"
                end
                Menu.options[#Menu.options+1] = {
                    title = QBCore.Shared.Items[v.ItemName].label,
                    icon = tostring(Main.ImagesDirectory..QBCore.Shared.Items[v.ItemName].image),
                    description = text,
                    event = 'mt-restaurants:client:MakeDrinks',
                    args = {
                        anim = animation,
                        items = v.Itens,
                        ItemName = v.ItemName,
                        ItemAmount = v.ReciveAmount
                    }
                }
            end
        end
        lib.registerContext(Menu)
        lib.showContext(Menu.id)
    else
        QBCore.Functions.Notify(Lang.NotOnDuty, 'error', 7500)
    end
end)

RegisterNetEvent('mt-restaurants:client:GaragesMenu', function(job, station, spawnloc)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if onDuty and PlayerData.job.name == job then
        local Menu = {
            title = Lang.GaragesMenuHeader,
            id = 'restaurants_menu_garage',
            options = {}
        }
        for k, v in pairs(LocationsConfig.Garages[station]["Vehicles"]) do
            Menu.options[#Menu.options+1] = {
                title = v.VehicleLable,
                icon = 'car',
                event = 'mt-restaurants:client:TakeVehicle',
                args = {
                    vehicle = v.VehicleSpawnName,
                    station = station,
                    spawnloc = spawnloc
                }
            }
        end
        lib.registerContext(Menu)
        lib.showContext(Menu.id)
    else
        QBCore.Functions.Notify(Lang.NotOnDuty, 'error', 7500)
    end
end)

RegisterNetEvent('mt-restaurants:client:Charge', function(data)
    local p = promise.new() lib.callback('mt-restaurants:MakePlayerList', false, function(cb) p:resolve(cb) end) 
    local onlineList = Citizen.Await(p) local nearbyList = {}
    for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(PlayerPedId()), Main.PaymentRadius)) do
        local dist = #(GetEntityCoords(GetPlayerPed(v)) - GetEntityCoords(PlayerPedId()))
        for i = 1, #onlineList do
            if onlineList[i].value == GetPlayerServerId(v) then
                if v ~= PlayerId() then
                    nearbyList[#nearbyList+1] = { value = onlineList[i].value, label = tostring(onlineList[i].text..' ('..math.floor(dist+0.05)..'m)') }
                end
            end
        end
    end
    if not nearbyList[1] then QBCore.Functions.Notify(Lang.NoNearby, "error", 5000) return end
    local dialog = lib.inputDialog(Lang.CashRegister, {
        { type = "select", icon = 'user', required = true, label = Lang.Player, options = nearbyList },
        { type = 'select', icon = 'credit-card', required = true, label = Lang.PaymentType, options = { { value = "cash", label = Lang.Cash }, { value = "bank", label = Lang.Bank } } },
        { type = 'number', icon = 'dollar-sign', required = true, label = Lang.AmountMoney },
    })
    if dialog then
        if not dialog[1] or not dialog[3] then return end
        TriggerServerEvent('mt-restaurants:server:Charge', dialog[1], tonumber(dialog[3]), dialog[2])
    end
end)

RegisterNetEvent("mt-restaurants:client:PayPopup", function(amount, biller, billtype)
	lib.registerContext({
        id = 'restaurants_paypopup_menu',
        title = Lang.AceptPayment,
        options = {
            { title = tostring(billtype:gsub("^%l", string.upper)..Lang.PaymentAmount..amount), disabled = true },
            { icon = "circle-check", title = Lang.Yes, serverEvent = "mt-restaurants:server:PayPopup", args = { accept = true, amount = amount, biller = biller, billtype = billtype, gang = gang, outside = outside }  },
            { icon = "circle-xmark", title = Lang.No, serverEvent = "mt-restaurants:server:PayPopup", args = { accept = false, amount = amount, biller = biller, billtype = billtype, outside = outside }  }, 
        }
    })
    lib.showContext('restaurants_paypopup_menu')
end)