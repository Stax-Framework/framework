local _DEPENDENCIES_ = {
  CLIENT = {},
  SERVER = {
    "Database"
  },
  SHARED = {
    "Class",
    "Table",
    "Logger"
  }
}

local function _DEPENDENCIES_LOADED_(success)
  print("DEPENDENCIES LOADED")
end

local function _INITIALIZED_()
  print("STAX INITIALIZED")
end

Stax.Init(_DEPENDENCIES_, _DEPENDENCIES_LOADED_, _INITIALIZED_)