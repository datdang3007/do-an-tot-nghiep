vehicles = {}
cargoProp = nil
holdingCargo = false
serverData = {}

----------------------------------
--- Functions:
----------------------------------
function getVehiclePlate(vehicle)
    return ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
end

local function checkVehicleExists(vehicle)
    local plate = getVehiclePlate(vehicle)
    local vehicleExist = vehicles[plate]

    if not vehicleExist then return nil end

    return plate, vehicleExist
end

local function checkCargoEmpty(slot)
    if slot == 0 then return true end
    return false
end

local function checkCargoFull(slot, maxSlot)
    if slot > maxSlot then return true end
    return false
end

local function checkVehicleCanPushCargo(vehicle)
    local plate, vehicleExist = checkVehicleExists(vehicle)
    if not vehicleExist then return false end

    local slot = #vehicleExist.cargos + 1
    local maxSlot = #Config.CargoSlots[vehicleExist.model]
    if checkCargoFull(slot, maxSlot) then return false end

    local isTrunkOpen = GetVehicleDoorAngleRatio(vehicle, 5) > 0
    if not isTrunkOpen then return false end

    if not cargoProp then return false end

    return true
end

local function checkVehicleCanPopCargo(vehicle)
    local plate, vehicleExist = checkVehicleExists(vehicle)
    if not vehicleExist then return false end

    local slot = #vehicleExist.cargos
    if checkCargoEmpty(slot) then return false end

    local isTrunkOpen = GetVehicleDoorAngleRatio(vehicle, 5) > 0
    if not isTrunkOpen then return false end

    if cargoProp then return false end

    return true
end

local function getWareHouseDataByCode(code)
    if serverData.warehouse == nil then return nil end
    for _, dataWareHouse in pairs(serverData.warehouse) do
        if dataWareHouse.code == code then return dataWareHouse end
    end
    return nil
end

local function animCargoTake(cargoType)
    local model = Config.CargoProps[1]
    lib.requestModel(model)

    local pos = GetEntityCoords(cache.ped)
    local cargoEntity = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(cargoEntity, cache.ped, GetPedBoneIndex(cache.ped, 28422), 0.01, -0.3, 0.1, 6.0, 0.0, 0.0, true, true, false, true, 0, true)
    
    lib.requestAnimDict('anim@heists@box_carry@')
    TaskPlayAnim(cache.ped, 'anim@heists@box_carry@', 'idle', 5.0, 5.0, -1, 51, 0, 0, 0, 0)
    SetModelAsNoLongerNeeded(model)

    cargoProp = {
        entity = cargoEntity,
        model = model,
        type = cargoType,
    }

    print('cargoType', cargoType)
    
    CreateThread(function()
        while cargoProp and DoesEntityExist(cargoProp.entity) do
            if not IsEntityPlayingAnim(cache.ped, 'anim@heists@box_carry@', 'idle', 3) then
                TaskPlayAnim(cache.ped, 'anim@heists@box_carry@', 'idle', 5.0, 5.0, -1, 51, 0, 0, 0, 0)
            end
            Wait(1000)
        end
        RemoveAnimDict('anim@heists@box_carry@')
    end)
    
    holdingCargo = true
end

function animCargoPush()
    local currentCargo = cargoProp
    if DoesEntityExist(cargoProp.entity) then
        DetachEntity(cache.ped, true, false)
        DeleteEntity(cargoProp.entity)
        cargoProp = nil
        ClearPedTasksImmediately(cache.ped)
    end
    holdingCargo = false
    return currentCargo
end

----------------------------------
--- Events:
----------------------------------
RegisterNetEvent('cuoi_trucker:client:syncCommodityServerData')
AddEventHandler('cuoi_trucker:client:syncCommodityServerData', function(data)
    serverData.commodity = data
end)

RegisterNetEvent('cuoi_trucker:client:syncWarehouseServerData')
AddEventHandler('cuoi_trucker:client:syncWarehouseServerData', function(data)
    serverData.warehouse = data
end)

