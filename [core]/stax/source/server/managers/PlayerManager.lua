local Manager = {
    Players = {}
}

local function _add(player)
    table.insert(Manager.Players, player)
end

local function _remove(playerSource)
    table.remove(Manager.Players, playerSource)
end

local function _fetch()

end