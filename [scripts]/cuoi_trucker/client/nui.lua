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
    if data.price then
        messageSuccess = messageSuccess.. " với giá ~g~$" ..data.price
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

RegisterNUICallback('rentVehicle', function(data, cb)
    toggleNui(false, false, nil)
    ESX.ShowNotification(defineMessageRentSuccess(data), true, false, 3000)
    TriggerEvent('cuoi_trucker:client:spawnVehicle', data.model)
    cb({})
end)

RegisterNUICallback('getMarkets', function(data, cb)
    ESX.TriggerServerCallback('cuoi-trucker:commodity-system:getMarkets', function(markets)
        if not markets then cb({}) end
        cb(markets)
    end)
end)

RegisterNUICallback('setWayPointToMarket', function(data, cb)
    local targetMarket = nil
    for _, store in ipairs(Config.Shops.List) do
        print('store.code', store.code)
        print('data.code', data.code)
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
