---@class StaxConnectionManagerSingleton
---@field MaxPlayers number
---@field ConnectedPlayers number
---@field Queue { [string]: { priority: boolean, index: number } }
---@field ThreadStarted boolean
local Manager = {
    MaxPlayers = 0,
    ConnectedPlayers = 0,
    Queue = {},
    ThreadStarted = false,
}

---@param priorityOnly boolean | nil
local function _queueCount(priorityOnly)
    if not priorityOnly then priorityOnly = false end

    local count = 0

    for _, v in pairs(Manager.Queue) do
        if priorityOnly then
            if v.priority then
                count = count + 1
            end
        else
            count = count + 1
        end
    end

    return count
end

local function _stopThread()
    Manager.ThreadStarted = false
end

local function _startThread()
    if Manager.ThreadStarted then return end

    local function _checkQueue()
        if _queueCount() <= 0 then
            _stopThread()
            return
        end


    end

    Manager.ThreadStarted = true

    Citizen.CreateThread(function()
        while Manager.ThreadStarted do
            _checkQueue()
            Citizen.Wait(1000)
        end
    end)
end

local function _add(handle)

end

local function _remove()

end

local function _get()

end

Stax.Ready(function()
    local config = Stax.Config:Fetch("framework")

    if config then
        Manager.MaxPlayers = config["server"]["max_players"]
    end

    AddEventHandler("playerAdded", function()
    
    end)
end)