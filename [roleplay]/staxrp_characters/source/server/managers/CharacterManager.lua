---@type Logger
local _Logger

local Manager = {
    Characters = {}
}

local function _add(character)

end

local function _remove()

end

local function _fetch()

end

local function _fetchPlayerCharacters()

end

local function _loadComponents()
    _Logger = Stax.Component.FetchAsync("Logger")
end

---[[
--- EVENTS
---]]
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)