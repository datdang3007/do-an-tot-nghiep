local nearMarker = false
local listenPress = false

local function handleListenPress(warehouseType, warehouseCode)
    if listenPress then return end
    listenPress = true
    Wait(500)

    ESX.TextUI('Nhấn [E] để trả phương tiện')
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