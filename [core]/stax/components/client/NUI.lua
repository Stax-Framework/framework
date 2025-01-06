---@class NUI
---@field COMPONENT Component
local NUI = {
    COMPONENT = Stax.Component.Init("NUI")
}

--- Checks if keyboard input is enabled during NUI focus
---@return boolean
function NUI.FocusedWithInput()
    return IsNuiFocusKeepingInput()
end

--- Sets the focus of the screen to the NUI
---@param hasFocus boolean Focus on the NUI screen
---@param hasCursor boolean # True if you want the NUI to have a cursor
function NUI.SetFocus(hasFocus, hasCursor)
    SetNuiFocus(hasFocus, hasCursor)
end

--- Setter if you want the NUI focus to keep game input
---@param keepInput boolean
function NUI.SetFocusKeepInput(keepInput)
    SetNuiFocusKeepInput(keepInput)
end

--- Sends data to the NUI
---@param data table<string, any>
function NUI.SendMessage(data)
    SendNUIMessage(data)
end

--- Callback that the UI can pass data to the client
---@param callbackType string
---@param callback fun(body: any, resultCallback: fun())
function NUI.RegisterCallback(callbackType, callback)
    RegisterNuiCallback(callbackType, callback)
end

--- Gets the NUI cursor position
---@return number, number
function NUI.GetCursorPosition()
    return GetNuiCursorPosition()
end

--- Sends a message of data to the loading screen
---@param data table<string, any>
function NUI.SendLoadingMessage(data)
    SendLoadingScreenMessage(json.encode(data))
end

--- Shutdown loading screen
function NUI.ShutdownLoading()
    ShutdownLoadingScreen()
end

--- Manually shutdown loading screen
---@param manualShutdown boolean
function NUI.ManualShutdownLoading(manualShutdown)
    SetManualShutdownLoadingScreenNui(manualShutdown)
end