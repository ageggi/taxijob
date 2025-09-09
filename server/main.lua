local QBCore = exports['qb-core']:GetCoreObject()

-- Утилиты для работы с модами транспорта
local function GetVehicleMods(vehicle)
    local mods = {}
    
    -- Получаем все основные моды
    for i = 0, 67 do -- Максимальное количество модов в GTA V
        local modType = GetVehicleModType(vehicle, i)
        if modType ~= -1 then
            mods[tostring(i)] = GetVehicleMod(vehicle, i)
        end
    end
    
    -- Получаем дополнительные параметры
    mods.plateText = GetVehicleNumberPlateText(vehicle)
    mods.plateIndex = GetVehicleNumberPlateTextIndex(vehicle)
    mods.windowTint = GetVehicleWindowTint(vehicle)
    mods.color1 = table.pack(GetVehicleColours(vehicle))
    mods.color2 = table.pack(GetVehicleExtraColours(vehicle))
    mods.pearlescentColor = table.pack(GetVehicleExtraColours(vehicle))
    mods.tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle))
    mods.modLivery = GetVehicleLivery(vehicle)
    
    -- Получаем статус неонов
    mods.neonEnabled = {
        GetIsVehicleNeonLightEnabled(vehicle, 0), -- левая сторона
        GetIsVehicleNeonLightEnabled(vehicle, 1), -- правая сторона
        GetIsVehicleNeonLightEnabled(vehicle, 2), -- передняя
        GetIsVehicleNeonLightEnabled(vehicle, 3)  -- задняя
    }
    
    mods.neonColor = table.pack(GetVehicleNeonLightsColour(vehicle))
    
    -- Получаем статус ксенона
    mods.xenonColor = GetVehicleXenonLightsColour(vehicle)
    
    return mods
end

local function SetVehicleMods(vehicle, mods)
    if not mods then return end
    
    -- Устанавливаем все основные моды
    for modIndex, modValue in pairs(mods) do
        local index = tonumber(modIndex)
        if index and index >= 0 and index <= 67 then
            SetVehicleMod(vehicle, index, modValue, false)
        end
    end
    
    -- Устанавливаем дополнительные параметры
    if mods.plateText then
        SetVehicleNumberPlateText(vehicle, mods.plateText)
    end
    
    if mods.plateIndex then
        SetVehicleNumberPlateTextIndex(vehicle, mods.plateIndex)
    end
    
    if mods.windowTint then
        SetVehicleWindowTint(vehicle, mods.windowTint)
    end
    
    if mods.color1 and #mods.color1 >= 2 then
        SetVehicleColours(vehicle, mods.color1[1], mods.color1[2])
    end
    
    if mods.color2 and #mods.color2 >= 2 then
        SetVehicleExtraColours(vehicle, mods.color2[1], mods.color2[2])
    end
    
    if mods.tyreSmokeColor and #mods.tyreSmokeColor >= 3 then
        SetVehicleTyreSmokeColor(vehicle, mods.tyreSmokeColor[1], mods.tyreSmokeColor[2], mods.tyreSmokeColor[3])
    end
    
    if mods.modLivery then
        SetVehicleLivery(vehicle, mods.modLivery)
    end
    
    -- Устанавливаем неоны
    if mods.neonEnabled then
        for i = 0, 3 do
            SetVehicleNeonLightEnabled(vehicle, i, mods.neonEnabled[i + 1] or false)
        end
    end
    
    if mods.neonColor and #mods.neonColor >= 3 then
        SetVehicleNeonLightsColour(vehicle, mods.neonColor[1], mods.neonColor[2], mods.neonColor[3])
    end
    
    -- Устанавливаем ксенон
    if mods.xenonColor then
        SetVehicleXenonLightsColour(vehicle, mods.xenonColor)
    end
end

function NearTaxi(src)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    for _, v in pairs(Config.NPCLocations.DeliverLocations) do
        local dist = #(coords - vector3(v.x, v.y, v.z))
        if dist < 20 then
            return true
        end
    end
