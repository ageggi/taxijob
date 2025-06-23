local QBCore = exports['qb-core']:GetCoreObject()
local meterIsOpen = false
local meterActive = false
local lastLocation = nil
local PlayerJob = {}
local jobRequired = Config.jobRequired

local meterData = {
    fareAmount = 6,
    currentFare = 0,
    distanceTraveled = 0,
}

local NpcData = {
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

-- === Система заказов: рандомные заказы, звук, DrawText3D внизу ===
local pendingOrder = false
local pendingPickupIndex = nil
local pendingBlip = nil
local pendingOrderActive = false

local function PlayOrderSound()
    -- Самый заметный стандартный звук подтверждения
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
end

function StartOrderOffer()
    if pendingOrder or NpcData.Active then return end
    pendingOrder = true
    pendingPickupIndex = math.random(1, #Config.NPCLocations.TakeLocations)
    if pendingBlip then RemoveBlip(pendingBlip) end
    local loc = Config.NPCLocations.TakeLocations[pendingPickupIndex]
    pendingBlip = AddBlipForCoord(loc.x, loc.y, loc.z)
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
    QBCore.Functions.Notify("Вы отказались от заказа. Новый заказ будет через 30 секунд.", "error")
    Citizen.SetTimeout(30000, function()
        if not pendingOrder and not NpcData.Active then
            StartRandomOrderTimer()
        end
    end)
end

function StartRandomOrderTimer()
    -- задержка от 30 до 180 секунд (3 минуты)
    local delay = math.random(30, 180)
    Citizen.SetTimeout(delay * 1000, function()
        if not pendingOrder and not NpcData.Active and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            StartOrderOffer()
        end
    end)
end

CreateThread(function()
    while true do
        Wait(1000)
        if not pendingOrder and not NpcData.Active and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            StartRandomOrderTimer()
            while pendingOrder or NpcData.Active do
                Wait(2000)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if pendingOrderActive and IsPedInAnyVehicle(PlayerPedId(), false) and whitelistedVehicle() then
            DrawText3D(0, 0, 0, "~g~[E]~s~ Принять заказ   ~r~[Y]~s~ Отклонить")
            if IsControlJustPressed(0, 38) then -- E
                pendingOrderActive = false
                pendingOrder = false
                if pendingBlip then RemoveBlip(pendingBlip) end
                TriggerEvent('qb-taxi:client:DoTaxiNpc', pendingPickupIndex)
                pendingPickupIndex = nil
            elseif IsControlJustPressed(0, 246) then -- Y
                pendingOrderActive = false
                CancelOrderOffer()
            end
        end
    end
end)
-- === конец блока системы заказов ===

-- DrawText3D внизу экрана, по центру, с темным фоном
function DrawText3D(x, y, z, text)
    local screenX = 0.5
    local screenY = 0.93
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(true)
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(screenX, screenY)
    local factor = (string.len(text)) / 370
    local boxWidth = (0.017 + factor)
    local boxHeight = 0.040
    DrawRect(screenX, screenY + 0.017, boxWidth, boxHeight, 0, 0, 0, 200)
end

AddEventHandler('onResourceStart', function(resourceName)
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    PlayerJob = QBCore.Functions.GetPlayerData().job
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

function whitelistedVehicle()
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

RegisterNetEvent('qb-taxi:client:DoTaxiNpc', function(pickupIndex)
    if not PlayerJob.onduty then return end
    if whitelistedVehicle() then
        if not NpcData.Active then
            local idx = pickupIndex or math.random(1, (Config.NPCLocations and Config.NPCLocations.TakeLocations) and #Config.NPCLocations.TakeLocations or 0)
            NpcData.CurrentNpc = idx
            if NpcData.LastNpc ~= nil and Config.NPCLocations and Config.NPCLocations.TakeLocations then
                while NpcData.LastNpc == NpcData.CurrentNpc do
                    NpcData.CurrentNpc = math.random(1, #Config.NPCLocations.TakeLocations)
                end
            end

            local Gender = math.random(1, #Config.NpcSkins)
            local PedSkin = math.random(1, #Config.NpcSkins[Gender])
            local model = GetHashKey(Config.NpcSkins[Gender][PedSkin])
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(0) end

            -- Проверка: есть ли координаты
            if not (Config.NPCLocations and Config.NPCLocations.TakeLocations and NpcData.CurrentNpc and Config.NPCLocations.TakeLocations[NpcData.CurrentNpc]) then
                QBCore.Functions.Notify("Ошибка: не найдена локация NPC для такси.", "error")
                return
            end
            local coords = Config.NPCLocations.TakeLocations[NpcData.CurrentNpc]
            local found, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 10.0, 0)
            local spawnZ = found and groundZ or coords.z
            NpcData.Npc = CreatePed(3, model, coords.x, coords.y, spawnZ, coords.w or 0.0, true, true)
            PlaceObjectOnGroundProperly(NpcData.Npc)
            FreezeEntityPosition(NpcData.Npc, true)
            if NpcData.NpcBlip ~= nil then
                RemoveBlip(NpcData.NpcBlip)
            end
            QBCore.Functions.Notify("Клиент отмечен на GPS!", 'success')

            NpcData.NpcBlip = AddBlipForCoord(coords.x, coords.y, spawnZ)
            SetBlipColour(NpcData.NpcBlip, 3)
            SetBlipRoute(NpcData.NpcBlip, true)
            SetBlipRouteColour(NpcData.NpcBlip, 3)
            NpcData.LastNpc = NpcData.CurrentNpc
            NpcData.Active = true

            CreateThread(function()
                while not NpcData.NpcTaken and NpcData.Active do
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local dist = #(pos - vector3(coords.x, coords.y, spawnZ))
                    if dist < 25 then
                        DrawMarker(0, coords.x, coords.y, spawnZ - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 255, 0, 100, 1, 0, 0, 1)
                        if dist < 5 then
                            DrawText3D(0, 0, 0, "Нажмите [E] чтобы клиент сел в машину")
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
                                resetMeter()
                                QBCore.Functions.Notify("Отвезите клиента в пункт назначения!")
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
        else
            QBCore.Functions.Notify("У вас уже есть активный заказ.")
        end
    else
        QBCore.Functions.Notify("Вы не в такси!", "error")
    end
end)

function GetDeliveryLocation()
    NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
    if NpcData.LastDeliver ~= nil then
        while NpcData.LastDeliver == NpcData.CurrentDeliver do
            NpcData.CurrentDeliver = math.random(1, #Config.NPCLocations.DeliverLocations)
        end
    end
    if NpcData.DeliveryBlip ~= nil then
        RemoveBlip(NpcData.DeliveryBlip)
    end
    local drop = Config.NPCLocations.DeliverLocations[NpcData.CurrentDeliver]
    NpcData.DeliveryBlip = AddBlipForCoord(drop.x, drop.y, drop.z)
    SetBlipColour(NpcData.DeliveryBlip, 3)
    SetBlipRoute(NpcData.DeliveryBlip, true)
    SetBlipRouteColour(NpcData.DeliveryBlip, 3)
    NpcData.LastDeliver = NpcData.CurrentDeliver
    CreateThread(function()
        while true and NpcData.Active do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = #(pos - vector3(drop.x, drop.y, drop.z))
            if dist < 50 then
                -- Обычный круглый белый маркер: тип 1, цвет белый (255,255,255), радиус 4.0
                DrawMarker(1, drop.x, drop.y, drop.z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 1.0, 255, 255, 255, 180, false, false, 2, false, nil, nil, false)
                if dist < 15 then
                    DrawText3D(0, 0, 0, "Нажмите [E] чтобы высадить клиента")
                    if IsControlJustPressed(0, 38) then
                        TaskLeaveVehicle(NpcData.Npc, GetVehiclePedIsIn(NpcData.Npc, false), 0)
                        Wait(1000)
                        SetEntityAsMissionEntity(NpcData.Npc, false, true)
                        SetEntityAsNoLongerNeeded(NpcData.Npc)
                        SendNUIMessage({ action = 'toggleMeter' })
                        TriggerServerEvent('qb-taxi:server:NpcPay', meterData.currentFare, NpcData.CrashCount == 0)
                        meterActive = false
                        SendNUIMessage({ action = 'resetMeter' })
                        QBCore.Functions.Notify("Клиент доставлен! Получите оплату.", "success")
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
                        Citizen.SetTimeout(2000, function()
                            if not pendingOrder and not NpcData.Active then
                                StartRandomOrderTimer()
                            end
                        end)
                        break
                    end
                end
            end
            Wait(1)
        end
    end)
end

-- ...Остальной стандартный код (garage, cancel, meter, polyzone, threads и т.д.) оставлять без изменений.

-- Остальной дефолтный код (garage, cancel, meter, polyzone, threads и т.д.) не меняется!

-- Остальной код (take vehicle, cancel, meter, polyzone, threads и т.д.)
-- Дальше идет весь дефолтный client/main.lua из qb-taxijob
-- Если нужен полный оригинал (800+ строк), скачайте [client/main.lua из репозитория](https://github.com/qbcore-framework/qb-taxijob/blob/main/client/main.lua)
-- и просто добавьте блок системы заказов из этого файла.

-- КОД НА 800+ СТРОК: https://github.com/qbcore-framework/qb-taxijob/blob/main/client/main.lua

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

-- Events


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
                        -- Маркер: чуть меньше по радиусу, ниже по высоте, светло-желтоватый
                        DrawMarker(
                            1,
                            Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z - 1.1,
                            0.0, 0.0, 0.0,
                            0.0, 0.0, 0.0,
                            2.0, 2.0, 0.4,
                            255, 235, 120, 200, -- светло-желтый (RGBA)
                            false, false, 2, false, nil, nil, false
                        )
                        -- Нет текста "Парковка транспорта" над маркером!
                        if vehDist < 1.5 then
                            if whitelistedVehicle() then
                                DrawText3D(
                                    Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z + 0.7,
                                    Lang:t('info.vehicle_parking'),
                                    255, 235, 120 -- светло-желтоватый текст
                                )
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                    end
                                end
                            else
                                DrawText3D(
                                    Config.parkLocation.x, Config.parkLocation.y, Config.parkLocation.z + 0.7,
                                    Lang:t('info.job_vehicles'),
                                    255, 235, 120 -- светло-желтоватый текст
                                )
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

-- Функция 3D текста с цветом (по умолчанию желтоватый)
function DrawText3D(x, y, z, text, r, g, b)
    r = r or 255
    g = g or 235
    b = b or 120
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.45, 0.45)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end

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