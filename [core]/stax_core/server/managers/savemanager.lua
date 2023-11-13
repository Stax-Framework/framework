local Events = Stax.Events()
local CoreEvents = Stax.DefinedEvents.Core()

--- EVENTS
local SaveEvents = CoreEvents.Server.SAVE

---@class SaveManager
---@field private LastSave string | nil
local SaveManager = {
  LastSave = nil
}

--- Fires a massive server wide save event for plugins to save unimportant data on a timer
function SaveManager.Save()
  Events.FireServer(SaveEvents.AutoSave)
  SaveManager.LastSave = GetGameTimer()
end

--- Registers a callback to run to handle your save queries
---@param callback function
function SaveManager.Register(callback)
  Events.CreateEvent(SaveEvents.AutoSave, callback)
end

--- Gets the last time the server was saved
---@return string
function SaveManager.GetLastSave()
  return SaveManager.LastSave
end

Citizen.CreateThread(function()
  local SaveTimer = Stax.Config:Get("framework.autosave_time")

  while true do
    Citizen.Wait(SaveTimer)
    SaveManager.Save()
  end
end)

exports("SaveManager_Save", SaveManager.Save)
exports("SaveManager_Register", SaveManager.Register)
exports("SaveManager_GetLastSave", SaveManager.GetLastSave)