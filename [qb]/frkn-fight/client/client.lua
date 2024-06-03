
QBCore = exports["qb-core"]:GetCoreObject()

fight , received , betOpen , serverFightController  , serverBetController = true , false , false , false , false
caseObject = nil
targetPlayer , sourcePlayer , moneyStatus = "" , "" , "takeStairs"
fightData , information , userData , bets , roundList ,currentRoundData , globalRoundData  = {} , {} , {} , {} , {} , {} , {}
targetPedCount , sourcePedCount , targetPedBetsCount ,  sourcePedBetsCount , roundCounter , sourcePunch , targetPunch , targetfatalPunch , sourcefatalPunch = 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
cStairsObject , oStairsObject , moneyBag = nil
local modelsToLoad = {"3fe_boxing_cstairs", "3fe_boxing_ostairs", "3fe_boxing_rope", "3fe_boxing_moneybag"}


function CreateNamedRenderTargetForModel(name, model)
    local handle = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, 0)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        handle = GetNamedRendertargetRenderId(name)
    end
    return handle
end


local scale = 1.5  
local screenWidth = math.floor(1280 / scale)  
local screenHeight = math.floor(720 / scale)  
local screenModel = GetHashKey('v_ilev_cin_screen')  
local handle = CreateNamedRenderTargetForModel('cinscreen', screenModel)  

local txd = CreateRuntimeTxd('video')  
local duiObj = CreateDui('nui://'.. GetCurrentResourceName() ..'/html/index.html', screenWidth, screenHeight)

local dui = GetDuiHandle(duiObj)  
local tx = CreateRuntimeTextureFromDuiHandle(txd, 'test', dui)  

RegisterCommand("openfight",function(source,args)
    SendNUIMessage({
          action = 'openNui',
          name = nuiName,
          data = {
             nearbyPlayers = GetNearbyPlayers(300),
          },
    })    
    SetNuiFocus(true, true)
end)

RegisterNetEvent('frkn-fight:fightControllerEvent')
AddEventHandler('frkn-fight:fightControllerEvent', function (controller)
    serverFightController = controller
end)

RegisterNetEvent('frkn-fight:betClientControl')
AddEventHandler('frkn-fight:betClientControl',function (controller)
    serverBetController = controller
    if not serverBetController then 
        SetNuiFocus(0,0)
        SendNUIMessage({
            action = 'betClose',
            name = "nuiName",
            data = {
                nearbyPlayers = "",
                fighterData = userData
            },
        })  
    end 
end)

RegisterNetEvent('frkn-fight:sendClientCurrentData')
AddEventHandler('frkn-fight:sendClientCurrentData', function (currentData)
    globalRoundData = currentData
end)

RegisterNetEvent('frkn-fight:OpenNui')
AddEventHandler('frkn-fight:OpenNui', function(requesterPlayerId,information,nuiName,allData)
    targetPed = PlayerPedId()
    SendNUIMessage({
        action = 'openRequestPage',
        name = nuiName,
        data = {
           nearbyPlayers = "",
           information = information,
           allData = allData
        },
    })
    fightData = information
    SetNuiFocus(true, true)

    RegisterNUICallback("requestStatus",function (data,cb)
        if data.bool then
            SetTargetPlayer(targetPed)
            TriggerServerEvent('frkn-fight:HandleRequest', requesterPlayerId, true,ped)
            BetOpen()
        else
            TriggerServerEvent('frkn-fight:HandleRequest', requesterPlayerId, false,ped)
        end
    end)
end)


RegisterNetEvent('frkn-fight:requestsControl')
AddEventHandler('frkn-fight:requestsControl', function (bool,data)
    if bool then
        SetSourcePlayer(sourcePed)
        BetOpen()
    else
        --print("dövüşü red etti")
    end
end)

RegisterNetEvent('frkn-fight:sendAllData')
AddEventHandler('frkn-fight:sendAllData',function (data)
    userData = data
end)


