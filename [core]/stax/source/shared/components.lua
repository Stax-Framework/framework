local Components = {}
local _loaded = false
local _loading = false
local _lastLoad = nil
local _loadTimeout = 500

---@param component Component
AddEventHandler("STAX::ComponentLoader::Register", function(component)
    _lastLoad = GetGameTimer()

    if not _loading then
        StartLoadThread()
    end

    if Components[component.COMPONENT.Name] then
        print("Couldn't register " .. component.COMPONENT.Name .. " because its already been registered.")
        return
    end

    Components[component.COMPONENT.Name] = component

    print("Registered " .. component.COMPONENT.Name .. " as a component!")
end)

AddEventHandler("STAX::ComponentLoader::Fetch", function(name, callback)
    while not _loaded do
        Wait(250)
    end

    local componentFound = Components[name]

    if componentFound then
        callback(componentFound)
    end
end)

function StartLoadThread()
    _loading = true

    Citizen.CreateThread(function()
        while _loading do
            Citizen.Wait(50)
            if GetGameTimer() > _lastLoad + _loadTimeout then
                _loading = false
                _loaded = true
            end
        end

        ---@param component Logger
        Stax.Component.Fetch("Logger", function(component)
            component.Success("ComponentLoader", "Finished Loading Components!")
        end)
    end)
end