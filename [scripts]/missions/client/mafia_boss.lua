local MafiaBoss = {}

function MafiaBoss.SpawnDefaultVehicle(vehicleType)
    if vehicleType == 'car' then
        ESX.Game.SpawnLocalVehicle(Config.MafiaBoss.DefaultVehicle.Car.model, Config.MafiaBoss.DefaultVehicle.Car.pos, Config.MafiaBoss.DefaultVehicle.Car.heading, function(vehicle) end)
    elseif vehicleType == 'moto' then
        ESX.Game.SpawnLocalVehicle(Config.MafiaBoss.DefaultVehicle.Moto.model, Config.MafiaBoss.DefaultVehicle.Moto.pos, Config.MafiaBoss.DefaultVehicle.Moto.heading, function(vehicle) end)
    end
end

CreateThread(function()
    MafiaBoss.Ped = exports['rep-talkNPC']:CreateNPC({
        npc = 'csb_sol',
        coords = vector4(518.67, -2756.84, 5.12, 216.55),
        name = 'Mafia Boss',
        animScenario = 'PROP_HUMAN_SEAT_CHAIR',
        position = "Mafia Boss",
        color = "#00736F",
        startMSG = 'Người Anh Em, có chuyện gì cần Tôi giúp đỡ à?'
    }, {
        [1] = {
            label = "Tôi cần một nhiệm vụ mới, hãy giao cho Tôi?",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Đây là danh sách các nhiệm vụ Cậu có thể nhận", {})
                Wait(2500)
                TriggerEvent('rep-talkNPC:client:close')
                Wait(300)
                TriggerEvent('cuoi-ui:nui:toggle', false, 'mafia missions', true)
            end
        },
        [2] = {
            label = "Tôi muốn hủy nhiệm vụ hiện tại, hãy giúp Tôi!",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Uhm! Tôi sẽ cho người khác làm!", {})
                Wait(2500)
                TriggerEvent('rep-talkNPC:client:close')
            end
        },
        [3] = {
            label = "Tôi đang cần phương tiện, có thể cung cấp cho Tôi chứ?",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog(
                    "Bạn muốn phương tiện nào?\n1. Xe máy\n2. Ô tô",
                    {
                        [1] = {
                            label = "1. Xe máy",
                            shouldClose = false,
                            action = function()
                                MafiaBoss.SpawnDefaultVehicle('moto')
                                exports['rep-talkNPC']:changeDialog("Tôi đã chuẩn bị xe ở garage, bảo trọng nhé!", {})
                                Wait(2500)
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        },
                        [2] = {
                            label = "2. Ô tô",
                            shouldClose = false,
                            action = function()
                                MafiaBoss.SpawnDefaultVehicle('car')
                                exports['rep-talkNPC']:changeDialog("Tôi đã chuẩn bị xe ở garage, bảo trọng nhé!", {})
                                Wait(2500)
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        },
                        [3] = {
                            label = "Tôi nghĩ lại rồi, chắc Tôi không cần dùng xe nữa!",
                            shouldClose = true,
                            action = function()
                            end
                        }
                    }
                )
            end
        },
        [4] = {
            label = "Tôi chỉ ghé qua thôi!",
            shouldClose = true,
            action = function()
            end
        }
    })
end)
