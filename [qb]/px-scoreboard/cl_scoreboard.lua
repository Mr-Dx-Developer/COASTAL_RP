local QBCore = exports['qb-core']:GetCoreObject() 
PlayerData = nil

local group = "user"


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
    PlayerData = xPlayer
    QBCore.Functions.TriggerCallback('px-scoreboard:server:GetPermissions', function(UserGroup)
      group = UserGroup
    end)
    isLoggedIn = true
    TriggerServerEvent('px-scoreboard:AddPlayer')

end)


---------------------------------------------------------

local PX = PX or {}
PX.Scoreboard = {}
PX._Scoreboard = {}

PX.Scoreboard.Menu = {}

PX._Scoreboard.Players = {}
PX._Scoreboard.Recent = {}
PX._Scoreboard.SelectedPlayer = nil
PX._Scoreboard.MenuOpen = false
PX._Scoreboard.Menus = {}

local function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function PX.Scoreboard.AddPlayer(self, data)
    PX._Scoreboard.Players[data.src] = data
end

function PX.Scoreboard.RemovePlayer(self, data)
    if data == nil then return end

    PX._Scoreboard.Players[data.src] = nil
    PX._Scoreboard.Recent[data.src] = data
end

function PX.Scoreboard.RemoveRecent(self, src)
    PX._Scoreboard.Recent[src] = nil
end

function PX.Scoreboard.AddAllPlayers(self, data)
    PX._Scoreboard.Players = data
end

function PX.Scoreboard.GetPlayerCount(self)
    -- local count = 0

    -- for i = 0, 255 do
    --     if NetworkIsPlayerActive(i) then count = count + 1 end
    -- end

    -- return count

    local count = 0

    for _, v in pairs(PX._Scoreboard.Players) do
        count = count + 1
    end

    return count
end




