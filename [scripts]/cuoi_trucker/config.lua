Config = {}

Config.Debug = true
Config.ReloadCommodity = 5 -- (minutes)
Config.ReloadWareHouse = 10 -- (minutes)

-------------------------
--- Blips:
-------------------------
Config.Blips = {
    Name = 'Vận chuyển: Nhà kho',
    Pos = vector3(156.96, -3204.17, 6.02),
    Sprite = 473,
    Display = 4,
    Scale = 0.65,
    Colour = 54,
}

Config.WareHouseBlips = {
    Sprite = 557,
    Display = 4,
    Scale = 0.65,
    Colour = 54,
}

Config.ShopBlips = {
    ['store'] = {
        Sprite = 478,
        Display = 4,
        Scale = 0.65,
        Colour = 25,
    },
    ['clothes'] = {
        Sprite = 478,
        Display = 4,
        Scale = 0.65,
        Colour = 47,
    },
    ['machine'] = {
        Sprite = 478,
        Display = 4,
        Scale = 0.65,
        Colour = 63,
    }
}

-------------------------
--- Laptop:
-------------------------
Config.Laptop = {
    minZ = 5.0,
    maxZ = 6.5,
    width = 3.0,
    height = 3.0,
    scale = {1.0, 1.0, 1.0},
    model = 1385417869,
    pos = vector3(153.18, -3211.72, 6.11),
}

-------------------------
--- Vehicles:
-------------------------
Config.Vehicles = {'rebel2', 'sandking2', 'guardian', 'mule4', 'pounder2', 'hauler2', 'phantom3'}
Config.VehicleSpawn = vector4(165.3, -3203.91, 5.9, 270.72)
Config.ReturnVehicle = {
    Distance = 25,
    Size = {x = 5.0, y = 5.0, z = 2.0},
    Color  = {r = 255, g = 0, b = 0},
    Coords = vector3(137.78, -3204.06, 4.44)
}

-------------------------
--- Cargo Props:
-------------------------
Config.CargoProps = {
    {
        name = 'Nhỏ',
        prop = 'prop_cs_rub_box_02',
    },
    {
        name = 'Rất nhỏ',
        prop = 'prop_cardbordbox_04a',
    },
    {
        name = 'Vừa',
        prop = 'prop_box_wood05a',
    },
    {
        name = 'Lớn',
        prop = 'prop_box_wood04a',
    },
    {
        name = 'Rất lớn',
        prop = 'prop_box_wood08a',
    }
    -- 'v_ind_cf_boxes',
    -- 'prop_boxpile_07d'
}

-------------------------
--- Cargo Slots:
-------------------------
Config.CargoSlots = {
    rebel2 = {
        {x = 0.0, y = -0.95, z = 0.6},
        {x = 0.0, y = -1.85, z = 0.6},
    }
}

-------------------------
--- WareHouses:
-------------------------
Config.WareHouses = {
    Distance = 10,
    MaximumCargo = 20,
    Size = {x = 1.5, y = 1.5, z = 1.0},
    Color  = {r = 50, g = 200, b = 50},
    List = {
        {
            code = "WareHouse_01",
            name = "Nhà cung cấp Buccaneer Way",
            pos = vector3(1190.53, -3326.32, 4.53),
        },
        {
            code = "WareHouse_02",
            name = "Nhà cung cấp El Rancho Blvd",
            pos = vector3(1213.34, -1256.54, 34.23),
        }
    },
    Pos = {
        {
            ware_house_code = 'WareHouse_01',
            type = 'store',
            min_price = 200,
            max_price = 400,
            label = 'Nhà cung cấp tạp hóa',
            coords = vector3(1190.53, -3326.32, 4.53)
        },
        {
            ware_house_code = 'WareHouse_01',
            type = 'clothes',
            min_price = 200,
            max_price = 400,
            label = 'Nhà cung cấp quần áo',
            coords = vector3(1205.44, -3326.46, 4.53)
        },
        {
            ware_house_code = 'WareHouse_01',
            type = 'machine',
            min_price = 50,
            max_price = 200,
            label = 'Nhà cung cấp dụng cụ',
            coords = vector3(1233.43, -3326.34, 4.53)
        },
        {
            ware_house_code = 'WareHouse_02',
            type = 'store',
            min_price = 200,
            max_price = 400,
            label = 'Nhà cung cấp tạp hóa',
            coords = vector3(1213.34, -1256.54, 34.23)
        },
        {
            ware_house_code = 'WareHouse_02',
            type = 'clothes',
            min_price = 200,
            max_price = 400,
            label = 'Nhà cung cấp quần áo',
            coords = vector3(1191.3, -1261.47, 34.16)
        },
        {
            ware_house_code = 'WareHouse_02',
            type = 'machine',
            min_price = 50,
            max_price = 200,
            label = 'Nhà cung cấp dụng cụ',
            coords = vector3(1130.09, -1304.15, 33.74)
        },
    },
}