end

RegisterNetEvent('qb-taxi:server:NpcPay', function(payment, hasReceivedBonus)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.jobRequired then
        if NearTaxi(src) then
            local randomAmount = math.random(1, 5)
            local r1, r2 = math.random(1, 5), math.random(1, 5)
            if randomAmount == r1 or randomAmount == r2 then payment = payment + math.random(10, 20) end

            if Config.Advanced.Bonus.Enabled then
                local tipAmount = math.floor(payment * Config.Advanced.Bonus.Percentage / 100)

                payment += tipAmount
                if hasReceivedBonus then
                    TriggerClientEvent('QBCore:Notify', src, string.format(Lang:t('info.tip_received'), tipAmount), 'primary', 5000)
                else
                    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.tip_not_received'), 'primary', 5000)
                end
            end

            if Config.Management then
                exports['qb-banking']:AddMoney('taxi', payment, 'Customer payment')
            else
                Player.Functions.AddMoney('cash', payment, 'Taxi payout')
            end

            local chance = 0.1 -- 100% шанс для тестов, поставь math.random() < 0.05 для 5% в будущем

            if chance == 1 then
                -- Выдаём "contact_pimp" через ox_inventory или qb-inventory
                local itemName = "contact_pimp"
                local gave = false
                if GetResourceState('ox_inventory') == "started" then
                    exports.ox_inventory:AddItem(src, itemName, 1)
                    gave = true
                elseif GetResourceState('qb-inventory') == "started" then
                    exports['qb-inventory']:AddItem(src, itemName, 1, false, false, 'qb-taxi:server:NpcPay')
                    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[itemName] then
                        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'add')
                    end
                    gave = true
                end
                if gave then
                    TriggerClientEvent('QBCore:Notify', src, "Вы получили редкий контакт: сутенёр!", "success", 5000)
                end
            end

            -- Старый шанс на Config.Rewards (оставь, если он нужен, или убери если не нужен)
            local chance2 = math.random(1, 100)
            if chance2 < 26 then
                exports['qb-inventory']:AddItem(src, Config.Rewards, 1, false, false, 'qb-taxi:server:NpcPay')
                TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Rewards], 'add')
            end
        else
            DropPlayer(src, 'Attempting To Exploit')
        end
    else
        DropPlayer(src, 'Attempting To Exploit')
    end
end)

