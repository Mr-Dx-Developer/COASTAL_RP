Clothing = {
    resourceName = nil
}

local RESOURCE_APPEARANCE_TYPE = {
    ['fivem-appearance'] = 'fivem-appearance',
    ['illenium-appearance'] = 'illenium-appearance',
    ['crm-appearance'] = 'crm-appearance',
}

-- ?? Note: This is a map of resource description to resource name, handy when there is defined provider in fxmanifest.lua for qb-clothing or whatever, to get real resource.

local RESOURCE_DESC_MAP = {
    ['snakewiz'] = 'fivem-appearance',
    ['wasabirobby'] = 'fivem-appearance',
    ['Wasabi fork of fivem-appearance'] = 'fivem-appearance',
    ['A flexible player customization script for FiveM.'] = 'fivem-appearance',
    ['snakewiz & iLLeniumStudios'] = 'illenium-appearance',
    ['QB-Clothing'] = 'qb-clothing',
    ['Official ESX-Legacy resource for handling the Player`s Skin'] = 'skinchanger'
}

CreateThread(function()
    Clothing.resourceName = Clothing.FetchSkinDriver()
    dbg.debugClothing('Using clothing resource named: %s', Clothing.resourceName)
end)

Clothing.FetchSkinDriver = function()
    local ClothingScripts = Prison.ClothingScripts or {}
    local ClothingResource = nil

    if not ClothingResource then
        for k, clothingName in pairs(ClothingScripts) do
            if HasResource(clothingName) then
                ClothingResource = clothingName
                break
            end
        end
    end

    if ClothingResource then
        ClothingResource = Clothing.GetCurrentSkinResource(ClothingResource)
    end

    return ClothingResource
end

Clothing.GetCurrentSkinResource = function(name)
    local retval = nil
    local resourceDesc = GetResourceMetadata(name, 'description') or nil
    local resourceAuth = GetResourceMetadata(name, 'author') or nil

    if not resourceDesc then 
        if resourceAuth then
            resourceDesc = resourceAuth
        else
            return retval
        end
    end

    if RESOURCE_DESC_MAP[resourceDesc] then
        retval = RESOURCE_DESC_MAP[resourceDesc]
    else
        retval = name
    end

    if RESOURCE_DESC_MAP[resourceAuth] then
        retval = RESOURCE_DESC_MAP[resourceAuth]
    else
        retval = name
    end

    return retval
end

Clothing.SelectRandomOutfit = function()
    local plyPed = PlayerPedId()
    local model = GetEntityArchetypeName(plyPed)
    local isMale = 'mp_m_freemode_01' == model
    local gender = isMale and 'Male' or 'Female'

    local type = Clothing.resourceName
    local clothingData = OUTFITS[type] or nil

    if not clothingData then
        return
    end

    local data = clothingData[gender] and clothingData[gender] or nil

    return data[math.random(1, #data)]
end

Clothing.HandleQBClothing = function(actionType, data)
    local clothingEvents = Prison.ScriptEvents[Clothing.resourceName] or nil

    if not clothingEvents then
        return
    end
    
    Clothing.state = actionType
    Clothing.data = data

    local plyPed = PlayerPedId()

    if data and actionType == 'release' then
        TriggerEvent(clothingEvents.loadPlayerClothing, data, plyPed)
    elseif actionType == 'selectOutfit' and data.components then
        local outfit = {
            outfitData = data.components
        }

        TriggerEvent(clothingEvents.loadOutfit, outfit)
    elseif actionType == 'relog' and data.components then
        local outfit = {
            outfitData = data.components
        }

        TriggerEvent(clothingEvents.loadOutfit, outfit)
    end
end

Clothing.RestorePlayerOutfit = function()
    if Clothing.resourceName == Prison.ClothingScripts.SKINCHANGER  then
        local ESX = GetSharedObjectSafe()

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            repeat
                Wait(1000)
            until skin ~= nil

            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif Clothing.resourceName == Prison.ClothingScripts.QB_CLOTHING then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
        TriggerServerEvent("qb-clothing:loadPlayerSkin")
    end
end


Clothing.SetUserOutfit = function(data, actionType)
    if not next(data) then
        return dbg.error('SetUserOutfit: Failure, outfit data is empty!')
    end

    local plyPed = PlayerPedId()

    dbg.debugClothing('SetUserOutfit: Setting outfit for player, resource: %s, actionType: %s', Clothing.resourceName, actionType)

    if HasResource('codem-appearance') and actionType == 'release' then
        return TriggerEvent("codem-appearance:reloadSkin")
    end

    if HasResource('crm-appearance') and actionType == 'release' then
        return TriggerEvent("crm-appearance:load-player-skin")
    end

    if HasResource('ak47_qb_clothing') and actionType == 'release' then
        return ExecuteCommand('reloadSkin')
    end

    if HasResource('illenium-appearance') and actionType == 'release' then
        return ExecuteCommand('reloadSkin')
    end

    if actionType == 'release' then
        return Clothing.RestorePlayerOutfit()
    end

    IsResourceLoaded(Clothing.resourceName, function(state, clothingResource)
        if state then
            if RESOURCE_APPEARANCE_TYPE[Clothing.resourceName:lower()] then
                local currentOutfit = data

                if HasResource('crm-appearance') then
                    exports['crm-appearance']:crm_set_ped_clothing(plyPed, data.crm_clothing)
                    exports['crm-appearance']:crm_set_ped_accessories(plyPed, data.crm_accessories)
                    return
                end

                clothingResource:setPedAppearance(plyPed, currentOutfit)

                if currentOutfit.props then
                    clothingResource:setPedProps(plyPed, currentOutfit.props)
                end
            elseif Clothing.resourceName == Prison.ClothingScripts.SKINCHANGER then
                local currentOutift = data and data.components and data.components.skin

                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerEvent('skinchanger:loadClothes', skin, currentOutift)
                end)
            elseif Clothing.resourceName == Prison.ClothingScripts.QB_CLOTHING then
                Clothing.HandleQBClothing(actionType, data)
            end

            dbg.debugClothing('SetUserOutfit: Applied outfit by resource -> %s', Clothing.resourceName)
        else
            dbg.debugClothing('SetUserOutfit: Failed to set outfit, since running standalone mode\n Invoking client event named [%s] which you can use with own clothing resource.', 'rcore_prison:api:clothing:setUserOutfit')
            TriggerEvent('rcore_prison:api:clothing:setUserOutfit', data, actionType)
        end
    end)
end

AddEventHandler('rcore_prison:api:clothing:setUserOutfit', function(playerOutfit, actionType)
    -- ?? playerOutfit: (arrayData) - to set actual clothing
    -- ?? actionType: (string) - why setting current ouftit - types: release, selectOutfit, relog
end)
