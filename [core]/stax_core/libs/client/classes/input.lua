---@enum InputMappers
local InputMappers = {
  Keyboard = "KEYBOARD",
  MouseButton = "MOUSE_BUTTON",
  MouseWheel = "MOUSE_WHEEL",
  PadDigitalButton = "PAD_DIGITALBUTTON"
}

---@enum KeyboardButtons
local KeyboardButtons = {
  ["Backspace"] = "BACK",
  ["Tab"] = "TAB",
  ["Return"] = "Return",
  ["Pause"] = "PAUSE",
  ["CapsLock"] = "CAPITAL",
  ["Escape"] = "ESCAPE",
  ["Space"] = "SPACE",
  ["PageUp"] = "PAGEUP",
  ["PageDown"] = "PAGEDOWN",
  ["End"] = "END",
  ["Home"] = "HOME",
  ["LeftArrow"] = "LEFT",
  ["UpArrow"] = "UP",
  ["RightArrow"] = "RIGHT",
  ["DownArrow"] = "DOWN",
  ["PrintScreen"] = "SYSRQ",
  ["Insert"] = "INSERT",
  ["Delete"] = "DELETE",
  ["0"] = "0",
  ["1"] = "1",
  ["2"] = "2",
  ["3"] = "3",
  ["4"] = "4",
  ["5"] = "5",
  ["6"] = "6",
  ["7"] = "7",
  ["8"] = "8",
  ["9"] = "9",
  ["A"] = "A",
  ["B"] = "B",
  ["C"] = "C",
  ["D"] = "D",
  ["E"] = "E",
  ["F"] = "F",
  ["G"] = "G",
  ["H"] = "H",
  ["I"] = "I",
  ["J"] = "J",
  ["K"] = "K",
  ["L"] = "L",
  ["M"] = "M",
  ["N"] = "N",
  ["O"] = "O",
  ["P"] = "P",
  ["Q"] = "Q",
  ["R"] = "R",
  ["S"] = "S",
  ["T"] = "T",
  ["U"] = "U",
  ["V"] = "V",
  ["W"] = "W",
  ["X"] = "X",
  ["Y"] = "Y",
  ["Z"] = "Z",
  ["LeftWindows"] = "LWIN",
  ["RightWindows"] = "RWIN",
  ["Numpad0"] = "NUMPAD0",
  ["Numpad1"] = "NUMPAD1",
  ["Numpad2"] = "NUMPAD2",
  ["Numpad3"] = "NUMPAD3",
  ["Numpad4"] = "NUMPAD4",
  ["Numpad5"] = "NUMPAD5",
  ["Numpad6"] = "NUMPAD6",
  ["Numpad7"] = "NUMPAD7",
  ["Numpad8"] = "NUMPAD8",
  ["Numpad9"] = "NUMPAD9",
  ["Multiply"] = "MULTIPLY",
  ["Add"] = "ADD",
  ["Subtract"] = "SUBTRACT",
  ["Decimal"] = "DECIMAL",
  ["Divide"] = "DIVIDE",
  ["NumpadEqual"] = "NUMPADEQUALS",
  ["NumpadEnter"] = "NUMPADENTER",
  ["F1"] = "F1",
  ["F2"] = "F2",
  ["F3"] = "F3",
  ["F4"] = "F4",
  ["F5"] = "F5",
  ["F6"] = "F6",
  ["F7"] = "F7",
  ["F8"] = "F8",
  ["F9"] = "F9",
  ["F10"] = "F10",
  ["F11"] = "F11",
  ["F12"] = "F12",
  ["NumLock"] = "NUMLOCK",
  ["ScrollLock"] = "SCROLL",
  ["LeftShift"] = "LSHIFT",
  ["RightShift"] = "RSHIFT",
  ["LeftControl"] = "LCONTROL",
  ["RightControl"] = "RCONTROL",
  ["LeftAlt"] = "LMENU",
  ["RightAlt"] = "RMENU",
  ["Semicolon"] = "SEMICOLON",
  ["Equals"] = "EQUALS",
  ["Plus"] = "PLUS",
  ["Comma"] = "COMMA",
  ["Minus"] = "MINUS",
  ["ForwardSlash"] = "SLASH",
  ["Grave"] = "GRAVE",
  ["LeftBracket"] = "LBRACKET",
  ["BackSlash"] = "BACKSLASH",
  ["RightBracket"] = "RBRACKET"
}

