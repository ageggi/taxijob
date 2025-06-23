local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local meterIsOpen, meterActive, lastLocation = false, false, nil
local jobRequired = Config.jobRequired
local PendingOrder = false
local PendingOrderData = nil
local OrderAcceptKey = 246 -- Y
local OrderDeclineKey = 249 -- N


-- Pending order system (предзаказы)
local pendingOrder, pendingOrderActive, pendingPickupIndex, pendingBlip = false, false, nil, nil
local notificationShown = false

NpcData = NpcData or {
    Active = false,
    CurrentNpc = nil,
    LastNpc = nil,
    CurrentDeliver = nil,
    LastDeliver = nil,
    Npc = nil,
    NpcBlip = nil,
    DeliveryBlip = nil,
    NpcTaken = false,
    NpcDelivered = false,
    CountDown = 180,
    startingLength = 0,
    distanceLeft = 0,
    CrashCount = 0
}

-- Utils
local function whitelistedVehicle()
    local veh = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
    for _, v in ipairs(Config.AllowedVehicles) do
        if veh == GetHashKey(v.model) then return true end
    end
    return false
end

local function getValidNpcIndex()
    local takeLocs = Config.NPCLocations and Config.NPCLocations.TakeLocations
    if not takeLocs then return nil end
    local keys = {}
    for k, v in pairs(takeLocs) do
        if v and (v.x or v[1]) and (v.y or v[2]) and (v.z or v[3]) then
            table.insert(keys, k)
        end
    end
    if #keys == 0 then return nil end
    return keys[math.random(1, #keys)]
end

-- Функция для генерации нового предзаказа
local function GenerateTaxiPreorder()
    PendingOrder = true
    -- Рандомная точка для NPC
    local pickupId = math.random(1, #Config.NPCLocations.TakeLocations)
    -- Не повторяем последнюю точку
    if NpcData.LastNpc ~= nil and #Config.NPCLocations.TakeLocations > 1 then
        while pickupId == NpcData.LastNpc do
            pickupId = math.random(1, #Config.NPCLocations.TakeLocations)
        end
    end
    PendingOrderData = {
        pickupId = pickupId,
        location = Config.NPCLocations.TakeLocations[pickupId]
    }
    -- Показываем уведомление справа вверху (или любым другим способом)
    local preorderMsg
    if Lang and Lang.t then
        preorderMsg = Lang:t('info.preorder_request')
    else
        preorderMsg = ('[ПРЕДЗАКАЗ] Новый клиент: район ~y~%s~s~. Нажмите ~g~Y~s~ чтобы принять, ~r~N~s~ чтобы отклонить.')
            :format(PendingOrderData.location.label or '???')
    end
    QBCore.Functions.Notify(preorderMsg, 'primary', 12000)
end

-- Функция для принятия заказа
local function AcceptTaxiPreorder()
    PendingOrder = false
    if PendingOrderData then
        -- Запускаем обычную миссию, но используем PendingOrderData.pickupId вместо random()
        StartTaxiMissionWithPickup(PendingOrderData.pickupId)
        PendingOrderData = nil
    end
end

-- Функция для отклонения заказа
local function DeclineTaxiPreorder()
    PendingOrder = false
    PendingOrderData = nil
    -- Генерируем новый заказ, исключая только что предложенный pickupId (или тот же не предлагать дважды подряд)
    GenerateTaxiPreorder()
end

-- Перехват нажатий клавиш для принятия/отклонения заказа
CreateThread(function()
    while true do
        if PendingOrder then
            -- Y принять
            if IsControlJustReleased(0, OrderAcceptKey) then
                AcceptTaxiPreorder()
            end
            -- N отклонить
            if IsControlJustReleased(0, OrderDeclineKey) then
                DeclineTaxiPreorder()
            end
        end
        Wait(0)
    end
end)

-- Основная миссия с новым входом (pickupId)
function StartTaxiMissionWithPickup(pickupId)
    -- Скопируйте всю логику из старого 'DoTaxiNpc', но замените random(1, #Config.NPCLocations.TakeLocations) на pickupId
    if not PlayerJob.onduty then return end
    if whitelistedVehicle() then
        if not NpcData.Active then
            NpcData.CurrentNpc = pickupId
            NpcData.LastNpc = pickupId
            -- остальной код как в RegisterNetEvent('qb-taxi:client:DoTaxiNpc'), только без random()
            -- ... (см. ниже)
            local Gender = math.random(1, #Config.NpcSkins)
            local PedSkin = math.random(1, #Config.NpcSkins[Gender])
            local model = GetHashKey(Config.NpcSkins[Gender][PedSkin])
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(0) end
            NpcData.Npc = CreatePed(3, model, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z, 0.0, true, false)
            PlaceObjectOnGroundProperly(NpcData.Npc)
            FreezeEntityPosition(NpcData.Npc, true)
            if NpcData.NpcBlip ~= nil then
                RemoveBlip(NpcData.NpcBlip)
            end
            QBCore.Functions.Notify(Lang:t('info.npc_on_gps'), 'success')
            if Config.UseTarget then createNpcPickUpLocation() end
            NpcData.NpcBlip = AddBlipForCoord(Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z)
            SetBlipColour(NpcData.NpcBlip, 3)
            SetBlipRoute(NpcData.NpcBlip, true)
            SetBlipRouteColour(NpcData.NpcBlip, 3)
            NpcData.Active = true
            -- остальной код как раньше (см. оригинальный DoTaxiNpc)
            if not Config.UseTarget then
                CreateThread(function()
                    while not NpcData.NpcTaken and NpcData.Active do
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local dist = #(pos - vector3(Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z))
                        if dist < 25 then
                            DrawMarker(0, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z+1.5, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                            if dist < 5 then
                                DrawText3D(Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y, Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z+1.2, '[E] Посадить пассажира')
                                if IsControlJustPressed(0, 38) then
                                    local veh = GetVehiclePedIsIn(ped, 0)
                                    local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(veh)
                                    for i = maxSeats - 1, 0, -1 do
                                        if IsVehicleSeatFree(veh, i) then
                                            freeSeat = i
                                            break
                                        end
                                    end
                                    meterIsOpen = true
                                    meterActive = true
                                    lastLocation = GetEntityCoords(PlayerPedId())
                                    SendNUIMessage({
                                        action = 'openMeter',
                                        toggle = true,
                                        meterData = Config.Meter
                                    })
                                    SendNUIMessage({
                                        action = 'toggleMeter'
                                    })
                                    ClearPedTasksImmediately(NpcData.Npc)
                                    FreezeEntityPosition(NpcData.Npc, false)
                                    TaskEnterVehicle(NpcData.Npc, veh, -1, freeSeat, 1.0, 0)
                                    listenForVehicleDamage()
                                    resetMeter()
                                    QBCore.Functions.Notify(Lang:t('info.go_to_location'))
                                    if NpcData.NpcBlip ~= nil then
                                        RemoveBlip(NpcData.NpcBlip)
                                    end
                                    GetDeliveryLocation()
                                    NpcData.NpcTaken = true
                                end
                            end
                        end
                        Wait(1)
                    end
                end)
            end
        else
            QBCore.Functions.Notify(Lang:t('error.already_mission'))
        end
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_taxi'))
    end
end

local function PlayOrderSound()
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
end

function StartOrderOffer()
    if pendingOrder or meterActive then return end
    pendingOrder = true
    pendingPickupIndex = getValidNpcIndex()
    if not pendingPickupIndex then
        QBCore.Functions.Notify("Ошибка: не найдено ни одной точки для NPC!", "error")
        pendingOrder = false
        pendingOrderActive = false
        return
    end
    if pendingBlip then RemoveBlip(pendingBlip) end
    local loc = Config.NPCLocations.TakeLocations[pendingPickupIndex]
    pendingBlip = AddBlipForCoord(loc.x or loc[1], loc.y or loc[2], loc.z or loc[3])
    SetBlipSprite(pendingBlip, 280)
    SetBlipColour(pendingBlip, 5)
    SetBlipScale(pendingBlip, 0.85)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Потенциальный клиент")
    EndTextCommandSetBlipName(pendingBlip)
    pendingOrderActive = true
    PlayOrderSound()
end

function CancelOrderOffer()
    if pendingBlip then RemoveBlip(pendingBlip) end
    pendingBlip = nil
    pendingOrder = false
    pendingPickupIndex = nil
    pendingOrderActive = false
    QBCore.Functions.Notify("Вы отказались от заказа. Новый будет через 30 сек.", "error")
    Citizen.SetTimeout(30000, function()
        if not pendingOrder and not meterActive then
            StartRandomOrderTimer()
        end
    end)
end

function StartRandomOrderTimer()
    local delay = math.random(30, 180)
    Citizen.SetTimeout(delay * 1000, function()
        if not pendingOrder and not meterActive and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            StartOrderOffer()
        end
    end)
end

CreateThread(function()
    while true do
        Wait(1000)
        if not pendingOrder and not meterActive and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            StartRandomOrderTimer()
            while pendingOrder or meterActive do
                Wait(2000)
            end
        end
    end
end)

-- HUD уведомление и обработка клавиш
CreateThread(function()
    while true do
        Wait(0)
        if pendingOrderActive and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            if not notificationShown then
                QBCore.Functions.Notify("У вас есть новый заказ. Принять [E] | Отклонить [Y]", "primary", 6000)
                notificationShown = true
            end
            if IsControlJustPressed(0, 38) then -- E
                pendingOrderActive = false
                pendingOrder = false
                notificationShown = false
                if pendingBlip then RemoveBlip(pendingBlip) end
                TriggerEvent('qb-taxi:client:DoTaxiNpc', pendingPickupIndex)
                pendingPickupIndex = nil
            elseif IsControlJustPressed(0, 246) then -- Y
                pendingOrderActive = false
                notificationShown = false
                CancelOrderOffer()
            end
        else
            notificationShown = false
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    if Config.UseTarget then
        setupTarget()
        setupCabParkingLocation()
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local dutyKey = false
local function onDuty()
    dutyKey = true
    CreateThread(function()
        while dutyKey do
            if PlayerJob.name == jobRequired then
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('QBCore:ToggleDuty')
                    dutyKey = false
                    break
                end
            else
                break
            end
            Wait(0)
        end
    end)
end

local function ResetNpcTask()
    NpcData = {
        Active = false,
        CurrentNpc = nil,
        LastNpc = nil,
        CurrentDeliver = nil,
        LastDeliver = nil,
        Npc = nil,
        NpcBlip = nil,
        DeliveryBlip = nil,
        NpcTaken = false,
        NpcDelivered = false,
        startingLength = 0,
        distanceLeft = 0,
        CrashCount = 0
    }
end

local function resetMeter()
    meterData = {
        fareAmount = 6,
        currentFare = 0,
        distanceTraveled = 0,
        startingLength = 0,
        distanceLeft = 0
    }
end

local function whitelistedVehicle()
    local veh = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
    local retval = false

    for i = 1, #Config.AllowedVehicles, 1 do
        if veh == GetHashKey(Config.AllowedVehicles[i].model) then
            retval = true
        end
    end

    if veh == GetHashKey('dynasty') then
        retval = true
    end

    return retval
end

local function IsDriver()
    return GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId()
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function GetDeliveryLocation()
    NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
    if NpcData.LastDeliver ~= nil then
        while NpcData.LastDeliver ~= NpcData.CurrentDeliver do
            NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
        end
    end

    if NpcData.DeliveryBlip ~= nil then
        RemoveBlip(NpcData.DeliveryBlip)
    end
    NpcData.DeliveryBlip = AddBlipForCoord(Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z)
    SetBlipColour(NpcData.DeliveryBlip, 3)
    SetBlipRoute(NpcData.DeliveryBlip, true)
    SetBlipRouteColour(NpcData.DeliveryBlip, 3)
    NpcData.LastDeliver = NpcData.CurrentDeliver
    if not Config.UseTarget then -- added checks to disable distance checking if polyzone option is used
        CreateThread(function()
            while true and NpcData.Active do
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local dist = #(pos - vector3(Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z))
                if dist < 25 then
                    DrawMarker(2, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
                    if dist < 5 then
                        DrawText3D(Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].x, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].y, Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver].z, Lang:t('info.drop_off_npc'))
                        if IsControlJustPressed(0, 38) then
                            local veh = GetVehiclePedIsIn(ped, 0)
                            TaskLeaveVehicle(NpcData.Npc, veh, 0)
                            SetEntityAsMissionEntity(NpcData.Npc, false, true)
                            SetEntityAsNoLongerNeeded(NpcData.Npc)
                            local targetCoords = Config.NPCLocations.TakeLocations[NpcData.LastNpc]
                            TaskGoStraightToCoord(NpcData.Npc, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
                            SendNUIMessage({
                                action = 'toggleMeter'
                            })
                            TriggerServerEvent('qb-taxi:server:NpcPay', meterData.currentFare, NpcData.CrashCount == 0)
                            PlayPedAmbientSpeechNative(NpcData.Npc, NpcData.CrashCount == 0 and Config.Advanced.Speech.Happy or Config.Advanced.Speech.Grateful, 'SPEECH_PARAMS_ALLOW_REPEAT')
                            meterActive = false
                            SendNUIMessage({
                                action = 'resetMeter'
                            })
                            QBCore.Functions.Notify(Lang:t('info.person_was_dropped_off'), 'success')
                            if NpcData.DeliveryBlip ~= nil then
                                RemoveBlip(NpcData.DeliveryBlip)
                            end
                            local RemovePed = function(p)
                                SetTimeout(60000, function()
                                    DeletePed(p)
                                end)
                            end
                            RemovePed(NpcData.Npc)
                            ResetNpcTask()
                            break
                        end
                    end
                end
                Wait(1)
            end
        end)
    end
end

local function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end
    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))
        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end
    return nearbyEntities
end

local function GetVehiclesInArea(coords, maxDistance) -- Vehicle inspection in designated area
    return EnumerateEntitiesWithinDistance(GetGamePool('CVehicle'), false, coords, maxDistance)
end

local function IsSpawnPointClear(coords, maxDistance) -- Check the spawn point to see if it's empty or not:
    return #GetVehiclesInArea(coords, maxDistance) == 0
end

local function getVehicleSpawnPoint()
    local near = nil
    local distance = 10000
    for k, v in pairs(Config.CabSpawns) do
        if IsSpawnPointClear(vector3(v.x, v.y, v.z), 2.5) then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local cur_distance = #(pos - vector3(v.x, v.y, v.z))
            if cur_distance < distance then
                distance = cur_distance
                near = k
            end
        end
    end
    return near
end

local function calculateFareAmount()
    if meterIsOpen and meterActive and not NpcData.NpcTaken then -- For RP purposes
        local startPos = lastLocation
        local newPos = GetEntityCoords(PlayerPedId())
        if startPos ~= newPos then
            local newDistance = #(startPos - newPos)
            lastLocation = newPos
            meterData['distanceTraveled'] += (newDistance / 1609)
            local fareAmount = ((meterData['distanceTraveled']) * Config.Meter['defaultPrice']) + Config.Meter['startingPrice']
            meterData['currentFare'] = math.floor(fareAmount)
            SendNUIMessage({
                action = 'updateMeter',
                meterData = meterData
            })
        end
    end

    if meterIsOpen and meterActive and NpcData.NpcTaken then
        if DoesBlipHaveGpsRoute(NpcData.DeliveryBlip) then
            local startPos = lastLocation
            local newPos = GetEntityCoords(PlayerPedId())
            if startPos ~= newPos then
                lastLocation = newPos
                if NpcData.startingLength == 0 then NpcData.startingLength = GetGpsBlipRouteLength() end -- initial length
                NpcData.distanceLeft = GetGpsBlipRouteLength()                                           -- refresh length as driving
                if GetGpsBlipRouteLength() > NpcData.distanceLeft then return end                        -- check route length against previous route length
                local distanceTraveled = NpcData.startingLength - NpcData.distanceLeft                   -- calculate route progress
                if distanceTraveled < 0 then return end
                meterData['distanceTraveled'] = (distanceTraveled / 1609)
                local fareAmount = ((meterData['distanceTraveled']) * Config.Meter['defaultPrice']) + Config.Meter['startingPrice']
                meterData['currentFare'] = math.floor(fareAmount)
                SendNUIMessage({
                    action = 'updateMeter',
                    meterData = meterData
                })
            end
        end
    end
end

local function listenForVehicleDamage()
    CreateThread(function()
        local lastVehicleHealth = nil
        while true do
            if not Config.Advanced.Bonus.Enabled or not NpcData.Active then return end

            if NpcData.NpcTaken then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

                if vehicle and vehicle ~= 0 then
                    local currentHealth = GetEntityHealth(vehicle)
                    if currentHealth < Config.Advanced.MinCabHealth then
                        TriggerEvent('qb-taxi:client:CancelTaxiNpc')
                        return QBCore.Functions.Notify(Lang:t('error.broken_taxi'), 'error')
                    end

                    if lastVehicleHealth and currentHealth < lastVehicleHealth then
                        if Config.Advanced.Speech.Enabled then
                            if lastVehicleHealth - currentHealth < 10 then -- small crash = angry / big crash = scared
                                PlayPedAmbientSpeechNative(NpcData.Npc, Config.Advanced.Speech.Angry, 'SPEECH_PARAMS_ALLOW_REPEAT')
                            else
                                PlayPedAmbientSpeechNative(NpcData.Npc, Config.Advanced.Speech.Scared, 'SPEECH_PARAMS_ALLOW_REPEAT')
                            end
                        end

                        NpcData.CrashCount += 1
                        if NpcData.CrashCount >= Config.Advanced.MaxCrashesAllowed then
                            TriggerEvent('qb-taxi:client:CancelTaxiNpc')
                            return QBCore.Functions.Notify(Lang:t('error.ride_canceled'), 'error')
                        end

                        local count = Config.Advanced.MaxCrashesAllowed - NpcData.CrashCount
                        QBCore.Functions.Notify(string.format(Lang:t('error.crash_warning'), count, count == 1 and Lang:t('error.time') or Lang:t('error.times')), 'error')
                    end
                    lastVehicleHealth = currentHealth
                else
                    lastVehicleHealth = nil
                end
            end
            Wait(200)
        end
    end)
end

-- qb-menu

function TaxiGarage()
    local vehicleMenu = {
        {
            header = Lang:t('menu.taxi_menu_header'),
            isMenuHeader = true
        }
    }
    for _, v in pairs(Config.AllowedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = v.label,
            params = {
                event = 'qb-taxi:client:TakeVehicle',
                args = {
                    model = v.model
                }
            }
        }
    end
    -- qb-bossmenu:client:openMenu
    if PlayerJob.name == jobRequired and PlayerJob.isboss and Config.UseTarget then
        vehicleMenu[#vehicleMenu + 1] = {
            header = Lang:t('menu.boss_menu'),
            txt = '',
            params = {
                event = 'qb-bossmenu:client:forceMenu'
            }
        }
    end

    vehicleMenu[#vehicleMenu + 1] = {
        header = Lang:t('menu.close_menu'),
        txt = '',
        params = {
            event = 'qb-menu:client:closeMenu'
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

RegisterNetEvent('qb-taxi:client:TakeVehicle', function(data)
    local SpawnPoint = getVehicleSpawnPoint()
    if SpawnPoint then
        local coords = vector3(Config.CabSpawns[SpawnPoint].x, Config.CabSpawns[SpawnPoint].y, Config.CabSpawns[SpawnPoint].z)
        local CanSpawn = IsSpawnPointClear(coords, 2.0)
        if CanSpawn then
            QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
                local veh = NetToVeh(netId)
                SetVehicleNumberPlateText(veh, 'TAXI' .. tostring(math.random(1000, 9999)))
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                closeMenuFull()
                SetEntityHeading(veh, Config.CabSpawns[SpawnPoint].w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
                SetVehicleEngineOn(veh, true, true)
            end, data.model, coords, true)
        else
            QBCore.Functions.Notify(Lang:t('info.no_spawn_point'), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t('info.no_spawn_point'), 'error')
        return
    end
end)

function closeMenuFull()
    exports['qb-menu']:closeMenu()
end

-- === НАЧАЛО: НОВЫЕ ФУНКЦИИ ДЛЯ NPC МИССИЙ ===

-- Переменные для системы заказов
local taxiMissionsEnabled = false
local currentOrder = nil
local orderBlip = nil
local waitingForAccept = false
local orderIncoming = false
local orderData = nil
local orderTimer = 0
local orderTimeout = 15 -- секунд на принятие
local orderAcceptKey = 38 -- E
local orderDeclineKey = 246 -- Y
local ORDER_RETRY_MIN = 15
local ORDER_RETRY_MAX = 180

-- Показывает экран заказа (правый верхний угол)
function ShowTaxiOrderScreen(order)
    orderIncoming = true
    orderData = order
    orderTimer = orderTimeout
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
    -- Новый блип
    if orderBlip then RemoveBlip(orderBlip) end
    orderBlip = AddBlipForCoord(order.pos.x, order.pos.y, order.pos.z)
    SetBlipSprite(orderBlip, 280)
    SetBlipColour(orderBlip, 5)
    SetBlipScale(orderBlip, 0.8)
    SetBlipDisplay(orderBlip, 4)
    SetBlipAsShortRange(orderBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Заказ такси")
    EndTextCommandSetBlipName(orderBlip)
    -- Таймер на принятие
    CreateThread(function()
        while orderIncoming and orderTimer > 0 do
            Wait(1000)
            orderTimer = orderTimer - 1
        end
        if orderIncoming then
            orderIncoming = false
            QBCore.Functions.Notify("Время на принятие заказа истекло", "primary")
            DeclineOrder()
        end
    end)
end

-- Отрисовка окна заказа
function DrawTaxiOrder()
    if not orderIncoming or not orderData then return end

    local zoneName = GetLabelText(GetNameOfZone(orderData.pos.x, orderData.pos.y, orderData.pos.z))
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(orderData.pos.x, orderData.pos.y, orderData.pos.z))
    local timerStr = ("Осталось: %d сек."):format(orderTimer)

    -- Окно справа вверху
    local boxX, boxY, boxW, boxH = 0.87, 0.175, 0.32, 0.25
    DrawRect(boxX, boxY, boxW, boxH, 0, 0, 0, 210)
    DrawRect(boxX, boxY, boxW + 0.005, boxH + 0.005, 255, 215, 60, 140)
    local leftX = boxX - boxW/2 + 0.018
    local curY = boxY - boxH/2 + 0.022
    local lineH = 0.035

    SetTextFont(4) SetTextScale(0.73, 0.73) SetTextColour(255,220,80,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString("Новый заказ такси!") EndTextCommandDisplayText(leftX, curY)
    curY = curY + lineH + 0.005
    SetTextFont(4) SetTextScale(0.53, 0.53) SetTextColour(255,180,60,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString("Район: ~w~"..zoneName) EndTextCommandDisplayText(leftX, curY)
    curY = curY + lineH * 0.9
    SetTextFont(4) SetTextScale(0.53, 0.53) SetTextColour(255,255,255,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString("Улица: ~w~"..streetName) EndTextCommandDisplayText(leftX, curY)
    curY = curY + lineH * 0.9
    SetTextFont(4) SetTextScale(0.54, 0.54) SetTextColour(255,200,40,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString(timerStr) EndTextCommandDisplayText(leftX, curY)
    curY = curY + lineH * 0.95
    DrawRect(boxX, curY, boxW * 0.92, 0.0016, 255, 220, 80, 100)
    curY = curY + 0.013
    local btnY = curY + 0.009
    SetTextFont(4) SetTextScale(0.56, 0.56) SetTextColour(80,220,100,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString("[E] Принять") EndTextCommandDisplayText(leftX, btnY)
    SetTextFont(4) SetTextScale(0.56, 0.56) SetTextColour(220,90,90,255) SetTextOutline()
    BeginTextCommandDisplayText("STRING") AddTextComponentString("[Y] Отклонить") EndTextCommandDisplayText(boxX + boxW/2 - 0.13, btnY)
end

-- Отрисовка и обработка кнопок
CreateThread(function()
    while true do
        if orderIncoming then
            DrawTaxiOrder()
            if IsControlJustReleased(0, orderAcceptKey) then
                orderIncoming = false
                AcceptOrder()
            elseif IsControlJustReleased(0, orderDeclineKey) then
                orderIncoming = false
                DeclineOrder()
            end
            Wait(0)
        else
            Wait(200)
        end
    end
end)

-- Команды для включения/выключения миссий
RegisterCommand("taximissions", function()
    if not taxiMissionsEnabled then
        taxiMissionsEnabled = true
        QBCore.Functions.Notify("NPC заказы такси включены", "success")
        TrySendNewOrder()
    else
        QBCore.Functions.Notify("NPC заказы уже включены", "error")
    end
end, false)
RegisterCommand("taximissions_off", function()
    taxiMissionsEnabled = false
    if orderBlip then RemoveBlip(orderBlip) orderBlip = nil end
    waitingForAccept = false
    orderIncoming = false
    orderData = nil
    orderTimer = 0
    currentOrder = nil
    if NpcData then
        if NpcData.NpcBlip then RemoveBlip(NpcData.NpcBlip) NpcData.NpcBlip = nil end
        if NpcData.DeliveryBlip then RemoveBlip(NpcData.DeliveryBlip) NpcData.DeliveryBlip = nil end
        if NpcData.Npc and DoesEntityExist(NpcData.Npc) then SetEntityAsMissionEntity(NpcData.Npc, false, true) DeleteEntity(NpcData.Npc) NpcData.Npc = nil end
        NpcData.Active = false NpcData.NpcTaken = false NpcData.NpcDelivered = false NpcData.CurrentNpc = nil NpcData.LastNpc = nil NpcData.CurrentDeliver = nil NpcData.LastDeliver = nil NpcData.CrashCount = 0 NpcData.CountDown = 180
    end
    meterIsOpen = false meterActive = false resetMeter()
    QBCore.Functions.Notify("NPC заказы такси выключены", "primary")
end, false)

-- Запуск нового заказа если можно
function TrySendNewOrder()
    if not taxiMissionsEnabled or waitingForAccept or (NpcData and NpcData.Active) or orderIncoming then return end
    local locations = Config.NPCLocations.TakeLocations
    local idx = math.random(1, #locations)
    local pos = locations[idx]
    currentOrder = { idx = idx, pos = pos }
    waitingForAccept = true
    ShowTaxiOrderScreen(currentOrder)
end

function RemoveOrderPreview()
    if orderBlip then RemoveBlip(orderBlip) orderBlip = nil end
    waitingForAccept = false
end

function AcceptOrder()
    if not waitingForAccept or not currentOrder or not currentOrder.idx then
        QBCore.Functions.Notify("Ошибка: заказ не найден или истек!", "error")
        RemoveOrderPreview()
        currentOrder = nil
        return
    end
    waitingForAccept = false
    RemoveOrderPreview()
    -- Запускаем миссию с выбранным индексом точки
    TriggerEvent("qb-taxi:client:DoTaxiNpc_custom", currentOrder.idx)
    currentOrder = nil
end

function DeclineOrder()
    if not waitingForAccept then return end
    RemoveOrderPreview()
    waitingForAccept = false
    currentOrder = nil
    if taxiMissionsEnabled then
        local timeout = math.random(ORDER_RETRY_MIN, ORDER_RETRY_MAX)
        QBCore.Functions.Notify("Вы отказались от заказа. Ожидание нового: "..timeout.." сек.", "primary")
        CreateThread(function()
            Wait(timeout * 1000)
            TrySendNewOrder()
        end)
    end
end

-- Новый и единственный обработчик миссии
RegisterNetEvent("qb-taxi:client:DoTaxiNpc_custom", function(npcIdx)
    -- Используем всегда актуальные данные о смене!
    local playerData = QBCore.Functions.GetPlayerData()
    if not (playerData and playerData.job and playerData.job.onduty) then
        QBCore.Functions.Notify("Вы не на смене!", "error")
        return
    end
    if not whitelistedVehicle() then
        QBCore.Functions.Notify("Вы не в служебном такси!", "error")
        return
    end
    if NpcData.Active then
        QBCore.Functions.Notify("У вас уже есть активная миссия!", "error")
        return
    end

    if npcIdx and Config.NPCLocations.TakeLocations[npcIdx] then
        NpcData.CurrentNpc = npcIdx
    else
        NpcData.CurrentNpc = math.random(1, #Config.NPCLocations.TakeLocations)
    end

    local Gender = math.random(1, #Config.NpcSkins)
    local PedSkin = math.random(1, #Config.NpcSkins[Gender])
    local model = GetHashKey(Config.NpcSkins[Gender][PedSkin])
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local x = Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].x
    local y = Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].y
    local z = Config.NPCLocations.TakeLocations[NpcData.CurrentNpc].z
    local spawnZ = z - 0.1
    NpcData.Npc = CreatePed(3, model, x, y, spawnZ, 0.0, true, false)
    PlaceObjectOnGroundProperly(NpcData.Npc)
    FreezeEntityPosition(NpcData.Npc, true)
    if NpcData.NpcBlip then RemoveBlip(NpcData.NpcBlip) end
    QBCore.Functions.Notify("Клиент отмечен на GPS", 'success')
    NpcData.NpcBlip = AddBlipForCoord(x, y, z)
    SetBlipColour(NpcData.NpcBlip, 3)
    SetBlipRoute(NpcData.NpcBlip, true)
    SetBlipRouteColour(NpcData.NpcBlip, 3)
    NpcData.LastNpc = NpcData.CurrentNpc
    NpcData.Active = true

    CreateThread(function()
        while not NpcData.NpcTaken and NpcData.Active do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = #(pos - vector3(x, y, z))
            if dist < 25 then
                DrawMarker(0, x, y, z - 1.0, 0,0,0,0,0,0, 2.0,2.0,1.0, 255,255,0,90, false,true,2,false)
                if dist < 5 then
                    DrawText3D(x, y, z + 1.0, "~y~[E] Посадить клиента")
                    if IsControlJustPressed(0, 38) then
                        local veh = GetVehiclePedIsIn(ped, 0)
                        local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(veh)
                        for i = maxSeats - 1, 0, -1 do
                            if IsVehicleSeatFree(veh, i) then
                                freeSeat = i
                                break
                            end
                        end
                        meterIsOpen = true
                        meterActive = true
                        lastLocation = GetEntityCoords(PlayerPedId())
                        SendNUIMessage({ action = 'openMeter', toggle = true, meterData = Config.Meter })
                        SendNUIMessage({ action = 'toggleMeter' })
                        ClearPedTasksImmediately(NpcData.Npc)
                        FreezeEntityPosition(NpcData.Npc, false)
                        TaskEnterVehicle(NpcData.Npc, veh, -1, freeSeat, 1.0, 0)
                        listenForVehicleDamage()
                        resetMeter()
                        QBCore.Functions.Notify("Отвезите клиента по адресу")
                        if NpcData.NpcBlip then RemoveBlip(NpcData.NpcBlip) end
                        GetDeliveryLocation()
                        NpcData.NpcTaken = true
                    end
                end
            end
            Wait(1)
        end
    end)
end)

-- После поездки — новый заказ!
-- Исходная функция (убери local)
function ResetNpcTask()
    NpcData.Active = false
    NpcData.CurrentNpc = nil
    NpcData.LastNpc = nil
    NpcData.CurrentDeliver = nil
    NpcData.LastDeliver = nil
    NpcData.Npc = nil
    NpcData.NpcBlip = nil
    NpcData.DeliveryBlip = nil
    NpcData.NpcTaken = false
    NpcData.NpcDelivered = false
    NpcData.CountDown = 180
    NpcData.startingLength = 0
    NpcData.distanceLeft = 0
    NpcData.CrashCount = 0
end

-- Переопределение
local _orig_ResetNpcTask = ResetNpcTask
function ResetNpcTask()
    _orig_ResetNpcTask()
    if taxiMissionsEnabled then
        local timeout = math.random(ORDER_RETRY_MIN, ORDER_RETRY_MAX)
        CreateThread(function()
            Wait(timeout * 1000)
            TrySendNewOrder()
        end)
    end
end

-- === КОНЕЦ: НОВЫЕ ФУНКЦИИ ДЛЯ NPC МИССИЙ ===

RegisterNetEvent('qb-taxi:client:CancelTaxiNpc', function()
    if NpcData.Active then
        NpcData.Active = false
        NpcData.NpcTaken = false
        NpcData.CurrentNpc = nil
        NpcData.LastNpc = nil
        NpcData.CurrentDeliver = nil
        NpcData.LastDeliver = nil
        NpcData.CrashCount = 0

        if DoesEntityExist(NpcData.Npc) then
            SetEntityAsMissionEntity(NpcData.Npc, false, true)
            DeleteEntity(NpcData.Npc)
        end

        if NpcData.NpcBlip ~= nil then
            RemoveBlip(NpcData.NpcBlip)
        end
        if NpcData.DeliveryBlip ~= nil then
            RemoveBlip(NpcData.DeliveryBlip)
        end

        if meterActive then
            SendNUIMessage({
                action = 'resetMeter'
            })
            SendNUIMessage({
                action = 'toggleMeter'
            })
            meterActive = false
        end
    end
end)

RegisterNetEvent('qb-taxi:client:toggleMeter', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        if whitelistedVehicle() then
            if not meterIsOpen and IsDriver() then
                SendNUIMessage({
                    action = 'openMeter',
                    toggle = true,
                    meterData = Config.Meter
                })
                meterIsOpen = true
            else
                SendNUIMessage({
                    action = 'openMeter',
                    toggle = false
                })
                meterIsOpen = false
            end
        else
            QBCore.Functions.Notify(Lang:t('error.missing_meter'), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t('error.no_vehicle'), 'error')
    end
end)

RegisterNetEvent('qb-taxi:client:enableMeter', function()
    if meterIsOpen then
        SendNUIMessage({
            action = 'toggleMeter'
        })
    else
        QBCore.Functions.Notify(Lang:t('error.not_active_meter'), 'error')
    end
end)

-- NUI Callbacks

RegisterNUICallback('enableMeter', function(data, cb)
    meterActive = data.enabled
    if not meterActive then resetMeter() end
    lastLocation = GetEntityCoords(PlayerPedId())
    cb('ok')
end)

-- Threads
CreateThread(function()
    local TaxiBlip = AddBlipForCoord(Config.Location)
    SetBlipSprite(TaxiBlip, 198)
    SetBlipDisplay(TaxiBlip, 4)
    SetBlipScale(TaxiBlip, 0.6)
    SetBlipAsShortRange(TaxiBlip, true)
    SetBlipColour(TaxiBlip, 5)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Lang:t('info.blip_name'))
    EndTextCommandSetBlipName(TaxiBlip)
end)

CreateThread(function()
    while true do
        Wait(2000)
        calculateFareAmount()
    end
end)

CreateThread(function()
    while true do
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            if meterIsOpen then
                SendNUIMessage({
                    action = 'openMeter',
                    toggle = false
                })
                meterIsOpen = false
            end
        end
        Wait(200)
    end
end)

RegisterNetEvent('qb-taxijob:client:requestcab', function()
    TaxiGarage()
end)

-- added checks to disable distance checking if polyzone option is used
CreateThread(function()
    while true do
        if not Config.UseTarget then
            local inRange = false
            if LocalPlayer.state.isLoggedIn then
                local Player = QBCore.Functions.GetPlayerData()
                if Player.job.name == jobRequired then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehDist = #(pos - vector3(Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z))
                    if vehDist < 30 then
                        inRange = true
                        DrawMarker(2, Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.3, 0.5, 0.2, 200, 0, 0, 222, false, false, false, true, false, false, false)
                        if vehDist < 1.5 then
                            if whitelistedVehicle() then
                                DrawText3D(Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z + 0.3, Lang:t('info.vehicle_parking'))
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                    end
                                end
                            else
                                DrawText3D(Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z + 0.3, Lang:t('info.job_vehicles'))
                                if IsControlJustReleased(0, 38) then
                                    if PlayerJob.onduty then
                                        TaxiGarage()
                                    else
                                        QBCore.Functions.Notify('You need to be on duty')
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if not inRange then
                Wait(3000)
            end
        end
        Wait(3)
    end
end)

-- POLY & TARGET Conversion code

-- setup qb-target
function setupTarget()
    CreateThread(function()
        exports['qb-target']:SpawnPed({
            model = 'a_m_m_indian_01',
            coords = vector4(901.34, -170.06, 74.08, 228.81),
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            animDict = 'abigail_mcs_1_concat-0',
            anim = 'csb_abigail_dual-0',
            flag = 1,
            scenario = 'WORLD_HUMAN_AA_COFFEE',
            target = {
                options = {
                    {
                        type = 'client',
                        event = 'qb-taxijob:client:requestcab',
                        icon = 'fas fa-sign-in-alt',
                        label = '🚕 Request Taxi Cab',
                        job = jobRequired,
                    }
                },
                distance = 2.5,
            },
            spawnNow = true,
            currentpednumber = 0,
        })
    end)
end

local zone
local deliveryZone

function createNpcPickUpLocation()
    zone = BoxZone:Create(Config.PZLocations.TakeLocations[NpcData.CurrentNpc].coord, Config.PZLocations.TakeLocations[NpcData.CurrentNpc].height, Config.PZLocations.TakeLocations[NpcData.CurrentNpc].width, {
        heading = Config.PZLocations.TakeLocations[NpcData.CurrentNpc].heading,
        debugPoly = false,
        minZ = Config.PZLocations.TakeLocations[NpcData.CurrentNpc].minZ,
        maxZ = Config.PZLocations.TakeLocations[NpcData.CurrentNpc].maxZ,
    })

    zone:onPlayerInOut(function(isPlayerInside)
        if isPlayerInside then
            if whitelistedVehicle() and not isInsidePickupZone and not NpcData.NpcTaken then
                isInsidePickupZone = true
                exports['qb-core']:DrawText(Lang:t('info.call_npc'), Config.DefaultTextLocation)
                callNpcPoly()
            end
        else
            isInsidePickupZone = false
        end
    end)
end

function createNpcDelieveryLocation()
    deliveryZone = BoxZone:Create(Config.PZLocations.DropLocations[NpcData.CurrentDeliver].coord, Config.PZLocations.DropLocations[NpcData.CurrentDeliver].height, Config.PZLocations.DropLocations[NpcData.CurrentDeliver].width, {
        heading = Config.PZLocations.DropLocations[NpcData.CurrentDeliver].heading,
        debugPoly = false,
        minZ = Config.PZLocations.DropLocations[NpcData.CurrentDeliver].minZ,
        maxZ = Config.PZLocations.DropLocations[NpcData.CurrentDeliver].maxZ,
    })

    deliveryZone:onPlayerInOut(function(isPlayerInside)
        if isPlayerInside then
            if whitelistedVehicle() and not isInsideDropZone and NpcData.NpcTaken then
                isInsideDropZone = true
                exports['qb-core']:DrawText(Lang:t('info.drop_off_npc'), Config.DefaultTextLocation)
                dropNpcPoly()
            end
        else
            isInsideDropZone = false
        end
    end)
end

function callNpcPoly()
    CreateThread(function()
        while not NpcData.NpcTaken do
            local ped = PlayerPedId()
            if isInsidePickupZone then
                if IsControlJustPressed(0, 38) then
                    exports['qb-core']:KeyPressed()
                    local veh = GetVehiclePedIsIn(ped, false)
                    local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(veh)

                    for i = maxSeats - 1, 0, -1 do
                        if IsVehicleSeatFree(veh, i) then
                            freeSeat = i
                            break
                        end
                    end

                    meterIsOpen = true
                    meterActive = true
                    lastLocation = GetEntityCoords(PlayerPedId())
                    SendNUIMessage({
                        action = 'openMeter',
                        toggle = true,
                        meterData = Config.Meter
                    })
                    SendNUIMessage({
                        action = 'toggleMeter'
                    })
                    ClearPedTasksImmediately(NpcData.Npc)
                    FreezeEntityPosition(NpcData.Npc, false)
                    TaskEnterVehicle(NpcData.Npc, veh, -1, freeSeat, 1.0, 0)
                    listenForVehicleDamage()
                    resetMeter()
                    QBCore.Functions.Notify(Lang:t('info.go_to_location'))
                    if NpcData.NpcBlip ~= nil then
                        RemoveBlip(NpcData.NpcBlip)
                    end
                    GetDeliveryLocation()
                    NpcData.NpcTaken = true
                    createNpcDelieveryLocation()
                    zone:destroy()
                end
            end
            Wait(1)
        end
    end)
end

function dropNpcPoly()
    CreateThread(function()
        while NpcData.NpcTaken do
            local ped = PlayerPedId()
            if isInsideDropZone then
                if IsControlJustPressed(0, 38) then
                    exports['qb-core']:KeyPressed()
                    local veh = GetVehiclePedIsIn(ped, 0)
                    TaskLeaveVehicle(NpcData.Npc, veh, 0)
                    SetEntityAsMissionEntity(NpcData.Npc, false, true)
                    SetEntityAsNoLongerNeeded(NpcData.Npc)
                    local targetCoords = Config.NPCLocations.TakeLocations[NpcData.LastNpc]
                    TaskGoStraightToCoord(NpcData.Npc, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
                    SendNUIMessage({
                        action = 'toggleMeter'
                    })
                    TriggerServerEvent('qb-taxi:server:NpcPay', meterData.currentFare, NpcData.CrashCount == 0)
                    PlayPedAmbientSpeechNative(NpcData.Npc, NpcData.CrashCount == 0 and Config.Advanced.Speech.Happy or Config.Advanced.Speech.Grateful, 'SPEECH_PARAMS_ALLOW_REPEAT')
                    meterActive = false
                    SendNUIMessage({
                        action = 'resetMeter'
                    })
                    QBCore.Functions.Notify(Lang:t('info.person_was_dropped_off'), 'success')
                    if NpcData.DeliveryBlip ~= nil then
                        RemoveBlip(NpcData.DeliveryBlip)
                    end
                    local RemovePed = function(p)
                        SetTimeout(60000, function()
                            DeletePed(p)
                        end)
                    end
                    RemovePed(NpcData.Npc)
                    ResetNpcTask()
                    deliveryZone:destroy()
                    break
                end
            end
            Wait(1)
        end
    end)
end

function setupCabParkingLocation()
    local taxiParking = BoxZone:Create(vector3(908.62, -173.82, 74.51), 11.0, 38.2, {
        name = 'qb-taxi',
        heading = 55,
        --debugPoly=true
    })

    taxiParking:onPlayerInOut(function(isPlayerInside)
        if isPlayerInside and not Notified and Config.UseTarget then
            if whitelistedVehicle() then
                exports['qb-core']:DrawText(Lang:t('info.vehicle_parking'), Config.DefaultTextLocation)
                Notified = true
                isPlayerInsideZone = true
            end
        else
            exports['qb-core']:HideText()
            Notified = false
            isPlayerInsideZone = false
        end
    end)
end

-- thread to handle vehicle parking
CreateThread(function()
    while true do
        if isPlayerInsideZone then
            if IsControlJustReleased(0, 38) then
                exports['qb-core']:KeyPressed()
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    local ped = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    if meterIsOpen then
                        TriggerEvent('qb-taxi:client:toggleMeter')
                        meterActive = false
                    end
                    TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
                    Wait(2000) -- 2 second delay just to ensure the player is out of the vehicle
                    DeleteVehicle(vehicle)
                    QBCore.Functions.Notify(Lang:t('info.taxi_returned'), 'success')
                end
            end
        end
        Wait(1)
    end
end)

CreateThread(function()
    local v = Config.Duty
    local dutyZone = BoxZone:Create(
        vector3(v.x, v.y, v.z), 3.75, 3, {
            name = 'duty_zone',
            debugPoly = false,
            minZ = v.z - 1,
            maxZ = v.z + 1,
        })

    dutyZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            dutyKey = true
            if not PlayerJob.onduty then
                exports['qb-core']:DrawText(Lang:t('info.on_duty'), 'left')
            else
                exports['qb-core']:DrawText(Lang:t('info.off_duty'), 'left')
            end
            onDuty()
        else
            dutyKey = false
            exports['qb-core']:HideText()
        end
    end)
end)