print("HEYOOOO THIS SHIT IS FUCKING RUNNING JEEEEEEEZ")

---@type StaxLogger
local _Logger = nil

Stax.Component.Fetch("Logger", function(component)
    _Logger = component
end)

Citizen.CreateThread(function()
    Wait(500)

    _Logger.Success("| Hello Message |", "HELLO WORLD FROM SOURCE SCRIPT USING COMPONENT")
end)