RegisterNetEvent('frkn-fight:setBetCount')
AddEventHandler('frkn-fight:setBetCount',function (target,source)
    targetPedBetsCount = target
    sourcePedBetsCount = source
end)


RegisterNetEvent('frkn-fight:betsAppend')
AddEventHandler('frkn-fight:betsAppend',function(data)
    SendNUIMessage({
        action = "betsUpdate",
        data = data
    })
end)

function punchCounter()
    Citizen.CreateThread(function()

        local targetPedLastHealth = GetEntityHealth(GetPlayerPed(targetPlayer))
        local sourcePedLastHealth = GetEntityHealth(GetPlayerPed(sourcePlayer))

        while fight do
            Citizen.Wait(100)
            local targetPedNewHealth = GetEntityHealth(GetPlayerPed(targetPlayer))
            local sourcePedNewHealth = GetEntityHealth(GetPlayerPed(sourcePlayer))

            if targetPedNewHealth < targetPedLastHealth then
                local damage = targetPedLastHealth - targetPedNewHealth
                --print("target hasar aldı: " .. damage)
                if damage >= FRKN.FatalPunchValue then 
                    targetfatalPunch = targetfatalPunch + 1
                    --print("fatal punch attı")
                end
                targetPunch = targetPunch + 1
            end

            if sourcePedNewHealth < sourcePedLastHealth then
                local damage = sourcePedLastHealth - sourcePedNewHealth
                --print("source hasar aldı: " .. damage)
                if damage >= FRKN.FatalPunchValue then 
                    sourcefatalPunch = sourcefatalPunch + 1
                end
                sourcePunch = sourcePunch + 1
            end

            targetPedLastHealth = targetPedNewHealth
            sourcePedLastHealth = sourcePedNewHealth
        end
    end)
    
end

function BetOpen()
    Wait(1000)
  
    betOpen = true

    SetNuiFocus(0,0)
    SendNUIMessage({
        action = 'betClose',
        name = "nuiName",
        data = {
            nearbyPlayers = "",
            fighterData = userData
        },
    })    
    local animDict = "mini@triathlon"
    local animName = "idle_d"
    local repeatCount = FRKN.RepeatAnimationCount 
    
    LoadAnimDict(animDict)
    
    for i = 1, repeatCount do
        TaskPlayAnim(PlayerPedId(), animDict, animName, 5.0, 5.0, -1, 1, 0, false, false, false)
    
        local startTime = GetGameTimer()
        while GetGameTimer() - startTime < 5000 do
            Citizen.Wait(0)
        end
    end

    -- Wait(FRKN.BetWait)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent('frkn-fight:betOpenServer',false)
    StartFight()
end 


function OpenNuiForPlayer(targetPlayerId, nuiName, data)
    if tonumber(targetPlayerId) ~= tonumber(GetPlayerServerId(PlayerId())) then 
        TriggerServerEvent('frkn-fight:OpenNuiForPlayer', targetPlayerId, nuiName, data,information)
    else
        -- print("Kendine dövüş isteği gönderemezsin")
    end
end

