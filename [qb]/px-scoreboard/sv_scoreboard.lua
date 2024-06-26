local QBCore = exports['qb-core']:GetCoreObject() 

local PX = PX or {}
PX.Scoreboard = {}
PX._Scoreboard = {}
PX._Scoreboard.PlayersS = {}
PX._Scoreboard.RecentS = {}
scoreboarddata = {}

RegisterServerEvent('px-scoreboard:AddPlayer')
AddEventHandler("px-scoreboard:AddPlayer", function()
    local src = source


    local identifiers, steamIdentifier = GetPlayerIdentifiers(src)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    
    local ply = GetPlayerName(src)
    local scomid = GetPlayerIdentifiers(src)[2]:gsub("steam:", "")
    local data = { src = src, steamid = scomid, comid = scomid, name = ply,  group = ugroup, priority = leval }
    scoreboarddata[src] = data
    TriggerClientEvent("px-scoreboard:AddPlayer", -1, scoreboarddata[src])
    TriggerClientEvent("px-scoreboard:AddAllPlayers", src, scoreboarddata)
end)


QBCore.Functions.CreateCallback('px-scoreboard:server:GetPermissions', function(source, cb)
    local group = QBCore.Functions.GetPermission(source)
    cb(group)
end)

RegisterServerEvent('hud:HidePlayer')
AddEventHandler("hud:HidePlayer", function(id, type)
    TriggerClientEvent("hud:HidePlayerf", -1, source, type)
end)


function PX.Scoreboard.AddPlayerS(self, data)
    PX._Scoreboard.PlayersS[data.src] = data
end



AddEventHandler("playerDropped", function()
    local src = source

	local identifiers, steamIdentifier = GetPlayerIdentifiers(src)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    local xPlayer = QBCore.Functions.GetPlayer(src)


    local ply = GetPlayerName(src)
    local scomid = GetPlayerIdentifiers(src)[2]:gsub("steam:", "")
    local plyid = src
    local data = { src = src, steamid = scomid, comid = scomid, name = ply ,  group = ugroup, priority = leval}
    local srcScoreboardData = scoreboarddata[src]
    TriggerClientEvent("px-scoreboard:RemovePlayer", -1, srcScoreboardData)
    scoreboarddata[src] = nil
    Wait(600000)
    TriggerClientEvent("px-scoreboard:RemoveRecent", -1, plyid)
end)


function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end
