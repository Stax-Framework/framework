local Logger = Stax.Logger()

---@class StorageSingleton
local Storage = {}

--- Gets the full json data by file name
---@param name string
---@param subpath string | nil
---@return string | nil
function Storage.Get(name, subpath)
  local resource = GetCurrentResourceName()
  local path = GetResourcePath(resource) .. "/storage"

  if subpath then
    path = path .. subpath
  end

  return LoadResourceFile(resource, path .. "/" .. name .. ".json")
end

---@return boolean
function Storage.Save(name, data, subpath)
  local resource = GetCurrentResourceName()
  local path = GetResourcePath(resource)

  if subpath then
    path = path .. subpath
  end

  return SaveResourceFile(resource, path .. "/" .. name .. ".json", json.encode(data), -1)
end