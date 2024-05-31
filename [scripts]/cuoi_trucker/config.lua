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
    'prop_cs_rub_box_02',
    'prop_cardbordbox_04a',
    'prop_box_wood05a',
    'prop_box_wood04a',
    'prop_box_wood08a',
    'v_ind_cf_boxes',
    'prop_boxpile_07d'
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
    MaximumProduct = 20,
    Size = {x = 1.5, y = 1.5, z = 1.0},
    Color  = {r = 50, g = 50, b = 200},
    List = {
        -- Stores:
        {
            code = 'store_01',
            type = 'store',
            name = 'Kho tạp hóa 01',
            maximum_product = 10,
            pos = vector3(-3047.72, 590.36, 7.76),
        },
        {
            code = 'store_02',
            type = 'store',
            name = 'Kho tạp hóa 02',
            maximum_product = 10,
            pos = vector3(1702.53, 4916.64, 42.08),
        },
        {
            code = 'store_03',
            type = 'store',
            name = 'Kho tạp hóa 03',
            maximum_product = 10,
            pos = vector3(541.74, 2663.77, 42.17),
        },
        {
            code = 'store_04',
            type = 'store',
            name = 'Kho tạp hóa 04',
            maximum_product = 20,
            pos = vector3(371.56, 337.2, 103.36),
        },
        {
            code = 'store_05',
            type = 'store',
            name = 'Kho tạp hóa 05',
            maximum_product = 20,
            pos = vector3(2553.15, 399.56, 108.56),
        },

        -- Clothes:
        {
            code = 'clothes_01',
            type = 'clothes',
            name = 'Kho quần áo 01',
            maximum_product = 10,
            pos = vector3(-823.55, -1065.41, 11.65),
        },
        {
            code = 'clothes_02',
            type = 'clothes',
            name = 'Kho quần áo 02',
            maximum_product = 15,
            pos = vector3(-3169.99, 1034.09, 20.84),
        },
        {
            code = 'clothes_03',
            type = 'clothes',
            name = 'Kho quần áo 03',
            maximum_product = 20,
            pos = vector3(619.1, 2785.25, 43.48),
        },
        {
            code = 'clothes_04',
            type = 'clothes',
            name = 'Kho quần áo 04',
            maximum_product = 10,
            pos = vector3(10.07, 6505.69, 31.54),
        },

        -- Machines:
        {
            code = 'machine_01',
            type = 'machine',
            name = 'Kho dụng cụ 01',
            maximum_product = 35,
            pos = vector3(29.38, -1770.19, 29.61),
        },
        {
            code = 'machine_02',
            type = 'machine',
            name = 'Kho dụng cụ 02',
            maximum_product = 50,
            pos = vector3(2703.7, 3457.29, 55.55),
        },
    }
}

-------------------------
--- Purchases:
-------------------------
Config.Purchases = {
    ['store'] = {
        ['prop_cs_rub_box_02']      = {amount = 1, min_price = 100, max_price = 200},
        ['prop_cardbordbox_04a']    = {amount = 2, min_price = 200, max_price = 300},
        ['prop_box_wood05a']        = {amount = 2, min_price = 300, max_price = 400},
        ['prop_box_wood04a']        = {amount = 3, min_price = 400, max_price = 500},
        ['prop_box_wood08a']        = {amount = 3, min_price = 500, max_price = 600},
        ['v_ind_cf_boxes']          = {amount = 4, min_price = 600, max_price = 750},
        ['prop_boxpile_07d']        = {amount = 5, min_price = 750, max_price = 900},
    },
    ['clothes'] = {
        ['prop_cs_rub_box_02']      = {amount = 1, min_price = 100, max_price = 200},
        ['prop_cardbordbox_04a']    = {amount = 2, min_price = 200, max_price = 300},
        ['prop_box_wood05a']        = {amount = 2, min_price = 300, max_price = 400},
        ['prop_box_wood04a']        = {amount = 3, min_price = 400, max_price = 500},
        ['prop_box_wood08a']        = {amount = 3, min_price = 500, max_price = 600},
        ['v_ind_cf_boxes']          = {amount = 4, min_price = 600, max_price = 750},
        ['prop_boxpile_07d']        = {amount = 5, min_price = 750, max_price = 900},
    },
    ['machine'] = {
        ['prop_cs_rub_box_02']      = {amount = 1, min_price = 75, max_price = 100},
        ['prop_cardbordbox_04a']    = {amount = 2, min_price = 100, max_price = 150},
        ['prop_box_wood05a']        = {amount = 2, min_price = 150, max_price = 200},
        ['prop_box_wood04a']        = {amount = 3, min_price = 200, max_price = 250},
        ['prop_box_wood08a']        = {amount = 3, min_price = 250, max_price = 350},
        ['v_ind_cf_boxes']          = {amount = 4, min_price = 350, max_price = 450},
        ['prop_boxpile_07d']        = {amount = 5, min_price = 450, max_price = 600},
    }
}
