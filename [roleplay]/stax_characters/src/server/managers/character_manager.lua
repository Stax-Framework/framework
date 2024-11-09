local Manager = {}

local function _fetchCharacters(player)

end

local function _selectCharacter(player, charId)

end

local function _deleteCharacter()

end

local function _createCharacter()

end

local function _fetchSelectedCharacter()

end

--- STAX EVENTS

--- STAX EXPORTS
Stax.Export("CharacterManager_FetchCharacter", _fetchCharacters)
Stax.Export("CharacterManager_SelectCharacter", _selectCharacter)
Stax.Export("CharacterManager_DeleteCharacter", _deleteCharacter)
Stax.Export("CharacterManager_CreateCharacter", _createCharacter)
Stax.Export("CharacterManager_FetchSelectedCharacter", _fetchCharacters)