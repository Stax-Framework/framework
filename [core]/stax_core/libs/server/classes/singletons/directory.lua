---@class DirectorySingleton
local Directory = {}

--- Scans directory for files - [SERVER]
---@param directory string
---@return table<string> | nil
function Directory.Scan(directory)
  return Stax.ServerOnly(function()
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "' .. directory .. '" /b'):lines() do
      i = i + 1
      t[i] = filename
    end
    return t
  end)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.Directory()
    return Directory
  end
end)
