local nearMarker = false
local listenPress = false

----------------------------------
--- Functions:
----------------------------------
local function defineRefundPrice(vehicle, price)
    local refundPrice = price * 0.8
    if IsVehicleDamaged(vehicle) then
        refundPrice = refundPrice - (price * 0.15)
    end
    return math.floor(refundPrice)
end

----------------------------------
--- Events:
----------------------------------
RegisterNetEvent('cuoi_trucker:client:spawnVehicle')
AddEventHandler('cuoi_trucker:client:spawnVehicle', function(model, rentPrice)
    ESX.Game.SpawnVehicle(model, vector3(Config.VehicleSpawn.x, Config.VehicleSpawn.y, Config.VehicleSpawn.z), Config.VehicleSpawn.w, function(vehicle) 
		local playerPed = PlayerPedId()
        local plate = getVehiclePlate(vehicle)
        DoScreenFadeOut(1000)
        Wait(1000)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        vehicles[plate] = {
            rentPrice = rentPrice,
            entity = vehicle,
            model = model,
            cargos = {},
        }
        Wait(1000)
        DoScreenFadeIn(1000)
    end)
end)

----------------------------------
--- Threads:
----------------------------------
local function handleListenPress(warehouseType, warehouseCode)
    if listenPress then return end
    listenPress = true
    Wait(500)

    local plate = getVehiclePlate(GetVehiclePedIsIn(PlayerPedId()))
    local vehicleInfo = vehicles[plate]
    local refundPrice = defineRefundPrice(vehicleInfo.entity, vehicleInfo.rentPrice)
    ESX.TextUI('Nhấn [E] để trả phương tiện (Hoàn trả: $' .. refundPrice .. ')')
    CreateThread(function()
        while listenPress do
            Wait(0)
            if not listenPress then ESX.HideUI() return end
            if IsControlJustReleased(0, 38) then
                local playerPed = PlayerPedId()
                local plate = getVehiclePlate(GetVehiclePedIsIn(playerPed))
                ESX.HideUI()
                DoScreenFadeOut(1000)
                Wait(1000)
                TriggerServerEvent('cuoi-trucker:server:refundVehicle', refundPrice)
                ESX.Game.DeleteVehicle(vehicles[plate].entity)
                Wait(1000)
                DoScreenFadeIn(1000)
                return
            end
        end
    end)
end

CreateThread(function()
	while true do
		local sleep = 1500
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local plate = getVehiclePlate(GetVehiclePedIsIn(playerPed))
        if(#(coords - Config.ReturnVehicle.Coords) < Config.ReturnVehicle.Distance) and IsPedInAnyVehicle(playerPed) and vehicles[plate]?.entity then
            DrawMarker(1, Config.ReturnVehicle.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ReturnVehicle.Size.x, Config.ReturnVehicle.Size.y, Config.ReturnVehicle.Size.z, Config.ReturnVehicle.Color.r, Config.ReturnVehicle.Color.g, Config.ReturnVehicle.Color.b, 255, false, false, 2, true, false, false, false)
            sleep = 0
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
			local isInMarker = false

            if #(coords - Config.ReturnVehicle.Coords) < Config.ReturnVehicle.Size.x then
                isInMarker = true
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