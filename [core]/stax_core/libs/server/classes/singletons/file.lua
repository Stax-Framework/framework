---@class FileSingleton
local File = {}

--- Loads file from a directory
---@param directory string
---@param file string
---@return string | nil
function File.LoadFile(directory, file)
  Stax.ServerOnly(function()
    local f = io.open(directory .. file, "r")

    if not f then return nil end
    local fData = f:read("*a")

    f:close()
    return fData or nil
  end)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.File()
    return File
  end
end)