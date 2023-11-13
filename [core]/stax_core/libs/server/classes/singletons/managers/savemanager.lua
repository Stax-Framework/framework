---@class SaveManagerSingleton
local SaveManager = {}

--- Fires a massive server wide save event for plugins to save unimportant data on a timer
function SaveManager.Save()
  exports.stax_core:SaveManager_Save()
end

--- Registers a callback to run to handle your save queries
---@param callback function
function SaveManager.Register(callback)
  exports.stax_core:SaveManager_Register(callback)
end

--- Gets the last time the server was saved
---@return string
function SaveManager.GetLastSave()
  return exports.stax_core:SaveManager_GetLastSave()
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.SaveManager()
    return SaveManager
  end
end)