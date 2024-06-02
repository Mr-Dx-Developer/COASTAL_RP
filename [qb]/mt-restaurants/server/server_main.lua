local QBCore = exports[Main.CoreName]:GetCoreObject()

lib.callback.register('mt-restaurants:server:ItemsSuficientes', function(source, items)
    local i = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(items) do
		if Main.InventoryName == 'ox_inventory' then
			if exports.ox_inventory:GetItem(source, v.item, nil, true) >= v.amount then
				i = i + 1
				if i == #items then
					return true
				end
			else
				return false
			end
		else
			if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
				i = i + 1
				if i == #items then
					return true
				end
			else
				return false
			end
		end
    end
end)

RegisterNetEvent('mt-restaurants:server:AddItem', function(ItemName, ItemAmount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem(ItemName, ItemAmount)
	if Main.InventoryName ~= 'ox_inventory' then
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[ItemName], "add")
	end
end)

RegisterNetEvent('mt-restaurants:server:RemoveItem', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item, amount)
	if Main.InventoryName ~= 'ox_inventory' then
   		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
	end
end)

-- Billing

lib.callback.register('mt-restaurants:MakePlayerList', function(source)
	local onlineList = {}
	for _, v in pairs(QBCore.Functions.GetPlayers()) do
		local P = QBCore.Functions.GetPlayer(v)
		onlineList[#onlineList+1] = { value = tonumber(v), text = "["..v.."] - "..P.PlayerData.charinfo.firstname..' '..P.PlayerData.charinfo.lastname  }
	end
	return onlineList
end)

RegisterServerEvent("mt-restaurants:server:Charge", function(citizen, price, billtype)
	local src = source
	local biller = QBCore.Functions.GetPlayer(src)
	local billed = QBCore.Functions.GetPlayer(tonumber(citizen))
	local amount = tonumber(price)
	local balance = billed.Functions.GetMoney(billtype)
	if amount and amount > 0 then
		if balance < amount then
			TriggerClientEvent('QBCore:Notify', src, Lang.CusNoCash, "error") TriggerClientEvent('QBCore:Notify', tonumber(citizen), Lang.YouNoCash, "error") return
		else
			local label = biller.PlayerData.job.label
			TriggerClientEvent("mt-restaurants:client:PayPopup", billed.PlayerData.source, amount, src, billtype) TriggerClientEvent('QBCore:Notify', src, Lang.InvoiceSuccess, "success") TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, Lang.InvoiceRecieved, "success")
		end
	else TriggerClientEvent('QBCore:Notify', src, Lang.ChargeZero, "error") return end
end)

RegisterServerEvent("mt-restaurants:server:PayPopup", function(data)
	local src = source
	local billed = QBCore.Functions.GetPlayer(src)
	local biller = QBCore.Functions.GetPlayer(tonumber(data.biller))
	local newdata = { senderCitizenId = biller.PlayerData.citizenid, society = biller.PlayerData.job.name, amount = data.amount }
	if data.accept == true then
		billed.Functions.RemoveMoney(tostring(data.billtype), data.amount)
		exports[Main.ManagementName]:AddMoney(biller.PlayerData.job.name, data.amount)
		biller.Functions.AddMoney('bank', tonumber(math.floor(data.amount*Main.ComissionBill/100)))
        TriggerClientEvent('QBCore:Notify', data.biller, billed.PlayerData.charinfo.firstname..Lang.AceptedPayment..data.amount, "success")
	elseif data.accept == false then
        TriggerClientEvent('QBCore:Notify', src, Lang.Declined, "success") TriggerClientEvent('QBCore:Notify', data.biller, billed.PlayerData.charinfo.firstname..Lang.DeclinePayment..data.amount..Lang.Payment, "error")
	end
end)

RegisterNetEvent('mt-restaurants:server:RegisterStash', function(id, label, slots, maxWeight)
    exports.ox_inventory:RegisterStash(id, label, slots, maxWeight)
end)