-------------------------
--- Shops:
-------------------------
Config.Shops = {
    Distance = 10,
    OpenTime = {
        { from = 11, to = 14 },
        { from = 20, to = 24 },
        { from = 0, to = 2 },
    },
    Size = {x = 1.5, y = 1.5, z = 1.0},
    Color  = {r = 50, g = 50, b = 200},
    List = {
        -- Stores:
        {
            code = 'store_01',
            type = 'store',
            name = 'Kho tạp hóa Ineseno Road',
            maximum_cargo = 10,
            pos = vector3(-3047.72, 590.36, 6.76),
        },
        {
            code = 'store_02',
            type = 'store',
            name = 'Kho tạp hóa Grapeseed Main St',
            maximum_cargo = 10,
            pos = vector3(1702.53, 4916.64, 41.08),
        },
        {
            code = 'store_03',
            type = 'store',
            name = 'Kho tạp hóa Route 68',
            maximum_cargo = 10,
            pos = vector3(541.74, 2663.77, 41.17),
        },
        {
            code = 'store_04',
            type = 'store',
            name = 'Kho tạp hóa Clinton Ave',
            maximum_cargo = 20,
            pos = vector3(371.22, 337.51, 102.33),
        },
        {
            code = 'store_05',
            type = 'store',
            name = 'Kho tạp hóa Polomino Fwy',
            maximum_cargo = 20,
            pos = vector3(2553.15, 399.56, 107.56),
        },

        -- Clothes:
        {
            code = 'clothes_01',
            type = 'clothes',
            name = 'Kho quần áo Polomini Ave',
            maximum_cargo = 10,
            pos = vector3(-823.55, -1065.41, 10.65),
        },
        {
            code = 'clothes_02',
            type = 'clothes',
            name = 'Kho quần áo Great Ocean Hwy',
            maximum_cargo = 15,
            pos = vector3(-3169.99, 1034.09, 19.84),
        },
        {
            code = 'clothes_03',
            type = 'clothes',
            name = 'Kho quần áo Route 68',
            maximum_cargo = 20,
            pos = vector3(619.1, 2785.25, 42.48),
        },
        {
            code = 'clothes_04',
            type = 'clothes',
            name = 'Kho quần áo Paleto Blvd',
            maximum_cargo = 10,
            pos = vector3(10.07, 6505.69, 30.54),
        },

        -- Machines:
        {
            code = 'machine_01',
            type = 'machine',
            name = 'Kho dụng cụ Davis Ave',
            maximum_cargo = 35,
            pos = vector3(29.38, -1770.19, 28.61),
        },
        {
            code = 'machine_02',
            type = 'machine',
            name = 'Kho dụng cụ Senora Fwy',
            maximum_cargo = 50,
            pos = vector3(2703.7, 3457.29, 54.55),
        },
    }
}

