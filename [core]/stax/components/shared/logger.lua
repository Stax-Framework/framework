---@class Logger
---@field COMPONENT Component
local Logger = {
    COMPONENT = Stax.Component.Init("Logger")
}

---@param action string
---@param message string
function Logger.Success(action, message)
    print("^9[STAX] ^0:: ^2SUCCESS ^0:: ^9" .. action .. "^0 :: ^3" .. message .. "^0")
end

---@param action string
---@param message string
function Logger.Error(action, message)
    print("^9[STAX] ^0:: ^8ERROR ^0:: ^8" .. action .. "^0 :: ^3" .. message .. "^0")
end

---@param action string
---@param message string
function Logger.Warning(action, message)
    print("^9[STAX] ^0:: ^1WARNING ^0:: ^1" .. action .. "^0 :: ^3" .. message .. "^0")
end

---@param name string
---@param data table
---@param pretty boolean?
function Logger.Unpack(name, data, pretty)
    if not name then
        name = "Data"
    end

    print("\n")
    print("----------------------------------------------------------")
    print("[ ^9[STAX] ^7Unpacking " .. name .. "^0 ]")
    print("----------------------------------------------------------")
    print(json.encode(data, { indent = pretty or false }))
    print("----------------------------------------------------------")
end

Stax.Component.Register(Logger)