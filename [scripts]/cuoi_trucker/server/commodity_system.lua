local CommoditySystem = {}
CommoditySystem.data = {}
CommoditySystem.action = false
CommoditySystem.DefaultData = {
    -- Stores:
    {
        code = 'store_01',
        type = 'store',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'store_02',
        type = 'store',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'store_03',
        type = 'store',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'store_04',
        type = 'store',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'store_05',
        type = 'store',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },

    -- Clothes:
    {
        code = 'clothes_01',
        type = 'clothes',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'clothes_02',
        type = 'clothes',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'clothes_03',
        type = 'clothes',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },
    {
        code = 'clothes_04',
        type = 'clothes',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            ['v_ind_cf_boxes']          = 600,
            ['prop_boxpile_07d']        = 750,
        },
    },

    -- Machines:
    {
        code = 'machine_01',
        type = 'machine',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 75,
            ['prop_cardbordbox_04a']    = 100,
            ['prop_box_wood05a']        = 150,
            ['prop_box_wood04a']        = 200,
            ['prop_box_wood08a']        = 250,
            ['v_ind_cf_boxes']          = 350,
            ['prop_boxpile_07d']        = 450,
        },
    },
    {
        code = 'machine_02',
        type = 'machine',
        amount = 0,
        purchase = {
            ['prop_cs_rub_box_02']      = 75,
            ['prop_cardbordbox_04a']    = 100,
            ['prop_box_wood05a']        = 150,
            ['prop_box_wood04a']        = 200,
            ['prop_box_wood08a']        = 250,
            ['v_ind_cf_boxes']          = 350,
            ['prop_boxpile_07d']        = 450,
        },
    },
}

----------------------------------
--- Functions:
----------------------------------
function CommoditySystem.GetCurrentData()
	local currentData = LoadResourceFile(GetCurrentResourceName(), 'data/commodity_system.json')
	return currentData and json.decode(currentData)
end

function CommoditySystem.Init()
    local currentData = CommoditySystem.GetCurrentData()
    if currentData ~= nil then
        CommoditySystem.data = currentData
    else
        CommoditySystem.data = CommoditySystem.DefaultData
    end
    CommoditySystem.action = true
end

----------------------------------
--- Events:
----------------------------------
RegisterServerEvent('cuoi-trucker:commodity-system:pushCargo')
AddEventHandler('cuoi-trucker:commodity-system:pushCargo', function(dataCargo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or not dataCargo then end

    -- Define params:
    local storeIdx = dataCargo.storeIdx
    local purchaseObj = Config.Purchases[dataCargo.type][dataCargo.prop]

    -- Check same type:
    if dataCargo.type ~= Config.Shops.List[storeIdx].type then
        print('not same type')
        return
    end

    -- Check store full:
    local storeAmount = CommoditySystem.data[storeIdx].amount
    local newStoreAmount = storeAmount + purchaseObj.amount
    if newStoreAmount > Config.Shops.List[storeIdx].maximum_product then
        print('store is full')
        return
    end

    -- Give money for player:
    print('xPlayer', xPlayer)
    -- xPlayer.addMoney(CommoditySystem.data[storeIdx].purchase[dataCargo.prop])
    
    -- Update file:
    CommoditySystem.data[storeIdx].amount = newStoreAmount
    TriggerClientEvent('cuoi-trucker:commodity-system:pushCargo', -1, CommoditySystem.data)
    SaveResourceFile(GetCurrentResourceName(), "data/commodity_system.json", json.encode(CommoditySystem.data), -1)
end)

----------------------------------
--- Callbacks:
----------------------------------
-- ESX.RegisterServerCallback('cuoi-trucker:commodity-system:getData', function(source, cb, code)
--     for k, v in pairs(CommoditySystem.data) do
--         if v.code == code then cb(v) end
--     end
--     cb(nil)
-- end)

----------------------------------
--- Threads:
----------------------------------
Citizen.CreateThread(function()
    CommoditySystem.Init()
	Wait(2500)
	while true do
        local sleep = 5000
        if CommoditySystem.action then
            sleep = Config.ReloadCommodity * 60 * 1000
            local loadFile = LoadResourceFile(GetCurrentResourceName(), "data/commodity_system.json")
            TriggerClientEvent('cuoi_trucker:client:syncCommodityServerData', -1, CommoditySystem.data)
            SaveResourceFile(GetCurrentResourceName(), "data/commodity_system.json", json.encode(CommoditySystem.data), -1)
        end
        Wait(sleep)
	end
end)

----------------------------------
--- Commands:
----------------------------------
if Config.Debug then
    RegisterCommand("sv_push_cargo", function(source, args)
        local dataTest = {
            storeIdx = 1,
            type = 'store',
            prop = 'prop_cs_rub_box_02',
        }
        TriggerEvent('cuoi-trucker:commodity-system:pushCargo', dataTest)
    end)
end