

function handleMission(mission)
    if not mission then return end

    local missionConfig = Config.Mission[mission]
    if missionConfig then
        local eventType = missionConfig.eventType
        if eventType == 'client' then
            TriggerEvent(missionConfig.event)
        elseif eventType == 'server' then
            TriggerServerEvent(missionConfig.event)
        end
    end
end

RegisterNUICallback('selectMission', function(data, cb)
    toggleNui(false, false, nil)
    print('data.mission', data.mission)
    handleMission(data.mission)
    cb({})
end)

RegisterCommand("select_mission", function()
    print('Config.Mission', Config.Mission['randol_heist'])
    print('event', Config.Mission['randol_heist'].event)
    print('eventType', Config.Mission['randol_heist'].eventType)
end)