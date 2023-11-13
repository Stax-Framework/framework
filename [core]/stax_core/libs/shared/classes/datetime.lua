---@class DateTime
---@field private data table
local DateTime = {}
DateTime.__index = DateTime

--- Creates a new instance of DateTime
---@param now boolean Sets the default values to the current date and time
---@return DateTime
function DateTime.New(now)
  local dt = {}
  setmetatable(dt, DateTime)

  dt.data = { year = 0, month = 0, day = 0, hour = 0, minute = 0, second = 0 }

  if now then
    local currentDateTime = os.date("*t")

    dt.data.year = currentDateTime.year
    dt.data.month = currentDateTime.month
    dt.data.day = currentDateTime.day
    dt.data.hour = currentDateTime.hour
    dt.data.minute = currentDateTime.min
    dt.data.second = currentDateTime.sec
  end

  return dt
end

--- Create a new instance of DateTime with default values set
---@param time table
---@return DateTime
function DateTime.NewDefaultSet(time)
  local dt = {}
  setmetatable(dt, DateTime)

  dt.data = { year = 0, month = 0, day = 0, hour = 0, minute = 0, second = 0 }

  for k, _ in pairs(dt.data) do
    for j, l in pairs(time) do
      if k == j then
        dt.data[k] = l
      end
    end
  end

  return dt
end

--- Adds onto the current date and time values
---@param time table
function DateTime:Add(time)
  for k, v in pairs(self.data) do
    for l, j in pairs(time) do
      if k == l then
        self.data[k] = v + j
      end
    end
  end
end

--- Adds from the current date and time values
---@param time table
function DateTime:Subtract(time)
  for k,v in pairs(self.data) do
    for l, j in pairs(time) do
      if k == l then
        self.data[k] = v - j
      end
    end
  end
end

--- Comapres the current DateTime to a different DateTime
---@param time DateTime
---@return table
function DateTime:Compare(time)
  local localDateTime = self:GetDateAndTime()
  local otherDateTime = time:GetDateAndTime()
  local difference = { year = 0, month = 0, day = 0, hour = 0, minute = 0, second = 0 }

  for k, v in pairs(localDateTime) do
    for j, l in pairs(otherDateTime) do
      if k == j then
        difference[k] = v - l
      end
    end
  end

  return difference
end

--- Comapres the current DateTime date to a different DateTime instance date
---@param time DateTime
function DateTime:CompareDate(time)
  local localDate = self:GetDate()
  local otherDate = time:GetDate()
  local difference = { year = 0, month = 0, day = 0 }

  for k, v in pairs(localDate) do
    for j, l in pairs(otherDate) do
      if k == j then
        difference[k] = v - l
      end
    end
  end

  return difference
end

--- Comapres the current DateTime time to a different DateTime instance time
---@param time DateTime
function DateTime:CompareTime(time)
  local localTime = self:GetTime()
  local otherTime = self:GetTime()
  local difference = { hour = 0, minute = 0, second = 0 }
  
  for k, v in pairs(localTime) do
    for j, l in pairs(otherTime) do
      if k == j then
        difference[k] = v - l
      end
    end
  end

  return difference
end

--- Returns the entire date and time
---@return table
function DateTime:GetDateAndTime()
  return self.data
end

--- Returns the current date of the instance
---@return table
function DateTime:GetDate()
  return { year = self.data.year, month = self.data.month, day = self.data.day }
end

function DateTime:GetTime()
  return { hour = self.data.hour, minute = self.data.minute, second = self.data.second }
end

--- Returns the year for the instance
---@return number
function DateTime:GetYear()
  return self.data.year
end

--- Returns the year for the instance
---@return number
function DateTime:GetMonth()
  return self.data.month
end

--- Returns the year for the instance
---@return number
function DateTime:GetDay()
  return self.data.day
end

--- Returns the year for the instance
---@return number
function DateTime:GetHour()
  return self.data.hour
end

--- Returns the year for the instance
---@return number
function DateTime:GetMinute()
  return self.data.minute
end

--- Returns the year for the instance
---@return number
function DateTime:GetSecond()
  return self.data.second
end

--- [ SHARED ]
function Stax.DateTime()
  return DateTime
end