---@type Logger
local _Logger

local Manager = {}

local function _fetchDiscordData()

end

local function _fetchPlayerData()

end

local function _fetchPlayerRoles()

end

local function _sendMessage()

end

local function _sendCard()

end

local function _loadComponents()
    _Logger = Stax.Component.FetchAsync("Logger")
end

---[[
--- EVENTS
---]]
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)

---[[
--- EXPORTS
---]]
Stax.Export("DiscordManager_FetchDiscordData", _fetchDiscordData)
Stax.Export("DiscordManager_FetchPlayerData", _fetchPlayerData)
Stax.Export("DiscordManager_FetchPlayerRoles", _fetchPlayerRoles)
Stax.Export("DiscordManager_SendMessage", _sendMessage)
Stax.Export("DiscordManager_SendCard", _sendCard)