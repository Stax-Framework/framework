---@type Database
local _Database

---@class StaxCharacter
local Character = {
    COMPONENT = Stax.Component.Init("Character")
}

function Character.new()

end

function Character.fetchSingle()

end

function Character.fetchAll()

end

function Character.Load()

end

function Character.Save()

end

local function _loadComponents()
    _Database = Stax.Component.FetchAsync("Database")
end


---[[
--- EVENTS
---]]
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)

---[[
--- REGISTER COMPONENT
---]]
Stax.Component.Register(Character)