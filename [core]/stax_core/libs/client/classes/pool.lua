local Vehicle = Stax.Vehicle()
local Ped = Stax.Ped()
local Object = Stax.Object()
local Pickup = Stax.Pickup()

--- TODO: MOVE THESE SYSTEMS DIRECTLY INTO THE CLASSES THEMSELVES

---@class Pool
---@field private Pool any
local Pool = {}

--- Gets the current vehicle pool
---@return Pool
function Pool.Vehicle()
  local newPool = {}

  ---@type table<number, Vehicle>
  newPool.Pool = {}

  local data = GetGamePool("CVehicle")

  for _, v in pairs(data) do
    newPool[v] = Vehicle.Init(v)
  end

  return newPool
end

--- Gets the current ped pool
---@return Pool
function Pool.Ped()
  local newPool = {}

  ---@type table<number, Ped>
  newPool.Pool = {}

  local data = GetGamePool("CPed")

  for _, v in pairs(data) do
    newPool[v] = Ped.Init(v)
  end

  return newPool
end

--- Gets the current pickup pool
---@return Pool
function Pool.Pickup()
  local newPool = {}

  ---@type table<number, Pickup>
  newPool.Pool = {}

  local data = GetGamePool("CPickup")

  for _, v in pairs(data) do
    newPool[v] = Pickup.Init(v)
  end

  return newPool
end

--- Gets the current object pool
---@return Pool
function Pool.Object()
  local newPool = {}

  ---@type table<number, Pickup>
  newPool.Pool = {}

  local data = GetGamePool("CObject")

  for _, v in pairs(data) do
    newPool[v] = Object.Init(v)
  end

  return newPool
end

--- Gets a single instance from the pool
---@generic T
---@param handle number
---@return T
function Pool:Get(handle)
  if not handle then
    return self.Pool
  end

  return self.Pool[handle]
end

--- Gets all of the instances from the pool
---@generic T
---@return { [number]: T }
function Pool:GetAll()
  return self.Pool
end

Stax.ClientOnly(function()
  --- [CLIENT]
  function Stax.Pool()
    return Pool
  end
end)