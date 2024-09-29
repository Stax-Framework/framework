---@class StaxCharacter
---@field COMPONENT StaxComponent
---@field Id number
---@field FirstName string
---@field LastName string
---@field DOB string
local Character = {
    COMPONENT = Stax.Component.Init("Character", {
        "Logger",
        "Database"
    }),
    Database = nil,
    Logger = nil
}
Character.__index = Character

--- Creates a new instance of the character class
--- @return StaxCharacter | nil
function Character.Create()
    local self = setmetatable({
        Id = 0,
        Firstname = "PLACEHOLDER_FIRST",
        Lastname = "PLACEHOLDER_LAST",
        DOB = "9/99/9999",
    }, Character)

    local loaded = self:Load()

    if not loaded then return nil end
    return self
end

function Character:Load()

end

Stax.Register(Character, function(components)
    Character.Database = components.Database
    Character.Logger = components.Logger
end)