function StartFight()
    fight = true
    time = 0
    targetPlayer = GetPlayerFromServerId(tonumber(userData.targetPlayerId))
    sourcePlayer = GetPlayerFromServerId(tonumber(userData.sourcePlayerId))
    punchCounter()    
    if FRKN.StairsSystem then 
        loadModels(modelsToLoad)
        createStairs()
        createMoneyBag()
        caseSystem()
    end
    while fight do 
        Wait(1000)
        time = time + 1
        local targetHealth = GetEntityHealth(GetPlayerPed(targetPlayer))
        local sourceHealth = GetEntityHealth(GetPlayerPed(sourcePlayer))
        if targetHealth == 0 or sourceHealth == 0 then
            if targetHealth == 0 then
                sourcePedCount = sourcePedCount + 1
            else
                targetPedCount = targetPedCount + 1
            end
        
            roundCounter = roundCounter + 1
            time = 0
            SetSourcePlayer(sourcePed)
            SetTargetPlayer(targetPed)

            result = string.format('%d - %d', sourcePedCount, targetPedCount)
        
            local roundData = {
                winner = roundWinner,
                targetHealth = targetHealth,
                sourceHealth = sourceHealth,
                targetPunch = targetPunch,
                targetFatalPunch = targetfatalPunch,
                sourcePunch = sourcePunch,
                sourcefatalPunch = sourcefatalPunch,
                roundCounter = roundCounter
            }
        
            table.insert(roundList, roundData)

        end

        if time >= fightData.roundTime then 
            roundCounter = roundCounter + 1
            time = 0
            SetSourcePlayer(sourcePed)
            SetTargetPlayer(targetPed)
        
            local roundWinner
            if targetHealth > sourceHealth then 
                roundWinner = userData.targetPedName
                targetPedCount = targetPedCount + 1
            elseif targetHealth < sourceHealth then 
                roundWinner = userData.sourcePedName
                sourcePedCount = sourcePedCount + 1
            end
        
            result = string.format('%d - %d', targetPedCount, sourcePedCount)
        
            local roundData = {
                winner = roundWinner,
                targetHealth = targetHealth,
                sourceHealth = sourceHealth,
                targetPunch = targetPunch,
                targetFatalPunch = targetfatalPunch,
                sourcePunch = sourcePunch,
                sourcefatalPunch = sourcefatalPunch,
                roundCounter = roundCounter
            }
        
            table.insert(roundList, roundData)
        end 
        

        if tonumber(roundCounter) > tonumber(fightData.round) then
            finishFight()
            fight = false
        end
        
        SendNUIMessage({
            action = "roundData",
            round = roundCounter,
            currentRoundNumber = result,
            targetHealth = targetHealth,
            sourceHealth = sourceHealth,
            targetUserName = userData.targetPedName,
            sourceUserName = userData.sourcePedName,
            time = time
        })

        currentRoundData = {
            round = roundCounter,
            currentRoundNumber = result,
            targetHealth = targetHealth,
            sourceHealth = sourceHealth,
            targetUserName = userData.targetPedName,
            sourceUserName = userData.sourcePedName,
            time = time
        }
        TriggerServerEvent('frkn-fight:sendCurrentData',currentRoundData)

        end 
        Wait(1000)
        SendNUIMessage({
            action = 'close',
            data ={}
        })  
        betOpen = false
end

Citizen.CreateThread(function()
    local sleep = 2000  
    while true do  
        if serverFightController then 
            local playerPed = PlayerPedId()  
            local playerCoords = GetEntityCoords(playerPed)
            local px, py, pz = table.unpack(FRKN.MiddleringCoords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
        
        if distance ~= -1 and distance <= 70 then 
                sleep = 0
                SetTextRenderId(handle)  
                Set_2dLayer(4)  
                SetScriptGfxDrawBehindPausemenu(1)  
                DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)  
                DrawSprite("video", "test", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)  
                SetTextRenderId(GetDefaultScriptRendertargetRenderId()) -- reset
                SendDuiMessage(duiObj, json.encode({action = "opendui"})) 
            
                SendDuiMessage(duiObj, json.encode({
                    action = "updateDui",
                    round = globalRoundData.round,
                    currentRoundNumber = globalRoundData.currentRoundNumber,
                    targetHealth = globalRoundData.targetHealth,
                    sourceHealth = globalRoundData.sourceHealth,
                    targetUserName = globalRoundData.targetUserName,
                    sourceUserName = globalRoundData.sourceUserName,
                    time = time
                }))
            end
        end
        Wait(sleep) 
    end
end)

