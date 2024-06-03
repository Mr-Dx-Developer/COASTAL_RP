
QBCore = exports["qb-core"]:GetCoreObject()

requests , bets = {} , {}
targetPedBetsCount , sourcePedBetsCount = 0 , 0
fight = false
betController = false

-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        EVENT                                                        
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛


RegisterServerEvent('frkn-fight:OpenNuiForPlayer')
AddEventHandler('frkn-fight:OpenNuiForPlayer', function(targetPlayerId, nuiName, information,roundData)
    local sourcePlayerId = source
    requests = {
        targetPlayerId = targetPlayerId,
        targetPed = GetPlayerPed(targetPlayerId),
        targetPedName = GetPlayerName(targetPlayerId),
        targetImg = GetRandomImageUrl(),
        sourcePlayerId = sourcePlayerId,
        sourcePed = GetPlayerPed(sourcePlayerId),
        sourcePedName = GetPlayerName(sourcePlayerId),
        sourceImg =GetRandomImageUrl(),
        data = data,
        nuiName = nuiName,
        roundTime = roundData["roundTime"],
        roundCount = roundData["round"]
    }
    TriggerClientEvent('frkn-fight:OpenNui', targetPlayerId, sourcePlayerId, information,nuiName,requests)
end)

RegisterServerEvent('frkn-fight:HandleRequest')
AddEventHandler('frkn-fight:HandleRequest', function(requesterServerId, accepted,ped)
    if not fight then 
            local requesterData = requests
            if requesterData then
            local requesterSource = requesterData.sourcePlayerId

            if accepted then
                TriggerClientEvent('frkn-fight:sendAllData',-1, requests)
                TriggerClientEvent('frkn-fight:betClientControl', -1,true)
                TriggerClientEvent('frkn-fight:requestsControl', requesterServerId, true,ped)
                TriggerClientEvent('frkn-fight:fightControllerEvent', -1,true)
                --print("İstek kabul edildi. Oyuncu ID: " .. requesterSource)
                fight = true
                betController = true
            else
                TriggerClientEvent('frkn-fight:sendAllData',-1, requests)
                TriggerClientEvent('frkn-fight:betClientControl', -1,false)
                TriggerClientEvent('frkn-fight:requestsControl', requesterServerId, false,ped)
                TriggerClientEvent('frkn-fight:fightControllerEvent', -1,false)
                --print("İstek reddedildi. Oyuncu ID: " .. requesterSource)
                fight = false
                betController = false
            end

            requests = nil
        else
            --print("İstek bulunamadı.")
        end
    else
        --print("zaten bir dövvüş var")
    end
end)

RegisterNetEvent('frkn-fight:insertBet')
AddEventHandler('frkn-fight:insertBet',function (betsData,currentData)
    local player = source 
    local steamName, playerId, playerIdentifier = GetPlayerInfo(player)
    if not  betsData.betType == steamName then 
    
    table.insert(bets,{
        name = betsData.betType,
        count=tonumber(betsData.betCount),
        color = betsData.color,
        betterName = steamName,
        betterId = playerId,
        betterIdentifier = playerIdentifier,
        source = player
    })
    
    --print(json.encode(bets))
    --print("Target Name " ..currentData.targetPedName)
    --print("Source Name " ..currentData.sourcePedName)
    
    if betsData.betType == currentData.targetPedName then 
        targetPedBetsCount = targetPedBetsCount + betsData.betCount
    else
        sourcePedBetsCount = sourcePedBetsCount + betsData.betCount
    end
    
    --print(targetPedBetsCount)
    --print(sourcePedBetsCount)

    TriggerClientEvent('frkn-fight:betsAppend',-1,bets)
    end
end)

RegisterNetEvent('frkn-fight:getBetCount')
AddEventHandler('frkn-fight:getBetCount', function ()
    TriggerClientEvent('frkn-fight:setBetCount',-1, targetPedBetsCount,sourcePedBetsCount)
end)


RegisterNetEvent('frkn-fight:payBets')
AddEventHandler('frkn-fight:payBets', function(winnerPlayer)
    for _, bet in ipairs(bets) do

        if bet.name == winnerPlayer then
            local xPlayer = QBCore.Functions.GetPlayer(bet.source)
            if xPlayer then 
                local payout = tonumber(bet.count) * 2 
                --print(payout)
                --print(bet.betterName .. " isimli oyuncuya " .. payout .. " miktarında para ödendi.")
                xPlayer.Functions.AddMoney(payout)
            end
        end
    end

    bets = {}
    targetPedBetsCount = 0
    sourcePedBetsCount = 0
end)

RegisterNetEvent('frkn-fight:finishFight')
AddEventHandler('frkn-fight:finishFight', function()
    requests = {}
    bets = {} 
    targetPedBetsCount = 0
    sourcePedBetsCount = 0
    fight = false
    betController = false
    TriggerClientEvent('frkn-fight:fightControllerEvent', -1,false)
end)

RegisterNetEvent('frkn-fight:betOpenServer')
AddEventHandler('frkn-fight:betOpenServer',function (controller)
    betController = controller
    TriggerClientEvent('frkn-fight:betClientControl', -1,controller)
end)

RegisterNetEvent('frkn-fight:caseGift')
AddEventHandler('frkn-fight:caseGift',function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if xPlayer then 
        xPlayer.Functions.AddMoney(FRKN.CaseMoney)
    end
end)

RegisterNetEvent('frkn-fight:sendCurrentData')
AddEventHandler('frkn-fight:sendCurrentData',function (currentData)
    TriggerClientEvent('frkn-fight:sendClientCurrentData', -1, currentData)
end)


-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        FUNCTION                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

function GetRandomImageUrl()
    local randomIndex = math.random(1, #FRKN.RandomImg)
    return FRKN.RandomImg[randomIndex]
end

function GetPlayerInfo(player)
    local steamName = GetPlayerName(player) 
    local playerId = player 
    local playerIdentifier = GetPlayerIdentifier(player, 0)

    return steamName, playerId, playerIdentifier
end
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        CALLBACK                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛


QBCore.Functions.CreateCallback('frkn-fight:moneyControl', function(source, cb,amount)
    local src = source
    local xPlayer =QBCore.Functions.GetPlayer(source)
    if xPlayer and tonumber(xPlayer.PlayerData.money['cash']) >= tonumber(amount) then
        cb(true)  
    else
        cb(true) 
    end
end)