Config.Suppliers = {
    ["WareHouse_01"] = {
        store = {
            ['prop_cs_rub_box_02']      = { min_productivity = 3, max_productivity = 5, max_amount = 20, min_price = 80, max_price = 180 },
            ['prop_cardbordbox_04a']    = { min_productivity = 2, max_productivity = 4, max_amount = 15, min_price = 150, max_price = 280 },
            ['prop_box_wood05a']        = { min_productivity = 2, max_productivity = 4, max_amount = 10, min_price = 200, max_price = 380 },
            ['prop_box_wood04a']        = { min_productivity = 1, max_productivity = 3, max_amount = 8, min_price = 275, max_price = 480 },
            ['prop_box_wood08a']        = { min_productivity = 1, max_productivity = 2, max_amount = 5, min_price = 350, max_price = 580 },
        },
        clothes = {
            ['prop_cs_rub_box_02']      = { min_productivity = 3, max_productivity = 5, max_amount = 20, min_price = 80, max_price = 180 },
            ['prop_cardbordbox_04a']    = { min_productivity = 2, max_productivity = 4, max_amount = 15, min_price = 150, max_price = 280 },
            ['prop_box_wood05a']        = { min_productivity = 2, max_productivity = 4, max_amount = 10, min_price = 200, max_price = 380 },
            ['prop_box_wood04a']        = { min_productivity = 1, max_productivity = 3, max_amount = 8, min_price = 275, max_price = 480 },
            ['prop_box_wood08a']        = { min_productivity = 1, max_productivity = 2, max_amount = 5, min_price = 350, max_price = 580 },
        },
        machine = {
            ['prop_cs_rub_box_02']      = { min_productivity = 5, max_productivity = 7, max_amount = 50, min_price = 25, max_price = 50 },
            ['prop_cardbordbox_04a']    = { min_productivity = 4, max_productivity = 6, max_amount = 40, min_price = 50, max_price = 75 },
            ['prop_box_wood05a']        = { min_productivity = 4, max_productivity = 5, max_amount = 30, min_price = 90, max_price = 120 },
            ['prop_box_wood04a']        = { min_productivity = 3, max_productivity = 4, max_amount = 25, min_price = 100, max_price = 150 },
            ['prop_box_wood08a']        = { min_productivity = 2, max_productivity = 3, max_amount = 20, min_price = 150, max_price = 250 },
        }
    },
    ["WareHouse_02"] = {
        store = {
            ['prop_cs_rub_box_02']      = { min_productivity = 3, max_productivity = 5, max_amount = 20, min_price = 80, max_price = 180 },
            ['prop_cardbordbox_04a']    = { min_productivity = 2, max_productivity = 4, max_amount = 15, min_price = 150, max_price = 280 },
            ['prop_box_wood05a']        = { min_productivity = 2, max_productivity = 4, max_amount = 10, min_price = 200, max_price = 380 },
            ['prop_box_wood04a']        = { min_productivity = 1, max_productivity = 3, max_amount = 8, min_price = 275, max_price = 480 },
            ['prop_box_wood08a']        = { min_productivity = 1, max_productivity = 2, max_amount = 5, min_price = 350, max_price = 580 },
        },
        clothes = {
            ['prop_cs_rub_box_02']      = { min_productivity = 4, max_productivity = 6, max_amount = 25, min_price = 35, max_price = 150 },
            ['prop_cardbordbox_04a']    = { min_productivity = 3, max_productivity = 5, max_amount = 20, min_price = 75, max_price = 250 },
            ['prop_box_wood05a']        = { min_productivity = 2, max_productivity = 4, max_amount = 15, min_price = 125, max_price = 350 },
            ['prop_box_wood04a']        = { min_productivity = 2, max_productivity = 3, max_amount = 12, min_price = 200, max_price = 450 },
            ['prop_box_wood08a']        = { min_productivity = 1, max_productivity = 2, max_amount = 8, min_price = 250, max_price = 550 },
        },
        machine = {
            ['prop_cs_rub_box_02']      = { min_productivity = 4, max_productivity = 6, max_amount = 35, min_price = 50, max_price = 75 },
            ['prop_cardbordbox_04a']    = { min_productivity = 3, max_productivity = 5, max_amount = 30, min_price = 80, max_price = 120 },
            ['prop_box_wood05a']        = { min_productivity = 2, max_productivity = 4, max_amount = 25, min_price = 100, max_price = 150 },
            ['prop_box_wood04a']        = { min_productivity = 1, max_productivity = 3, max_amount = 20, min_price = 150, max_price = 220 },
            ['prop_box_wood08a']        = { min_productivity = 1, max_productivity = 2, max_amount = 15, min_price = 200, max_price = 300 },
        }
    }
}

-------------------------
--- Purchases:
-------------------------
Config.Purchases = {
    store = {
        ['prop_cs_rub_box_02']      = { min_price = 100, max_price = 200 },
        ['prop_cardbordbox_04a']    = { min_price = 200, max_price = 300 },
        ['prop_box_wood05a']        = { min_price = 300, max_price = 400 },
        ['prop_box_wood04a']        = { min_price = 400, max_price = 500 },
        ['prop_box_wood08a']        = { min_price = 500, max_price = 600 },
    },
    clothes = {
        ['prop_cs_rub_box_02']      = { min_price = 100, max_price = 200 },
        ['prop_cardbordbox_04a']    = { min_price = 200, max_price = 300 },
        ['prop_box_wood05a']        = { min_price = 300, max_price = 400 },
        ['prop_box_wood04a']        = { min_price = 400, max_price = 500 },
        ['prop_box_wood08a']        = { min_price = 500, max_price = 600 },
    },
    machine = {
        ['prop_cs_rub_box_02']      = { min_price = 75, max_price = 100 },
        ['prop_cardbordbox_04a']    = { min_price = 100, max_price = 150 },
        ['prop_box_wood05a']        = { min_price = 150, max_price = 200 },
        ['prop_box_wood04a']        = { min_price = 200, max_price = 250 },
        ['prop_box_wood08a']        = { min_price = 250, max_price = 350 },
    }
}
