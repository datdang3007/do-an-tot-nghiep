local open = false

RegisterNUICallback('maze-callback', function(data, cb)
	SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
    Callbackk(data.success)
    open = false
    cb('ok')
end)

local function StartMiniGame(callback, auto)
    if not open then
        Callbackk = callback
        open = true
        SendNUIMessage({
            action = "maze-start",
            auto = auto
        })
        SetNuiFocus(true, true)
        TriggerScreenblurFadeIn(0)
    end
end

exports("StartMiniGame", StartMiniGame)