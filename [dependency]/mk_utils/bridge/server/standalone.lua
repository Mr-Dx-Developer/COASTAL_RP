---@diagnostic disable: duplicate-set-field
if GetResourceState('myCustomCore') == 'missing' then return end 

--MyCore = Load Your Core

-- Framework label used by all scripts
framework.name = 'MyCustomCore'
framework.core = MyCore

--Show server console prints from mk scripts. Disable will only show version update available print
framework.consoleLogging = true

-- Default garage used by [mk_usedvehicles] and [mk_garage] to store a vehicle if one wasn't found
framework.defaultGarage = GetResourceState('mk_garage') == 'started' and 'legion'  or 'default'

-- Used by [mk_garage] [mk_vehiclekeys] [mk_plates] [mk_usedvehicles]
-- Framework database structure
database = {
    ownedVehicles = {
        tableName = 'player_vehicles',
        plateColumn = 'plate',
        fakePlateColumn = 'fakeplate',
        identifierColumn = 'citizenid',
        modsColumn = 'mods',
        garageColumn = 'garage',
        vehicleStoredColumn = 'state',
        vinColumn = false
    },
    players = {
        tableName = 'players',
        identifierColumn = 'citizenid'
    },
    glovebox = false,
    trunk = false
}

-- Used by [mk_plates] [mk_vehiclekeys] [mk_usedvehicles]
---@param itemName string Name of item to make useable
---@param triggerEvent string Event name to trigger when item is used
---@param args table|nil Event args to pass to the triggered event when item is used
inventory.createUseableItem = function(self, itemName, triggerEvent, args)
    --TriggerClientEvent(triggerEvent, src, item, args)
end

-- Used by [mk_mining] [mk_plates] [mk_usedvehicles] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Item name to be removed
---@param amount number Amount to be removed
---@param metadata table|nil Metadata item should have to be removed
---@param slot number|nil Slot number to check for specific item to remove
---@param cb function Callback true if item was removed. false if not
inventory.removeItem = function(self, playerSource, itemName, amount, metadata, slot, cb)
    local src = playerSource
    
    if GetResourceState('ox_inventory') == 'started' then 
        if slot then 
            local item = exports['ox_inventory']:GetSlot(src, slot)
            if item then 
                if item.name == itemName then
                    local success, response = exports['ox_inventory']:RemoveItem(src, itemName, amount, false, slot)
                    if success then
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        else
            local itemAmount = exports['ox_inventory']:Search(src, 'count', itemName, metadata)
            if itemAmount >= amount then 
                local success, response = exports['ox_inventory']:RemoveItem(src, itemName, amount, metadata, false)
                if success then 
                    cb(true)
                else
                    --debug response
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        --framework inventory remove item 
    end
end

-- Used by [mk_garbage] [mk_mining] [mk_plates] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Item name to be added
---@param amount number Amount to be added
---@param metadata table|nil Metadata to add onto the item
---@param cb function Callback true if item was added. false if not
inventory.addItem = function(self, playerSource, itemName, amount, metadata, cb)
    local src = playerSource

    if GetResourceState('ox_inventory') == 'started' then 
        local carryAmount = exports['ox_inventory']:CanCarryAmount(src, itemName)
        if carryAmount >= amount then 
            local success, response = exports['ox_inventory']:AddItem(src, itemName, amount, metadata, false)
            if success then 
                cb(true)
            else
                --debug response
                cb(false)
            end
        else
            utils:notify(src, locale('cant_carry'), 'error', 5000)
            cb(false)
        end
    else
        --framework inventory add item
    end
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Name of item to check
---@param metadata table|nil Metadata item should have when checking if the player has it
---@return boolean true if player has item. false if not
inventory.hasItem = function(self, playerSource, itemName, metadata)
    local src = playerSource
    local hasItem = false 

    if GetResourceState('ox_inventory') == 'started' then 
        local item = exports['ox_inventory']:Search(src, 'count', itemName, metadata)
        if item > 0 then 
            hasItem = true
        end
    else
        --framework inventory checks
    end

    return hasItem
end

-- Used by [mk_mining]
---@param playerSource number Player server id
---@param itemName string Name of item to check
---@return table List of each slot a specific item is in the inventory
inventory.getItemSlots = function(self, playerSource, itemName)
    local src = playerSource
    local slots = {}

    if GetResourceState('ox_inventory') == 'started' then 
        local inv = exports['ox_inventory']:Search(src, 'slots', itemName)
        if inv then 
            slots = inv
        end
    else
        --framework inventory checks
    end

    return slots
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param slot number Inventory slot to get item data
---@return table|boolean Item data if exists or false
inventory.getItemBySlot = function(self, playerSource, slot)
    local src = playerSource 

    if GetResourceState('ox_inventory') == 'started' then 
        local item = exports['ox_inventory']:GetSlot(src, slot)
        if item then
            return item 
        else
            return false
        end
    else
        --framework inventory checks
    end
end

