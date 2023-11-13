local Database = Stax.Database()
local Logger = Stax.Logger()

---@class User
---@field public _id number User's Id
---@field public name string User's Name
---@field public identifier string User's Identifier
---@field public role string User's Role
---@field public allowlisted boolean If user is allowed to join when server is private
---@field public priority boolean If user has priority connection queue
---@field public created_at string When the user was created
---@field public played_at string When the user has last played the server
local User = {}
User.__index = User

--- Creates a new instance of the user if one doesn't exist otherwise uses already stored data
---@param player Player
---@return User | nil
function User.Create(player)
  local newUser = {}
  setmetatable(newUser, User)

  local identifierType = Stax.Config:Get("framework.identifier")
  local identifier = player:GetIdentifier(identifierType)

  if identifier then
    local exists = User.Exists(identifier)

    if exists then
      local user = Database.AsyncFindOne("users", {})

      if not user.success then
        return nil
      end

      if #user.results <= 0 then
        return nil
      end

      local userData = user.results[1]

      if userData then
        newUser._id = userData._id
        newUser.name = userData.name
        newUser.role = userData.role
        newUser.allowlisted = userData.allowlisted
        newUser.priority = userData.priority
      end
    else
      local user = Database.AsyncInsertOne("users", {
        name = player.Name,
        role = 'user',
        allowlisted = false,
        priority = false
      })

      if not user.success then
        return
      end

      if #user.insertedIds <= 0 then
        return
      end

      local userId = user.insertedIds[1]

      if userId then
        newUser._id = userId
        newUser.name = player.Name
        newUser.role = 'user'
        newUser.allowlisted = false
        newUser.priority = false
      end
    end
  end

  return newUser
end

--- Checks if the user already has existing records
---@param identifier string
---@return boolean
function User.Exists(identifier)
  local user = Database.AsyncFindOne("users", {
    identifiers = identifier
  })

  if not user.success then return false end
  if #user.results <= 0 then return false end

  return true
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.User()
    return User
  end
end)