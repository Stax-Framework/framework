---@type StaxString
local String

---@class StaxLogger
---@field COMPONENT ComponentDetails
local Logger = {
  COMPONENT = {
    NAME = "Logger",
    REQUIREMENTS = {
      "String"
    }
  }
}

---@param action string
---@param message string
function Logger.Success(action, message)
  if not String then return end

  local msg = String.Interpolate("^9[STAX] ^0:: ^2SUCCESS ^0:: ^9{action}^0 :: ^3{message}^0", {
    action = action,
    message = message
  })

  print(msg)
end

---@param action string
---@param message string
function Logger.Error(action, message)
  if not String then return end

  local msg = String.Interpolate("^9[STAX] ^0:: ^8ERROR ^0:: ^8{action}^0 :: ^3{message}^0", {
    action = action,
    message = message
  })

  print(msg)
end

---@param action string
---@param message string
function Logger.Warning(action, message)
  if not String then return end

  local msg = String.Interpolate("^9[STAX] ^0:: ^1WARNING ^0:: ^1{action}^0 :: ^3{message}^0", {
    action = action,
    message = message
  })

  print(msg)
end

Stax.Register(Logger,function(components)
  String = components["String"]
end)