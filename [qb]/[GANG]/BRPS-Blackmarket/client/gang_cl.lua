local TRClassicBlackMarketPed

-- Remove ped model on resource stop.

local function RemoveTRPed()
    if DoesEntityExist(TRClassicBlackMarketPed) then
        DeletePed(TRClassicBlackMarketPed)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() == resourceName then
        RemoveTRPed()
	end
end)

-- Target and ped model

CreateThread(function()
    local Coords = Config.GBMarketLocation.Coords
    local PedHash = Config.GBMarketLocation.ModelHash
    local PedModel = Config.GBMarketLocation.ModelName
    if not DoesEntityExist(TRClassicBlackMarketPed) then
        RequestModel( GetHashKey(PedModel) )
        while ( not HasModelLoaded( GetHashKey(PedModel) ) ) do
            Wait(1)
        end
        TRClassicBlackMarketPed = CreatePed(1, PedHash, Coords, false, true)
        FreezeEntityPosition(TRClassicBlackMarketPed, true)
        SetEntityInvincible(TRClassicBlackMarketPed, true)
        SetBlockingOfNonTemporaryEvents(TRClassicBlackMarketPed, true)
    end
    exports['qb-target']:AddTargetEntity(TRClassicBlackMarketPed, {
        options = {
            {
                num = 1,
                type = "client",
                event = "tr-blackmarket:OpenShop",
                label = Config.GBMarketText["TargetLabel"],
                icon = Config.GBMarketIcons["Eyeicon"],
            }
        },
        distance = 1.5
    })
end)

-- qb-menu

RegisterNetEvent('tr-blackmarket:OpenShop', function()
    local BlackMarket = {
        {
            header = Config.GBMarketText['PedHeader'],
            isMenuHeader = true,
            icon = Config.GBMarketIcons["Header"]
        },
        {
            header = Config.GBMarketText['Miscellanceous'],
            icon = Config.GBMarketIcons['Miscellanceous'],
            params = {
                event = "tr-blackmarket:MiscellanceousShop",
            }
        },
    }
    exports['qb-menu']:openMenu(BlackMarket)
end)

-- BlackMarket Shop Event
RegisterNetEvent("tr-blackmarket:PistolShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.GBMarketPistolShop)
end)

RegisterNetEvent("tr-blackmarket:SubMachineGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.GBMarketSubMachineGunShop)
end)

RegisterNetEvent("tr-blackmarket:ShotGunsShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.GBMarketShotGunShop)
end)



RegisterNetEvent("tr-blackmarket:MiscellanceousShop", function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "market", Config.GBMarketMiscellanceousShop)
end)
