---@class HauntingMapData
---@field name string
---@field radius number
---@field center_position { x: number, y: number, z: number }
---@field weather_types string[]
---@field ghost_spawns { name: string, x: number, y: number, z: number }[]
---@field hunter_spawns { name: string, x: number, y: number, z: number }[]
---@field notes { x: number, y: number, z: number }[]

---@class HauntingMapManagerSingleton
---@field SelectedMap string?
---@field Maps { [string]: HauntingMapData }
local Singleton = {
  SelectedMap = nil,
  Maps = {}
}

Stax.OnConfigsLoaded(function()
  Singleton.Maps = Stax.Config:Fetch("maps")
  print("Haunting Maps Loaded...")

  print(json.encode(Singleton.Maps, { indent = true }))
end)

---@class HauntingMapManager
local MapManager = {
  COMPONENT = Stax.Component.Init("Haunting_MapManager")
}

function MapManager.SelectMap()

end

function MapManager.ForceMap()

end

function MapManager.GetMapData()

end

Stax.Component.Register(MapManager)