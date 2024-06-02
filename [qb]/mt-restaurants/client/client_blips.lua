local QBCore = exports[Main.CoreName]:GetCoreObject()

CreateThread(function()
    for k, v in pairs(LocationsConfig.Stations["FoodStations"]) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.FoodStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent("mt-restaurants:client:FoodsMenu", v.Job, v.StationName, v.Animation) end },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.FoodStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent("mt-restaurants:client:FoodsMenu", v.Job, v.StationName, v.Animation) end },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.Stations["DrinkStations"]) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.DrinkStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent("mt-restaurants:client:DrinksMenu", v.Job, v.StationName, v.Animation) end },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.DrinkStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent("mt-restaurants:client:DrinksMenu", v.Job, v.StationName, v.Animation) end },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.Stations["CuttingStations"]) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.CuttingStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent("mt-restaurants:client:CutMenu", v.Job, v.StationName, v.Animation) end },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.CuttingStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent("mt-restaurants:client:CutMenu", v.Job, v.StationName, v.Animation) end },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.Stations["GrillStations"]) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.GrillStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent("mt-restaurants:client:GrillingMenu", v.Job, v.StationName, v.Animation) end },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.GrillStationsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent("mt-restaurants:client:GrillingMenu", v.Job, v.StationName, v.Animation) end },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(Stashes.MainStashes) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({ coords = v.Coords, size = vec3(v.Length, v.Width, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    {
                        label = Lang.OpenStashTarget,
                        icon = "fas fa-circle",
                        targeticon = "fas fa-hand-paper",
                        onSelect = function()
                            if Main.InventoryName == 'ox_inventory' then
                                TriggerServerEvent('mt-restaurants:server:RegisterStash', tostring(v.StashName.."_"..v.Job), tostring(v.StashName.."_"..v.Job), v.StashSlots, v.StashWeigth)
                                exports.ox_inventory:openInventory('stash', tostring(v.StashName.."_"..v.Job))
                            else
                                TriggerEvent("inventory:client:SetCurrentStash", v.StashName.."_"..v.Job)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", v.StashName.."_"..v.Job, {
                                    maxweight = v.StashWeigth,
                                    slots = v.StashSlots,
                                })
                            end
                        end,
                        canInteract = function()
                            if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end
                        end,
                    },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone('Stashes'..k..v.Job, v.Coords, v.Length, v.Width, { name='Stashes'..k..v.Job, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    {
                        label = Lang.OpenStashTarget,
                        icon = "fas fa-circle",
                        targeticon = "fas fa-hand-paper",
                        action = function()
                            if Main.InventoryName == 'ox_inventory' then
                                TriggerServerEvent('mt-restaurants:server:RegisterStash', tostring(v.StashName.."_"..v.Job), tostring(v.StashName.."_"..v.Job), v.StashSlots, v.StashWeigth)
                                exports.ox_inventory:openInventory('stash', tostring(v.StashName.."_"..v.Job))
                            else
                                TriggerEvent("inventory:client:SetCurrentStash", v.StashName.."_"..v.Job)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", v.StashName.."_"..v.Job, {
                                    maxweight = v.StashWeigth,
                                    slots = v.StashSlots,
                                })
                            end
                        end,
                        canInteract = function()
                            if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end 
                        end,
                    },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(Stashes.Trays) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({ coords = v.Coords, size = vec3(v.Length, v.Width, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    {
                        label = Lang.OpenTrayTarget,
                        icon = "fas fa-circle",
                        targeticon = "fas fa-hand-paper",
                        onSelect = function()
                            if Main.InventoryName == 'ox_inventory' then
                                TriggerServerEvent('mt-restaurants:server:RegisterStash', tostring(v.StashName), tostring(v.StashName), v.StashSlots, v.StashWeigth)
                                exports.ox_inventory:openInventory('stash', tostring(v.StashName))
                            else
                                TriggerEvent("inventory:client:SetCurrentStash", v.StashName)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", v.StashName, {
                                    maxweight = v.StashWeigth,
                                    slots = v.StashSlots,
                                })
                            end
                        end,
                    },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StashName, v.Coords, v.Length, v.Width, { name='Tray_'..k, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    {
                        label = Lang.OpenTrayTarget,
                        icon = "fas fa-circle",
                        targeticon = "fas fa-hand-paper",
                        action = function()
                            if Main.InventoryName == 'ox_inventory' then
                                TriggerServerEvent('mt-restaurants:server:RegisterStash', tostring(v.StashName), tostring(v.StashName), v.StashSlots, v.StashWeigth)
                                exports.ox_inventory:openInventory('stash', tostring(v.StashName))
                            else
                                TriggerEvent("inventory:client:SetCurrentStash", v.StashName)
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", v.StashName, {
                                    maxweight = v.StashWeigth,
                                    slots = v.StashSlots,
                                })
                            end
                        end,
                    },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.ClothingSpots) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.OpenClothesTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = Main.ClothingMenuEvent }
                },
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.OpenClothesTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = Main.ClothingMenuEvent }
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.Registers) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.RegistersTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent("mt-restaurants:client:Charge") end },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.RegistersTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent("mt-restaurants:client:Charge") end },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.WashHands) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.WashHandsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:WashHands' },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.WashHandsTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:WashHands' },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.Garages) do
        local PedLoc1 = v.PedLoc
        RequestModel(GetHashKey(v.PedModel))
        while not HasModelLoaded(GetHashKey(v.PedModel)) do
            Wait(1)
        end
        GaragesPed =  CreatePed(4, v.PedHash, PedLoc1.x, PedLoc1.y, PedLoc1.z, v.Heading, false, true)
        SetEntityHeading(GaragesPed, v.Heading)
        FreezeEntityPosition(GaragesPed, true)
        SetEntityInvincible(GaragesPed, true)
        SetBlockingOfNonTemporaryEvents(GaragesPed, true)
        TaskStartScenarioInPlace(GaragesPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 

        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = vector3(PedLoc1.x, PedLoc1.y, PedLoc1.z), size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.GarageMenuTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, onSelect = function() TriggerEvent('mt-restaurants:client:GaragesMenu', v.Job, v.StationName, v.SpawnLoc) end },
                }
            })
            exports.ox_target:addBoxZone({
                coords = vector3(v.SpawnLoc.x, v.SpawnLoc.y, v.SpawnLoc.z), size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.DeleteVehicleTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:DeleteVehicle' },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, vector3(PedLoc1.x, PedLoc1.y, PedLoc1.z), v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.GarageMenuTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, action = function() TriggerEvent('mt-restaurants:client:GaragesMenu', v.Job, v.StationName, v.SpawnLoc) end },
                },
                distance = 2.5
            })
            exports[Main.TargetName]:AddBoxZone(v.StationName..'delete', vector3(v.SpawnLoc.x, v.SpawnLoc.y, v.SpawnLoc.z), v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.DeleteVehicleTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:DeleteVehicle' },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.ToogleDuty) do
        if Main.TargetName == 'ox_target' then
            exports.ox_target:addBoxZone({
                coords = v.Coords, size = vec3(v.Width, v.Length, 2.5), rotation = 0, debug = Main.DebugPoly,
                options = {
                    { icon = v.TargetIcon, label = Lang.ToogleDutyTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:ToogleDuty' },
                }
            })
        else
            exports[Main.TargetName]:AddBoxZone(v.StationName, v.Coords, v.Width, v.Length, { name=v.StationName, heading=0, debugPoly = Main.DebugPoly }, {
                options = {
                    { icon = v.TargetIcon, label = Lang.ToogleDutyTarget, canInteract = function() if QBCore.Functions.GetPlayerData().job.name == v.Job then return true end end, event = 'mt-restaurants:client:ToogleDuty' },
                },
                distance = 2.5
            })
        end
    end
    for k, v in pairs(LocationsConfig.MapBlips) do
        v.blipvariantid = AddBlipForCoord(v.blipcoords)
        SetBlipSprite (v.blipvariantid, v.blipsprite)
        SetBlipDisplay(v.blipvariantid, v.blipdisplay)
        SetBlipScale  (v.blipvariantid, v.blipscale)
        SetBlipAsShortRange(v.blipvariantid, true)
        SetBlipColour(v.blipvariantid, v.blipcolour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.blipname)
        EndTextCommandSetBlipName(v.blipvariantid)
    end
end)
