local Immutable = {
    COMPONENT = Stax.Component.Init("Immutable")
}

function Immutable.Value(value)
    local tbl = { value = value }
    return setmetatable({}, {
        __index = tbl,
        __newindex = function(t, k, v)
            error("Attempt to modify immutable value")
        end
    })
end

function Immutable.Table(tbl)
    if type(tbl) ~= "table" then
        error("Expected table type argument", 2)
    end

    local function make_immutable(t)
        if type(t) ~= "table" then return t end

        local new_t = {}

        for k, v in pairs(t) do
            new_t[k] = make_immutable(v)
        end

        return setmetatable({}, {
            __index = new_t,
            __newindex = function(_, k, _)
                error("Attempt to modify immutable value: " .. tostring(k), 2)
            end
        })
    end

    return make_immutable(tbl)
end

function Immutable.Object(obj)
    return setmetatable({}, {
        __index = obj,
        __newindex = function(t, k, v)
            if type(t[k]) == "function" then
                rawset(t, k, v)
            else
                error("Attempt to modify immutable object: " .. tostring(k), 2)
            end
        end
    })
end

Stax.Component.Register(Immutable)