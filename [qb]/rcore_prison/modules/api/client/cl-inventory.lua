AddEventHandler('rcore_prison:hudState', function(actionType, data)
    local actionType = actionType

    if actionType == 'firstSpawn' then
        local plyPed = PlayerPedId()

        if HasResource('qs-inventory') then
            GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
            SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
            RemoveAllPedWeapons(plyPed, true)
        elseif HasResource('es_extended') then
            GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
            SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
            RemoveAllPedWeapons(plyPed, true)
        end

        if IsScriptLoaded('17mov_hud') then
            dbg.info('Do you hear beeping sounds each second? That comes 17mov_hud being integrated into your qb-core.')
        end

        if IsScriptLoaded('rcore_stats') then
            dbg.info('Rcore stats found on your server!')
            TriggerEvent('rcore_stats:api:increaseStatValue', 'prison_recurring_citizen', 1)
        end
    end
end)