RegisterNetEvent('cuoi_trucker:client:spawnVehicle')
AddEventHandler('cuoi_trucker:client:spawnVehicle', function(model)
    ESX.Game.SpawnVehicle(model, vector3(Config.VehicleSpawn.x, Config.VehicleSpawn.y, Config.VehicleSpawn.z), Config.VehicleSpawn.w, function(vehicle) 
		local playerPed = PlayerPedId()
        local plate = getVehiclePlate(vehicle)
        DoScreenFadeOut(1000)
        Wait(1000)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        vehicles[plate] = {
            entity = vehicle,
            model = model,
            cargos = {},
        }
        Wait(1000)
        DoScreenFadeIn(1000)
    end)
end)

RegisterNetEvent('cuoi_trucker:client:cargoPush')
AddEventHandler('cuoi_trucker:client:cargoPush', function()
    local vehicle, distance = ESX.Game.GetClosestVehicle()
    if not vehicle or distance >= 5 then return end

    local plate, vehicleExist = checkVehicleExists(vehicle)
    if not vehicleExist then return end

    local slot = #vehicleExist.cargos + 1
    local maxSlot = #Config.CargoSlots[vehicleExist.model]
    if checkCargoFull(slot, maxSlot) then
        print("Cargo is full")
        return
    end

    local currentCargo = animCargoPush()

    local posProp = Config.CargoSlots[vehicleExist.model][slot]
    ESX.Game.SpawnLocalObject(currentCargo.model, vector3(posProp.x, posProp.y, posProp.z), function(entity)
        SetEntityAsMissionEntity(entity, true, true)
        AttachEntityToEntity(entity, vehicle, 0, posProp.x, posProp.y, posProp.z, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        vehicles[plate].cargos[slot] = {
            entity = entity,
            model = currentCargo.model,
            type = currentCargo.type,
        }
    end)
end)

RegisterNetEvent('cuoi_trucker:client:cargoPop')
AddEventHandler('cuoi_trucker:client:cargoPop', function()
    local vehicle, distance = ESX.Game.GetClosestVehicle()
    if not vehicle or distance >= 5 then return end
    
    local plate, vehicleExist = checkVehicleExists(vehicle)
    if not vehicleExist then return end

    local slot = #vehicleExist.cargos
    if checkCargoEmpty(slot) then
        print("Cargo is empty")
        return
    end

    local currentCargo = vehicles[plate].cargos[slot]
    ESX.Game.DeleteObject(vehicles[plate].cargos[slot].entity)
    vehicles[plate].cargos[slot] = nil

    animCargoTake(currentCargo.type)
end)

----------------------------------
--- Threads:
----------------------------------

-- Targets:
CreateThread(function()
    exports.ox_target:addModel(Config.Vehicles[1], {
        name = 'cuoi_trucker:cargoPush',
        icon = 'fas fa-box',
        distance = 2,
        offset = vec3(0.5, 0, 0.5),
        label = 'Chất hàng',
        canInteract = function(entity)
            return checkVehicleCanPushCargo(entity)
        end,
        onSelect = function()
            TriggerEvent('cuoi_trucker:client:cargoPush')
        end
    })

    exports.ox_target:addModel(Config.Vehicles[1], {
        name = 'cuoi_trucker:cargoPop',
        icon = 'fas fa-box',
        distance = 2,
        offset = vec3(0.5, 0, 0.5),
        label = 'Rỡ hàng',
        canInteract = function(entity)
            return checkVehicleCanPopCargo(entity)
        end,
        onSelect = function()
            TriggerEvent('cuoi_trucker:client:cargoPop')
        end
    })
end)

-- Display markers:
local nearMarker = false
local listenPress = false
local HasAlreadyEnteredMarker = false

local function handleListenPress(warehouseType, warehouseCode)
    if listenPress then return end
    listenPress = true
    Wait(500)

    local dataWareHouse = getWareHouseDataByCode(warehouseCode)
    if dataWareHouse then
        local actionMessage = cargoProp and 'trả hàng' or 'mua hàng'
        ESX.TextUI('Nhấn [E] để ' .. actionMessage .. ' ($' .. dataWareHouse[warehouseType][Config.CargoProps[1]].price .. ')')
        CreateThread(function()
            while listenPress do
                Wait(0)
                if not listenPress then ESX.HideUI() return end
                if IsControlJustReleased(0, 38) then
                    if cargoProp then
                        ESX.TriggerServerCallback("cuoi-trucker:warehouse-system:returnCargo", function(bool)
                            if bool then
                                animCargoPush()
                                return
                            end
                            print('is full')
                        end, warehouseCode, warehouseType)
                    else
                        ESX.TriggerServerCallback("cuoi-trucker:warehouse-system:buyCargo", function(bool)
                            if bool then
                                animCargoTake(warehouseType)
                                return
                            end
                            print('is empty')
                        end, warehouseCode, warehouseType)
                    end
                    ESX.HideUI()
                    return
                end
            end
        end)
    end
end

CreateThread(function()
	while true do
		local sleep = 1500
		local coords = GetEntityCoords(PlayerPedId())
        for i = 1, #Config.WareHouses.Pos, 1 do
            if(#(coords - Config.WareHouses.Pos[i].coords) < 10) then
                local amount = 0
                local dataWareHouse = getWareHouseDataByCode(Config.WareHouses.Pos[i].ware_house_code)
                if dataWareHouse then
                    amount = dataWareHouse[Config.WareHouses.Pos[i].type][Config.CargoProps[1]].amount
                end

                ESX.Game.Utils.DrawText3D({
                    x = Config.WareHouses.Pos[i].coords.x,
                    y = Config.WareHouses.Pos[i].coords.y,
                    z = Config.WareHouses.Pos[i].coords.z + 1.65,
                }, 'Còn lại: ' .. (amount == 0 and "~r~" or "~g~") .. amount, 1.2, 6)

                ESX.Game.Utils.DrawText3D({
                    x = Config.WareHouses.Pos[i].coords.x,
                    y = Config.WareHouses.Pos[i].coords.y,
                    z = Config.WareHouses.Pos[i].coords.z + 1.5,
                }, Config.WareHouses.Pos[i].label, 1.2, 6)
                
                DrawMarker(1, Config.WareHouses.Pos[i].coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.WareHouses.Size.x, Config.WareHouses.Size.y, Config.WareHouses.Size.z, Config.WareHouses.Color.r, Config.WareHouses.Color.g, Config.WareHouses.Color.b, 255, false, false, 2, true, false, false, false)
                sleep = 0
                break
            end
        end
		if sleep == 0 then nearMarker = true else nearMarker = false end
		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 1500
		if nearMarker then
			sleep = 0
			local coords = GetEntityCoords(PlayerPedId())
            local warehouseType = nil
            local warehouseCode = nil
			local isInMarker = false

            for i = 1, #Config.WareHouses.Pos, 1 do
                if #(coords - Config.WareHouses.Pos[i].coords) < Config.WareHouses.Size.x then
                    isInMarker = true
                    warehouseType = Config.WareHouses.Pos[i].type
                    warehouseCode = Config.WareHouses.Pos[i].ware_house_code
                    break
                end
            end

            if isInMarker then
                handleListenPress(warehouseType, warehouseCode)
            else
                listenPress = false
            end
		end
		Wait(sleep)
	end
end)

----------------------------------
--- Commands:
----------------------------------
if Config.Debug then
    RegisterCommand("trucker_vehicle", function(source, args)
        TriggerEvent('cuoi_trucker:client:spawnVehicle')
    end)
    
    RegisterCommand("cargo_push", function(source, args)
        TriggerEvent('cuoi_trucker:client:cargoPush')
    end)
    
    RegisterCommand("cargo_pop", function(source, args)
        TriggerEvent('cuoi_trucker:client:cargoPop')
    end)

    RegisterCommand("take_cargo", function(source, args)
        animCargoTake()
    end)

    RegisterCommand("push_cargo", function(source, args)
        animCargoPush()
    end)
end