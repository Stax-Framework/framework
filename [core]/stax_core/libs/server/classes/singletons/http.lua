---@class HttpSingleton
---@field public Async table
local Http = {
  Async = {}
}

--- Fires an HTTP GET request
---@param url string
---@param payload { headers: table, options: table }
---@param callback fun(status: number, text: string, headers: table)
---@return nil -- CHANGE THIS LATER
function Http.Get(url, payload, callback)
  if not payload.headers then payload.headers = {} end
  if not payload.options then payload.options = {} end
  PerformHttpRequest(url, callback, "GET", "", payload.headers, payload.options)
end

--- Fires an HTTP POST Request
---@param url string
---@param payload { data: table, headers: table, options: table }
---@param callback fun(status: number, text: string, headers: table)
---@return nil -- CHANGE THIS LATER
function Http.Post(url, payload, callback)
  if not payload.data then payload.data = {} end
  if not payload.headers then payload.headers = {} end
  if not payload.options then payload.options = {} end
  PerformHttpRequest(url, callback, "POST", json.encode(payload.data), payload.headers, payload.options)
end

--- Fires an HTTP GET request
---@async
---@param url string
---@param payload { data: table, headers: table, options: table }
function Http.Async.Get(url, payload)
  local p = promise.new()

  Http.Get(url, payload, function(status, text, headers)
    p:resolve({ status = status, text = text, headers = headers })
  end)

  return Citizen.Await(p)
end

--- Fires an HTTP POST request
---@async
---@param url string
---@param payload { data: table, headers: table, options: table }
function Http.Async.Post(url, payload)
  local p = promise.new()

  Http.Post(url, payload, function(status, text, headers)
    p:resolve({ status = status, text = text, headers = headers })
  end)

  return Citizen.Await(p)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.Http()
    return Http
  end
end)