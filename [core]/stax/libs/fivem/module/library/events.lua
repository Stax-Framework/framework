---@meta

--- [SERVER] Passed in a server event fired by a client
---@type number | string
source = nil

---[SHARED] Creates an event handler that can be fired from your local environment
---
---@param event string
---@param callback fun(...)
---@return table
function _G.AddEventHandler(event, callback) end

---[SHARED] Makes the AddEventHandler event a networked event that can be fired from the opposite environment
---
--- Client -> Server | Server -> Client
---
---@param event string
---@param callback? fun(...)
function _G.RegisterNetEvent(event, callback) end

---[SHARED] Removes an event handler using its event handler data
---
---@param eventHandlerData table
function _G.RemoveEventHandler(eventHandlerData) end

---[SHARED] Triggers an event in the local environment
---
--- Client -> Client | Server -> Server
---@param event string
---@return any
function _G.TriggerEvent(event, ...) end

---[CLIENT] Triggers a server event from the client
---
--- Client -> Server
---@param event string
function _G.TriggerServerEvent(event, ...) end

---[SERVER] Triggers a client event from the server
---
--- Server -> Client
---@param event string
---@param playerId string | number
function _G.TriggerClientEvent(event, playerId, ...) end