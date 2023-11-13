---@class Ped
local Ped = {}
Ped.__index = Ped

--- Creates a new instance of Ped
function Ped.Init(handle)
  local newPed = {}
  setmetatable(newPed, Ped)

  newPed.IsServer = IsDuplicityVersion()
  newPed.Handle = handle

  return newPed
end

--- [ SHARED ]
function Stax.Ped()
  return Ped
end