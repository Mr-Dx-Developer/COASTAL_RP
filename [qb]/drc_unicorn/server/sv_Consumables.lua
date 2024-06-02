local RegisterUsable = nil

if Config.Framework == "ESX" then
    if Config.NewESX then
        ESX = exports["es_extended"]:getSharedObject()
        RegisterUsable = ESX.RegisterUsableItem
    else
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        RegisterUsable = ESX.RegisterUsableItem
    end
elseif Config.Framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterUsable = QBCore.Functions.CreateUseableItem
end

for k, v in pairs(Config.Consumables) do
    RegisterUsable(k, function(source)
        local src = source
        Logs(v.Log)
        if v.Remove then
            if GetItem(v.RemoveItem, v.RemoveItemCount, src) then
                RemoveItem(v.RemoveItem, v.RemoveItemCount, src)
                if v.Add then
                    AddItem(v.AddItem, v.AddItemCount, src)
                end
                TriggerClientEvent('drc_unicorn:consumables', src, v.ProgressBar, v.animation, v.duration, v.Effect)
            end
        else
            if v.Add then
                AddItem(v.AddItem, v.AddItemCount, src)
            end
            TriggerClientEvent('drc_unicorn:consumables', src, v.ProgressBar, v.animation, v.duration, v.Effect)
        end
    end)
end