-- Used by [mk_vehiclekeys]
---@param item table Item to locate metadata from
---@return table|boolean Item metadata or false
inventory.getMetadata = function(self, item)
    if item then 
        if GetResourceState('ox_inventory') == 'started' then 
            return item.metadata 
        else
            --framework inventory return
        end
    else
        return false 
    end
end

-- Used by [mk_vehiclekeys]
---@param item table Item to check its metadata
---@param metadataKey string Table key of item metadata to check
---@param metadataValue string Table value of item metadata to check
---@return boolean true if metadata value exists. false if not
inventory.compareMetadata = function(self, item, metadataKey, metadataValue)
    if GetResourceState('ox_inventory') == 'started' then 
        if item.metadata?[metadataKey] == metadataValue then 
            return true 
        else
            return false 
        end
    else
        --framework inventory check
    end
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param item table Item to set new metadata on
---@param slot number Inventory slot where item is located
---@param metadataKey string Metadata table key
---@param metadataValue string New metadata value for the provided metadata key
inventory.setNewMetadata = function(self, playerSource, item, slot, metadataKey, metadataValue)
    local src = playerSource

    if GetResourceState('ox_inventory') == 'started' then
        item.metadata[metadataKey] = metadataValue
        exports['ox_inventory']:SetMetadata(src, slot, item.metadata)
    else
        --framework inventory metadata set
    end
end

-- Used by [mk_garage] [mk_usedvehicles] [mk_vehicleshop]
---@param data { shared: true|nil (true if a shared vehicle), userData: table|nil (owners row from the players database or nil if shared vehicle), modelString: string (vehicle model name), 
---@param data      modelHash: number (vehicle model number), mods: table (vehicle mods), plate: string (vehicle plate), vin: string|nil (vehicle vin number), garage: string (garage name),
---@param data      state: number (0 - out 1 - garaged 2 - impounded), fuelLevel: number (vehicle fuel amount), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health),
---@param data      vehicleData: table|nil (data set by mk_garage) } 
---@param cb function Callsback upson SQL query finish
database.addPlayerVehicle = function(self, data, cb)
    local insertQuery, insertData 
    --update to match framework database structure 
    if database.ownedVehicles.vinColumn and data.vin then 
        if data.vehicleData then 
            insertQuery = 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, '..database.ownedVehicles.vinColumn..', garage, state, fuel, engine, body, vehicleData) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and nil or data.userData?.license,
                data.shared and data.shared or data.userData?.citizenid,
                data.modelString,
                data.modelHash,
                json.encode(data.mods),
                data.plate,
                data.vin,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.fuelLevel and data.fuelLevel or 100,
                data.engineHealth and data.engineHealth or 1000,
                data.bodyHealth and data.bodyHealth or 1000,
                data.vehicleData
            }
        else
            insertQuery = 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, '..database.ownedVehicles.vinColumn..', garage, state, fuel, engine, body) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and nil or data.userData?.license,
                data.shared and data.shared or data.userData?.citizenid,
                data.modelString,
                data.modelHash,
                json.encode(data.mods),
                data.plate,
                data.vin,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.fuelLevel and data.fuelLevel or 100,
                data.engineHealth and data.engineHealth or 1000,
                data.bodyHealth and data.bodyHealth or 1000
            }
        end
    else
        if data.vehicleData then 
            insertQuery = 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, fuel, engine, body, vehicleData) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and nil or data.userData?.license,
                data.shared and data.shared or data.userData?.citizenid,
                data.modelString,
                data.modelHash,
                json.encode(data.mods),
                data.plate,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.fuelLevel and data.fuelLevel or 100,
                data.engineHealth and data.engineHealth or 1000,
                data.bodyHealth and data.bodyHealth or 1000,
                data.vehicleData
            }
        else
            insertQuery = 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, fuel, engine, body) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and nil or data.userData?.license,
                data.shared and data.shared or data.userData?.citizenid,
                data.modelString,
                data.modelHash,
                json.encode(data.mods),
                data.plate,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.fuelLevel and data.fuelLevel or 100,
                data.engineHealth and data.engineHealth or 1000,
                data.bodyHealth and data.bodyHealth or 1000
            }
        end
    end

    MySQL.insert(insertQuery, insertData, cb)
end

