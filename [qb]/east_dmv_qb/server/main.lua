QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('QBCore:Server:PlayerLoaded', function(self)
    local licenses = self.PlayerData.metadata['licences']
	TriggerClientEvent('east_dmv:loadLicenses', source, licenses)
end)

RegisterNetEvent('east_dmv:addLicense', function(type)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenses = Player.PlayerData.metadata['licences']
    licenses[type] = true
    Player.Functions.SetMetaData('licences', licenses)
	TriggerClientEvent('east_dmv:loadLicenses', src, licenses)
end)

RegisterNetEvent('east_dmv:getLicenses', function(type)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenses = Player.PlayerData.metadata['licences']
    TriggerClientEvent('east_dmv:loadLicenses', src, licenses)
end)

QBCore.Functions.CreateCallback('east_dmv:hasMoney', function(source, cb, price)
    local Player = QBCore.Functions.GetPlayer(source)
    local cash = Player.PlayerData.money['cash']
    if cash >= price then
        Player.Functions.RemoveMoney('cash', price)
        cb(true)
    else
        cb(false)
    end
end)