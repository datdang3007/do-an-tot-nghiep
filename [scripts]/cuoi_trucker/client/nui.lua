function toggleNui(shouldShow, canClose, pageCode, isBlur)
    SetNuiFocus(shouldShow, shouldShow)
  
    SendReactMessage('canClose', canClose)
    SendReactMessage('pageCode', pageCode)
    SendReactMessage('setVisible', shouldShow)
  
    if isBlur and shouldShow then TriggerScreenblurFadeIn(0) end
    if not shouldShow then TriggerScreenblurFadeOut(0) end
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
    TriggerEvent('cuoi_trucker:client:spawnVehicle', data.model)
    cb({})
end)
