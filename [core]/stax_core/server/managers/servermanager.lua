local Logger = Stax.Logger()

local ServerManager = {
  ReadyStates = {}
}

--- Sets a specific server ready state
---@param key string
---@param ready boolean
function ServerManager.SetReadyState(key, ready)
  if ServerManager.ReadyStates[key] ~= nil then
    ServerManager.ReadyStates[key] = ready
    Logger.Success("ServerManager::SetReadyState::StateChanged", key .. " - " .. tostring(ready))
  end
end

--- Gets a specific server ready state
---@param key string
---@return boolean
function ServerManager.GetReadyState(key)
  return ServerManager.ReadyStates[key] or false
end

--- Checks if all the ready states are true
---@return boolean
function ServerManager.ServerReady()
  for _, v in pairs(ServerManager.ReadyStates) do
    if v == false then
      return false
    end
  end
  return true
end

-- EXPORTS
exports("ServerManager_SetReadyState", ServerManager.SetReadyState)
exports("ServerManager_GetReadyState", ServerManager.GetReadyState)
exports("ServerManager_ServerReady", ServerManager.ServerReady)