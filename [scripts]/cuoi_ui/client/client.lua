function toggleNui(shouldShow, canClose, pageCode, isBlur)
  SetNuiFocus(shouldShow, shouldShow)

  SendReactMessage('canClose', canClose)
  SendReactMessage('pageCode', pageCode)
  SendReactMessage('setVisible', shouldShow)

  if isBlur and shouldShow then TriggerScreenblurFadeIn(0) end
  if not shouldShow then TriggerScreenblurFadeOut(0) end
end

RegisterNetEvent('cuoi-ui:nui:toggle', function(canClose, path, blur)
  toggleNui(true, canClose, path, blur)
end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNui(false, false, nil)
  cb({})
end)
