-- Create Blips
CreateThread(function()
  -- Create job blip:
  local jobBlip = AddBlipForCoord(Config.Blips.Pos.x, Config.Blips.Pos.y, Config.Blips.Pos.z)
  
  SetBlipSprite(jobBlip, Config.Blips.Sprite)
  SetBlipDisplay(jobBlip, Config.Blips.Display)
  SetBlipScale(jobBlip, Config.Blips.Scale)
  SetBlipColour(jobBlip, Config.Blips.Colour)
  SetBlipAsShortRange(jobBlip, true)

  BeginTextCommandSetBlipName('STRING')
  AddTextComponentSubstringPlayerName(Config.Blips.Name)
  EndTextCommandSetBlipName(jobBlip)

  -- Create shop blips:
  for k, v in pairs(Config.Shops.List) do
    local shopBlip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)
    
    SetBlipSprite(shopBlip, Config.ShopBlips[v.type].Sprite)
    SetBlipDisplay(shopBlip, Config.ShopBlips[v.type].Display)
    SetBlipScale(shopBlip, Config.ShopBlips[v.type].Scale)
    SetBlipColour(shopBlip, Config.ShopBlips[v.type].Colour)
    SetBlipAsShortRange(shopBlip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(v.name)
    EndTextCommandSetBlipName(shopBlip)
  end

   -- Create WareHouse blips:
   for k, v in pairs(Config.WareHouses.List) do
    local shopBlip = AddBlipForCoord(v.pos.x, v.pos.y, v.pos.z)
    
    SetBlipSprite(shopBlip, Config.WareHouseBlips.Sprite)
    SetBlipDisplay(shopBlip, Config.WareHouseBlips.Display)
    SetBlipScale(shopBlip, Config.WareHouseBlips.Scale)
    SetBlipColour(shopBlip, Config.WareHouseBlips.Colour)
    SetBlipAsShortRange(shopBlip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(v.name)
    EndTextCommandSetBlipName(shopBlip)
  end
end)

-- Add box zone to react with laptop:
CreateThread(function()
  local boxZone = BoxZone:Create(Config.Laptop.pos, Config.Laptop.width, Config.Laptop.height, {
    name = "box_zone",
    scale = Config.Laptop.scale,
    minZ = Config.Laptop.minZ,
    maxZ = Config.Laptop.maxZ,
  })

  boxZone:onPlayerInOut(function(isPointInside)
    if isPointInside then
      exports.ox_target:addModel({Config.Laptop.model}, {
        icon = 'fas fa-computer',
        label = 'Tương tác',
        distance = 2,
        onSelect = function()
          TriggerEvent('cuoi-trucker:nui:toggle', true, 'trucker dashboard', true)
        end,
      })
    else
      exports.ox_target:removeModel({Config.Laptop.model})
    end
  end)
end)

if Config.Debug then
  RegisterCommand('trucker_nui', function()
    TriggerEvent('cuoi-trucker:nui:toggle', true, 'trucker dashboard', true)
  end)
end
