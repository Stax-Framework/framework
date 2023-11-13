---@enum CameraNames
local CameraNames = {
  default_scripted = "DEFAULT_SCRIPTED_CAMERA",
  default_animated = "DEFAULT_ANIMATED_CAMERA",
  default_spline = "DEFAULT_SPLINE_CAMERA",
  default_scripted_fly = "DEFAULT_SCRIPTED_FLY_CAMERA",
  timed_spline = "TIMED_SPLINE_CAMERA",
  custom_timed_spline = "CUSTOM_TIMED_SPLINE_CAMERA",
  rounded_spline = "ROUNDED_SPLINE_CAMERA",
  smoothed_spline = "SMOOTHED_SPLINE_CAMERA"
}

---@class Camera
---@field public Handle number
local Camera = {}
Camera.__index = Camera

--- Creates a new instance of Camera
---@param camName CameraNames
---@param position { x: number, y: number, z: number }
---@param rotation { x: number, y: number, z: number }
---@param fov number
---@param active boolean
---@return Camera
function Camera.Create(camName, position, rotation, fov, active)
  local newCam = {}
  setmetatable(newCam, Camera)

  newCam.Handle = CreateCamWithParams(camName, position.x, position.y, position.z, rotation.x, rotation.y, rotation.z, fov, active, 2)

  return newCam
end

--- Sets the camera active state
---@param active boolean
function Camera:SetActive(active)
  SetCamActive(self.Handle, active)
end

--- Sets a camera active with interpolation
---@param camTo Camera
---@param duration number
---@param easeLocation number
---@param easeRotation number
function Camera:SetActiveInterp(camTo, duration, easeLocation, easeRotation)
  SetCamActiveWithInterp(camTo.Handle, self, duration, easeLocation, easeRotation)
end

--- Sets the cameras position
---@param position { x: number, y: number, z: number }
function Camera:SetPosition(position)
  SetCamCoord(self.Handle, position.x, position.y, position.z)
end

--- Sets the motion blur strength
---@param strength number
function Camera:SetMotionBlur(strength)
  SetCamMotionBlurStrength(self.Handle, strength)
end

--- Sets the cameras parameters
---@param position { x: number, y: number, z: number }
---@param rotation { x: number, y: number, z: number }
---@param fov number
---@param transitionSpeed number
function Camera:SetParams(position, rotation, fov, transitionSpeed)
  SetCamParams(self.Handle, position.x, position.y, position.z, rotation.z, rotation.y, rotation.z, fov, transitionSpeed, 0, 0, 2)
end

--- Sets the cameras rotation
---@param rotation { x: number, y: number, z: number }
function Camera:SetRotation(rotation)
  SetCamRot(self.Handle, rotation.x, rotation.y, rotation.z, 2)
end

--- Sets the camera shake amplitude
---@param amplitude number
function Camera:ShakeAmplitude(amplitude)
  SetCamShakeAmplitude(self.Handle, amplitude)
end

--- Adds a spline node for the camera
---@param pos { x: number, y: number, z: number }
---@param rot { x: number, y: number, z: number }
---@param length number
---@param slowness number
---@param transitionType number
function Camera:AddSplineNode(pos, rot, length, slowness, transitionType)
  AddCamSplineNode(self.Handle, pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, length, slowness, transitionType)
end

--- Adds a spline node from another camera
---@param camera Camera
---@param length number
function Camera:AddSplineNodeFromCamera(camera, length)
  AddCamSplineNodeUsingCamera(self.Handle, camera.Handle, length, 3)
end

--- Gets the current spline node index
---@return number
function Camera:GetSplineNodeIndex()
  return GetCamSplineNodeIndex(self.Handle)
end

--- Gets the current spline node phase
---@return number
function Camera:GetSplineNodePhase()
  return GetCamSplineNodePhase(self.Handle)
end

--- Gets the current spline phase
---@return number
function Camera:GetSplinePhase()
  return GetCamSplinePhase(self.Handle)
end

--- Gets if the spline is paused or not
---@return boolean
function Camera:IsSplinePaused()
  return IsCamSplinePaused(self.Handle)
end

--- Sets the spline duration
---@param duration number
function Camera:SetSplineDuration(duration)
  SetCamSplineDuration(self.Handle, duration)
end

--- Sets the spline phase
---@param phase number
function Camera:SetSplinePhase(phase)
  SetCamSplinePhase(self.Handle, phase)
end

--- Sets the spline smoothing style
--- https://docs.fivem.net/natives/?_0xD1B0F412F109EA5D
---@param style number
function Camera:SetSplineSmoothingStyle(style)
  SetCamSplineSmoothingStyle(self.Handle, style)
end

Stax.ClientOnly(function()
  function Stax.CameraNames()
    return CameraNames
  end

  function Stax.Camera()
    return Camera
  end
end)