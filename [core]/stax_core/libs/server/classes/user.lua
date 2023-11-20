---@type Database
local Database = Stax:GetComponent("Database")

---@type LoggerSingleton
local Logger = Stax:GetComponent("Logger")

---@class User
---@field public _id number
---@field public name string
---@field public identifiers string[]
---@field public roles string[]
local User = {
  _COMPONENT = {
    NAME = "User",
    REQUIREMENTS = {
      "Database",
      "Logger"
    }
  }
}
User.__index = User

function User.Create()
  
end

function User.Exists()

end

AddEventHandler("Stax::Core::RetrieveComponent", function(name, callback)
  if name ~= User._COMPONENT.NAME then return end
  return callback(User)
end)