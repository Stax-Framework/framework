---@meta

Citizen = {}

---[SHARED] Waits a certain amount of time in milliseconds inside of a threaded environment
---
---@param ms number
function Citizen.Wait(ms) end

_G.Wait = Citizen.Wait

---[SHARED] Creates a thread
---
---@param callback function
function Citizen.CreateThread(callback) end

_G.CreateThread = Citizen.CreateThread

---[SHARED] Stops the thread in its place until a promise is concluded
---
---@param p Promise
function Citizen.Await(p) end

_G.Await = Citizen.Await

---[SHARED] Invokes a native from its hash
---
---@param hash number
function Citizen.InvokeNative(hash) end

_G.InvokeNative = Citizen.InvokeNative

---[SHARED] This will execute the specified function after the specified amount of milliseconds.
---
---@param milliseconds number
---@param callback function
function Citizen.SetTimeout(milliseconds, callback) end

_G.SetTimeout = Citizen.SetTimeout

---[SHARED] Outputs the passed message to any trace listeners, including the console output and the log file. Does not add a newline by itself, therefore suffix a message with "\n".
---
---@param message string
function Citizen.Trace(message) end

_G.Trace = Citizen.Trace