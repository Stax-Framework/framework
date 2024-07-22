---@class StaxDirectory
---@field COMPONENT StaxComponentDetails
local Directory = {
  COMPONENT = Stax.Component.Init("Directory")
}

--- Scans directory for files
---@param directory string
---@return string[] | nil
function Directory.Scan(directory)
  local i, t, popen = 0, {}, io.popen
  for filename in popen('dir "' .. directory .. '" /b'):lines() do
    i = i + 1
    t[i] = filename
  end
  return t
end

Stax.Register(Directory)