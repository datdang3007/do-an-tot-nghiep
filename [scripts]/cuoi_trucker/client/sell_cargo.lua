local isShopOpen = false
local needResetShop = true

----------------------------------
--- Functions:
----------------------------------
local function getShopDataByCode(code)
    if serverData.commodity == nil then return nil end
    for _, shop in pairs(serverData.commodity) do
        if shop.code == code then return shop end
    end
    return nil
end

local function checkTimeOpen(hour)
    local isOpen = false
    for k,v in pairs(Config.Shops.OpenTime) do
        if hour >= v.from and hour < v.to then
            isOpen = true
        end
    end
    return isOpen
end

----------------------------------
--- Threads:
----------------------------------
local nearMarker = false
local listenPress = false
local HasAlreadyEnteredMarker = false

local function handleListenPress(shopCode, maximumCargo)
    if listenPress then return end
    listenPress = true
    Wait(500)

    local dataShop = getShopDataByCode(shopCode)
    if dataShop then
        ESX.TextUI('Nhấn [E] để giao hàng, giá của món hàng $' .. dataShop.purchase[cargoProp.model])
        CreateThread(function()
            while listenPress do
                Wait(0)
                if not listenPress then ESX.HideUI() return end
                if IsControlJustReleased(0, 38) then
                    if cargoProp then
                        ESX.TriggerServerCallback("cuoi-trucker:commodity-system:sellCargo", function(bool)
                            if bool then
                                animCargoPush()
                                return
                            end
                            print('is full')
                        end, shopCode, maximumCargo)
                    end
                    ESX.HideUI()
                    return
                end
            end
        end)
    end
end

CreateThread(function()
	while true do
		local sleep = 1500
		local coords = GetEntityCoords(PlayerPedId())
        for i = 1, #Config.Shops.List, 1 do
            if(#(coords - Config.Shops.List[i].pos) < 10) then
                local amount = 0
                local dataShop = getShopDataByCode(Config.Shops.List[i].code)
                if dataShop then amount = dataShop.amount end

                local content = 'Lượng hàng: ' .. amount .. "/~g~" .. Config.Shops.List[i].maximum_cargo
                if not isShopOpen then
                    content = "~r~Tạm dừng nhận hàng"
                end

                ESX.Game.Utils.DrawText3D({
                    x = Config.Shops.List[i].pos.x,
                    y = Config.Shops.List[i].pos.y,
                    z = Config.Shops.List[i].pos.z + 1.65,
                }, '~y~' ..Config.Shops.List[i].name, 1.0, 6)

                ESX.Game.Utils.DrawText3D({
                    x = Config.Shops.List[i].pos.x,
                    y = Config.Shops.List[i].pos.y,
                    z = Config.Shops.List[i].pos.z + 1.5,
                }, content, 0.85, 6)
                
                DrawMarker(1, Config.Shops.List[i].pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Shops.Size.x, Config.Shops.Size.y, Config.Shops.Size.z, Config.Shops.Color.r, Config.Shops.Color.g, Config.Shops.Color.b, 255, false, false, 2, true, false, false, false)
                sleep = 0
                break
            end
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
            local shopCode = nil
            local shopType = nil
            local maximumCargo = 0
			local isInMarker = false

            for i = 1, #Config.Shops.List, 1 do
                if #(coords - Config.Shops.List[i].pos) < Config.Shops.Size.x then
                    isInMarker = true
                    shopCode = Config.Shops.List[i].code
                    shopType = Config.Shops.List[i].type
                    maximumCargo = Config.Shops.List[i].maximum_cargo
                    break
                end
            end

            if isInMarker and isShopOpen and cargoProp and shopType == cargoProp.type then
                handleListenPress(shopCode, maximumCargo)
            else
                listenPress = false
            end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local sleep = 1000
        local hour = GetClockHours()
        local isOpen = checkTimeOpen(hour)

        if hour == 5 and needResetShop then
            needResetShop = false
            TriggerServerEvent("cuoi-trucker:commodity-system:resetShops")
        end

        if hour > 5 and not needResetShop then
            needResetShop = true
        end

        if isOpen then
            if not isShopOpen then
                isShopOpen = true
            end
        else
            if isShopOpen then
                isShopOpen = false
            end
        end
        Wait(sleep)
	end
end)