-- События для управления транспортом такси
RegisterNetEvent('qb-taxi:server:StoreVehicle', function(vehicleData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Получаем данные автомобиля с модами
    local vehicleNetId = vehicleData.netId
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    
    if not DoesEntityExist(vehicle) then
        TriggerClientEvent('QBCore:Notify', src, 'Ошибка: автомобиль не найден', 'error')
        return
    end
    
    -- Получаем текущие моды автомобиля
    local currentMods = GetVehicleMods(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    
    -- Сохраняем данные в базу данных (предполагаем наличие таблицы owned_vehicles)
    MySQL.update('UPDATE owned_vehicles SET mods = ? WHERE plate = ? AND citizenid = ?', {
        json.encode(currentMods),
        plate,
        Player.PlayerData.citizenid
    }, function(result)
        if result > 0 then
            -- Удаляем автомобиль из мира
            DeleteEntity(vehicle)
            TriggerClientEvent('QBCore:Notify', src, 'Автомобиль припаркован, тюнинг сохранен', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Ошибка при сохранении автомобиля', 'error')
        end
    end)
end)

RegisterNetEvent('qb-taxi:server:TakeOutVehicle', function(vehicleModel, spawnCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Проверяем, является ли игрок таксистом
    if Player.PlayerData.job.name ~= Config.jobRequired then
        TriggerClientEvent('QBCore:Notify', src, 'Вы не таксист!', 'error')
        return
    end
    
    -- Создаем автомобиль
    QBCore.Functions.SpawnVehicle(src, vehicleModel, function(netId)
        local vehicle = NetworkGetEntityFromNetworkId(netId)
        local plate = 'TAXI' .. tostring(math.random(1000, 9999))
        
        SetVehicleNumberPlateText(vehicle, plate)
        
        -- Получаем сохраненные моды из БД (если есть)
        MySQL.query('SELECT mods FROM owned_vehicles WHERE plate = ? AND citizenid = ?', {
            plate,
            Player.PlayerData.citizenid
        }, function(result)
            if result[1] and result[1].mods then
                local savedMods = json.decode(result[1].mods)
                SetVehicleMods(vehicle, savedMods)
            end
            
            -- Устанавливаем автомобиль на позицию
            SetEntityCoords(vehicle, spawnCoords.x, spawnCoords.y, spawnCoords.z)
            SetEntityHeading(vehicle, spawnCoords.w or 0.0)
            
            -- Выдаем ключи
            TriggerEvent('vehiclekeys:server:SetVehicleOwner', Player.PlayerData.citizenid, plate)
            TriggerClientEvent('vehiclekeys:client:SetOwner', src, plate)
            
            -- Уведомляем клиент о успешном спавне
            TriggerClientEvent('qb-taxi:client:VehicleSpawned', src, netId, plate)
            
            -- Уведомляем игрока
            TriggerClientEvent('QBCore:Notify', src, 'Автомобиль вызван из гаража с сохраненным тюнингом', 'success')
        end)
    end, spawnCoords, true)
end)

RegisterNetEvent('qb-taxi:server:SellVehicle', function(buyerData, vehicleData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Buyer = QBCore.Functions.GetPlayer(buyerData.playerId)
    
    if not Player or not Buyer then
        TriggerClientEvent('QBCore:Notify', src, 'Ошибка: игрок не найден', 'error')
        return
    end
    
    local plate = vehicleData.plate
    local salePrice = vehicleData.price or 0
    
    -- Обновляем владельца в БД
    MySQL.update('UPDATE owned_vehicles SET citizenid = ? WHERE plate = ? AND citizenid = ?', {
        Buyer.PlayerData.citizenid,
        plate,
        Player.PlayerData.citizenid
    }, function(result)
        if result > 0 then
            -- Снимаем деньги с покупателя и даем продавцу
            if Buyer.Functions.RemoveMoney('cash', salePrice, 'vehicle-purchase') then
                Player.Functions.AddMoney('cash', salePrice, 'vehicle-sale')
                
                -- Сразу выдаем ключи новому владельцу
                TriggerEvent('vehiclekeys:server:SetVehicleOwner', Buyer.PlayerData.citizenid, plate)
                TriggerClientEvent('vehiclekeys:client:SetOwner', buyerData.playerId, plate)
                
                -- Уведомляем обе стороны
                TriggerClientEvent('QBCore:Notify', src, 'Автомобиль продан за $' .. salePrice, 'success')
                TriggerClientEvent('QBCore:Notify', buyerData.playerId, 'Автомобиль куплен за $' .. salePrice .. ', ключи получены', 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, 'У покупателя недостаточно денег', 'error')
                TriggerClientEvent('QBCore:Notify', buyerData.playerId, 'У вас недостаточно денег', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Ошибка при продаже автомобиля', 'error')
        end
    end)
end)

-- Дополнительное событие для повторной выдачи ключей при спавне автомобиля
RegisterNetEvent('qb-taxi:server:GiveVehicleKeys', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Проверяем, владеет ли игрок этим автомобилем
    MySQL.query('SELECT * FROM owned_vehicles WHERE plate = ? AND citizenid = ?', {
        plate,
        Player.PlayerData.citizenid
    }, function(result)
        if result[1] then
            -- Выдаем ключи владельцу
            TriggerEvent('vehiclekeys:server:SetVehicleOwner', Player.PlayerData.citizenid, plate)
            TriggerClientEvent('vehiclekeys:client:SetOwner', src, plate)
            TriggerClientEvent('QBCore:Notify', src, 'Ключи от автомобиля получены', 'success')
        end
    end)
end)