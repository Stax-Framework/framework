---@class ClassSingleton
local Class = {
  _COMPONENT = {
    NAME = "Class",
    REQUIREMENTS = {}
  }
}

--- Reinitializes class from its data
---@generic T
---@param data table
---@param class T
---@return T
function Class.Init(data, class)
  return setmetatable(data, class)
end

AddEventHandler("Stax::Core::RetrieveComponent", function(name, callback)
  if name ~= Class._COMPONENT.NAME then return end
  return callback(Class)
end)