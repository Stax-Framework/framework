---@meta

---[SHARED] Can be used to get a console variable of type char*, for example a string.
---
---@param varName string
---@param default_ string
---@return string
function _G.GetConvar(varName, default_) end

---[SHARED] Can be used to get a console variable casted back to int (an integer value).
---
---@param varName string
---@param default_ number
---@return number
function _G.GetConvarInt(varName, default_) end

---[SHARED] Can be used to set a console variable of type char*, for example a string.
---
---@param varName string
---@param value string
function _G.SetConvar(varName, value) end

---[SHARED] Used to replicate a server variable onto clients.
---
---@param varName string
---@param value string
function _G.SetConvarReplicated(varName, value) end

---[SHARED] Used to set server info variables
---
---@param varName string
---@param value string
function _G.SetConvarServerInfo(varName, value) end