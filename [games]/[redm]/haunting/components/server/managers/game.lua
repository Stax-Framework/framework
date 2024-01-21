---@class HauntingGameManagerSingleton
---@field RoundStarted boolean
---@field RoundStartedAt number?
---@field Hunters { [number]: number }
---@field Ghosts { [number]: number }
local Singleton = {
  RoundStarted = false,
  RoundStartedAt = nil,
  Hunters = {},
  Ghosts = {}
}

---@class HauntingGameManager
---@field COMPONENT StaxComponent
---@field Logger StaxLogger?
local GameManager = {
  COMPONENT = Stax.Component.Init("Haunting_GameManager", { "Logger" }),
  Logger = nil
}

function GameManager.StartGame()

end

Stax.Register(GameManager, function(components)
  GameManager.Logger = components.Logger
end)