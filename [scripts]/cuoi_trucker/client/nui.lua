function toggleNui(shouldShow, canClose, pageCode, isBlur)
    SetNuiFocus(shouldShow, shouldShow)
  
    SendReactMessage('canClose', canClose)
    SendReactMessage('pageCode', pageCode)
    SendReactMessage('setVisible', shouldShow)
  
    if isBlur and shouldShow then TriggerScreenblurFadeIn(0) end
    if not shouldShow then TriggerScreenblurFadeOut(0) end
end

function defineMessageRentSuccess(data)
    local messageSuccess = "Bạn đã thuê phương tiện"
    if data.name then
        messageSuccess = messageSuccess.. " ~g~" ..data.name
    end
    messageSuccess = messageSuccess.. " ~s~thành công"
    if data.rent then
        messageSuccess = messageSuccess.. " với giá ~g~$" ..data.rent
    end
    return messageSuccess
end

RegisterNetEvent('cuoi-trucker:nui:toggle', function(canClose, path, blur)
    toggleNui(true, canClose, path, blur)
end)

RegisterNUICallback('hideFrame', function(_, cb)
    toggleNui(false, false, nil)
    cb({})
end)

RegisterKeyMapping('trucker_tablet', 'open trucker tablet', 'keyboard', 'i')
RegisterCommand("trucker_tablet", function()
    local playerPed = PlayerPedId()
    local plate = getVehiclePlate(GetVehiclePedIsIn(playerPed))
    if IsPedInAnyVehicle(playerPed) and vehicles[plate]?.entity then
        TriggerEvent('cuoi-trucker:nui:toggle', true, 'trucker tablet', true)
    end
end)

-------------------------------------------
--- Vehicles Page
-------------------------------------------
RegisterNUICallback('rentVehicle', function(data, cb)
    toggleNui(false, false, nil)
    ESX.ShowNotification(defineMessageRentSuccess(data), true, false, 3000)
    TriggerEvent('cuoi_trucker:client:spawnVehicle', data.model)
    cb({})
end)

-------------------------------------------
--- Markets Page
-------------------------------------------
RegisterNUICallback('getMarkets', function(data, cb)
    ESX.TriggerServerCallback('cuoi-trucker:commodity-system:getMarkets', function(markets)
        if not markets then cb({}) end
        cb(markets)
    end)
end)

RegisterNUICallback('setWayPointToMarket', function(data, cb)
    local targetMarket = nil
    for _, store in ipairs(Config.Shops.List) do
        if store.code == data.code then
            targetMarket = store
            break
        end
    end

    if targetMarket then
        toggleNui(false, false, nil)
        SetNewWaypoint(targetMarket.pos.x, targetMarket.pos.y)
        ESX.ShowNotification("Đã định vị GPS tới ~g~" .. data.name, true, false, 3000)
        cb({})
    end
end)

-------------------------------------------
--- Suppliers Page
-------------------------------------------
RegisterNUICallback('getWareHouses', function(data, cb)
    ESX.TriggerServerCallback('cuoi-trucker:warehouse-system:getWareHouses', function(wareHouses)
        if not wareHouses then cb({}) end
        cb(wareHouses)
    end)
end)

RegisterNUICallback('setWayPointToSupplier', function(data, cb)
    local targetSupplier = nil
    for _, wareHouse in ipairs(Config.WareHouses.List) do
        if wareHouse.code == data.code then
            targetSupplier = wareHouse
            break
        end
    end

    if targetSupplier then
        toggleNui(false, false, nil)
        SetNewWaypoint(targetSupplier.pos.x, targetSupplier.pos.y)
        ESX.ShowNotification("Đã định vị GPS tới ~g~" .. data.name, true, false, 3000)
        cb({})
    end
end)
