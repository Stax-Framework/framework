local _resource = GetCurrentResourceName()

local function AsyncQuery(queryData)
  local p = promise.new()

  exports[_resource]:SendQuery(queryData.query, queryData.data, function(results)
    p:resolve(results)
  end)

  return Citizen.Await(p)
end

local function SyncQuery(queryData, callback)
  exports[_resource]:SendQuery(queryData.query, queryData.data, callback)
end

exports("AsyncQuery", AsyncQuery)
exports("SyncQuery", SyncQuery)