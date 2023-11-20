---@class Stax
Stax = {
  _components = {},
  _componentsLoaded = false,
  _componentLoadStates = {},
  _requiredComponents = {}
}
Stax.__index = Stax

---@enum CompLoadState
local LoadState = {
  Staged = 0,
  Requested = 1,
  Loading = 2,
  Waiting = 3,
  Loaded = 4
}

--- Intializes new stax instance
---
function Stax.Init(dependencies, dependencyLoaded, initialized)
  local newStax = {}
  setmetatable(newStax, Stax)

  Citizen.CreateThread(function()
    Stax.LoadDependencies(newStax, dependencies, function(success)
      dependencyLoaded(success)
    end)

    --- Retrieve Config For This Stax Plugin Instance
    --- Retrieve Locale For This Stax Plugin Instance

    initialized()
  end)

  return newStax
end

function Stax:IsServer()
  return IsDuplicityVersion() == 1
end

function Stax:DependenciesLoaded()
  for _, v in pairs(self._componentLoadStates) do
    if v < LoadState.Loaded then
      return false
    end
  end
  return true
end

function Stax:RequirementsLoaded(requirements)
  if type(requirements) == "table" then
    local allLoaded = true

    for _, req in pairs(requirements) do
      local matched = false

      for comp, compLoad in pairs(self._componentLoadStates) do
        if comp == req then
          if compLoad < LoadState.Loaded then
            return false
          end
          matched = true
        end
      end

      if not matched then
        return false
      end
    end

    return allLoaded
  elseif type(requirements) == "string" then
    if self._componentLoadStates[requirements] then
      if self._componentLoadStates[requirements] < LoadState.Loaded then
        return false
      else
        return true
      end
    else
      return false
    end
  else
    return false
  end

  return false
end

function Stax:ComponentGetterPool(dependency, callback)
  local p = promise.new()

  while not self:DependenciesLoaded() do
    Citizen.Wait(250)
  end

  callback(self._components[dependency])

  return Citizen.Await(p)
end

--- Gets a component
---@generic T
---@param name string
---@return T
function Stax:GetComponent(name)
  return Citizen.CreateThread(function()
    return self:ComponentGetterPool(name, function(Component)
      return Component
    end)
  end)
end

-- local function _switchRequirementOrder(req1, req2)
--   local index1 = nil
--   local index2 = nil

--   for index, requirement in pairs(requiredComponents) do
--     if requirement == req1 then
--       index1 = index
--     elseif requirement == req2 then
--       index2 = index
--     end
--   end

--   if index1 and index2 then
--     requiredComponents[index1] = req2
--     requiredComponents[index2] = req1
--   end
-- end

function Stax:LoadDependencies(dependencies, success)
  local isServer = Stax:IsServer()

  local function _addRequirement(req)
    table.insert(self._requiredComponents, req)
  end

  local function _removeRequirement(index)
    table.remove(self._requiredComponents, index)
  end

  local function _required(required)
    for _, v in pairs(required) do
      table.insert(self._requiredComponents, v)
      self._componentLoadStates[v] = LoadState.Staged
    end
  end

  ---@param callback fun(loaded: boolean)
  local function _load(callback)
    local comp = self._requiredComponents[1]
    print(json.encode(self._requiredComponents))
    
    if not comp then
      return callback(true)
    end

    if self._componentLoadStates[comp] == LoadState.Staged then
      self._componentLoadStates[comp] = LoadState.Requested
    end

    TriggerEvent("Stax::Core::RetrieveComponent", comp, function(component)
      local requirements = component._COMPONENT.REQUIREMENTS

      if #requirements > 0 then
        local allLoaded = self:RequirementsLoaded(requirements)
        if allLoaded then
          if self._componentLoadStates[comp] ~= LoadState.Loaded then
            self._components[comp] = component
            self._componentLoadStates[comp] = LoadState.Loaded
            _removeRequirement(1)
          end
        else
          local addedRequirements = false

          for _, requirement in pairs(requirements) do
            local loaded = self:RequirementsLoaded(requirement)
  
            if not loaded then
              addedRequirements = true
              _addRequirement(requirement)
              self._componentLoadStates[requirement] = LoadState.Staged
            end
          end

          if addedRequirements then
            _removeRequirement(1)
            _addRequirement(comp)
            self._componentLoadStates[comp] = LoadState.Waiting
          end
        end
      else
        if self._componentLoadStates[comp] ~= LoadState.Loaded then
          self._components[comp] = component
          self._componentLoadStates[comp] = LoadState.Loaded
          _removeRequirement(1)
        end
      end
      
      return callback(self:DependenciesLoaded())
    end)
  end

  if isServer then
    _required(dependencies.SERVER)
  else
    _required(dependencies.CLIENT)
  end

  _required(dependencies.SHARED)

  Citizen.CreateThread(function()
    local loading = false
    local allLoaded = false

    while not allLoaded do
      if not loading then
        loading = true
        _load(function (loaded)
          allLoaded = loaded
          loading = false
        end)
      end

      Citizen.Wait(500)
    end

    print("DEPENDENCIES LOADED")
    print(json.encode(self._componentLoadStates))
  end)
end

function Stax:LoadConfig()

end

function Stax:LoadLocale()

end