Citizen.CreateThread(function()
    
    local function DrawMain()
        -- if next(PX._Scoreboard.Players) == nil then

        -- end
        if WarMenu.Button("Total:", tostring(PX.Scoreboard:GetPlayerCount())) then end
        
   

        for k,v in spairs(PX._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do

            local playerId = GetPlayerFromServerId(v.src)

            if NetworkIsPlayerActive(playerId) or GetPlayerPed(playerId) == GetPlayerPed(-1) then

               
                   
                        if v.priority == 2 then
                            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options", {r = 205, g = 127, b = 50, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
                        elseif v.priority == 4 then
                                if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options", {r = 192, g = 192, b = 192, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
                        elseif v.priority == 6 then
                            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options", {r = 255, g = 215, b = 0, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
                        elseif v.priority == 8 then
                            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options", {r = 255, g = 105, b = 180, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
                        else
                            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options", {r = 50, g = 205, b = 50, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
                        end
                    
            else
                if WarMenu.MenuButton("[" .. v.src .. "] - instanced?", "options", {r = 255, g = 0, b = 0, a = 255}) then PX._Scoreboard.SelectedPlayer = v end
            end
        end

        

        if WarMenu.MenuButton("Recent Disconnects", "recent" ) then
        end
    end

    local function DrawRecent()
        for k,v in spairs(PX._Scoreboard.Recent, function(t, a, b) return t[a].src < t[b].src end) do
            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.name, "options") then PX._Scoreboard.SelectedPlayer = v end
        end
    end

    local function DrawOptions()
        if group == "god" or group == "admin" or group == "staff" then
            if WarMenu.Button("Name:", PX._Scoreboard.SelectedPlayer.name) then end
        end
        if WarMenu.Button("Steam ID:", PX._Scoreboard.SelectedPlayer.steamid) then end
        if WarMenu.Button("Community ID:", PX._Scoreboard.SelectedPlayer.comid) then end
        if WarMenu.Button("Server ID:", PX._Scoreboard.SelectedPlayer.src) then end
        if group == "god" or group == "admin" or group == "staff" then
            if WarMenu.MenuButton("Kick Player", "kick", {r = 255, g = 0, b = 0, a = 255}) then end
        end
    end

    local function KickPlayer()
        if group == "god" or group == "admin" or group == "staff" then
            DisplayOnscreenKeyboard(1, "Reason", "", "Reason", "", "", "", 128 + 1)
            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Citizen.Wait(7)
            end
            local reason = GetOnscreenKeyboardResult()
            if reason ~= nil and reason ~= "" then
                local target = PX._Scoreboard.SelectedPlayer.src
                TriggerServerEvent("db-admin:server:kickPlayer", target, reason)
            end
        end
    end

    PX._Scoreboard.Menus = {
        ["scoreboard"] = DrawMain,
        ["recent"] = DrawRecent,
        ["kick"] = KickPlayer,
        ["options"] = DrawOptions
    }

    local function Init()
        WarMenu.CreateMenu("scoreboard", "Player List")
        WarMenu.SetSubTitle("scoreboard", "Players")

        WarMenu.SetMenuWidth("scoreboard", 0.5)
        WarMenu.SetMenuX("scoreboard", 0.71)
        WarMenu.SetMenuY("scoreboard", 0.017)
        WarMenu.SetMenuMaxOptionCountOnScreen("scoreboard", 30)
        WarMenu.SetTitleColor("scoreboard", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("scoreboard", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("scoreboard", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("scoreboard", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("recent", "scoreboard", "Recent D/C's")
        WarMenu.SetMenuWidth("recent", 0.5)
        WarMenu.SetTitleColor("recent", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("recent", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("recent", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("recent", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("options", "scoreboard", "User Info")
        WarMenu.SetMenuWidth("options", 0.5)
        WarMenu.SetTitleColor("options", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("options", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("options", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("options", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("kick", "options", "Kick Player")
        WarMenu.SetMenuWidth("kick", 0.5)
        WarMenu.SetTitleColor("kick", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("kick", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("kick", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("kick", 255, 255, 255, 255)
    end

    Init()
    timed = 0
    while true do
        for k,v in pairs(PX._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then
                v()
                WarMenu.Display()
            else
                if timed > 0 then
                    timed = timed - 1
                end
            end
        end

        Citizen.Wait(1)
    end

    

end)

function PX.Scoreboard.Menu.Open(self)
    PX._Scoreboard.SelectedPlayer = nil
    WarMenu.OpenMenu("scoreboard")
end

function PX.Scoreboard.Menu.Close(self)
    for k,v in pairs(PX._Scoreboard.Menus) do
        WarMenu.CloseMenu(K)
    end
end

Citizen.CreateThread(function()
    local function IsAnyMenuOpen()
        for k,v in pairs(PX._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then return true end
        end

        return false
    end

    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, 303) then
            if not IsAnyMenuOpen() then
                TriggerEvent('animations:client:EmoteCommandStart', {"think"})
                PX.Scoreboard.Menu:Open()
            end
        else
            
            if IsAnyMenuOpen() then 
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                PX.Scoreboard.Menu:Close() 
            end
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent("px-scoreboard:RemovePlayer")
AddEventHandler("px-scoreboard:RemovePlayer", function(data)
    PX.Scoreboard:RemovePlayer(data)
end)

RegisterNetEvent("px-scoreboard:AddPlayer")
AddEventHandler("px-scoreboard:AddPlayer", function(data)
    PX.Scoreboard:AddPlayer(data)
end)

RegisterNetEvent("px-scoreboard:RemoveRecent")
AddEventHandler("px-scoreboard:RemoveRecent", function(src)
    PX.Scoreboard:RemoveRecent(src)
end)

RegisterNetEvent("px-scoreboard:AddAllPlayers")
AddEventHandler("px-scoreboard:AddAllPlayers", function(data)
    PX.Scoreboard:AddAllPlayers(data)
end)




-----------------------------
-- Player IDs Above Head
-----------------------------

local hidden = {}
local showPlayerBlips = false
local ignorePlayerNameDistance = false
local disPlayerNames = 50
local playerSource = 0

function DrawText3DTalking(x,y,z, text, textColor)
    local color = { r = 220, g = 220, b = 220, alpha = 255 }
    if textColor ~= nil then 
        color = {r = textColor[1] or 22, g = textColor[2] or 55, b = textColor[3] or 155, alpha = textColor[4] or 255}
    end

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz) - vector3(x,y,z))

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.0*scale, 0.75*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end



RegisterNetEvent("hud:HidePlayerf")
AddEventHandler("hud:HidePlayerf", function(player, toggle)
    if toggle then
        for k,v in spairs(PX._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do
            if v.src == player then
                v.show = false
               
                break
            end
        end
       
    else
        for k,v in spairs(PX._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do
            if v.src == player then
                v.show = true
                break
            end
        end
    end
    
end)

Citizen.CreateThread(function()
    while true do
        if IsControlPressed(0, 303) then

            for i=0,255 do
                N_0x31698aa80e0223f8(i)
            end


            for k,v in spairs(PX._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do
                local playerped = GetPlayerServerId(PlayerId())
                local HeadBone = 0x796e
                local ped = GetPlayerFromServerId(v.src)
                local playerCoords = GetPedBoneCoords(GetPlayerPed(-1), HeadBone)

                if v.src == playerped then
                    DrawText3DTalking(playerCoords.x, playerCoords.y, playerCoords.z+0.5, " ".. playerped .. " ", {255, 255, 255, 255})
                else
                    local pedCoords = GetPedBoneCoords(GetPlayerPed(GetPlayerFromServerId(v.src)), HeadBone)
                    local distance = #(playerCoords - pedCoords)
                    
                    if distance >= 0.1 then
                        local isDucking = IsPedDucking(GetPlayerPed(GetPlayerFromServerId(v.src)))
                        local cansee = HasEntityClearLosToEntity( GetPlayerPed( -1 ), GetPlayerPed(GetPlayerFromServerId(v.src)), 17 )
                        local isReadyToShoot = IsPedWeaponReadyToShoot(GetPlayerPed(GetPlayerFromServerId(v.src)))
                        local isStealth = GetPedStealthMovement(GetPlayerPed(GetPlayerFromServerId(v.src)))
                        local isDriveBy = IsPedDoingDriveby(GetPlayerPed(GetPlayerFromServerId(v.src)))
                        local isInCover = IsPedInCover(GetPlayerPed(GetPlayerFromServerId(v.src)),true)
                        if isStealth == nil then
                            isStealth = 0
                        end
                        local dola = true
                        if isDucking or isStealth == 1 or isDriveBy or isInCover then
                            cansee = false
                        end
                        
                        if v.show ~= nil then
                            

                            if not v.show then
                                dola = false
                            end
                        end
                        
                        if dola then
                            if (distance < disPlayerNames) then
                                local isTalking = true
                                if cansee then
                                    DrawText3DTalking(pedCoords.x, pedCoords.y, pedCoords.z+0.5, " ".. v.src .. " ", {255, 255, 255, 255})
                                end
                            end
                        end

                    end
                end
                
            end
            Citizen.Wait(1)
        else
            Citizen.Wait(1)
        end
    end
end)