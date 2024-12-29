local secondsCalcs = {
    year = 31536000,
    month = 2592000,
    week = 604800,
    day = 86400,
    hour = 3600,
    minute = 60,
    second = 1
}

---@class DateTime
---@field COMPONENT Component
---@field time osdate | string
---@field secondsTotal number
local DateTime = {
    COMPONENT = Stax.Component.Init("DateTime")
}
DateTime.__index = DateTime

function DateTime.new(seconds)
    return setmetatable({
        time = os.date("*t", seconds),
        secondsTotal = seconds
    }, DateTime)
end

function DateTime.now()
    local time = os.date("*t")
    local seconds = 0

    if time then
        ---@diagnostic disable-next-line
        for k1, v1 in pairs(time) do
            for k2, v2 in pairs(secondsCalcs) do
                if k1 == k2 then
                    local calcedSeconds = v1 * v2
                    seconds = seconds + calcedSeconds
                end
            end
        end
    end

    return setmetatable({
        time = time,
        secondsTotal = seconds
    }, DateTime)
end

function DateTime.Add(self, timeObject, setTime)
    local seconds = 0

    if timeObject then
        for k1, v1 in pairs(timeObject) do
            for k2, v2 in pairs(secondsCalcs) do
                if k1 == k2 then
                    local calcedSeconds = v1 * v2
                    seconds = seconds + calcedSeconds
                end
            end
        end
    end

    ---@diagnostic disable-next-line
    local newTime = os.date("*t", os.time(self.time) + seconds)

    if setTime then
        self.time = newTime
        self.secondsTotal = seconds
    end

    return newTime
end

function DateTime.Subtract(self, timeObject, setTime)
    local seconds = 0

    if timeObject then
        for k1, v1 in pairs(timeObject) do
            for k2, v2 in pairs(secondsCalcs) do
                if k1 == k2 then
                    local calcedSeconds = v1 * v2
                    seconds = seconds + calcedSeconds
                end
            end
        end
    end

    ---@diagnostic disable-next-line
    local newTime = os.date("*t", os.time(self.time) - seconds)

    if setTime then
        self.time = newTime
        self.secondsTotal = seconds
    end

    return newTime
end

function DateTime.Compare(self, dateTime)
    ---@diagnostic disable-next-line
    local time1 = os.time(self.time)
    local time2 = os.time(dateTime.time)
    local difference = os.difftime(time1, time2)
    return difference
end

function DateTime.GetOSTime(self)
    ---@diagnostic disable-next-line
    return os.time(self.time)
end

function DateTime.ReadableString(self, format)
    ---@diagnostic disable-next-line
    return os.date(format, os.time(self.time))
end

---[[
--- REGISTER COMPONENT
---]]
Stax.Component.Register(DateTime)