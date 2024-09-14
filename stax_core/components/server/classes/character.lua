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
    })
}
Character.__index = Character

function Character.Create()

end