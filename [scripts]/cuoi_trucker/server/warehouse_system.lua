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
function randomProp(wareHouseCode, supplierType, data)
    local newData = data
    local supplierConfig = Config.Suppliers[wareHouseCode][supplierType]
    for prop, value in pairs(data) do
        -- Reset price:
        local minPrice = supplierConfig[prop].min_price
        local maxPrice = supplierConfig[prop].max_price
        newData[prop].price = math.random(minPrice, maxPrice)
        
        -- Reset amount:
        local maxAmount = supplierConfig[prop].max_amount
        local minProductivity = supplierConfig[prop].min_productivity
        local maxProductivity = supplierConfig[prop].max_productivity
        local currentAmount = value.amount
        local newAmount = currentAmount + math.random(minProductivity, maxProductivity)
        if newAmount > maxAmount then
            newAmount = maxAmount
        end
        newData[prop].amount = newAmount
    end
    return newData
end

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

function WarehouseSystem.ActionBuyCargo(xPlayer, prop, wareHouseCode, wareHouseType)
    for k, v in pairs(WarehouseSystem.data) do
        if v.code == wareHouseCode then
            -- Check amount:
            local newAmount = v[wareHouseType][prop].amount - 1;
            if newAmount == 0 then return false end

            -- Check money:
            local totalMoney = xPlayer.getMoney()
            if totalMoney < v[wareHouseType][prop].price then
                return false
            end
            xPlayer.removeMoney(v[wareHouseType][prop].price, 'Trucker buy cargo')
            WarehouseSystem.data[k][wareHouseType][prop].amount = newAmount
            WarehouseSystem.UpdateFileData()
            return true
        end
    end
    return false
end

function WarehouseSystem.ActionReturnCargo(xPlayer, prop, wareHouseCode, wareHouseType)
    for k, v in pairs(WarehouseSystem.data) do
        if v.code == wareHouseCode then
            local newAmount = v[wareHouseType][prop].amount + 1;
            if newAmount == MaximumCargo then return false end
            xPlayer.addMoney(v[wareHouseType][prop].price, 'Trucker return cargo')
            WarehouseSystem.data[k][wareHouseType][prop].amount = newAmount
            WarehouseSystem.UpdateFileData()
            return true
        end
    end
    return false
end

----------------------------------
--- Events:
----------------------------------
RegisterServerEvent('cuoi-trucker:warehouse-system:resetWarehouse')
AddEventHandler('cuoi-trucker:warehouse-system:resetWarehouse', function()
    local currentData = WarehouseSystem.GetCurrentData()
    if currentData ~= nil then
        for k,v in pairs(currentData) do
            currentData[k].store = randomProp(v.code, 'store', currentData[k].store)
            currentData[k].clothes = randomProp(v.code, 'clothes', currentData[k].clothes)
            currentData[k].machine = randomProp(v.code, 'machine', currentData[k].machine)
        end
        WarehouseSystem.data = currentData
        WarehouseSystem.UpdateFileData()
    end
end)

----------------------------------
--- Callbacks:
----------------------------------
ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:getWareHouses', function(source, cb)
    cb(WarehouseSystem.GetCurrentData())
end)

ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:buyCargo', function(source, cb, prop, wareHouseCode, wareHouseType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end

    local isBuyed = WarehouseSystem.ActionBuyCargo(xPlayer, prop, wareHouseCode, wareHouseType)
    cb(isBuyed, prop)
end)

ESX.RegisterServerCallback('cuoi-trucker:warehouse-system:returnCargo', function(source, cb, prop, wareHouseCode, wareHouseType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end

    cb(WarehouseSystem.ActionReturnCargo(xPlayer, prop, wareHouseCode, wareHouseType))
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
            sleep = Config.ReloadWareHouse * 60 * 1000
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
    RegisterCommand("trucker_reset_warehouse", function(source, args)
        TriggerEvent('cuoi-trucker:warehouse-system:resetWarehouse')
    end)
end