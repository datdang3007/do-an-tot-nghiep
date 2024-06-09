----------------------------------
--- Events:
----------------------------------
RegisterServerEvent('cuoi-trucker:server:refundVehicle')
AddEventHandler('cuoi-trucker:server:refundVehicle', function(price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end
    xPlayer.addMoney(price, "Trucker refund vehicle")
end)

----------------------------------
--- Callbacks:
----------------------------------
ESX.RegisterServerCallback('cuoi-trucker:server:rentVehicle', function(source, cb, price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price, "Trucker rent vehicle")
        cb(true)
    end
    cb(false)
end)
