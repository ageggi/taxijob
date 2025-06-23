local QBCore = exports['qb-core']:GetCoreObject()

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