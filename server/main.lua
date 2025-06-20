local QBCore = exports['qb-core']:GetCoreObject()

-- Проверка, находится ли игрок рядом с точкой доставки
function NearTaxi(src)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    for _, v in pairs(Config.NPCLocations.DeliverLocations) do
        local dist = #(coords.xy - vector2(v.x, v.y))
        local heightDiff = math.abs(coords.z - v.z)
        if dist < 20 and heightDiff < 5 then
            return true
        end
    end
    return false
end

-- Список активных заказов от игроков
local playerAlerts = {}
local playerAlertId = 1

-- Отправка вызова такси игроками
RegisterNetEvent("qb-taxi:server:SendTaxiAlert", function(address, x, y, z)
    local src = source
    for _, alert in pairs(playerAlerts) do
        if alert.sender == src and not alert.acceptedBy then
            TriggerClientEvent('QBCore:Notify', src, "Вы уже отправили запрос!", "error")
            return
        end
    end

    local players = QBCore.Functions.GetPlayers()
    local alertData = {
        id = playerAlertId,
        address = address,
        coords = vector3(x, y, z),
        sender = src,
        acceptedBy = nil
    }
    playerAlerts[playerAlertId] = alertData
    playerAlertId = playerAlertId + 1

    for _, id in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(id)
        if Player and Player.PlayerData.job.name == "taxi" and Player.PlayerData.job.onduty then
            TriggerClientEvent("qb-taxi:client:ReceivePlayerTaxiAlert", id, alertData)
        end
    end
    TriggerClientEvent('QBCore:Notify', src, "Ваш запрос такси отправлен!", "success")
end)


-- Регистрируем событие для отмены заказа
RegisterNetEvent("qb-taxi:server:CancelPlayerTaxiAlert", function(alertId)
    local src = source
    local alert = playerAlerts[alertId]
    if alert then
        -- Уведомляем всех таксистов, что заказ был отменён
        local players = QBCore.Functions.GetPlayers()
        for _, id in pairs(players) do
            local Player = QBCore.Functions.GetPlayer(id)
            if Player and Player.PlayerData.job.name == "taxi" and Player.PlayerData.job.onduty then
                TriggerClientEvent("qb-taxi:client:PlayerTaxiAlertCanceled", id, alertId)
            end
        end

        -- Удаляем заказ из списка активных заказов
        playerAlerts[alertId] = nil
    end
end)
-- Принятие вызова такси
RegisterNetEvent("qb-taxi:server:AcceptPlayerTaxiAlert", function(alertId)
    local src = source
    local alert = playerAlerts[alertId]
    
    -- Проверка на существование заказа
    if not alert then
        TriggerClientEvent('QBCore:Notify', src, "Этот заказ уже недоступен", "error")
        return
    end
    
    -- Проверка на то, что заказ еще не принят
    if alert.acceptedBy then
        TriggerClientEvent('QBCore:Notify', src, "Заказ уже принят другим таксистом", "error")
        return
    end

    -- Обновление состояния заказа
    alert.acceptedBy = src

    -- Уведомление всех таксистов
    local players = QBCore.Functions.GetPlayers()
    for _, id in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(id)
        if Player and Player.PlayerData.job.name == "taxi" and Player.PlayerData.job.onduty then
            TriggerClientEvent("qb-taxi:client:PlayerTaxiAlertTaken", id, alertId, src)
        end
    end

    -- Уведомление клиента
    local driver = QBCore.Functions.GetPlayer(src)
    local driverName = driver and driver.PlayerData.charinfo.firstname .. " " .. driver.PlayerData.charinfo.lastname or "Таксист"
    TriggerClientEvent('QBCore:Notify', alert.sender, "Таксист " .. driverName .. " принял ваш вызов!", "success")
end)

-- Выплата за NPC заказы
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
                payment = payment + tipAmount
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

            if math.random() < 0.05 then -- 5% шанс на предмет "contact_pimp"
                local itemName = "contact_pimp"
                local gave = false
                if GetResourceState('ox_inventory') == "started" then
                    exports.ox_inventory:AddItem(src, itemName, 1)
                    gave = true
                elseif GetResourceState('qb-inventory') == "started" then
                    exports['qb-inventory']:AddItem(src, itemName, 1)
                    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[itemName] then
                        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'add')
                    end
                    gave = true
                end
                if gave then
                    TriggerClientEvent('QBCore:Notify', src, "Вы получили редкий контакт: сутенёр!", "success", 5000)
                end
            end

            local chance2 = math.random(1, 100)
            if chance2 < 26 then
                exports['qb-inventory']:AddItem(src, Config.Rewards, 1)
                TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Rewards], 'add')
            end
        else
            DropPlayer(src, 'Attempting To Exploit')
        end
    else
        DropPlayer(src, 'Attempting To Exploit')
    end
end)