---@enum MouseButtons
local MouseButtons = {
  ["Left"] = "MOUSE_LEFT",
  ["Right"] = "MOUSE_RIGHT",
  ["Middle"] = "MOUSE_MIDDLE",
  ["Extra1"] = "MOUSE_EXTRABTN1",
  ["Extra2"] = "MOUSE_EXTRABTN2",
  ["Extra3"] = "MOUSE_EXTRABTN3",
  ["Extra4"] = "MOUSE_EXTRABTN4",
  ["Extra5"] = "MOUSE_EXTRABTN5",
  ["ScrollUp"] = "IOM_WHEEL_UP",
  ["ScrollDown"] = "IOM_WHEEL_DOWN"
}

---@enum MouseWheelButtons
local MouseWheelButtons = {
  ["ScrollUp"] = "IOM_WHEEL_UP",
  ["ScrollDown"] = "IOM_WHEEL_DOWN"
}

---@enum GamepadButtons
local GamepadButtons = {
  ["L1"] = "L1_INDEX",
  ["R1"] = "R1_INDEX",
  ["L2"] = "L2_INDEX",
  ["R2"] = "R2_INDEX",
  ["L3"] = "L3_INDEX",
  ["R3"] = "R3_INDEX",
  ["PadUp"] = "LUP_INDEX",
  ["PadRight"] = "LRIGHT_INDEX",
  ["PadDown"] = "LDOWN_INDEX",
  ["PadLeft"] = "LLEFT_INDEX",
  ["Y_Triangle"] = "RUP_INDEX",
  ["B_Circle"] = "RRIGHT_INDEX",
  ["A_Cross"] = "RDOWN_INDEX",
  ["X_Square"] = "RLEFT_INDEX"
}

---@class Input
---@field private CommandString string
---@field private Description string
---@field private DefaultMapper InputMappers
---@field private DefaultParameter KeyboardButtons | MouseButtons | MouseWheelButtons | GamepadButtons
---@field private PressedTimestamp number | nil
local Input = {}

--- Creates a new input handler
---@param commandString string
---@param description string
---@param defaultMapper InputMappers
---@param defaultParameter KeyboardButtons | MouseButtons | MouseWheelButtons | GamepadButtons
---@return Input
function Input.Create(commandString, description, defaultMapper, defaultParameter)
  local input = {}
  setmetatable(input, Input)

  input.CommandString = commandString
  input.Description = description
  input.DefaultMapper = defaultMapper
  input.DefaultParameter = defaultParameter
  input.PressedTimestamp = nil

  RegisterKeyMapping(commandString, description, defaultMapper, defaultParameter)

  return Input
end

--- Fires a callback when the input is pressed
---@param callback fun(pressedTime: number)
function Input:Pressed(callback)
  RegisterCommand("+" .. self.CommandString, function()
    self.PressedTimestamp = GetGameTimer()
    callback(self.PressedTimestamp)
  end, false)
end

--- Fires a callback when the input is released
---@param callback fun(pressedTime: number, heldTime: number)
function Input:Released(callback)
  RegisterCommand("-" .. self.CommandString, function()
    local TimeHeld = GetGameTimer() - self.PressedTimestamp
    callback(self.PressedTimestamp, TimeHeld)
  end, false)
end

Stax.ClientOnly(function()
  function Stax.Input()
    return Input
  end

  function Stax.InputMappers()
    return InputMappers
  end

  function Stax.KeyboardButtons()
    return KeyboardButtons
  end

  function Stax.MouseButtons()
    return MouseButtons
  end

  function Stax.MouseWheelButtons()
    return MouseWheelButtons
  end

  function Stax.GamepadButtons()
    return GamepadButtons
  end
end)