local LifeinvaderCEO = {}

function LifeinvaderCEO.SpawnDefaultVehicle(vehicleType)
    if vehicleType == 'car' then
        ESX.Game.SpawnLocalVehicle(Config.LifeinvaderCEO.DefaultVehicle.Car.model, Config.LifeinvaderCEO.DefaultVehicle.Car.pos, Config.LifeinvaderCEO.DefaultVehicle.Car.heading, function(vehicle) end)
    elseif vehicleType == 'moto' then
        ESX.Game.SpawnLocalVehicle(Config.LifeinvaderCEO.DefaultVehicle.Moto.model, Config.LifeinvaderCEO.DefaultVehicle.Moto.pos, Config.LifeinvaderCEO.DefaultVehicle.Moto.heading, function(vehicle) end)
    end
end

CreateThread(function()
    LifeinvaderCEO.Ped = exports['rep-talkNPC']:CreateNPC({
        npc = 'csb_avon',
        coords = vector4(-1083.59, -248.97, 42.5, 296.97),
        name = 'Lifeinvader CEO',
        animScenario = 'PROP_HUMAN_SEAT_CHAIR',
        position = "Life Invader CEO",
        color = "#00736F",
        startMSG = 'Chào bạn, tôi là CEO của Lifeinvader. Có vấn đề gì bạn cần hỏi, tôi sẵn sàng giúp đỡ!'
    }, {
        [1] = {
            label = "Ông có thể giúp Tôi tìm một công việc được không?",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Được chứ, đây là danh sách các công việc Cậu có thể chọn", {})
                Wait(2500)
                TriggerEvent('rep-talkNPC:client:close')
                Wait(300)
                TriggerEvent('cuoi-ui:nui:toggle', true, 'menu job', true)
            end
        },
        [2] = {
            label = "Tôi không muốn làm công việc hiện tại nữa. Nhờ Ông nói với bên đó giúp Tôi",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Oh! Cậu không thích làm bên đó nữa hả?. Không sao, để Tôi lo", {})
                Wait(2500)
                TriggerEvent('rep-talkNPC:client:close')
            end
        },
        [3] = {
            label = "Nhờ Ông chuẩn bị phương tiện giúp Tôi, Tôi sẽ trả tiền phí",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog(
                    "Bạn muốn phương tiện nào?\n1. Xe máy: 150$\n2. Ô tô: 350$",
                    {
                        [1] = {
                            label = "1. Xe máy",
                            shouldClose = false,
                            action = function()
                                LifeinvaderCEO.SpawnDefaultVehicle('moto')
                                exports['rep-talkNPC']:changeDialog("Tôi đã chuẩn bị xe ở garage, bảo trọng nhé!", {})
                                Wait(2500)
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        },
                        [2] = {
                            label = "2. Ô tô",
                            shouldClose = false,
                            action = function()
                                LifeinvaderCEO.SpawnDefaultVehicle('car')
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
            label = "Chào Ông, Tôi ghé để hỏi thăm sức khỏe thôi, giờ Tôi phải đi rồi",
            shouldClose = true,
            action = function()
                exports['rep-talkNPC']:changeDialog("à, Tôi vẫn khỏe. Cảm ơn Cậu, chúc Cậu thượng lộ bình an!", {})
                Wait(2500)
                TriggerEvent('rep-talkNPC:client:close')
            end
        }
    })
end)