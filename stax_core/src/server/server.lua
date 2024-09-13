Citizen.CreateThread(function()
    ---@type StaxDatabase
    local _Database = Stax.Component.FetchAsync("Database")
    local query = _Database.Async({query = [[ SELECT * FROM `persons` LIMIT 1 ]]})

    if query.ok then
        print("QUERY RESULTS: " .. json.encode(query.results))
    end
end)