Citizen.CreateThread(function()
    local sleep = 2000  
    while true do  
        if serverBetController then 
            local playerPed = PlayerPedId()  
            local playerCoords = GetEntityCoords(playerPed)
            local px, py, pz = table.unpack(FRKN.MiddleringCoords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
        
        if distance ~= -1 and distance <= 70 then 
            sleep = 0
            betOpen = true 
            SetNuiFocus(1,1)
            SendNUIMessage({
                action = 'openBet',
                name = "nuiName",
                data = {
                    nearbyPlayers = "",
                    fighterData = userData
                },
            })  
            end
            serverBetController = false
        end
        Wait(sleep) 
    end
end)



function finishFight()
    SetSourcePlayer(sourcePed)
    SetTargetPlayer(targetPed)
    
    local winnerPlayer = (sourcePedCount > targetPedCount and GetPlayerName(sourcePlayer)) or
                    (sourcePedCount < targetPedCount and GetPlayerName(targetPlayer)) or
                    "Berabere"

    TriggerServerEvent('frkn-fight:getBetCount',-1)
    Wait(1000)
    --print("Kazanan: " .. winnerPlayer)
    --print("Source Kazanç" ..sourcePedBetsCount)
    --print("Target Kazanç" ..targetPedBetsCount)
    clearData()
    close()
    TriggerServerEvent('frkn-fight:finishFight')
    TriggerServerEvent('frkn-fight:payBets',winnerPlayer)
end

function GetNearbyPlayers(maxDistance)
    local players = {}

    local myPed = GetPlayerPed(-1)
    local myPos = GetEntityCoords(myPed)

    for _, i in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(i)
        local targetPos = GetEntityCoords(targetPed)

        local distance = #(myPos - targetPos)

        if distance <= maxDistance and i ~= PlayerId() then
            local playerName = GetPlayerName(i)
            local playerServerId = GetPlayerServerId(i)
            table.insert(players, { id = playerServerId, name = playerName, distance = distance })
        end
    end

    return players
end

function getArea()
    local id = 0
    Stations = {}
    CreateThread(function()
        for k = 1, #FRKN.Area do
            Stations[k] = PolyZone:Create(FRKN.Area[k].zones, {
                name = "Area" .. k,
                minZ = FRKN.Area[k].minz,
                maxZ = FRKN.Area[k].maxz,
                debugPoly = false
            })
            Stations[k]:onPlayerInOut(function(isPointInside)

                if isPointInside then id = k end
            end)
        end
    end)
    Citizen.Wait(100)
    return id
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 500
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end


function clearData()
    fightData , information , userData , bets = {} , {} , {} , {}   
    targetPedCount , sourcePedCount , targetPedBetsCount ,  sourcePedBetsCount= 0 , 0 , 0 , 0 
    targetPlayer , sourcePlayer = "" , ""
    roundCounter = 0
    SendNUIMessage({
        action = 'close'
    })
end


function SetTargetPlayer(ped) 
    SetEntityCoords(ped,FRKN["TargetPlayerCoords"]["coords"])
    SetEntityHeading(ped,FRKN["TargetPlayerCoords"]["heading"])
    SetEntityHealth(ped, 200)
    Revive()
    SetNuiFocus(0,0)
    SendNUIMessage({
        action = 'betClose',
        name = "nuiName",
        data = {
            nearbyPlayers = "",
            fighterData = userData
        },
    })    
end

function SetSourcePlayer(ped)
    SetEntityCoords(ped,FRKN["SourcePlayerCoords"]["coords"])
    SetEntityHeading(ped,FRKN["SourcePlayerCoords"]["heading"])
    SetEntityHealth(ped, 200)
    Revive()
    SetNuiFocus(0,0)
    SendNUIMessage({
        action = 'betClose',
        name = "nuiName",
        data = {
            nearbyPlayers = "",
            fighterData = userData
        },
    })    
end

function close()
    SetNuiFocus(0, 0)
    SendNUIMessage({
        action = 'close'
    })
end

RegisterNUICallback("sendRequest",function (data,cb)
    information = {
        round = 2,
        roundTime = 59
    }
    fightData = information
    sourcePed = PlayerPedId()
    OpenNuiForPlayer(tonumber(data.id),"fightRequest",information)
end)

RegisterNUICallback("createFight",function(data,cb)
    if getArea() ~= 0 then 
        information = {
            round = data.round,
            roundTime = data.roundTime
        }
        fightData = information
        sourcePed = PlayerPedId()
        OpenNuiForPlayer(tonumber(data.id),"fightRequest",information)
        SetNuiFocus(0,0)
    else
        SetNuiFocus(0,0)
        --print("ring disinda dövüş oluşturulamaz")
    end
end)

RegisterNUICallback("bet",function(data,cb)
    QBCore.Functions.TriggerCallback('frkn-fight:moneyControl', function(control)
        if control then
            cb(true)
            TriggerServerEvent('frkn-fight:insertBet',data,userData)
        else
            cb(false)
        end
    end, data.betCount)
end)

RegisterNUICallback("close",function (data,cb)
    SetNuiFocus(0, 0)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        deleteAllObject()
    end
end)

function deleteAllObject()
    DeleteObject(cStairsObject)
    DeleteObject(oStairsObject)
    DeleteObject(moneyBag)
    DeleteEntity(cStairsObject)
    DeleteEntity(oStairsObject)
    DeleteEntity(moneyBag)
    cStairsObject = nil
    oStairsObject = nil
    moneyBag = nil
end

function loadModels(models)
    for _, model in ipairs(models) do
        RequestModel(model)
    end

    while not AreModelsLoaded(models) do
        Wait(500)
    end
end

function AreModelsLoaded(models)
    for _, model in ipairs(models) do
        if not HasModelLoaded(model) then
            return false
        end
    end
    return true
end

function createOpenStairs()
    while not HasModelLoaded("3fe_boxing_ostairs") do
        Wait(500)
    end

    oStairsObject = CreateObject(GetHashKey("3fe_boxing_ostairs"), 4142.301547, 7775.261719, 892.684753, true, true, true)
    SetEntityHeading(oStairsObject, 278.999481)

    SetEntityHasGravity(oStairsObject, true)
    SetEntityCollision(oStairsObject, true, true)
end

function createStairs()
    while not HasModelLoaded("3fe_boxing_cstairs") do
        Wait(500)
    end

    cStairsObject = CreateObject(GetHashKey("3fe_boxing_cstairs"), 4147.9966015625, 7774.6430664062, 891.86590576172, true, true, true)
    SetEntityHeading(cStairsObject, 278.999481)

    SetEntityHasGravity(cStairsObject, true)
    SetEntityCollision(cStairsObject, true, true)
end

function createMoneyBag()
    local caseCoords = FRKN.MoneyPropCoords
    local caseHash = GetHashKey("3fe_boxing_moneybag")  
    moneyBag = CreateObject(caseHash, caseCoords.x, caseCoords.y, caseCoords.z, true, false, false)  
    
    SetEntityHasGravity(moneyBag, true)
    SetEntityCollision(moneyBag, true, true)
end

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(500)
    end
end

function caseSystem()
    if FRKN.StairsSystem then 
        local sleep = 1000  
        local playerPed = PlayerPedId()  
        local playerCoords = GetEntityCoords(playerPed)
        local oStairsObjectCoords = GetEntityCoords(oStairsObject)
        local cStairsObjectCoords = GetEntityCoords(cStairsObject)
    Citizen.CreateThread(function()
        while fight do 
        if moneyStatus == "giveMoney" then
            local px, py, pz = table.unpack(FRKN.MoneyPropCoords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
            if distance ~= -1 and distance <= 1.5 then
                sleep = 1
                DrawText3D(px, py, pz, FRKN.PropText)
                
                if IsControlJustReleased(0, 38) then
                    LoadAnimDict("anim@am_hold_up@male")
	                TaskPlayAnim(playerPed, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
                    Wait(300)
	                StopAnimTask(playerPed, "anim@am_hold_up@male", "shoplift_high", 1.0) 
                    FreezeEntityPosition(moneyBag, false)
                    DeleteObject(moneyBag)
                    DeleteEntity(moneyBag)
                    TriggerServerEvent('frkn-fight:caseGift')
                    Wait(25000)
                    DeleteObject(oStairsObject)
                end
                moneyStatus = ""
                break
            end
        elseif moneyStatus == "takeStairs" then
            
            local distance = #(playerCoords - cStairsObjectCoords)
            if distance ~= -1 and distance <= 1.5 then
                sleep = 1
                DrawText3D(cStairsObjectCoords.x, cStairsObjectCoords.y, cStairsObjectCoords.z, FRKN.TakeStairsText)

                if IsControlJustReleased(0, 38) then 
                    moneyStatus = "setStairs"
                    LoadAnimDict("anim@am_hold_up@male")
	                TaskPlayAnim(playerPed, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
                    Wait(300)
	                StopAnimTask(playerPed, "anim@am_hold_up@male", "shoplift_high", 1.0) 
                    AttachEntityToEntity(cStairsObject, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                    SetEntityRotation(cStairsObject, 0.0, 0.0, GetEntityHeading(playerPed), 1, true)
                end
            end
        elseif moneyStatus == "climbStairs" then
            
            local distance = #(playerCoords - oStairsObjectCoords)

            if distance ~= -1 and distance <= 1.5 then
                sleep = 1
                DrawText3D(oStairsObjectCoords.x, oStairsObjectCoords.y, oStairsObjectCoords.z+0.5, FRKN.ClimbLadder)
                
                if IsControlJustReleased(0, 38) then 
                    DoScreenFadeIn(100)
                    DoScreenFadeOut(100)
                    moneyStatus = "giveMoney"
                    SetEntityCoords(playerPed, oStairsObjectCoords.x, oStairsObjectCoords.y, oStairsObjectCoords.z + 1.7, true, true, true, false)
                    FreezeEntityPosition(PlayerPedId(), true)
                    Wait(FRKN.StandingLadderTime)
                    FreezeEntityPosition(PlayerPedId(), false)
                    DeleteEntity(oStairsObject)
                end
            end
        elseif moneyStatus == "setStairs" then
            local px, py, pz = table.unpack(FRKN.MiddleringCoords)
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)

            if distance ~= -1 and distance <= 1.5 then
                sleep = 1
                DrawText3D(px, py, pz, FRKN.PlaceLadderText)

                if IsControlJustReleased(0, 38) then 
                    moneyStatus = "climbStairs"
                    DeleteObject(cStairsObject)
                    DeleteEntity(cStairsObject)
                    oStairsObject = CreateObject(GetHashKey("3fe_boxing_ostairs"), px, py, pz, true, false, false)
                end    
            end
        end

        Citizen.Wait(sleep)
        cStairsObjectCoords = GetEntityCoords(cStairsObject)
        oStairsObjectCoords = GetEntityCoords(oStairsObject)
        playerCoords = GetEntityCoords(playerPed)  
            end
        end)
    end
end

Citizen.CreateThread(function()
    local sleep = 1000  
    while true do 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local px, py, pz = table.unpack(FRKN.EnterAreaTextCoords)
        local pa , pb, pc = table.unpack(FRKN.QuitAreaTextCoords)
        local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, px, py, pz)
        local distance2 = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, pa, pb, pc)
        if distance ~= -1 and distance <= 1.5 then
            sleep = 1
            DrawText3D(px, py, pz, FRKN.EnterAreaText)
            if IsControlJustReleased(0, 38) then 
                SetEntityCoords(playerPed,  pa, pb, pc)
            end
        end 

        if distance2 ~= -1 and distance2 <= 1.5 then
            sleep = 1
            DrawText3D(pa, pb, pc, FRKN.QuitAreaText)
            if IsControlJustReleased(0, 38) then 
                SetEntityCoords(playerPed,  px, py, pz)
            end
        end 

        Citizen.Wait(sleep)
    end 
end)
