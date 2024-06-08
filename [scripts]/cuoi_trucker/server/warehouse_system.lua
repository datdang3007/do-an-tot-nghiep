local WarehouseSystem = {}
WarehouseSystem.data = {}
WarehouseSystem.action = false
WarehouseSystem.defaultData = {
    {
        id = 1,
        name = "Nhà cung cấp Buccaneer Way",
        code = 'WareHouse_01',
        ['store'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 150},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 250},
            ['prop_box_wood05a']        = {amount = 20, price = 350},
            ['prop_box_wood04a']        = {amount = 20, price = 450},
            ['prop_box_wood08a']        = {amount = 20, price = 550},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 675},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 775},
        },
        ['clothes'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 150},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 250},
            ['prop_box_wood05a']        = {amount = 20, price = 350},
            ['prop_box_wood04a']        = {amount = 20, price = 450},
            ['prop_box_wood08a']        = {amount = 20, price = 550},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 675},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 775},
        },
        ['machine'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 65},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 90},
            ['prop_box_wood05a']        = {amount = 20, price = 140},
            ['prop_box_wood04a']        = {amount = 20, price = 180},
            ['prop_box_wood08a']        = {amount = 20, price = 250},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 300},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 375},
        }
    },
    {
        id = 2,
        name = "Nhà cung cấp El Rancho Blvd",
        code = 'WareHouse_02',
        ['store'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 150},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 250},
            ['prop_box_wood05a']        = {amount = 20, price = 350},
            ['prop_box_wood04a']        = {amount = 20, price = 450},
            ['prop_box_wood08a']        = {amount = 20, price = 550},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 675},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 775},
        },
        ['clothes'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 150},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 250},
            ['prop_box_wood05a']        = {amount = 20, price = 350},
            ['prop_box_wood04a']        = {amount = 20, price = 450},
            ['prop_box_wood08a']        = {amount = 20, price = 550},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 675},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 775},
        },
        ['machine'] = {
            ['prop_cs_rub_box_02']      = {amount = 20, price = 65},
            ['prop_cardbordbox_04a']    = {amount = 20, price = 90},
            ['prop_box_wood05a']        = {amount = 20, price = 140},
            ['prop_box_wood04a']        = {amount = 20, price = 180},
            ['prop_box_wood08a']        = {amount = 20, price = 250},
            -- ['v_ind_cf_boxes']          = {amount = 20, price = 300},
            -- ['prop_boxpile_07d']        = {amount = 20, price = 375},
        }
    }
}

----------------------------------
--- Functions:
----------------------------------
function WarehouseSystem.UpdateFileData()
    TriggerClientEvent('cuoi_trucker:client:syncWarehouseServerData', -1, WarehouseSystem.data)
    SaveResourceFile(GetCurrentResourceName(), "data/warehouse_system.json", json.encode(WarehouseSystem.data), -1)
end

function WarehouseSystem.GetCurrentData()
	local currentData = LoadResourceFile(GetCurrentResourceName(), 'data/warehouse_system.json')
	return currentData and json.decode(currentData)
end

function WarehouseSystem.Init()
    local currentData = WarehouseSystem.GetCurrentData()
    if currentData ~= nil then
        WarehouseSystem.data = currentData
    else
        WarehouseSystem.data = WarehouseSystem.defaultData
    end
    WarehouseSystem.action = true
end

function WarehouseSystem.ActionBuyCargo(wareHouseCode, wareHouseType)
    for k, v in pairs(WarehouseSystem.data) do
        if v.code == wareHouseCode then
            local newAmount = v[wareHouseType][Config.CargoProps[1]].amount - 1;
            if newAmount == 0 then return false end
            WarehouseSystem.data[k][wareHouseType][Config.CargoProps[1]].amount = newAmount
            WarehouseSystem.UpdateFileData()
            return true
        end
    end
    return false
end

function WarehouseSystem.ActionReturnCargo(wareHouseCode, wareHouseType)
    for k, v in pairs(WarehouseSystem.data) do
        if v.code == wareHouseCode then
            local newAmount = v[wareHouseType][Config.CargoProps[1]].amount + 1;
            if newAmount == MaximumCargo then return false end
            WarehouseSystem.data[k][wareHouseType][Config.CargoProps[1]].amount = newAmount
            WarehouseSystem.UpdateFileData()
            return true
        end
    end
    return false
end

----------------------------------
--- Events:
----------------------------------
-- RegisterServerEvent('cuoi-trucker:commodity-system:getCargo')
-- AddEventHandler('cuoi-trucker:commodity-system:getCargo', function(dataCargo)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if not xPlayer or not dataCargo then end

--     -- Define params:
--     local storeIdx = dataCargo.storeIdx
--     local purchaseObj = Config.Purchases[dataCargo.type][dataCargo.prop]

--     -- Check same type:
--     if dataCargo.type ~= Config.Shops.List[storeIdx].type then
--         print('not same type')
--         return
--     end

--     -- Check store full:
--     local storeAmount = WarehouseSystem.data[storeIdx].amount
--     local newStoreAmount = storeAmount + purchaseObj.amount
--     if newStoreAmount > Config.Shops.List[storeIdx].maximum_cargo then
--         print('store is full')
--         return
--     end

--     -- Give money for player:
--     print('xPlayer', xPlayer)
--     -- xPlayer.addMoney(WarehouseSystem.data[storeIdx].purchase[dataCargo.prop])
    
--     -- Update file:
--     WarehouseSystem.data[storeIdx].amount = newStoreAmount
--     TriggerClientEvent('cuoi-trucker:commodity-system:pushCargo', -1, WarehouseSystem.data)
--     SaveResourceFile(GetCurrentResourceName(), "data/warehouse_system.json", json.encode(WarehouseSystem.data), -1)
-- end)

----------------------------------
--- Callbacks:
----------------------------------
ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:getWareHouses', function(source, cb)
    cb(WarehouseSystem.GetCurrentData())
end)

ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:buyCargo', function(source, cb, wareHouseCode, wareHouseType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end

    cb(WarehouseSystem.ActionBuyCargo(wareHouseCode, wareHouseType))
end)

ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:returnCargo', function(source, cb, wareHouseCode, wareHouseType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end

    cb(WarehouseSystem.ActionReturnCargo(wareHouseCode, wareHouseType))
end)

----------------------------------
--- Threads:
----------------------------------
Citizen.CreateThread(function()
    WarehouseSystem.Init()
	Wait(2500)
	while true do
        local sleep = 5000
        if WarehouseSystem.action then
            sleep = Config.ReloadCommodity * 60 * 1000
            local loadFile = LoadResourceFile(GetCurrentResourceName(), "data/warehouse_system.json")
            WarehouseSystem.UpdateFileData()
        end
        Wait(sleep)
	end
end)

----------------------------------
--- Commands:
----------------------------------
if Config.Debug then
    -- RegisterCommand("sv_get_cargo", function(source, args)
    --     local dataTest = {
    --         storeIdx = 1,
    --         type = 'store',
    --         prop = 'prop_cs_rub_box_02',
    --     }
    --     TriggerEvent('cuoi-trucker:commodity-system:pushCargo', dataTest)
    -- end)
end