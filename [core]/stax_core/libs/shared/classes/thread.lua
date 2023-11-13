---@enum ThreadState
local ThreadState = {
  Running = 0,
  Paused = 1,
  Destroyed = 2
}

---@class Thread
---@field state ThreadState
---@field time number | nil
local Thread = {}
Thread.__index = Thread

--- Creates new instance of StaxThread
---@param handler function
---@param time number | nil
---@return Thread | nil
function Thread.New(handler, time)
  local thread = {}
  setmetatable(thread, Thread)

  thread.state = ThreadState.Paused
  thread.time = time

  if type(handler) ~= "function" then return nil end

  return thread
end

--- Runs the instance of this thread
---@return Thread
function Thread:Init(callback)
  Citizen.CreateThread(function()
    if not self.time then
      Citizen.CreateThread(function()
        callback()
        self.state = ThreadState.Destroyed
        self:Destroy()
      end)
    else
      Citizen.CreateThread(function()
        while true do
  
          if self.state == ThreadState.Running then
            callback()
          elseif self.state == ThreadState.Destroyed then
            return
          end
  
          Citizen.Wait(self.time)
        end
      end)
    end
  end)

  return self
end

--- Pauses this instance of StaxThread
function Thread:Pause()
  self.state = ThreadState.Paused
end

--- Resumes a paused instance of StaxThread
function Thread:Resume()
  self.state = ThreadState.Running
end

--- Destroys this instance of StaxThread
function Thread:Destroy()
  self.state = ThreadState.Destroyed
end

--- Gets the current state of this instance of StaxThread
---@return ThreadState | string
function Thread:Status()
  return self.state
end

--- Sets the threads iteration timer
---@param time number
function Thread:SetTime(time)
  if not time and time < 0 then return end
  self.time = time
end

--- [ SHARED ]
function Stax.Thread()
  return Thread
end

--- [ SHARED ]
function Stax.ThreadState()
  return ThreadState
end