local characterSets = {
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
}

---@class StringSingleton
local String = {}

--- Interpolates and concatenate's data into a string
---@param str string
---@param data table
---@return string
function String.Interpolate(str, data)
  for k, v in pairs(data) do
    str = string.gsub(str, "{" .. k .. "}", v)
  end
  return str
end

--- Splits string into a table based on a seperator
---@param passed string
---@param sep string
---@return table
function String.Split(passed, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(passed, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

--- Formats a string into an index value
---@param str string
---@return string
function String.FormatIndex(str)
  str = string.lower(str):gsub(" ", "_")
  return str
end

--- Generates a random string at a specific length
---@param iterations number
---@return string
function String.Random(iterations)
  math.randomseed(GetGameTimer())
  local str = {}

  for _ = 1, iterations do
    table.insert(str, characterSets[math.random(1, #characterSets)])
  end

  return table.concat(str, "")
end

--- Strips string of invalid character
---@param str string
---@return string
function String.StripInvalid(str)
  str = str:gsub("%W", "")
  return str
end

--- [ SHARED ]
function Stax.String()
  return String
end