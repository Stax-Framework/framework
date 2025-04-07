---@class DUI
---@field COMPONENT Component
local DUI = {
    COMPONENT = Stax.Component.Init("DUI")
}

--- Creates a DUI browser. This can be used to draw on a runtime texture using CREATE_RUNTIME_TEXTURE_FROM_DUI_HANDLE.
---@param url string
---@param width number
---@param height number
---@return number
function DUI.Create(url, width, height)
    return CreateDui(url, width, height)
end

--- Creates a runtime texture from a DUI handle.
---@param txd number
---@param txName string
---@param duiHandle string
---@return number
function DUI.CreateRuntimeTexture(txd, txName, duiHandle)
    return CreateRuntimeTextureFromDuiHandle(txd, txName, duiHandle)
end

--- Destroys a DUI browser.
---@param duiObj number
function DUI.Destroy(duiObj)
    return DestroyDui(duiObj)
end

--- Returns the NUI window handle for a specified DUI browser object.
---@param duiObj number
---@return string
function DUI.GetHandle(duiObj)
    return GetDuiHandle(duiObj)
end

--- Returns whether or not a browser is created for a specified DUI browser object.
---@param duiObj number
---@return boolean
function DUI.IsAvailable(duiObj)
    return IsDuiAvailable(duiObj)
end

--- Sends a message to the specific DUI root page. This is similar to SEND_NUI_MESSAGE.
---@param duiObj number
---@param data table
function DUI.SendMessage(duiObj, data)
    SendDuiMessage(duiObj, json.encode(data))
end

--- Injects a 'mouse down' event for a DUI object. Coordinates are expected to be set using SEND_DUI_MOUSE_MOVE.
---@param duiObj number
---@param button "left" | "middle" | "right"
function DUI.MouseDown(duiObj, button)
    SendDuiMouseDown(duiObj, button)
end

--- Injects a 'mouse move' event for a DUI object. Coordinates are in browser space.
---@param duiObj number
---@param x number
---@param y number
function DUI.MouseMove(duiObj, x, y)
    SendDuiMouseMove(duiObj, x, y)
end

--- Injects a 'mouse up' event for a DUI object. Coordinates are expected to be set using SEND_DUI_MOUSE_MOVE.
---@param duiObj number
---@param button "left" | "middle" | "right"
function DUI.MouseUp(duiObj, button)
    SendDuiMouseUp(duiObj, button)
end

--- Injects a 'mouse wheel' event for a DUI object.
---@param duiObj number
---@param deltaY number
---@param deltaX number
function DUI.MouseWheel(duiObj, deltaY, deltaX)
    SendDuiMouseWheel(duiObj, deltaY, deltaX)
end

--- Navigates the specified DUI browser to a different URL.
---@param duiObj number
---@param url string
function DUI.SetURL(duiObj, url)
    SetDuiUrl(duiObj, url)
end

Stax.Component.Register(DUI)