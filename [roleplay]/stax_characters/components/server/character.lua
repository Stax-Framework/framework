---@class StaxCharacterAppearance
local CharacterAppearance = {}

---@class StaxCharacterClothing
local CharacterClothing = {}

---@class StaxCharacter
---@field COMPONENT StaxComponent
---@field Database StaxDatabase?
---@field Logger StaxLogger?
---@field Handle string | nil
---@field Data { FirstName: string | nil, LastName: string, Dob: string, Sex: string, Appearance: StaxCharacterAppearance, Clothing: StaxCharacterClothing }
local Character = {
    COMPONENT = Stax.Component.Init("Character", {
        "Logger",
        "Database"
    }),
    Database = nil,
    Logger = nil
}

--- Creates a new character
function Character.Create(source)
    local newCharacter = setmetatable({
        Handle = source,
        Data = {}
    }, Character)

    return newCharacter
end

--- Selects a current already created character
function Character.Select(source, characterId)
    local newCharacter = setmetatable({
        Handle = source,
        Data = {}
    }, Character)

    return newCharacter
end

--- Saves a characters data
function Character.Save(self)

end

--- Loads all characters data
function Character.Load(self)

end

--- Gets a players current count of created characters
function Character.GetCount(source)

end

Stax.Register(Character, function(components)
    Character.Database = components.Database
    Character.Logger = components.Logger
end)