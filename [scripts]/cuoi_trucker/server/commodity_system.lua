local CommoditySystem = {}
CommoditySystem.data = {}
CommoditySystem.action = false
CommoditySystem.DefaultData = {
    -- Stores:
    {
        id = 1,
        code = 'store_01',
        type = 'store',
        amount = 0,
        distance = "3,8",
        name = "Kho tạp hóa Ineseno Road",
        position = "Ngoại ô thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 2,
        code = 'store_02',
        type = 'store',
        amount = 0,
        distance = "6,7",
        name = "Kho tạp hóa Grapeseed Main St",
        position = "Vùng quê",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 3,
        code = 'store_03',
        type = 'store',
        amount = 0,
        distance = "4,6",
        name = "Kho tạp hóa Route 68",
        position = "Vùng quê",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 4,
        code = 'store_04',
        type = 'store',
        amount = 0,
        distance = "2,6",
        name = "Kho tạp hóa Clinton Ave",
        position = "Ngoại ô thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 5,
        code = 'store_05',
        type = 'store',
        amount = 0,
        distance = "4,1",
        name = "Kho tạp hóa Polomino Fwy",
        position = "Ngoại ô thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },

    -- Clothes:
    {
        id = 6,
        code = 'clothes_01',
        type = 'clothes',
        amount = 0,
        distance = "1,8",
        name = "Kho quần áo Polomini Ave",
        position = "Thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 7,
        code = 'clothes_02',
        type = 'clothes',
        amount = 0,
        distance = "4,1",
        name = "Kho quần áo Great Ocean Hwy",
        position = "Ngoại ô thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 8,
        code = 'clothes_03',
        type = 'clothes',
        amount = 0,
        distance = "4,8",
        name = "Kho quần áo Route 68",
        position = "Vùng quê",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },
    {
        id = 9,
        code = 'clothes_04',
        type = 'clothes',
        amount = 0,
        distance = "8,0",
        name = "Kho quần áo Paleto Blvd",
        position = "Vùng quê",
        purchase = {
            ['prop_cs_rub_box_02']      = 100,
            ['prop_cardbordbox_04a']    = 200,
            ['prop_box_wood05a']        = 300,
            ['prop_box_wood04a']        = 400,
            ['prop_box_wood08a']        = 500,
            -- ['v_ind_cf_boxes']          = 600,
            -- ['prop_boxpile_07d']        = 750,
        },
    },

    -- Machines:
    {
        id = 10,
        code = 'machine_01',
        type = 'machine',
        amount = 0,
        distance = "1,3",
        name = "Kho dụng cụ Davis Ave",
        position = "Thành phố",
        purchase = {
            ['prop_cs_rub_box_02']      = 75,
            ['prop_cardbordbox_04a']    = 100,
            ['prop_box_wood05a']        = 150,
            ['prop_box_wood04a']        = 200,
            ['prop_box_wood08a']        = 250,
            -- ['v_ind_cf_boxes']          = 350,
            -- ['prop_boxpile_07d']        = 450,
        },
    },
    {
        id = 11,
        code = 'machine_02',
        type = 'machine',
        amount = 0,
        distance = "4,9",
        name = "Kho dụng cụ Senora Fwy",
        position = "Vùng quê",
        purchase = {
            ['prop_cs_rub_box_02']      = 75,
            ['prop_cardbordbox_04a']    = 100,
            ['prop_box_wood05a']        = 150,
            ['prop_box_wood04a']        = 200,
            ['prop_box_wood08a']        = 250,
            -- ['v_ind_cf_boxes']          = 350,
            -- ['prop_boxpile_07d']        = 450,
        },
    },
}

----------------------------------
--- Functions:
----------------------------------
function randomAmount(amount)
    local maxAmount = math.floor(amount)
    local soldAmount = math.random(0, maxAmount)
    return amount - soldAmount
end

function CommoditySystem.UpdateFileData()
    TriggerClientEvent('cuoi_trucker:client:syncCommodityServerData', -1, CommoditySystem.data)
    SaveResourceFile(GetCurrentResourceName(), "data/commodity_system.json", json.encode(CommoditySystem.data), -1)
end

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

function CommoditySystem.ActionSellCargo(xPlayer, prop, shopCode, maximumCargo)
    for k, v in pairs(CommoditySystem.data) do
        if v.code == shopCode then
            local newAmount = v.amount + 1;
            if newAmount == maximumCargo then return false end
            xPlayer.addMoney(v.purchase[prop], 'Trucker sell cargo')
            CommoditySystem.data[k].amount = newAmount
            CommoditySystem.UpdateFileData()
            return true
        end
    end
    return false
end

----------------------------------
--- Events:
----------------------------------
RegisterServerEvent('cuoi-trucker:commodity-system:resetShops')
AddEventHandler('cuoi-trucker:commodity-system:resetShops', function()
    local currentData = CommoditySystem.GetCurrentData()
    if currentData ~= nil then
        for k,v in pairs(currentData) do
            local purchaseConfig = Config.Purchases[v.type]
            -- Reset amount:
            currentData[k].amount = randomAmount(currentData[k].amount)

            -- Reset price:
            for prop, price in pairs(v.purchase) do
                local minPrice = purchaseConfig[prop].min_price
                local maxPrice = purchaseConfig[prop].max_price
                currentData[k].purchase[prop] = math.random(minPrice, maxPrice)
            end
        end
        CommoditySystem.data = currentData
        CommoditySystem.UpdateFileData()
    end
end)

----------------------------------
--- Callbacks:
----------------------------------
ESX.RegisterServerCallback('cuoi-trucker:commodity-system:getMarkets', function(source, cb)
    cb(CommoditySystem.GetCurrentData())
end)

ESX.RegisterServerCallback('cuoi-trucker:commodity-system:sellCargo', function(source, cb, prop, shopCode, maximumCargo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then end

    cb(CommoditySystem.ActionSellCargo(xPlayer, prop, shopCode, maximumCargo))
end)

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
    RegisterCommand("trucker_reset_shop", function(source, args)
        TriggerEvent('cuoi-trucker:commodity-system:resetShops')
    end)
end