-- Used by [mk_usedvehicles]
---@param data { identifier: string (player identifier), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.removePlayerVehicle = function(self, data, cb)
    --update to match framework database structure 
    MySQL.query('DELETE FROM player_vehicles WHERE citizenid = :id AND '..(database.ownedVehicles.fakePlateColumn and '(plate = :plate OR '..database.ownedVehicles.fakePlateColumn..' = :plate)' or 'plate = :plate'), {id = data.identifier, data.plate}, cb)
end

-- Used by [mk_usedvehicles]
---@param data { userData: table (owners row from the players database), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.updateVehicleOwner = function(self, data, cb)
    --update to match framework database structure 
    MySQL.update('UPDATE player_vehicles SET license = ?, citizenid = ? WHERE plate = ?', {data.userData.license, data.userData.citizenid, data.plate}, cb)
end

-- Used by [mk_garage]
---@param data { garageName: string (garage name), vehicleState: number (1 - stored), fuelLevel: number (vehicle fuel), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health), mods: table (vehicle mods), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.storeVehicle = function(self, data, cb)
    --update to match framework database structure 
    MySQL.update('UPDATE player_vehicles SET garage = ?, state = ?, fuel = ?, engine = ?, body = ?, mods = ? WHERE plate = ?', {
        data.garageName,
        data.vehicleState,
        data.fuelLevel,
        data.engineHealth,
        data.bodyHealth,
        data.mods,
        data.plate
    }, cb)
end

-- Used by [mk_garage]
---@param data { garageName: string (garage name), vehicleState: number (2 - impounded), fuelLevel: number (vehicle fuel), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health), mods: table (vehicle mods), impoundData: table (data set by mk_garage) plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.impoundVehicle = function(self, data, cb)
    --update to match framework database structure 
    MySQL.update('UPDATE player_vehicles SET garage = ?, state = ?, fuel = ?, engine = ?, body = ?, mods = ?, impound = ? WHERE plate = ?', {
        data.garageName,
        data.vehicleState,
        data.fuelLevel,
        data.engineHealth,
        data.bodyHealth,
        data.mods,
        data.impoundData,
        data.plate
    }, cb)
end

-- Used by [mk_garage] [mk_vehicleshop]
---@param playerSource number Player server id
---@param playerIdentifier string Player identifier
---@return string|boolean player firstname, player lastname or false, false
framework.getPlayerName = function(self, playerSource, playerIdentifier)
    if playerIdentifier then --get name of another player
        --get other players name
    else --get own name
        --get player name
    end
end

-- Used by [mk_garage] [mk_plates] [mk_vehicleshop]
---@param playerSource number Player server id
---@return string|boolean player job name, player job grade or false, false
framework.getJob = function(self, playerSource)

end

--- Used by [mk_garbage] [mk_plates] [mk_usedvehicles]
---@param playerIdentifier string Player identifier
---@return number Player server id
framework.getPlayerSourceByIdentifier = function(self, playerIdentifier)

end

-- Used by [mk_garage] [mk_mining] [mk_usedvehicles] [mk_garbage] [mk_vehiclekeys] [mk_vehicleshop]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to check
---@return number Account balance or 0
framework.checkMoney = function(self, playerSource, moneyType)

end

-- Used by [mk_garage] [mk_mining] [mk_usedvehicles] [mk_garbage] [mk_vehiclekeys] [mk_vehicleshop]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to remove money from
---@param amount number Amount to remove
---@return boolean true if money was removed. false if not
framework.removeMoney = function(self, playerSource, moneyType, amount)

end

-- Used by [mk_garbage] [mk_mining] [mk_usedvehicles] [mk_vehicleshop]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to add money to
---@param amount number Amount to add
---@return boolean true if money was added. false if not
framework.addMoney = function(self, playerSource, moneyType, amount)

end

-- Used by [mk_usedvehicles]
---@param identifier string Player identifier
---@param moneyType string 'cash'|'bank' Account to add money to
---@param amount number Amount to add
---@return boolean true if money was added. false if not
framework.addMoneyToOfflinePlayer = function(self, identifier, moneyType, amount)

end

-- Used by [mk_garage] [mk_vehicleshop]
---@param societyType string 'job'|'gang' Job or gang society
---@param societyName string Job or gang name
---@return number|boolean Account balance or false
society.getBalance = function(self, societyType, societyName)

end

-- Used by [mk_garage] [mk_vehicleshop]
---@param deposit boolean true if depositing money. false if withdrawing
---@param societyType string 'job'|'gang' Job or gang society
---@param societyName string Job or gang name
---@param amount number Amount to add or remove from society account
---@return number|boolean New balance amount or false
society.updateBalance = function(self, playerSource, deposit, societyType, societyName, amount)

end

--Used by [mk_vehicleshop]
---@param shopName string Vehicle shop name from [mk_vehicleshop] locations.lua
framework.getShopVehicles = function(self, shopName)
    --[[
        return vehicles for this shop in the following table format
        {
            [categories] = {
                name = category name (example compacts)
                categoryLabel = category label (example Compacts)
            },
            [category] = { --(example compacts)
                {
                    name = Vehicle Name (example Club)
                    model = string vehicle spawn code (example club)
                    price = vehicle price  example (5000)
                },
                {
                    name = Vehicle Name (example Blista Kanjo)
                    model = string vehicle spawn code (example kanjo)
                    price = vehicle price  example (12000)
                }
            }
        }
    ]]
end

--Used by [mk_vehicleshop]
---@param playerSource number Player server id
---@param bool boolean On Duty boolean
framework.setjobDuty = function(self, playerSource, bool)
    --Set framework job duty if your framework supports this
end