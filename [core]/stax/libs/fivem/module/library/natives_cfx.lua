--- @meta





--- GET_VEHICLE_DASHBOARD_FUEL
---
---@return number
function GetVehicleDashboardFuel()
end

--- GET_VEHICLE_ENGINE_HEALTH
---
---@param vehicle any
---@return number
function GetVehicleEngineHealth(vehicle)
end

--- MUMBLE_CREATE_CHANNEL
---Create a permanent voice channel.
---@param id any
---@return any
function MumbleCreateChannel(id)
end

--- GET_VEHICLE_NUMBER_OF_WHEELS
---
---@param vehicle any
---@return any
function GetVehicleNumberOfWheels(vehicle)
end

--- REGISTER_FONT_ID
---Registers a specified font name for use with text draw commands.
---@param fontName any
---@return any
function RegisterFontId(fontName)
end

--- SEND_DUI_MOUSE_WHEEL
---Injects a 'mouse wheel' event for a DUI object.
---@param duiObject any
---@param deltaY any
---@param deltaX any
---@return any
function SendDuiMouseWheel(duiObject, deltaY, deltaX)
end

--- SET_RESOURCE_KVP_FLOAT_NO_SYNC
---Nonsynchronous [SET_RESOURCE_KVP_FLOAT](#\_0x9ADD2938) operation; see [FLUSH_RESOURCE_KVP](#\_0x5240DA5A).
---@param key any
---@param value number
---@return any
function SetResourceKvpFloatNoSync(key, value)
end

--- GET_INTERIOR_PORTAL_COUNT
---
---@param interiorId any
---@return any
function GetInteriorPortalCount(interiorId)
end

--- GET_ENTITY_HEALTH
---Currently it only works with peds.
---@param entity number
---@return any
function GetEntityHealth(entity)
end

--- GET_PLAYER_INVINCIBLE
---
---@param playerSrc any
---@return boolean
function GetPlayerInvincible(playerSrc)
end

--- SET_PLAYER_MODEL
---Set the model for a specific Player. Note that this will destroy the current Ped for the Player and create a new one, any reference to the old ped will be invalid after calling this.
--- As per usual, make sure to request the model first and wait until it has loaded.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PLAYER_MODEL](?\_0x00A1CADD00108836).**
---@param player number
---@param model any
---@return any
function SetPlayerModel(player, model)
end

--- FIND_FIRST_PICKUP
---
---@param outEntity any
---@return any
function FindFirstPickup(outEntity)
end

--- GET_ENTITY_MAX_HEALTH
---Currently it only works with peds.
---@param entity number
---@return any
function GetEntityMaxHealth(entity)
end

--- SET_WEAPON_RECOIL_SHAKE_AMPLITUDE
---A setter for the recoil shake amplitude of a weapon.
---@param weaponHash any
---@param amplitude number
---@return any
function SetWeaponRecoilShakeAmplitude(weaponHash, amplitude)
end

--- TEMP_BAN_PLAYER
---
---@param playerSrc any
---@param reason any
---@return any
function TempBanPlayer(playerSrc, reason)
end

--- DRAW_GIZMO
---Draws a gizmo. This function supports SDK infrastructure and is not intended to be used directly from your code.
--- 
--- This should be used from JavaScript or another language supporting mutable buffers like ArrayBuffer.
--- 
--- Matrix layout is as follows:
--- 
--- *   Element \[0], \[1] and \[2] should represent the right vector.
--- *   Element \[4], \[5] and \[6] should represent the forward vector.
--- *   Element \[8], \[9] and \[10] should represent the up vector.
--- *   Element \[12], \[13] and \[14] should represent X, Y and Z translation coordinates.
--- *   All other elements should be \[0, 0, 0, 1].
---@param matrixPtr any
---@param id any
---@return boolean
function DrawGizmo(matrixPtr, id)
end

--- GET_ENTITY_ATTACHED_TO
---Gets the entity that this entity is attached to.
---@param entity number
---@return number
function GetEntityAttachedTo(entity)
end

--- GET_VEHICLE_INDICATOR_LIGHTS
---Gets the vehicle indicator light state. 0 = off, 1 = left, 2 = right, 3 = both
---@param vehicle any
---@return any
function GetVehicleIndicatorLights(vehicle)
end

--- SET_AIM_COOLDOWN
---Adds a cooldown between instances of moving and then aiming.
--- Can be optionally used to hinder 'speedboosting'
--- To turn off, set value to 0
---@param value any
---@return any
function SetAimCooldown(value)
end

--- REQUEST_PLAYER_COMMERCE_SESSION
---Requests the specified player to buy the passed SKU. This'll pop up a prompt on the client, which upon acceptance
--- will open the browser prompting further purchase details.
---@param playerSrc any
---@param skuId any
---@return any
function RequestPlayerCommerceSession(playerSrc, skuId)
end

--- SET_AUDIO_SUBMIX_EFFECT_PARAM_INT
---Sets an integer parameter for a submix effect.
---@param submixId any
---@param effectSlot any
---@param paramIndex any
---@param paramValue any
---@return any
function SetAudioSubmixEffectParamInt(submixId, effectSlot, paramIndex, paramValue)
end

--- DISABLE_EDITOR_RUNTIME
---Disables the editor runtime mode, changing game behavior to not track entity metadata.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@return any
function DisableEditorRuntime()
end

--- DOES_PLAYER_OWN_SKU_EXT
---Requests whether or not the player owns the specified package.
---@param playerSrc any
---@param skuId any
---@return boolean
function DoesPlayerOwnSkuExt(playerSrc, skuId)
end

--- GET_INTERIOR_PORTAL_CORNER_POSITION
---
---@param interiorId any
---@param portalIndex any
---@param cornerIndex any
---@param posX any
---@param posY any
---@param posZ any
---@return any
function GetInteriorPortalCornerPosition(interiorId, portalIndex, cornerIndex, posX, posY, posZ)
end

--- PERFORM_HTTP_REQUEST_INTERNAL_EX
---
---@param requestData any
---@return any
function PerformHttpRequestInternalEx(requestData)
end

--- SEND_DUI_MESSAGE
---Sends a message to the specific DUI root page. This is similar to SEND_NUI_MESSAGE.
---@param duiObject any
---@param jsonString any
---@return any
function SendDuiMessage(duiObject, jsonString)
end

--- SET_RUNTIME_TEXTURE_ARGB_DATA
---
---@param tex any
---@param buffer any
---@param length any
---@return boolean
function SetRuntimeTextureArgbData(tex, buffer, length)
end

--- SET_VEHICLE_XENON_LIGHTS_CUSTOM_COLOR
---Sets custom vehicle xenon lights color, allowing to use RGB palette. The game will ignore lights color set by [\_SET_VEHICLE_XENON_LIGHTS_COLOR](#\_0xE41033B25D003A07) when custom color is active. This native is not synced between players. Requires xenon lights mod to be set on vehicle.
---@param vehicle any
---@param red any
---@param green any
---@param blue any
---@return any
function SetVehicleXenonLightsCustomColor(vehicle, red, green, blue)
end

--- SET_STATE_BAG_VALUE
---Internal function for setting a state bag value.
---@param bagName any
---@param keyName any
---@param valueData any
---@param valueLength any
---@param replicated boolean
---@return any
function SetStateBagValue(bagName, keyName, valueData, valueLength, replicated)
end

--- SET_VEHICLE_NUMBER_PLATE_TEXT
---**This is the server-side RPC native equivalent of the client native [SET_VEHICLE_NUMBER_PLATE_TEXT](?\_0x95A88F0B409CDA47).**
---@param vehicle any
---@param plateText any
---@return any
function SetVehicleNumberPlateText(vehicle, plateText)
end

--- GET_PED_HAIR_HIGHLIGHT_COLOR
---A getter for [\_SET_PED_HAIR_COLOR](#\_0x4CFFC65454C93A49). Returns -1 if fails to get.
---@param ped number
---@return any
function GetPedHairHighlightColor(ped)
end

--- GET_VEHICLE_WHEEL_TYPE
---
---@param vehicle any
---@return any
function GetVehicleWheelType(vehicle)
end

--- SCHEDULE_RESOURCE_TICK
---Schedules the specified resource to run a tick as soon as possible, bypassing the server's fixed tick rate.
---@param resourceName any
---@return any
function ScheduleResourceTick(resourceName)
end

--- SET_VEHICLE_HANDLING_FLOAT
---Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using SET_HANDLING_FLOAT, this might require some experimentation.
--- Example: SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', 360.0)
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value number
---@return any
function SetVehicleHandlingFloat(vehicle, class_, fieldName, value)
end

--- TRIGGER_LATENT_SERVER_EVENT_INTERNAL
---The backing function for TriggerLatentServerEvent.
---@param eventName any
---@param eventPayload any
---@param payloadLength any
---@param bps any
---@return any
function TriggerLatentServerEventInternal(eventName, eventPayload, payloadLength, bps)
end

--- GET_EXTERNAL_KVP_INT
---A getter for [SET_RESOURCE_KVP_INT](#\_0x6A2B1E8), but for a specified resource.
---@param resource any
---@param key any
---@return any
function GetExternalKvpInt(resource, key)
end

--- GET_INTERIOR_PORTAL_ENTITY_FLAG
---
---@param interiorId any
---@param portalIndex any
---@param entityIndex any
---@return any
function GetInteriorPortalEntityFlag(interiorId, portalIndex, entityIndex)
end

--- GET_VEHICLE_BODY_HEALTH
---
---@param vehicle any
---@return number
function GetVehicleBodyHealth(vehicle)
end

--- GET_VEHICLE_WHEEL_POWER
---Gets power being sent to a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelPower(vehicle, wheelIndex)
end

--- CLEAR_PLAYER_WANTED_LEVEL
---This executes at the same as speed as PLAYER::SET_PLAYER_WANTED_LEVEL(player, 0, false);
--- PLAYER::GET_PLAYER_WANTED_LEVEL(player); executes in less than half the time. Which means that it's worth first checking if the wanted level needs to be cleared before clearing. However, this is mostly about good code practice and can important in other situations. The difference in time in this example is negligible.
--- 
--- **This is the server-side RPC native equivalent of the client native [CLEAR_PLAYER_WANTED_LEVEL](?\_0xB302540597885499).**
---@param player number
---@return any
function ClearPlayerWantedLevel(player)
end

--- _SET_PED_HEAD_OVERLAY_COLOR
---
--- Used for freemode (online) characters.
--- Called after SET_PED_HEAD_OVERLAY().
--- 
--- 
--- **Note:**
--- You may need to call [SetPedHeadBlendData](#0x9414E18B9434C2FE) prior to calling this native in order for it to work.
--- 
--- **This is the server-side RPC native equivalent of the client native [\_SET_PED_HEAD_OVERLAY_COLOR](?\_0x497BF74A7B9CB952).**
---@param ped number
---@param overlayID any
---@param colorType any
---@param colorID any
---@param secondColorID any
---@return any
function SetPedHeadOverlayColor(ped, overlayID, colorType, colorID, secondColorID)
end

--- ADD_MINIMAP_OVERLAY
---Loads a minimap overlay from a GFx file in the current resource.
---@param name any
---@return any
function AddMinimapOverlay(name)
end

--- GET_PED_ARMOUR
---
---@param ped number
---@return any
function GetPedArmour(ped)
end

--- IS_NUI_FOCUS_KEEPING_INPUT
---Checks if keyboard input is enabled during NUI focus using SET_NUI_FOCUS_KEEP_INPUT.
---@return boolean
function IsNuiFocusKeepingInput()
end

--- CREATE_VEHICLE
---Creates a vehicle with the specified model at the specified position. This vehicle will initially be owned by the creating
--- script as a mission entity, and the model should be loaded already (e.g. using REQUEST_MODEL).
--- 
--- 
--- NativeDB Added Parameter 8: BOOL p7
--- 
--- 
--- **This is the server-side RPC native equivalent of the client native [CREATE_VEHICLE](?\_0xAF35D0D2583051B0).**
---@param modelHash any
---@param x number
---@param y number
---@param z number
---@param heading number
---@param isNetwork boolean
---@param netMissionEntity boolean
---@return number
function CreateVehicle(modelHash, x, y, z, heading, isNetwork, netMissionEntity)
end

--- _SET_PED_FACE_FEATURE
---Sets the various freemode face features, e.g. nose length, chin shape.
--- **Indexes (From 0 to 19):**
--- Parentheses indicate morph scale/direction as in (-1.0 to 1.0)
--- 
--- *   **0**: Nose Width (Thin/Wide)
--- *   **1**: Nose Peak (Up/Down)
--- *   **2**: Nose Length (Long/Short)
--- *   **3**: Nose Bone Curveness (Crooked/Curved)
--- *   **4**: Nose Tip (Up/Down)
--- *   **5**: Nose Bone Twist (Left/Right)
--- *   **6**: Eyebrow (Up/Down)
--- *   **7**: Eyebrow (In/Out)
--- *   **8**: Cheek Bones (Up/Down)
--- *   **9**: Cheek Sideways Bone Size (In/Out)
--- *   **10**: Cheek Bones Width (Puffed/Gaunt)
--- *   **11**: Eye Opening (Both) (Wide/Squinted)
--- *   **12**: Lip Thickness (Both) (Fat/Thin)
--- *   **13**: Jaw Bone Width (Narrow/Wide)
--- *   **14**: Jaw Bone Shape (Round/Square)
--- *   **15**: Chin Bone (Up/Down)
--- *   **16**: Chin Bone Length (In/Out or Backward/Forward)
--- *   **17**: Chin Bone Shape (Pointed/Square)
--- *   **18**: Chin Hole (Chin Bum)
--- *   **19**: Neck Thickness (Thin/Thick)
---     **Note:**
---     You may need to call [SetPedHeadBlendData](#0x9414E18B9434C2FE) prior to calling this native in order for it to work.
--- 
--- **This is the server-side RPC native equivalent of the client native [\_SET_PED_FACE_FEATURE](?\_0x71A5C1DBA060049E).**
---@param ped number
---@param index any
---@param scale number
---@return any
function SetPedFaceFeature(ped, index, scale)
end

--- DOOR_SYSTEM_GET_ACTIVE
---Returns a list of door system entries: a door system hash (see [ADD_DOOR_TO_SYSTEM](#\_0x6F8838D03D1DC226)) and its object handle.
--- 
--- The data returned adheres to the following layout:
--- 
--- 
--- [{doorHash1, doorHandle1}, ..., {doorHashN, doorHandleN}]
--- 
---@return any
function DoorSystemGetActive()
end

--- GET_VEHICLE_DASHBOARD_OIL_PRESSURE
---
---@return number
function GetVehicleDashboardOilPressure()
end

--- SET_ROUTING_BUCKET_ENTITY_LOCKDOWN_MODE
---Sets the entity lockdown mode for a specific routing bucket.
--- 
--- Lockdown modes are:
--- 
--- | Mode       | Meaning                                                    |
--- | ---------- | ---------------------------------------------------------- |
--- | strict   | No entities can be created by clients at all.              |
--- | relaxed  | Only script-owned entities created by clients are blocked. |
--- | inactive | Clients can create any entity they want.                   |
---@param bucketId any
---@param mode any
---@return any
function SetRoutingBucketEntityLockdownMode(bucketId, mode)
end

--- FIND_NEXT_OBJECT
---
---@param findHandle any
---@param outEntity any
---@return boolean
function FindNextObject(findHandle, outEntity)
end

--- GET_ENTITY_MODEL
---
---@param entity number
---@return any
function GetEntityModel(entity)
end

--- SET_MODEL_HEADLIGHT_CONFIGURATION
---
---@param modelHash any
---@param ratePerSecond number
---@param headlightRotation number
---@param invertRotation boolean
---@return any
function SetModelHeadlightConfiguration(modelHash, ratePerSecond, headlightRotation, invertRotation)
end

--- EXECUTE_COMMAND
---
---@param commandString any
---@return any
function ExecuteCommand(commandString)
end

--- SET_GAME_TYPE
---
---@param gametypeName any
---@return any
function SetGameType(gametypeName)
end

--- SET_ROPE_LENGTH_CHANGE_RATE
---Set's the ropes length change rate, which is the speed that rope should wind if started.
---@param rope any
---@param lengthChangeRate number
---@return any
function SetRopeLengthChangeRate(rope, lengthChangeRate)
end

--- SET_PLAYER_TALKING_OVERRIDE
---the status of default voip system. It affects on NETWORK_IS_PLAYER_TALKING and mp_facial animation.
--- This function doesn't need to be called every frame, it works like a switcher.
---@param player number
---@param state boolean
---@return any
function SetPlayerTalkingOverride(player, state)
end

--- CREATE_PED
---Creates a ped (biped character, pedestrian, actor) with the specified model at the specified position and heading.
--- This ped will initially be owned by the creating script as a mission entity, and the model should be loaded already
--- (e.g. using REQUEST_MODEL).
--- 
--- **This is the server-side RPC native equivalent of the client native [CREATE_PED](?\_0xD49F9B0955C367DE).**
---@param pedType any
---@param modelHash any
---@param x number
---@param y number
---@param z number
---@param heading number
---@param isNetwork boolean
---@param bScriptHostPed boolean
---@return number
function CreatePed(pedType, modelHash, x, y, z, heading, isNetwork, bScriptHostPed)
end

--- ADD_TEXT_ENTRY
---
---@param entryKey any
---@param entryText any
---@return any
function AddTextEntry(entryKey, entryText)
end

--- GET_VEHICLE_DASHBOARD_VACUUM
---
---@return number
function GetVehicleDashboardVacuum()
end

--- REGISTER_KEY_MAPPING
---Registers a key mapping for the current resource.
--- 
--- See the related [cookbook post](https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/) for more information.
---@param commandString any
---@param description any
---@param defaultMapper any
---@param defaultParameter any
---@return any
function RegisterKeyMapping(commandString, description, defaultMapper, defaultParameter)
end

--- _SET_PED_HAIR_COLOR
---Used for freemode (online) characters.
--- 
--- **This is the server-side RPC native equivalent of the client native [\_SET_PED_HAIR_COLOR](?\_0x4CFFC65454C93A49).**
---@param ped number
---@param colorID any
---@param highlightColorID any
---@return any
function SetPedHairColor(ped, colorID, highlightColorID)
end

--- TASK_WARP_PED_INTO_VEHICLE
---**This is the server-side RPC native equivalent of the client native [TASK_WARP_PED_INTO_VEHICLE](?\_0x9A7D091411C5F684).**
---@param ped number
---@param vehicle any
---@param seatIndex any
---@return any
function TaskWarpPedIntoVehicle(ped, vehicle, seatIndex)
end

--- GET_MAP_ZOOM_DATA_LEVEL
---Returns the zoom level data by index from mapzoomdata.meta file.
---@param index any
---@param zoomScale any
---@param zoomSpeed any
---@param scrollSpeed any
---@param tilesX any
---@param tilesY any
---@return boolean
function GetMapZoomDataLevel(index, zoomScale, zoomSpeed, scrollSpeed, tilesX, tilesY)
end

--- MUMBLE_SET_ACTIVE
---
---@param state boolean
---@return any
function MumbleSetActive(state)
end

--- SET_PLAYER_CULLING_RADIUS
---Sets the culling radius for the specified player.
--- Set to 0.0 to reset.
---@param playerSrc any
---@param radius number
---@return any
function SetPlayerCullingRadius(playerSrc, radius)
end

--- GET_ACTIVE_PLAYERS
---Returns all player indices for 'active' physical players known to the client.
--- The data returned adheres to the following layout:
--- 
--- 
--- [127, 42, 13, 37]
--- 
---@return any
function GetActivePlayers()
end

--- GET_PLAYER_STAMINA
---
---@param playerId number
---@return number
function GetPlayerStamina(playerId)
end

--- SET_CONVAR
---
---@param varName any
---@param value any
---@return any
function SetConvar(varName, value)
end

--- TRIGGER_EVENT_INTERNAL
---The backing function for TriggerEvent.
---@param eventName any
---@param eventPayload any
---@param payloadLength any
---@return any
function TriggerEventInternal(eventName, eventPayload, payloadLength)
end

--- SET_ENTITY_VELOCITY
---Note that the third parameter(denoted as z) is "up and down" with positive numbers encouraging upwards movement.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_ENTITY_VELOCITY](?\_0x1C99BB7B6E96D16F).**
---@param entity number
---@param x number
---@param y number
---@param z number
---@return any
function SetEntityVelocity(entity, x, y, z)
end

--- EXPERIMENTAL_SAVE_CLONE_CREATE
---This native is not implemented.
---@param entity number
---@return any
function ExperimentalSaveCloneCreate(entity)
end

--- GET_PED_EYE_COLOR
---A getter for [\_SET_PED_EYE_COLOR](#\_0x50B56988B170AFDF). Returns -1 if fails to get.
---@param ped number
---@return any
function GetPedEyeColor(ped)
end

--- GET_VEHICLE_INTERIOR_COLOUR
---
---@param vehicle any
---@param color any
---@return any
function GetVehicleInteriorColour(vehicle, color)
end

--- IS_VEHICLE_ALARM_SET
---
---@param vehicle any
---@return boolean
function IsVehicleAlarmSet(vehicle)
end

--- SEND_DUI_MOUSE_MOVE
---Injects a 'mouse move' event for a DUI object. Coordinates are in browser space.
---@param duiObject any
---@param x any
---@param y any
---@return any
function SendDuiMouseMove(duiObject, x, y)
end

--- SET_VEHICLE_STEERING_SCALE
---
---@param vehicle any
---@param scale number
---@return any
function SetVehicleSteeringScale(vehicle, scale)
end

--- GET_WEAPON_COMPONENT_CLIP_SIZE
---A getter for ClipSize in a weapon component.
---@param componentHash any
---@return any
function GetWeaponComponentClipSize(componentHash)
end

--- SET_INTERIOR_PORTAL_FLAG
---
---@param interiorId any
---@param portalIndex any
---@param flag any
---@return any
function SetInteriorPortalFlag(interiorId, portalIndex, flag)
end

--- GET_EXTERNAL_KVP_FLOAT
---A getter for [SET_RESOURCE_KVP_FLOAT](#\_0x9ADD2938), but for a specified resource.
---@param resource any
---@param key any
---@return number
function GetExternalKvpFloat(resource, key)
end

--- GET_RUNTIME_TEXTURE_WIDTH
---Gets the width of the specified runtime texture.
---@param tex any
---@return any
function GetRuntimeTextureWidth(tex)
end

--- GET_VEHICLE_NUMBER_PLATE_TEXT
---
---@param vehicle any
---@return any
function GetVehicleNumberPlateText(vehicle)
end

--- GET_VEHICLE_EXTRA_COLOURS
---
---@param vehicle any
---@param pearlescentColor any
---@param wheelColor any
---@return any
function GetVehicleExtraColours(vehicle, pearlescentColor, wheelColor)
end

--- OVERRIDE_VEHICLE_PEDS_CAN_STAND_ON_TOP_FLAG
---Overrides whether or not peds can stand on top of the specified vehicle.
--- 
--- Note this flag is not replicated automatically, you will have to manually do so.
---@param vehicle any
---@param can boolean
---@return any
function OverrideVehiclePedsCanStandOnTopFlag(vehicle, can)
end

--- SET_MINIMAP_OVERLAY_DISPLAY
---Sets the display info for a minimap overlay.
---@param miniMap any
---@param x number
---@param y number
---@param xScale number
---@param yScale number
---@param alpha number
---@return any
function SetMinimapOverlayDisplay(miniMap, x, y, xScale, yScale, alpha)
end

--- RESET_MAPDATA_ENTITY_MATRIX
---Resets mapdata entity transform matrix to its original state.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param mapDataHash any
---@param entityInternalIdx any
---@return boolean
function ResetMapdataEntityMatrix(mapDataHash, entityInternalIdx)
end

--- GET_PLAYER_WEAPON_DEFENSE_MODIFIER_2
---A getter for [\_SET_PLAYER_WEAPON_DEFENSE_MODIFIER\_2](#\_0xBCFDE9EDE4CF27DC).
---@param playerId number
---@return number
function GetPlayerWeaponDefenseModifier2(playerId)
end

--- GET_VEHICLE_NEXT_GEAR
---
---@param vehicle any
---@return any
function GetVehicleNextGear(vehicle)
end

--- GET_WEAPON_COMPONENT_RANGE_MODIFIER
---A getter for CWeaponFallOffModifier range modifier value in a weapon component.
---@param componentHash any
---@return number
function GetWeaponComponentRangeModifier(componentHash)
end

--- GET_VEHICLE_WHEEL_TIRE_COLLIDER_WIDTH
---
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelTireColliderWidth(vehicle, wheelIndex)
end

--- GET_WEAPON_COMPONENT_RETICULE_HASH
---A getter for ReticuleHash in a weapon scope component.
---@param componentHash any
---@return any
function GetWeaponComponentReticuleHash(componentHash)
end

--- MUMBLE_SET_SERVER_ADDRESS
---Changes the Mumble server address to connect to, and reconnects to the new address.
---@param address any
---@param port any
---@return any
function MumbleSetServerAddress(address, port)
end

--- CREATE_RUNTIME_TEXTURE_FROM_IMAGE
---Creates a runtime texture from the specified file in the current resource or a base64 data URL.
---@param txd any
---@param txn any
---@param fileName any
---@return any
function CreateRuntimeTextureFromImage(txd, txn, fileName)
end

--- DELETE_RESOURCE_KVP_NO_SYNC
---Nonsynchronous [DELETE_RESOURCE_KVP](#\_0x7389B5DF) operation; see [FLUSH_RESOURCE_KVP](#\_0x5240DA5A).
---@param key any
---@return any
function DeleteResourceKvpNoSync(key)
end

--- GET_VEHICLE_ROOF_LIVERY
---
---@param vehicle any
---@return any
function GetVehicleRoofLivery(vehicle)
end

--- REMOVE_WEAPON_FROM_PED
---This native removes a specified weapon from your selected ped.
--- Weapon Hashes: pastebin.com/0wwDZgkF
--- Example:
--- C#:
--- Function.Call(Hash.REMOVE_WEAPON_FROM_PED, Game.Player.Character, 0x99B507EA);
--- C++:
--- WEAPON::REMOVE_WEAPON_FROM_PED(PLAYER::PLAYER_PED_ID(), 0x99B507EA);
--- The code above removes the knife from the player.
--- 
--- **This is the server-side RPC native equivalent of the client native [REMOVE_WEAPON_FROM_PED](?\_0x4899CB088EDF59B8).**
---@param ped number
---@param weaponHash any
---@return any
function RemoveWeaponFromPed(ped, weaponHash)
end

--- SELECT_ENTITY_AT_CURSOR
---Gets the selected entity at the current mouse cursor position, and changes the current selection depth. This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param hitFlags any
---@param precise boolean
---@return number
function SelectEntityAtCursor(hitFlags, precise)
end

--- DROP_PLAYER
---
---@param playerSrc any
---@param reason any
---@return any
function DropPlayer(playerSrc, reason)
end

--- CREATE_DRY_VOLUME
---Creates a volume where water effects do not apply.
--- Useful for preventing water collisions from flooding areas underneath them.
--- This has no effect on waterquads, only water created from drawables and collisions.
--- Don't create volumes when your local ped is swimming (e.g. use IS_PED_SWIMMING in your scripts before you call this)
---@param xMin number
---@param yMin number
---@param zMin number
---@param xMax number
---@param yMax number
---@param zMax number
---@return any
function CreateDryVolume(xMin, yMin, zMin, xMax, yMax, zMax)
end

--- ENTER_CURSOR_MODE
---Enters cursor mode, suppressing mouse movement to the game and displaying a mouse cursor instead. This function supports
--- SDK infrastructure and is not intended to be used directly from your code.
---@return any
function EnterCursorMode()
end

--- MUMBLE_REMOVE_VOICE_TARGET_PLAYER_BY_SERVER_ID
---Removes the specified player from the user's voice targets.
--- 
--- Performs the opposite operation of [MUMBLE_ADD_VOICE_TARGET_PLAYER_BY_SERVER_ID](#\_0x25F2B65F)
---@param targetId any
---@param serverId any
---@return any
function MumbleRemoveVoiceTargetPlayerByServerId(targetId, serverId)
end

--- LOAD_RESOURCE_FILE
---Reads the contents of a text file in a specified resource.
--- If executed on the client, this file has to be included in files in the resource manifest.
--- Example: local data = LoadResourceFile("devtools", "data.json")
---@param resourceName any
---@param fileName any
---@return any
function LoadResourceFile(resourceName, fileName)
end

--- SET_VEHICLE_WHEEL_SIZE
---Sets vehicle's wheels' size (size is the same for all the wheels, cannot get/set specific wheel of vehicle).
--- Only works on non-default wheels.
--- Returns whether change was successful (can be false if trying to set size for non-default wheels).
---@param vehicle any
---@param size number
---@return boolean
function SetVehicleWheelSize(vehicle, size)
end

--- GET_INVOKING_RESOURCE
---
---@return any
function GetInvokingResource()
end

--- GET_PLAYER_FROM_INDEX
---
---@param index any
---@return any
function GetPlayerFromIndex(index)
end

--- GET_VEHICLE_DOOR_LOCK_STATUS
---lua
--- enum_VehicleLockStatus = {
---     None = 0,
---     Locked = 2,
---     LockedForPlayer = 3,
---     StickPlayerInside = 4, -- Doesn't allow players to exit the vehicle with the exit vehicle key.
---     CanBeBrokenInto = 7, -- Can be broken into the car. If the glass is broken, the value will be set to 1
---     CanBeBrokenIntoPersist = 8, -- Can be broken into persist
---     CannotBeTriedToEnter = 10, -- Cannot be tried to enter (Nothing happens when you press the vehicle enter key).
--- }
--- 
--- 
--- It should be [noted](https://forum.cfx.re/t/4863241) that while the [client-side command](#\_0x25BC98A59C2EA962) and its
--- setter distinguish between states 0 (unset) and 1 (unlocked), the game will synchronize both as state 0, so the server-side
--- command will return only '0' if unlocked.
---@param vehicle any
---@return any
function GetVehicleDoorLockStatus(vehicle)
end

--- SET_AUDIO_SUBMIX_EFFECT_PARAM_FLOAT
---Sets a floating-point parameter for a submix effect.
---@param submixId any
---@param effectSlot any
---@param paramIndex any
---@param paramValue number
---@return any
function SetAudioSubmixEffectParamFloat(submixId, effectSlot, paramIndex, paramValue)
end

--- GET_PLAYER_MAX_ARMOUR
---
---@param playerSrc any
---@return any
function GetPlayerMaxArmour(playerSrc)
end

--- GET_VEHICLE_DOOR_STATUS
---
---@param vehicle any
---@return any
function GetVehicleDoorStatus(vehicle)
end

--- GET_VEHICLE_DASHBOARD_LIGHTS
---Gets the state of the player vehicle's dashboard lights as a bit set
--- indicator_left = 1
--- indicator_right = 2
--- handbrakeLight = 4
--- engineLight = 8
--- ABSLight = 16
--- gasLight = 32
--- oilLight = 64
--- headlights = 128
--- highBeam = 256
--- batteryLight = 512
---@return any
function GetVehicleDashboardLights()
end

--- SET_VEHICLE_COLOURS
---colorPrimary & colorSecondary are the paint indexes for the vehicle.
--- For a list of valid paint indexes, view: pastebin.com/pwHci0xK
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_COLOURS](?\_0x4F1D4BE3A7F24601).**
---@param vehicle any
---@param colorPrimary any
---@param colorSecondary any
---@return any
function SetVehicleColours(vehicle, colorPrimary, colorSecondary)
end

--- DOES_ENTITY_EXIST
---
---@param entity any
---@return boolean
function DoesEntityExist(entity)
end

--- SET_CURSOR_LOCATION
---
---@param x number
---@param y number
---@return boolean
function SetCursorLocation(x, y)
end

--- SET_VEHICLE_BODY_HEALTH
---p2 often set to 1000.0 in the decompiled scripts.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_BODY_HEALTH](?\_0xB77D05AC8C78AADB).**
---@param vehicle any
---@param value number
---@return any
function SetVehicleBodyHealth(vehicle, value)
end

--- SET_DUI_URL
---Navigates the specified DUI browser to a different URL.
---@param duiObject any
---@param url any
---@return any
function SetDuiUrl(duiObject, url)
end

--- SET_ROUTING_BUCKET_POPULATION_ENABLED
---Sets whether or not the specified routing bucket has automatically-created population enabled.
---@param bucketId any
---@param mode boolean
---@return any
function SetRoutingBucketPopulationEnabled(bucketId, mode)
end

--- SET_RESOURCE_KVP_NO_SYNC
---Nonsynchronous [SET_RESOURCE_KVP](#\_0x21C7A35B) operation; see [FLUSH_RESOURCE_KVP](#\_0x5240DA5A).
---@param key any
---@param value any
---@return any
function SetResourceKvpNoSync(key, value)
end

--- CREATE_OBJECT_NO_OFFSET
---Creates an object (prop) with the specified model centered at the specified position.
--- This object will initially be owned by the creating script as a mission entity, and the model should be loaded already (e.g. using REQUEST_MODEL).
--- 
--- **This is the server-side RPC native equivalent of the client native [CREATE_OBJECT_NO_OFFSET](?\_0x9A294B2138ABB884).**
---@param modelHash any
---@param x number
---@param y number
---@param z number
---@param isNetwork boolean
---@param netMissionEntity boolean
---@param doorFlag boolean
---@return number
function CreateObjectNoOffset(modelHash, x, y, z, isNetwork, netMissionEntity, doorFlag)
end

--- TASK_EVERYONE_LEAVE_VEHICLE
---**This is the server-side RPC native equivalent of the client native [TASK_EVERYONE_LEAVE_VEHICLE](?\_0x7F93691AB4B92272).**
---@param vehicle any
---@return any
function TaskEveryoneLeaveVehicle(vehicle)
end

--- GET_VEHICLE_WHEEL_HEALTH
---
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelHealth(vehicle, wheelIndex)
end

--- GET_VEHICLE_OIL_LEVEL
---
---@param vehicle any
---@return number
function GetVehicleOilLevel(vehicle)
end

--- IS_VEHICLE_INTERIOR_LIGHT_ON
---
---@param vehicle any
---@return boolean
function IsVehicleInteriorLightOn(vehicle)
end

--- GET_PED_MODEL_PERSONALITY
---Gets a ped model's personality type.
---@param modelHash any
---@return any
function GetPedModelPersonality(modelHash)
end

--- NETWORK_GET_FIRST_ENTITY_OWNER
---Returns the first owner ID of the specified entity.
---@param entity number
---@return any
function NetworkGetFirstEntityOwner(entity)
end

--- GET_INTERIOR_ROOM_EXTENTS
---
---@param interiorId any
---@param roomIndex any
---@param bbMinX any
---@param bbMinY any
---@param bbMinZ any
---@param bbMaxX any
---@param bbMaxY any
---@param bbMaxZ any
---@return any
function GetInteriorRoomExtents(interiorId, roomIndex, bbMinX, bbMinY, bbMinZ, bbMaxX, bbMaxY, bbMaxZ)
end

--- GET_PED_MAX_HEALTH
---
---@param ped number
---@return any
function GetPedMaxHealth(ped)
end

--- GET_PLAYER_MELEE_WEAPON_DEFENSE_MODIFIER
---A getter for [SET_PLAYER_MELEE_WEAPON_DEFENSE_MODIFIER](#\_0xAE540335B4ABC4E2).
---@param playerId number
---@return number
function GetPlayerMeleeWeaponDefenseModifier(playerId)
end

--- GET_AMBIENT_VEHICLE_RANGE_MULTIPLIER
---A getter for [SET_AMBIENT_VEHICLE_RANGE_MULTIPLIER_THIS_FRAME](#\_0x90B6DA738A9A25DA).
---@return number
function GetAmbientVehicleRangeMultiplier()
end

--- DISABLE_WORLDHORIZON_RENDERING
---Disables the game's world horizon lods rendering (see farlods.#dd).
--- Using the island hopper natives might also affect this state.
---@param state boolean
---@return any
function DisableWorldhorizonRendering(state)
end

--- DRAW_LINE_2D
---Like DRAW_RECT, but it's a line.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param width number
---@param r any
---@param g any
---@param b any
---@param a any
---@return any
function DrawLine2D(x1, y1, x2, y2, width, r, g, b, a)
end

--- END_FIND_KVP
---
---@param handle any
---@return any
function EndFindKvp(handle)
end

--- MUMBLE_GET_TALKER_PROXIMITY
---
---@return number
function MumbleGetTalkerProximity()
end

--- SET_VEHICLE_WHEEL_TRACTION_VECTOR_LENGTH
---Sets the traction vector length of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@param length number
---@return any
function SetVehicleWheelTractionVectorLength(vehicle, wheelIndex, length)
end

--- LOAD_PLAYER_COMMERCE_DATA
---Requests the commerce data for the specified player, including the owned SKUs. Use IS_PLAYER_COMMERCE_INFO_LOADED to check if it has loaded.
---@param playerSrc any
---@return any
function LoadPlayerCommerceData(playerSrc)
end

--- REGISTER_RAW_NUI_CALLBACK
---
---@param callbackType any
---@param callback any
---@return any
function RegisterRawNuiCallback(callbackType, callback)
end

--- SET_MANUAL_SHUTDOWN_LOADING_SCREEN_NUI
---Sets whether or not SHUTDOWN_LOADING_SCREEN automatically shuts down the NUI frame for the loading screen. If this is enabled,
--- you will have to manually invoke SHUTDOWN_LOADING_SCREEN_NUI whenever you want to hide the NUI loading screen.
---@param manualShutdown boolean
---@return any
function SetManualShutdownLoadingScreenNui(manualShutdown)
end

--- SET_VEHICLE_CUSTOM_SECONDARY_COLOUR
---p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_CUSTOM_SECONDARY_COLOUR](?\_0x36CED73BFED89754).**
---@param vehicle any
---@param r any
---@param g any
---@param b any
---@return any
function SetVehicleCustomSecondaryColour(vehicle, r, g, b)
end

--- ADD_AUDIO_SUBMIX_OUTPUT
---Adds an output for the specified audio submix.
---@param submixId any
---@param outputSubmixId any
---@return any
function AddAudioSubmixOutput(submixId, outputSubmixId)
end

--- GET_GAME_POOL
---Returns a list of entity handles (script GUID) for all entities in the specified pool - the data returned is an array as
--- follows:
--- 
--- json
--- [ 770, 1026, 1282, 1538, 1794, 2050, 2306, 2562, 2818, 3074, 3330, 3586, 3842, 4098, 4354, 4610, ...]
--- 
--- 
--- ### Supported pools
--- 
--- *   CPed: Peds (including animals) and players.
--- *   CObject: Objects (props), doors, and projectiles.
--- *   CVehicle: Vehicles.
--- *   CPickup: Pickups.
---@param poolName any
---@return any
function GetGamePool(poolName)
end

--- GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER
---Currently it only works when set to "all players".
---@param vehicle any
---@return any
function GetVehicleDoorsLockedForPlayer(vehicle)
end

--- INVOKE_FUNCTION_REFERENCE
---
---@param referenceIdentity any
---@param argsSerialized any
---@param argsLength any
---@param retvalLength any
---@return any
function InvokeFunctionReference(referenceIdentity, argsSerialized, argsLength, retvalLength)
end

--- MUMBLE_SET_AUDIO_OUTPUT_DISTANCE
---Sets the current output distance. The player will be able to hear other players talking within this distance.
---@param distance number
---@return any
function MumbleSetAudioOutputDistance(distance)
end

--- SET_CONVAR_SERVER_INFO
---
---@param varName any
---@param value any
---@return any
function SetConvarServerInfo(varName, value)
end

--- SELECT_ENTITY_AT_POS
---Gets the selected entity at the specified mouse cursor position, and changes the current selection depth. This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param fracX number
---@param fracY number
---@param hitFlags any
---@param precise boolean
---@return number
function SelectEntityAtPos(fracX, fracY, hitFlags, precise)
end

--- ADD_BLIP_FOR_ENTITY
---Create a blip that by default is red (enemy), you can use [SET_BLIP_AS_FRIENDLY](#\_0xC6F43D0E) to make it blue (friend).\
--- Can be used for objects, vehicles and peds.
--- Example of enemy:
--- ![enemy](https://i.imgur.com/fl78svv.png)
--- Example of friend:
--- ![friend](https://i.imgur.com/Q16ho5d.png)
--- 
--- **This is the server-side RPC native equivalent of the client native [ADD_BLIP_FOR_ENTITY](?\_0x5CDE92C702A8FCE7).**
---@param entity number
---@return any
function AddBlipForEntity(entity)
end

--- END_FIND_PICKUP
---
---@param findHandle any
---@return any
function EndFindPickup(findHandle)
end

--- FIND_KVP
---
---@param handle any
---@return any
function FindKvp(handle)
end

--- FLUSH_RESOURCE_KVP
---Nonsynchronous operations will not wait for a disk/filesystem flush before returning from a write or delete call. They will be much faster than their synchronous counterparts (e.g., bulk operations), however, a system crash may lose the data to some recent operations.
--- 
--- This native ensures all _NO_SYNC operations are synchronized with the disk/filesystem.
---@return any
function FlushResourceKvp()
end

--- _SET_PED_EYE_COLOR
---Used for freemode (online) characters.
--- Indices:
--- 
--- 1.  black
--- 2.  very light blue/green
--- 3.  dark blue
--- 4.  brown
--- 5.  darker brown
--- 6.  light brown
--- 7.  blue
--- 8.  light blue
--- 9.  pink
--- 10. yellow
--- 11. purple
--- 12. black
--- 13. dark green
--- 14. light brown
--- 15. yellow/black pattern
--- 16. light colored spiral pattern
--- 17. shiny red
--- 18. shiny half blue/half red
--- 19. half black/half light blue
--- 20. white/red perimter
--- 21. green snake
--- 22. red snake
--- 23. dark blue snake
--- 24. dark yellow
--- 25. bright yellow
--- 26. all black
--- 27. red small pupil
--- 28. devil blue/black
--- 29. white small pupil
--- 30. glossed over
--- 
--- **This is the server-side RPC native equivalent of the client native [\_SET_PED_EYE_COLOR](?\_0x50B56988B170AFDF).**
---@param ped number
---@param index any
---@return any
function SetPedEyeColor(ped, index)
end

--- GET_TRAIN_DOOR_COUNT
---Gets the door count for the specified train.
---@param train any
---@return any
function GetTrainDoorCount(train)
end

--- GET_VEHICLE_THROTTLE_OFFSET
---
---@param vehicle any
---@return number
function GetVehicleThrottleOffset(vehicle)
end

--- SET_ENTITY_COORDS
---Sets the coordinates (world position) for a specified entity, offset by the radius of the entity on the Z axis.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_ENTITY_COORDS](?\_0x06843DA7060A026B).**
---@param entity number
---@param xPos number
---@param yPos number
---@param zPos number
---@param alive boolean
---@param deadFlag boolean
---@param ragdollFlag boolean
---@param clearArea boolean
---@return any
function SetEntityCoords(entity, xPos, yPos, zPos, alive, deadFlag, ragdollFlag, clearArea)
end

--- GET_VEHICLE_CHEAT_POWER_INCREASE
---A getter for [SET_VEHICLE_CHEAT_POWER_INCREASE](#\_0xB59E4BD37AE292DB).
---@param vehicle any
---@return number
function GetVehicleCheatPowerIncrease(vehicle)
end

--- RESET_MAP_ZOOM_DATA_LEVEL
---Resets values from the zoom level data by index to defaults from mapzoomdata.meta.
---@param index any
---@return any
function ResetMapZoomDataLevel(index)
end

--- OVERRIDE_PEDS_CAN_STAND_ON_TOP_FLAG
---Sets whether peds can stand on top of *all* vehicles without falling off.
--- 
--- Note this flag is not replicated automatically, you will have to manually do so.
---@param flag boolean
---@return any
function OverridePedsCanStandOnTopFlag(flag)
end

--- SET_MINIMAP_COMPONENT_POSITION
---Overrides the minimap component data (from common:/data/ui/frontend.xml) for a specified component.
---@param name any
---@param alignX any
---@param alignY any
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@return any
function SetMinimapComponentPosition(name, alignX, alignY, posX, posY, sizeX, sizeY)
end

--- SET_VEHICLE_WHEEL_IS_POWERED
---Sets whether the wheel is powered.
--- On all wheel drive cars this works to change which wheels receive power, but if a car's fDriveBiasFront doesn't send power to that wheel, it won't get power anyway. This can be fixed by changing the fDriveBiasFront with SET_VEHICLE_HANDLING_FLOAT.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
--- This is a shortcut to a flag in SET_VEHICLE_WHEEL_FLAGS.
---@param vehicle any
---@param wheelIndex any
---@param powered boolean
---@return any
function SetVehicleWheelIsPowered(vehicle, wheelIndex, powered)
end

--- GET_CURRENT_GAME_NAME
---This native returns the currently used game's name.
---@return any
function GetCurrentGameName()
end

--- DRAW_RECT_ROTATED
---DRAW_RECT, but with a rotation. Seems to be broken.
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r any
---@param g any
---@param b any
---@param a any
---@return any
function DrawRectRotated(x, y, width, height, rotation, r, g, b, a)
end

--- GET_RESOURCE_KVP_STRING
---A getter for [SET_RESOURCE_KVP](#\_0x21C7A35B).
---@param key any
---@return any
function GetResourceKvpString(key)
end

--- GET_INTERIOR_PORTAL_ROOM_FROM
---
---@param interiorId any
---@param portalIndex any
---@return any
function GetInteriorPortalRoomFrom(interiorId, portalIndex)
end

--- IS_VEHICLE_ENGINE_STARTING
---
---@param vehicle any
---@return boolean
function IsVehicleEngineStarting(vehicle)
end

--- MUMBLE_ADD_VOICE_TARGET_PLAYER
---Adds the specified player to the target list for the specified Mumble voice target ID.
---@param targetId any
---@param player number
---@return any
function MumbleAddVoiceTargetPlayer(targetId, player)
end

--- TRIGGER_CLIENT_EVENT_INTERNAL
---The backing function for TriggerClientEvent.
---@param eventName any
---@param eventTarget any
---@param eventPayload any
---@param payloadLength any
---@return any
function TriggerClientEventInternal(eventName, eventTarget, eventPayload, payloadLength)
end

--- TASK_GO_TO_ENTITY
---The entity will move towards the target until time is over (duration) or get in target's range (distance). p5 and p6 are unknown, but you could leave p5 = 1073741824 or 100 or even 0 (didn't see any difference but on the decompiled scripts, they use 1073741824 mostly) and p6 = 0
--- Note: I've only tested it on entity -> ped and target -> vehicle. It could work differently on other entities, didn't try it yet.
--- Example: TASK::TASK_GO_TO_ENTITY(pedHandle, vehicleHandle, 5000, 4.0, 100, 1073741824, 0)
--- Ped will run towards the vehicle for 5 seconds and stop when time is over or when he gets 4 meters(?) around the vehicle (with duration = -1, the task duration will be ignored).
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_GO_TO_ENTITY](?\_0x6A071245EB0D1882).**
---@param entity number
---@param target number
---@param duration any
---@param distance number
---@param speed number
---@param p5 number
---@param p6 any
---@return any
function TaskGoToEntity(entity, target, duration, distance, speed, p5, p6)
end

--- CREATE_RUNTIME_TXD
---Creates a runtime texture dictionary with the specified name.
--- Example:
--- 
--- lua
--- local txd = CreateRuntimeTxd('meow')
--- 
---@param name any
---@return any
function CreateRuntimeTxd(name)
end

--- CREATE_DUI
---Creates a DUI browser. This can be used to draw on a runtime texture using CREATE_RUNTIME_TEXTURE_FROM_DUI_HANDLE.
---@param url any
---@param width any
---@param height any
---@return any
function CreateDui(url, width, height)
end

--- FIND_NEXT_VEHICLE
---
---@param findHandle any
---@param outEntity any
---@return boolean
function FindNextVehicle(findHandle, outEntity)
end

--- TASK_SHOOT_AT_ENTITY
---//this part of the code is to determine at which entity the player is aiming, for example if you want to create a mod where you give orders to peds
--- Entity aimedentity;
--- Player player = PLAYER::PLAYER_ID();
--- PLAYER::\_GET_AIMED_ENTITY(player, \&aimedentity);
--- //bg is an array of peds
--- TASK::TASK_SHOOT_AT_ENTITY(bg\[i], aimedentity, 5000, MISC::GET_HASH_KEY("FIRING_PATTERN_FULL_AUTO"));
--- in practical usage, getting the entity the player is aiming at and then task the peds to shoot at the entity, at a button press event would be better.
--- Firing Pattern Hash Information: https://pastebin.com/Px036isB
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_SHOOT_AT_ENTITY](?\_0x08DA95E8298AE772).**
---@param entity number
---@param target number
---@param duration any
---@param firingPattern any
---@return any
function TaskShootAtEntity(entity, target, duration, firingPattern)
end

--- GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM
---
---@param vehicle any
---@return boolean
function GetIsVehicleSecondaryColourCustom(vehicle)
end

--- GET_PED_SCRIPT_TASK_STAGE
---Gets the stage of the peds scripted task.
---@param ped number
---@return any
function GetPedScriptTaskStage(ped)
end

--- SAVE_RESOURCE_FILE
---Writes the specified data to a file in the specified resource.
--- Using a length of -1 will automatically detect the length assuming the data is a C string.
---@param resourceName any
---@param fileName any
---@param data any
---@param dataLength any
---@return boolean
function SaveResourceFile(resourceName, fileName, data, dataLength)
end

--- SET_ENTITY_DRAW_OUTLINE
---Draws an outline around a given entity. This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param entity number
---@param enabled boolean
---@return any
function SetEntityDrawOutline(entity, enabled)
end

--- SET_PED_TO_RAGDOLL
---p4/p5: Unusued in TU27
--- 
--- ### Ragdoll Types
--- 
--- **0**: CTaskNMRelax
--- **1**: CTaskNMScriptControl: Hardcoded not to work in networked environments.
--- **Else**: CTaskNMBalance
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_TO_RAGDOLL](?\_0xAE99FB955581844A).**
---@param ped number
---@param time1 any
---@param time2 any
---@param ragdollType any
---@param p4 boolean
---@param p5 boolean
---@param p6 boolean
---@return any
function SetPedToRagdoll(ped, time1, time2, ragdollType, p4, p5, p6)
end

--- GET_VEHICLE_COLOURS
---
---@param vehicle any
---@param colorPrimary any
---@param colorSecondary any
---@return any
function GetVehicleColours(vehicle, colorPrimary, colorSecondary)
end

--- GET_VEHICLE_LIVERY
---
---@param vehicle any
---@return any
function GetVehicleLivery(vehicle)
end

--- REGISTER_ARCHETYPES
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a set of archetypes with the game engine. These should match CBaseArchetypeDef class information from the game.
---@param factory any
---@return any
function RegisterArchetypes(factory)
end

--- GET_PLAYER_TOKEN
---Gets a player's token. Tokens can be used to enhance banning logic, however are specific to a server.
---@param playerSrc any
---@param index any
---@return any
function GetPlayerToken(playerSrc, index)
end

--- GET_RESOURCE_KVP_FLOAT
---A getter for [SET_RESOURCE_KVP_FLOAT](#\_0x9ADD2938).
---@param key any
---@return number
function GetResourceKvpFloat(key)
end

--- SET_VEHICLE_WHEEL_TIRE_COLLIDER_WIDTH
---Use along with SetVehicleWheelWidth to resize the wheels (this native sets the collider width affecting physics while SetVehicleWheelWidth will change visual width).
---@param vehicle any
---@param wheelIndex any
---@param value number
---@return any
function SetVehicleWheelTireColliderWidth(vehicle, wheelIndex, value)
end

--- SET_INTERIOR_ROOM_TIMECYCLE
---
---@param interiorId any
---@param roomIndex any
---@param timecycleHash any
---@return any
function SetInteriorRoomTimecycle(interiorId, roomIndex, timecycleHash)
end

--- SET_VEHICLE_TURBO_PRESSURE
---
---@param vehicle any
---@param pressure number
---@return any
function SetVehicleTurboPressure(vehicle, pressure)
end

--- TASK_REACT_AND_FLEE_PED
---**This is the server-side RPC native equivalent of the client native [TASK_REACT_AND_FLEE_PED](?\_0x72C896464915D1B1).**
---@param ped number
---@param fleeTarget number
---@return any
function TaskReactAndFleePed(ped, fleeTarget)
end

--- GET_HOST_ID
---
---@return any
function GetHostId()
end

--- GET_VEHICLE_STEERING_SCALE
---
---@param vehicle any
---@return number
function GetVehicleSteeringScale(vehicle)
end

--- GET_VEHICLE_WHEEL_SURFACE_MATERIAL
---
---@param vehicle any
---@param wheelIndex any
---@return any
function GetVehicleWheelSurfaceMaterial(vehicle, wheelIndex)
end

--- GET_VEHICLE_DIRT_LEVEL
---
---@param vehicle any
---@return number
function GetVehicleDirtLevel(vehicle)
end

--- GET_PLAYER_WEAPON_DEFENSE_MODIFIER
---A getter for [SET_PLAYER_WEAPON_DEFENSE_MODIFIER](#\_0x2D83BC011CA14A3C).
---@param playerId number
---@return number
function GetPlayerWeaponDefenseModifier(playerId)
end

--- MUMBLE_GET_VOICE_CHANNEL_FROM_SERVER_ID
---Returns the mumble voice channel from a player's server id.
---@param serverId any
---@return any
function MumbleGetVoiceChannelFromServerId(serverId)
end

--- EXPERIMENTAL_LOAD_CLONE_CREATE
---This native is not implemented.
---@param data any
---@param objectId any
---@param tree any
---@return number
function ExperimentalLoadCloneCreate(data, objectId, tree)
end

--- GET_VEHICLE_WHEEL_FLAGS
---Gets the flags of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return any
function GetVehicleWheelFlags(vehicle, wheelIndex)
end

--- GET_VEHICLE_HOMING_LOCKON_STATE
---Gets the lock on state for the specified vehicle. See the client-side [GET_VEHICLE_HOMING_LOCKON_STATE](#\_0xE6B0E8CFC3633BF0) native for a description of lock on states.
---@param vehicle any
---@return any
function GetVehicleHomingLockonState(vehicle)
end

--- SET_DISCORD_RICH_PRESENCE_ASSET_SMALL
---This native sets the small image asset for the discord rich presence implementation.
---@param assetName any
---@return any
function SetDiscordRichPresenceAssetSmall(assetName)
end

--- SET_VEHICLE_FUEL_LEVEL
---
---@param vehicle any
---@param level number
---@return any
function SetVehicleFuelLevel(vehicle, level)
end

--- SET_VEHICLE_WHEEL_POWER
---Sets power being sent to a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@param power number
---@return any
function SetVehicleWheelPower(vehicle, wheelIndex, power)
end

--- LEAVE_CURSOR_MODE
---Leaves cursor mode. This function supports SDK infrastructure and is not intended to be used directly from your code.
---@return any
function LeaveCursorMode()
end

--- SET_PED_CONFIG_FLAG
---cpp
--- // Potential names and hash collisions included as comments
--- enum ePedConfigFlags {
--- \_0x67D1A445 = 0,
--- \_0xC63DE95E = 1,
--- CPED_CONFIG_FLAG_NoCriticalHits = 2,
--- CPED_CONFIG_FLAG_DrownsInWater = 3,
--- CPED_CONFIG_FLAG_DisableReticuleFixedLockon = 4,
--- \_0x37D196F4 = 5,
--- \_0xE2462399 = 6,
--- CPED_CONFIG_FLAG_UpperBodyDamageAnimsOnly = 7,
--- \_0xEDDEB838 = 8,
--- \_0xB398B6FD = 9,
--- \_0xF6664E68 = 10,
--- \_0xA05E7CA3 = 11,
--- \_0xCE394045 = 12,
--- CPED_CONFIG_FLAG_NeverLeavesGroup = 13,
--- \_0xCD8D1411 = 14,
--- \_0xB031F1A9 = 15,
--- \_0xFE65BEE3 = 16,
--- CPED_CONFIG_FLAG_BlockNonTemporaryEvents = 17,
--- \_0x380165BD = 18,
--- \_0x07C045C7 = 19,
--- \_0x583B5E2D = 20,
--- \_0x475EDA58 = 21,
--- \_0x8629D05B = 22,
--- \_0x1522968B = 23,
--- CPED_CONFIG_FLAG_IgnoreSeenMelee = 24,
--- \_0x4CC09C4B = 25,
--- \_0x034F3053 = 26,
--- \_0xD91BA7CC = 27,
--- \_0x5C8DC66E = 28,
--- \_0x8902EAA0 = 29,
--- \_0x6580B9D2 = 30,
--- \_0x0EF7A297 = 31,
--- \_0x6BF86E5B = 32,
--- CPED_CONFIG_FLAG_DieWhenRagdoll = 33,
--- CPED_CONFIG_FLAG_HasHelmet = 34,
--- CPED_CONFIG_FLAG_UseHelmet = 35,
--- \_0xEEB3D630 = 36,
--- \_0xB130D17B = 37,
--- \_0x5F071200 = 38,
--- CPED_CONFIG_FLAG_DisableEvasiveDives = 39,
--- \_0xC287AAFF = 40,
--- \_0x203328CC = 41,
--- CPED_CONFIG_FLAG_DontInfluenceWantedLevel = 42,
--- CPED_CONFIG_FLAG_DisablePlayerLockon = 43,
--- CPED_CONFIG_FLAG_DisableLockonToRandomPeds = 44,
--- \_0xEC4A8ACF = 45,
--- \_0xDB115BFA = 46,
--- CPED_CONFIG_FLAG_PedBeingDeleted = 47,
--- CPED_CONFIG_FLAG_BlockWeaponSwitching = 48,
--- \_0xF8E99565 = 49,
--- \_0xDD17FEE6 = 50,
--- \_0x7ED9B2C9 = 51,
--- \_0x655E8618 = 52,
--- \_0x5A6C1F6E = 53,
--- \_0xD749FC41 = 54,
--- \_0x357F63F3 = 55,
--- \_0xC5E60961 = 56,
--- \_0x29275C3E = 57,
--- CPED_CONFIG_FLAG_IsFiring = 58,
--- CPED_CONFIG_FLAG_WasFiring = 59,
--- CPED_CONFIG_FLAG_IsStanding = 60,
--- CPED_CONFIG_FLAG_WasStanding = 61,
--- CPED_CONFIG_FLAG_InVehicle = 62,
--- CPED_CONFIG_FLAG_OnMount = 63,
--- CPED_CONFIG_FLAG_AttachedToVehicle = 64,
--- CPED_CONFIG_FLAG_IsSwimming = 65,
--- CPED_CONFIG_FLAG_WasSwimming = 66,
--- CPED_CONFIG_FLAG_IsSkiing = 67,
--- CPED_CONFIG_FLAG_IsSitting = 68,
--- CPED_CONFIG_FLAG_KilledByStealth = 69,
--- CPED_CONFIG_FLAG_KilledByTakedown = 70,
--- CPED_CONFIG_FLAG_Knockedout = 71,
--- \_0x3E3C4560 = 72,
--- \_0x2994C7B7 = 73,
--- \_0x6D59D275 = 74,
--- CPED_CONFIG_FLAG_UsingCoverPoint = 75,
--- CPED_CONFIG_FLAG_IsInTheAir = 76,
--- \_0x2D493FB7 = 77,
--- CPED_CONFIG_FLAG_IsAimingGun = 78,
--- \_0x14D69875 = 79,
--- \_0x40B05311 = 80,
--- \_0x8B230BC5 = 81,
--- \_0xC74E5842 = 82,
--- \_0x9EA86147 = 83,
--- \_0x674C746C = 84,
--- \_0x3E56A8C2 = 85,
--- \_0xC144A1EF = 86,
--- \_0x0548512D = 87,
--- \_0x31C93909 = 88,
--- \_0xA0269315 = 89,
--- \_0xD4D59D4D = 90,
--- \_0x411D4420 = 91,
--- \_0xDF4AEF0D = 92,
--- CPED_CONFIG_FLAG_ForcePedLoadCover = 93,
--- \_0x300E4CD3 = 94,
--- \_0xF1C5BF04 = 95,
--- \_0x89C2EF13 = 96,
--- CPED_CONFIG_FLAG_VaultFromCover = 97,
--- \_0x02A852C8 = 98,
--- \_0x3D9407F1 = 99,
--- \_0x319B4558 = 100,
--- CPED_CONFIG_FLAG_ForcedAim = 101,
--- \_0xB942D71A = 102,
--- \_0xD26C55A8 = 103,
--- \_0xB89E703B = 104,
--- CPED_CONFIG_FLAG_ForceReload = 105,
--- \_0xD9E73DA2 = 106,
--- \_0xFF71DC2C = 107,
--- \_0x1E27E8D8 = 108,
--- \_0xF2C53966 = 109,
--- \_0xC4DBE247 = 110,
--- \_0x83C0A4BF = 111,
--- \_0x0E0FAF8C = 112,
--- \_0x26616660 = 113,
--- \_0x43B80B79 = 114,
--- \_0x0D2A9309 = 115,
--- \_0x12C1C983 = 116,
--- CPED_CONFIG_FLAG_BumpedByPlayer = 117,
--- \_0xE586D504 = 118,
--- \_0x52374204 = 119,
--- CPED_CONFIG_FLAG_IsHandCuffed = 120,
--- CPED_CONFIG_FLAG_IsAnkleCuffed = 121,
--- CPED_CONFIG_FLAG_DisableMelee = 122,
--- \_0xFE714397 = 123,
--- \_0xB3E660BD = 124,
--- \_0x5FED6BFD = 125,
--- \_0xC9D6F66F = 126,
--- \_0x519BC986 = 127,
--- CPED_CONFIG_FLAG_CanBeAgitated = 128,
--- \_0x9A4B617C = 129, // CPED_CONFIG_FLAG_FaceDirInsult
--- \_0xDAB70E9F = 130,
--- \_0xE569438A = 131,
--- \_0xBBC77D6D = 132,
--- \_0xCB59EF0F = 133,
--- \_0x8C5EA971 = 134,
--- CPED_CONFIG_FLAG_IsScuba = 135,
--- CPED_CONFIG_FLAG_WillArrestRatherThanJack = 136,
--- \_0xDCE59B58 = 137,
--- CPED_CONFIG_FLAG_RidingTrain = 138,
--- CPED_CONFIG_FLAG_ArrestResult = 139,
--- CPED_CONFIG_FLAG_CanAttackFriendly = 140,
--- \_0x98A4BE43 = 141,
--- \_0x6901E731 = 142,
--- \_0x9EC9BF6C = 143,
--- \_0x42841A8F = 144,
--- CPED_CONFIG_FLAG_ShootingAnimFlag = 145,
--- CPED_CONFIG_FLAG_DisableLadderClimbing = 146,
--- CPED_CONFIG_FLAG_StairsDetected = 147,
--- CPED_CONFIG_FLAG_SlopeDetected = 148,
--- \_0x1A15670B = 149,
--- \_0x61786EE5 = 150,
--- \_0xCB9186BD = 151,
--- \_0xF0710152 = 152,
--- \_0x43DFE310 = 153,
--- \_0xC43C624E = 154,
--- CPED_CONFIG_FLAG_CanPerformArrest = 155,
--- CPED_CONFIG_FLAG_CanPerformUncuff = 156,
--- CPED_CONFIG_FLAG_CanBeArrested = 157,
--- \_0xF7960FF5 = 158,
--- \_0x59564113 = 159,
--- \_0x0C6C3099 = 160,
--- \_0x645F927A = 161,
--- \_0xA86549B9 = 162,
--- \_0x8AAF337A = 163,
--- \_0x13BAA6E7 = 164,
--- \_0x5FB9D1F5 = 165,
--- CPED_CONFIG_FLAG_IsInjured = 166,
--- \_0x6398A20B = 167,
--- \_0xD8072639 = 168,
--- \_0xA05B1845 = 169,
--- \_0x83F6D220 = 170,
--- \_0xD8430331 = 171,
--- \_0x4B547520 = 172,
--- \_0xE66E1406 = 173,
--- \_0x1C4BFE0C = 174,
--- \_0x90008BFA = 175,
--- \_0x07C7A910 = 176,
--- \_0xF15F8191 = 177,
--- \_0xCE4E8BE2 = 178,
--- \_0x1D46E4F2 = 179,
--- CPED_CONFIG_FLAG_IsInCustody = 180,
--- \_0xE4FD9B3A = 181,
--- \_0x67AE0812 = 182,
--- CPED_CONFIG_FLAG_IsAgitated = 183,
--- CPED_CONFIG_FLAG_PreventAutoShuffleToDriversSeat = 184,
--- \_0x7B2D325E = 185,
--- CPED_CONFIG_FLAG_EnableWeaponBlocking = 186,
--- CPED_CONFIG_FLAG_HasHurtStarted = 187,
--- CPED_CONFIG_FLAG_DisableHurt = 188,
--- CPED_CONFIG_FLAG_PlayerIsWeird = 189,
--- \_0x32FC208B = 190,
--- \_0x0C296E5A = 191,
--- \_0xE63B73EC = 192,
--- \_0x04E9CC80 = 193,
--- CPED_CONFIG_FLAG_UsingScenario = 194,
--- CPED_CONFIG_FLAG_VisibleOnScreen = 195,
--- \_0xD88C58A1 = 196,
--- \_0x5A3DCF43 = 197, // CPED_CONFIG_FLAG_AvoidUnderSide
--- \_0xEA02B420 = 198,
--- \_0x3F559CFF = 199,
--- \_0x8C55D029 = 200,
--- \_0x5E6466F6 = 201,
--- \_0xEB5AD706 = 202,
--- \_0x0EDDDDE7 = 203,
--- \_0xA64F7B1D = 204,
--- \_0x48532CBA = 205,
--- \_0xAA25A9E7 = 206,
--- \_0x415B26B9 = 207,
--- CPED_CONFIG_FLAG_DisableExplosionReactions = 208,
--- CPED_CONFIG_FLAG_DodgedPlayer = 209,
--- \_0x67405504 = 210,
--- \_0x75DDD68C = 211,
--- \_0x2AD879B4 = 212,
--- \_0x51486F91 = 213,
--- \_0x32F79E21 = 214,
--- \_0xBF099213 = 215,
--- \_0x054AC8E2 = 216,
--- \_0x14E495CC = 217,
--- \_0x3C7DF9DF = 218,
--- \_0x848FFEF2 = 219,
--- CPED_CONFIG_FLAG_DontEnterLeadersVehicle = 220,
--- \_0x2618E1CF = 221,
--- \_0x84F722FA = 222,
--- \_0xD1B87B1F = 223,
--- \_0x728AA918 = 224,
--- CPED_CONFIG_FLAG_DisablePotentialToBeWalkedIntoResponse = 225,
--- CPED_CONFIG_FLAG_DisablePedAvoidance = 226,
--- \_0x59E91185 = 227,
--- \_0x1EA7225F = 228,
--- CPED_CONFIG_FLAG_DisablePanicInVehicle = 229,
--- \_0x6DCA7D88 = 230,
--- \_0xFC3E572D = 231,
--- \_0x08E9F9CF = 232,
--- \_0x2D3BA52D = 233,
--- \_0xFD2F53EA = 234,
--- \_0x31A1B03B = 235,
--- CPED_CONFIG_FLAG_IsHoldingProp = 236,
--- \_0x82ED0A66 = 237, // CPED_CONFIG_FLAG_BlocksPathingWhenDead
--- \_0xCE57C9A3 = 238,
--- \_0x26149198 = 239,
--- \_0x1B33B598 = 240,
--- \_0x719B6E87 = 241,
--- \_0x13E8E8E8 = 242,
--- \_0xF29739AE = 243,
--- \_0xABEA8A74 = 244,
--- \_0xB60EA2BA = 245,
--- \_0x536B0950 = 246,
--- \_0x0C754ACA = 247,
--- CPED_CONFIG_FLAG_DisableVehicleSeatRandomAnimations = 248,
--- \_0x12659168 = 249,
--- \_0x1BDF2F04 = 250,
--- \_0x7728FAA3 = 251,
--- \_0x6A807ED8 = 252,
--- CPED_CONFIG_FLAG_OnStairs = 253,
--- \_0xE1A2F73F = 254,
--- \_0x5B3697C8 = 255,
--- \_0xF1EB20A9 = 256,
--- \_0x8B7DF407 = 257,
--- \_0x329DCF1A = 258,
--- \_0x8D90DD1B = 259,
--- \_0xB8A292B7 = 260,
--- \_0x8374B087 = 261,
--- \_0x2AF558F0 = 262,
--- \_0x82251455 = 263,
--- \_0x30CF498B = 264,
--- \_0xE1CD50AF = 265,
--- \_0x72E4AE48 = 266,
--- \_0xC2657EA1 = 267,
--- \_0x29FF6030 = 268,
--- \_0x8248A5EC = 269,
--- CPED_CONFIG_FLAG_OnStairSlope = 270,
--- \_0xA0897933 = 271,
--- CPED_CONFIG_FLAG_DontBlipCop = 272,
--- CPED_CONFIG_FLAG_ClimbedShiftedFence = 273,
--- \_0xF7823618 = 274,
--- \_0xDC305CCE = 275, // CPED_CONFIG_FLAG_KillWhenTrapped
--- CPED_CONFIG_FLAG_EdgeDetected = 276,
--- \_0x92B67896 = 277,
--- \_0xCAD677C9 = 278,
--- CPED_CONFIG_FLAG_AvoidTearGas = 279,
--- \_0x5276AC7B = 280,
--- \_0x1032692A = 281,
--- \_0xDA23E7F1 = 282,
--- \_0x9139724D = 283,
--- \_0xA1457461 = 284,
--- \_0x4186E095 = 285,
--- \_0xAC68E2EB = 286,
--- CPED_CONFIG_FLAG_RagdollingOnBoat = 287,
--- CPED_CONFIG_FLAG_HasBrandishedWeapon = 288,
--- \_0x1B9EE8A1 = 289,
--- \_0xF3F5758C = 290,
--- \_0x2A9307F1 = 291,
--- \_0x7403D216 = 292,
--- \_0xA06A3C6C = 293,
--- CPED_CONFIG_FLAG_DisableShockingEvents = 294,
--- \_0xF8DA25A5 = 295,
--- \_0x7EF55802 = 296,
--- \_0xB31F1187 = 297,
--- \_0x84315402 = 298,
--- \_0x0FD69867 = 299,
--- \_0xC7829B67 = 300,
--- CPED_CONFIG_FLAG_DisablePedConstraints = 301,
--- \_0x6D23CF25 = 302,
--- \_0x2ADA871B = 303,
--- \_0x47BC8A58 = 304,
--- \_0xEB692FA5 = 305,
--- \_0x4A133C50 = 306,
--- \_0xC58099C3 = 307,
--- \_0xF3D76D41 = 308,
--- \_0xB0EEE9F2 = 309,
--- CPED_CONFIG_FLAG_IsInCluster = 310,
--- \_0x0FA153EF = 311,
--- \_0xD73F5CD3 = 312,
--- \_0xD4136C22 = 313,
--- \_0xE404CA6B = 314,
--- \_0xB9597446 = 315,
--- \_0xD5C98277 = 316,
--- \_0xD5060A9C = 317,
--- \_0x3E5F1CBB = 318,
--- \_0xD8BE1D54 = 319,
--- \_0x0B1F191F = 320,
--- \_0xC995167A = 321,
--- CPED_CONFIG_FLAG_HasHighHeels = 322,
--- \_0x86B01E54 = 323,
--- \_0x3A56FE15 = 324,
--- \_0xC03B736C = 325, // CPED_CONFIG_FLAG_SpawnedAtScenario
--- \_0xBBF47729 = 326,
--- \_0x22B668A8 = 327,
--- \_0x2624D4D4 = 328,
--- CPED_CONFIG_FLAG_DisableTalkTo = 329,
--- CPED_CONFIG_FLAG_DontBlip = 330,
--- CPED_CONFIG_FLAG_IsSwitchingWeapon = 331,
--- \_0x630F55F3 = 332,
--- \_0x150468FD = 333,
--- \_0x914EBD6B = 334,
--- \_0x79AF3B6D = 335,
--- \_0x75C7A632 = 336,
--- \_0x52D530E2 = 337,
--- \_0xDB2A90E0 = 338,
--- \_0x5922763D = 339,
--- \_0x12ADB567 = 340,
--- \_0x105C8518 = 341,
--- \_0x106F703D = 342,
--- \_0xED152C3E = 343,
--- \_0xA0EFE6A8 = 344,
--- \_0xBF348C82 = 345,
--- \_0xCDDFE830 = 346,
--- \_0x7B59BD9B = 347,
--- \_0x0124C788 = 348,
--- CPED_CONFIG_FLAG_EquipJetpack = 349,
--- \_0x08D361A5 = 350,
--- \_0xE13D1F7C = 351,
--- \_0x40E25FB9 = 352,
--- \_0x930629D9 = 353,
--- \_0xECCF0C7F = 354,
--- \_0xB6E9613B = 355,
--- \_0x490C0478 = 356,
--- \_0xE8865BEA = 357,
--- \_0xF3C34A29 = 358,
--- CPED_CONFIG_FLAG_IsDuckingInVehicle = 359,
--- \_0xF660E115 = 360,
--- \_0xAB0E6DED = 361,
--- CPED_CONFIG_FLAG_HasReserveParachute = 362,
--- CPED_CONFIG_FLAG_UseReserveParachute = 363,
--- \_0x5C5D9CD3 = 364,
--- \_0x8F7701F3 = 365,
--- \_0xBC4436AD = 366,
--- \_0xD7E07D37 = 367,
--- \_0x03C4FD24 = 368,
--- \_0x7675789A = 369,
--- \_0xB7288A88 = 370,
--- \_0xC06B6291 = 371,
--- \_0x95A4A805 = 372,
--- \_0xA8E9A042 = 373,
--- CPED_CONFIG_FLAG_NeverLeaveTrain = 374,
--- \_0xBAC674B3 = 375,
--- \_0x147F1FFB = 376,
--- \_0x4376DD79 = 377,
--- \_0xCD3DB518 = 378,
--- \_0xFE4BA4B6 = 379,
--- \_0x5DF03A55 = 380,
--- \_0xBCD816CD = 381,
--- \_0xCF02DD69 = 382,
--- \_0xF73AFA2E = 383,
--- \_0x80B9A9D0 = 384,
--- \_0xF601F7EE = 385,
--- \_0xA91350FC = 386,
--- \_0x3AB23B96 = 387,
--- CPED_CONFIG_FLAG_IsClimbingLadder = 388,
--- CPED_CONFIG_FLAG_HasBareFeet = 389,
--- \_0xB4B1CD4C = 390,
--- \_0x5459AFB8 = 391,
--- \_0x54F27667 = 392,
--- \_0xC11D3E8F = 393,
--- \_0x5419EB3E = 394,
--- \_0x82D8DBB4 = 395,
--- \_0x33B02D2F = 396,
--- \_0xAE66176D = 397,
--- \_0xA2692593 = 398,
--- \_0x714C7E31 = 399,
--- \_0xEC488AC7 = 400,
--- \_0xAE398504 = 401,
--- \_0xABC58D72 = 402,
--- \_0x5E5B9591 = 403,
--- \_0x6BA1091E = 404,
--- \_0x77840177 = 405,
--- \_0x1C7ACAC4 = 406,
--- \_0x124420E9 = 407,
--- \_0x75A65587 = 408,
--- \_0xDFD2D55B = 409,
--- \_0xBDD39919 = 410,
--- \_0x43DEC267 = 411,
--- \_0xE42B7797 = 412,
--- CPED_CONFIG_FLAG_IsHolsteringWeapon = 413,
--- \_0x4F8149F5 = 414,
--- \_0xDD9ECA7A = 415,
--- \_0x9E7EF9D2 = 416,
--- \_0x2C6ED942 = 417,
--- CPED_CONFIG_FLAG_IsSwitchingHelmetVisor = 418,
--- \_0xA488727D = 419,
--- \_0xCFF5F6DE = 420,
--- \_0x6D614599 = 421,
--- CPED_CONFIG_FLAG_DisableVehicleCombat = 422,
--- \_0xFE401D26 = 423,
--- CPED_CONFIG_FLAG_FallsLikeAircraft = 424,
--- \_0x2B42AE82 = 425,
--- \_0x7A95734F = 426,
--- \_0xDF4D8617 = 427,
--- \_0x578F1F14 = 428,
--- CPED_CONFIG_FLAG_DisableStartEngine = 429,
--- CPED_CONFIG_FLAG_IgnoreBeingOnFire = 430,
--- \_0x153C9500 = 431,
--- \_0xCB7A632E = 432,
--- \_0xDE727981 = 433,
--- CPED_CONFIG_FLAG_DisableHomingMissileLockon = 434,
--- \_0x12BBB935 = 435,
--- \_0xAD0A1277 = 436,
--- \_0xEA6AA46A = 437,
--- CPED_CONFIG_FLAG_DisableHelmetArmor = 438,
--- \_0xCB7F3A1E = 439,
--- \_0x50178878 = 440,
--- \_0x051B4F0D = 441,
--- \_0x2FC3DECC = 442,
--- \_0xC0030B0B = 443,
--- \_0xBBDAF1E9 = 444,
--- \_0x944FE59C = 445,
--- \_0x506FBA39 = 446,
--- \_0xDD45FE84 = 447,
--- \_0xE698AE75 = 448,
--- \_0x199633F8 = 449,
--- CPED_CONFIG_FLAG_PedIsArresting = 450,
--- CPED_CONFIG_FLAG_IsDecoyPed = 451,
--- \_0x3A251D83 = 452,
--- \_0xA56F6986 = 453,
--- \_0x1D19C622 = 454,
--- \_0xB68D3EAB = 455,
--- CPED_CONFIG_FLAG_CanBeIncapacitated = 456,
--- \_0x4BD5EBAD = 457,
--- }
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_CONFIG_FLAG](?\_0x1913FE4CBF41C463).**
---@param ped number
---@param flagId any
---@param value boolean
---@return any
function SetPedConfigFlag(ped, flagId, value)
end

--- GET_HELI_MAIN_ROTOR_HEALTH
---
---@param vehicle any
---@return number
function GetHeliMainRotorHealth(vehicle)
end

--- MUMBLE_REMOVE_VOICE_TARGET_PLAYER
---Removes the specified player from the user's voice targets.
--- 
--- Performs the opposite operation of [MUMBLE_ADD_VOICE_TARGET_PLAYER](#\_0x32C5355A)
---@param targetId any
---@param player number
---@return any
function MumbleRemoveVoiceTargetPlayer(targetId, player)
end

--- MUMBLE_SET_SUBMIX_FOR_SERVER_ID
---Sets the audio submix ID for a specified player using Mumble 'Native Audio' functionality.
---@param serverId any
---@param submixId any
---@return any
function MumbleSetSubmixForServerId(serverId, submixId)
end

--- SET_VEHICLE_CLUTCH
---
---@param vehicle any
---@param clutch number
---@return any
function SetVehicleClutch(vehicle, clutch)
end

--- SET_PED_TO_RAGDOLL_WITH_FALL
---Return variable is never used in R\*'s scripts.
--- Not sure what p2 does. It seems like it would be a time judging by it's usage in R\*'s scripts, but didn't seem to affect anything in my testings.
--- x, y, and z are coordinates, most likely to where the ped will fall.
--- p7 is probably the force of the fall, but untested, so I left the variable name the same.
--- p8 to p13 are always 0f in R\*'s scripts.
--- (Simplified) Example of the usage of the function from R\*'s scripts:
--- ped::set_ped_to_ragdoll_with_fall(ped, 1500, 2000, 1, -entity::get_entity_forward_vector(ped), 1f, 0f, 0f, 0f, 0f, 0f, 0f);
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_TO_RAGDOLL_WITH_FALL](?\_0xD76632D99E4966C8).**
---@param ped number
---@param time any
---@param p2 any
---@param ragdollType any
---@param x number
---@param y number
---@param z number
---@param p7 number
---@param p8 number
---@param p9 number
---@param p10 number
---@param p11 number
---@param p12 number
---@param p13 number
---@return any
function SetPedToRagdollWithFall(ped, time, p2, ragdollType, x, y, z, p7, p8, p9, p10, p11, p12, p13)
end

--- GET_PLAYER_FAKE_WANTED_LEVEL
---Gets the current fake wanted level for a specified player. This native is used server side when using OneSync.
---@param playerSrc any
---@return any
function GetPlayerFakeWantedLevel(playerSrc)
end

--- GET_VEHICLE_CUSTOM_SECONDARY_COLOUR
---
---@param vehicle any
---@param r any
---@param g any
---@param b any
---@return any
function GetVehicleCustomSecondaryColour(vehicle, r, g, b)
end

--- SET_MAP_ZOOM_DATA_LEVEL
---Sets values to the zoom level data by index.
---@param index any
---@param zoomScale number
---@param zoomSpeed number
---@param scrollSpeed number
---@param tilesX number
---@param tilesY number
---@return any
function SetMapZoomDataLevel(index, zoomScale, zoomSpeed, scrollSpeed, tilesX, tilesY)
end

--- GET_RUNTIME_TEXTURE_PITCH
---Gets the row pitch of the specified runtime texture, for use when creating data for SET_RUNTIME_TEXTURE_ARGB_DATA.
---@param tex any
---@return any
function GetRuntimeTexturePitch(tex)
end

--- GET_RESOURCE_BY_FIND_INDEX
---
---@param findIndex any
---@return any
function GetResourceByFindIndex(findIndex)
end

--- GET_VEHICLE_ENGINE_TEMPERATURE
---
---@param vehicle any
---@return number
function GetVehicleEngineTemperature(vehicle)
end

--- GET_VEHICLE_WHEEL_X_OFFSET
---Returns the offset of the specified wheel relative to the wheel's axle center.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelXOffset(vehicle, wheelIndex)
end

--- IS_VEHICLE_EXTRA_TURNED_ON
---
---@param vehicle any
---@param extraId any
---@return boolean
function IsVehicleExtraTurnedOn(vehicle, extraId)
end

--- CANCEL_EVENT
---Cancels the currently executing event.
---@return any
function CancelEvent()
end

--- GET_CONVAR_INT
---Can be used to get a console variable casted back to int (an integer value).
---@param varName any
---@param default_ any
---@return any
function GetConvarInt(varName, default_)
end

--- GET_GAME_TIMER
---Gets the current game timer in milliseconds.
---@return any
function GetGameTimer()
end

--- REGISTER_NUI_CALLBACK
---
---@param callbackType any
---@param callback any
---@return any
function RegisterNuiCallback(callbackType, callback)
end

--- MUMBLE_REMOVE_VOICE_CHANNEL_LISTEN
---Stops listening to the specified channel.
---@param channel any
---@return any
function MumbleRemoveVoiceChannelListen(channel)
end

--- REGISTER_FONT_FILE
---Registers a specified .gfx file as GFx font library.
--- The .gfx file has to be registered with the streamer already.
---@param fileName any
---@return any
function RegisterFontFile(fileName)
end

--- SEND_DUI_MOUSE_DOWN
---Injects a 'mouse down' event for a DUI object. Coordinates are expected to be set using SEND_DUI_MOUSE_MOVE.
---@param duiObject any
---@param button any
---@return any
function SendDuiMouseDown(duiObject, button)
end

--- SET_HANDLING_FLOAT
---Sets a global handling override for a specific vehicle class. The name is supposed to match the handlingName field from handling.meta.
--- Example: SetHandlingFloat('AIRTUG', 'CHandlingData', 'fSteeringLock', 360.0)
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value number
---@return any
function SetHandlingFloat(vehicle, class_, fieldName, value)
end

--- SCAN_RESOURCE_ROOT
---Scans the resources in the specified resource root. This function is only available in the 'monitor mode' process and is
--- not available for user resources.
---@param rootPath any
---@param callback any
---@return any
function ScanResourceRoot(rootPath, callback)
end

--- GET_PLAYER_LAST_MSG
---
---@param playerSrc any
---@return any
function GetPlayerLastMsg(playerSrc)
end

--- GET_ENTITY_SPEED
---Gets the current speed of the entity in meters per second.
--- 
--- 
--- To convert to MPH: speed * 2.236936
--- To convert to KPH: speed * 3.6
--- 
---@param entity number
---@return number
function GetEntitySpeed(entity)
end

--- GET_PED_FACE_FEATURE
---A getter for [\_SET_PED_FACE_FEATURE](#\_0x71A5C1DBA060049E). Returns 0.0 if fails to get.
---@param ped number
---@param index any
---@return number
function GetPedFaceFeature(ped, index)
end

--- GET_PLAYER_CAMERA_ROTATION
---Gets the current camera rotation for a specified player. This native is used server side when using OneSync.
---@param playerSrc any
---@return { x: number, y: number, z: number }
function GetPlayerCameraRotation(playerSrc)
end

--- GET_VEHICLE_CUSTOM_PRIMARY_COLOUR
---
---@param vehicle any
---@param r any
---@param g any
---@param b any
---@return any
function GetVehicleCustomPrimaryColour(vehicle, r, g, b)
end

--- MUMBLE_SET_TALKER_PROXIMITY
---
---@param value number
---@return any
function MumbleSetTalkerProximity(value)
end

--- SET_PLAYER_CONTROL
---Flags:
--- SPC_AMBIENT_SCRIPT = (1 << 1),
--- SPC_CLEAR_TASKS = (1 << 2),
--- SPC_REMOVE_FIRES = (1 << 3),
--- SPC_REMOVE_EXPLOSIONS = (1 << 4),
--- SPC_REMOVE_PROJECTILES = (1 << 5),
--- SPC_DEACTIVATE_GADGETS = (1 << 6),
--- SPC_REENABLE_CONTROL_ON_DEATH = (1 << 7),
--- SPC_LEAVE_CAMERA_CONTROL_ON = (1 << 8),
--- SPC_ALLOW_PLAYER_DAMAGE = (1 << 9),
--- SPC_DONT_STOP_OTHER_CARS_AROUND_PLAYER = (1 << 10),
--- SPC_PREVENT_EVERYBODY_BACKOFF = (1 << 11),
--- SPC_ALLOW_PAD_SHAKE = (1 << 12)
--- See: https://alloc8or.re/gta5/doc/enums/eSetPlayerControlFlag.txt
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PLAYER_CONTROL](?\_0x8D32347D6D4C40A2).**
---@param player number
---@param bHasControl boolean
---@param flags any
---@return any
function SetPlayerControl(player, bHasControl, flags)
end

--- TASK_DRIVE_BY
---Example:
--- TASK::TASK_DRIVE_BY(l\_467\[1/*22*/], PLAYER::PLAYER_PED_ID(), 0, 0.0, 0.0, 2.0, 300.0, 100, 0, ${firing_pattern_burst_fire_driveby});
--- Needs working example. Doesn't seem to do anything.
--- I marked p2 as targetVehicle as all these shooting related tasks seem to have that in common.
--- I marked p6 as distanceToShoot as if you think of GTA's Logic with the native SET_VEHICLE_SHOOT natives, it won't shoot till it gets within a certain distance of the target.
--- I marked p7 as pedAccuracy as it seems it's mostly 100 (Completely Accurate), 75, 90, etc. Although this could be the ammo count within the gun, but I highly doubt it. I will change this comment once I find out if it's ammo count or not.
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_DRIVE_BY](?\_0x2F8AF0E82773A171).**
---@param driverPed number
---@param targetPed number
---@param targetVehicle any
---@param targetX number
---@param targetY number
---@param targetZ number
---@param distanceToShoot number
---@param pedAccuracy any
---@param p8 boolean
---@param firingPattern any
---@return any
function TaskDriveBy(driverPed, targetPed, targetVehicle, targetX, targetY, targetZ, distanceToShoot, pedAccuracy, p8, firingPattern)
end

--- GET_ALL_PEDS
---Returns all peds handles known to the server.
--- The data returned adheres to the following layout:
--- 
--- 
--- [127, 42, 13, 37]
--- 
---@return any
function GetAllPeds()
end

--- GET_VEHICLE_PETROL_TANK_HEALTH
---
---@param vehicle any
---@return number
function GetVehiclePetrolTankHealth(vehicle)
end

--- RESET_VEHICLE_PEDS_CAN_STAND_ON_TOP_FLAG
---Resets whether or not peds can stand on top of the specified vehicle.
--- 
--- Note this flag is not replicated automatically, you will have to manually do so.
---@param vehicle any
---@return any
function ResetVehiclePedsCanStandOnTopFlag(vehicle)
end

--- GET_CONSOLE_BUFFER
---Returns the current console output buffer.
---@return any
function GetConsoleBuffer()
end

--- GET_PED_HEAD_OVERLAY_DATA
---A getter for [SET_PED_HEAD_OVERLAY](#\_0x48F44967FA05CC1E) and [\_SET_PED_HEAD_OVERLAY_COLOR](#\_0x497BF74A7B9CB952) natives.
---@param ped number
---@param index any
---@param overlayValue any
---@param colourType any
---@param firstColour any
---@param secondColour any
---@param overlayOpacity any
---@return boolean
function GetPedHeadOverlayData(ped, index, overlayValue, colourType, firstColour, secondColour, overlayOpacity)
end

--- GET_PLAYER_TIME_IN_PURSUIT
---
--- Gets the amount of time player has spent evading the cops.
--- Counter starts and increments only when cops are chasing the player.
--- If the player is evading, the timer will pause.
--- 
---@param playerSrc any
---@param lastPursuit boolean
---@return any
function GetPlayerTimeInPursuit(playerSrc, lastPursuit)
end

--- GET_SELECTED_PED_WEAPON
---Returns a hash of selected ped weapon.
---@param ped number
---@return any
function GetSelectedPedWeapon(ped)
end

--- GET_WEAPON_COMPONENT_DAMAGE_MODIFIER
---A getter for CWeaponDamageModifier in a weapon component.
---@param componentHash any
---@return number
function GetWeaponComponentDamageModifier(componentHash)
end

--- MUMBLE_CLEAR_VOICE_TARGET_CHANNELS
---Clears channels from the target list for the specified Mumble voice target ID.
---@param targetId any
---@return any
function MumbleClearVoiceTargetChannels(targetId)
end

--- COMMIT_RUNTIME_TEXTURE
---Commits the backing pixels to the specified runtime texture.
---@param tex any
---@return any
function CommitRuntimeTexture(tex)
end

--- GET_ENTITY_ARCHETYPE_NAME
---Returns entity's archetype name, if available.
---@param entity number
---@return any
function GetEntityArchetypeName(entity)
end

--- GET_IS_VEHICLE_ENGINE_RUNNING
---
---@param vehicle any
---@return boolean
function GetIsVehicleEngineRunning(vehicle)
end

--- SET_VEHICLE_STEERING_ANGLE
---
---@param vehicle any
---@param angle number
---@return any
function SetVehicleSteeringAngle(vehicle, angle)
end

--- MUMBLE_SET_VOLUME_OVERRIDE_BY_SERVER_ID
---Overrides the output volume for a particular player with the specified server id and player name on Mumble. This will also bypass 3D audio and distance calculations. -1.0 to reset the override.
---@param serverId any
---@param volume number
---@return any
function MumbleSetVolumeOverrideByServerId(serverId, volume)
end

--- SET_AUDIO_SUBMIX_OUTPUT_VOLUMES
---Sets the volumes for the sound channels in a submix effect.
--- Values can be between 0.0 and 1.0.
--- Channel 5 and channel 6 are not used in voice chat but are believed to be center and LFE channels.
--- Output slot starts at 0 for the first ADD_AUDIO_SUBMIX_OUTPUT call then incremented by 1 on each subsequent call.
---@param submixId any
---@param outputSlot any
---@param frontLeftVolume number
---@param frontRightVolume number
---@param rearLeftVolume number
---@param rearRightVolume number
---@param channel5Volume number
---@param channel6Volume number
---@return any
function SetAudioSubmixOutputVolumes(submixId, outputSlot, frontLeftVolume, frontRightVolume, rearLeftVolume, rearRightVolume, channel5Volume, channel6Volume)
end

--- SET_RUNTIME_TEXTURE_IMAGE
---Replaces the pixel data in a runtime texture with the image data from a file in the current resource, or a data URL.
--- 
--- If the bitmap is a different size compared to the existing texture, it will be resampled.
--- 
--- This command may end up executed asynchronously, and only update the texture data at a later time.
---@param tex any
---@param fileName any
---@return boolean
function SetRuntimeTextureImage(tex, fileName)
end

--- SET_ROPES_CREATE_NETWORK_WORLD_STATE
---Toggles whether the usage of [ADD_ROPE](#\_0xE832D760399EB220) should create an underlying CNetworkRopeWorldStateData. By default this is set to false.
---@param shouldCreate boolean
---@return any
function SetRopesCreateNetworkWorldState(shouldCreate)
end

--- NETWORK_GET_ENTITY_FROM_NETWORK_ID
---
---@param netId any
---@return number
function NetworkGetEntityFromNetworkId(netId)
end

--- SET_RESOURCE_KVP_INT_NO_SYNC
---Nonsynchronous [SET_RESOURCE_KVP_INT](#\_0x6A2B1E8) operation; see [FLUSH_RESOURCE_KVP](#\_0x5240DA5A).
---@param key any
---@param value any
---@return any
function SetResourceKvpIntNoSync(key, value)
end

--- SET_TRAIN_DOOR_OPEN_RATIO
---Sets the ratio that a door is open for on a train.
---@param train any
---@param doorIndex any
---@param ratio number
---@return any
function SetTrainDoorOpenRatio(train, doorIndex, ratio)
end

--- MUMBLE_SET_VOLUME_OVERRIDE
---Overrides the output volume for a particular player on Mumble. This will also bypass 3D audio and distance calculations. -1.0 to reset the override.
--- 
--- Set to -1.0 to reset the Volume override.
---@param player number
---@param volume number
---@return any
function MumbleSetVolumeOverride(player, volume)
end

--- SET_MP_GAMER_TAGS_VISIBLE_DISTANCE
---Sets the maximum distance at which all tags will be visible and which beyond will not be displayed. Distance is measured from the camera position.
---@param distance number
---@return any
function SetMpGamerTagsVisibleDistance(distance)
end

--- ADD_PED_DECORATION_FROM_HASHES
---Applies an Item from a PedDecorationCollection to a ped. These include tattoos and shirt decals.
--- collection - PedDecorationCollection filename hash
--- overlay - Item name hash
--- Example:
--- Entry inside "mpbeach_overlays.xml" -
--- <Item>
--- <uvPos x="0.500000" y="0.500000" />
--- <scale x="0.600000" y="0.500000" />
--- <rotation value="0.000000" />
--- <nameHash>FM_Hair_Fuzz</nameHash>
--- <txdHash>mp_hair_fuzz</txdHash>
--- <txtHash>mp_hair_fuzz</txtHash>
--- <zone>ZONE_HEAD</zone>
--- <type>TYPE_TATTOO</type>
--- <faction>FM</faction>
--- <garment>All</garment>
--- <gender>GENDER_DONTCARE</gender>
--- <award />
--- <awardLevel />
--- </Item>
--- Code:
--- PED::\_0x5F5D1665E352A839(PLAYER::PLAYER_PED_ID(), MISC::GET_HASH_KEY("mpbeach_overlays"), MISC::GET_HASH_KEY("fm_hair_fuzz"))
--- 
--- **This is the server-side RPC native equivalent of the client native [ADD_PED_DECORATION_FROM_HASHES](?\_0x5F5D1665E352A839).**
---@param ped number
---@param collection any
---@param overlay any
---@return any
function AddPedDecorationFromHashes(ped, collection, overlay)
end

--- GET_PED_IN_VEHICLE_SEAT
---
---@param vehicle any
---@param seatIndex any
---@return number
function GetPedInVehicleSeat(vehicle, seatIndex)
end

--- GET_TRAIN_CURRENT_TRACK_NODE
---
---@param train any
---@return any
function GetTrainCurrentTrackNode(train)
end

--- GET_VEHICLE_WHEEL_WIDTH
---Returns vehicle's wheels' width (width is the same for all the wheels, cannot get/set specific wheel of vehicle).
--- Only works on non-default wheels (returns 0 in case of default wheels).
---@param vehicle any
---@return number
function GetVehicleWheelWidth(vehicle)
end

--- TASK_PLAY_ANIM
---[Animations list](https://alexguirre.github.io/animations-list/)
--- 
--- 
--- float blendInSpeed > normal speed is 8.0f
--- ----------------------
--- float blendOutSpeed > normal speed is 8.0f
--- ----------------------
--- int duration: time in millisecond
--- ----------------------
--- -1 _ _ _ _ _ _ _> Default (see flag)
--- 0 _ _ _ _ _ _ _ > Not play at all
--- Small value _ _ > Slow down animation speed
--- Other _ _ _ _ _ > freeze player control until specific time (ms) has
--- _ _ _ _ _ _ _ _ _ passed. (No effect if flag is set to be
--- _ _ _ _ _ _ _ _ _ controllable.)
--- int flag:
--- ----------------------
--- enum eAnimationFlags
--- {
--- ANIM_FLAG_NORMAL = 0,
--- ANIM_FLAG_REPEAT = 1,
--- ANIM_FLAG_STOP_LAST_FRAME = 2,
--- ANIM_FLAG_UPPERBODY = 16,
--- ANIM_FLAG_ENABLE_PLAYER_CONTROL = 32,
--- ANIM_FLAG_CANCELABLE = 120,
--- };
--- Odd number : loop infinitely
--- Even number : Freeze at last frame
--- Multiple of 4: Freeze at last frame but controllable
--- 01 to 15 > Full body
--- 10 to 31 > Upper body
--- 32 to 47 > Full body > Controllable
--- 48 to 63 > Upper body > Controllable
--- ...
--- 001 to 255 > Normal
--- 256 to 511 > Garbled
--- ...
--- playbackRate:
--- values are between 0.0 and 1.0
--- lockX:
--- 0 in most cases 1 for rcmepsilonism8 and rcmpaparazzo_3
--- > 1 for mini@sprunk
--- lockY:
--- 0 in most cases
--- 1 for missfam5_yoga, missfra1mcs_2_crew_react
--- lockZ:
--- 0 for single player
--- Can be 1 but only for MP
--- 
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_PLAY_ANIM](?\_0xEA47FE3719165B94).**
---@param ped number
---@param animDictionary any
---@param animationName any
---@param blendInSpeed number
---@param blendOutSpeed number
---@param duration any
---@param flag any
---@param playbackRate number
---@param lockX boolean
---@param lockY boolean
---@param lockZ boolean
---@return any
function TaskPlayAnim(ped, animDictionary, animationName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
end

--- DELETE_FUNCTION_REFERENCE
---
---@param referenceIdentity any
---@return any
function DeleteFunctionReference(referenceIdentity)
end

--- GET_VEHICLE_WHEEL_SIZE
---Returns vehicle's wheels' size (size is the same for all the wheels, cannot get/set specific wheel of vehicle).
--- Only works on non-default wheels (returns 0 in case of default wheels).
---@param vehicle any
---@return number
function GetVehicleWheelSize(vehicle)
end

--- RESET_FLY_THROUGH_WINDSCREEN_PARAMS
---Resets parameters which is used by the game for checking is ped needs to fly through windscreen after a crash to default values.
---@return any
function ResetFlyThroughWindscreenParams()
end

--- GET_VEHICLE_LOCK_ON_TARGET
---Gets the vehicle that is locked on to for the specified vehicle.
---@param vehicle any
---@return any
function GetVehicleLockOnTarget(vehicle)
end

--- REMOVE_STATE_BAG_CHANGE_HANDLER
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Removes a handler for changes to a state bag.
---@param cookie any
---@return any
function RemoveStateBagChangeHandler(cookie)
end

--- NETWORK_GET_ENTITY_OWNER
---Returns the owner ID of the specified entity.
---@param entity number
---@return any
function NetworkGetEntityOwner(entity)
end

--- SET_PLAYER_STAMINA
---
---@param playerId number
---@param stamina number
---@return boolean
function SetPlayerStamina(playerId, stamina)
end

--- GET_PLAYER_FROM_SERVER_ID
---
---@param serverId any
---@return number
function GetPlayerFromServerId(serverId)
end

--- GET_REGISTERED_COMMANDS
---Returns all commands that are registered in the command system.
--- The data returned adheres to the following layout:
--- 
--- 
--- [
--- {
--- "name": "cmdlist"
--- },
--- {
--- "name": "command1"
--- }
--- ]
--- 
---@return any
function GetRegisteredCommands()
end

--- GET_VEHICLE_WHEEL_IS_POWERED
---Gets whether the wheel is powered.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
--- This is a shortcut to a flag in GET_VEHICLE_WHEEL_FLAGS.
---@param vehicle any
---@param wheelIndex any
---@return boolean
function GetVehicleWheelIsPowered(vehicle, wheelIndex)
end

--- GET_VEHICLE_HANDLING_FLOAT
---Returns the effective handling data of a vehicle as a floating-point value.
--- Example: local fSteeringLock = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock')
---@param vehicle any
---@param class_ any
---@param fieldName any
---@return number
function GetVehicleHandlingFloat(vehicle, class_, fieldName)
end

--- GET_VEHICLE_WHEEL_STEERING_ANGLE
---Gets steering angle of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelSteeringAngle(vehicle, wheelIndex)
end

--- SET_PLAYER_INVINCIBLE
---Simply sets you as invincible (Health will not deplete).
--- Use 0x733A643B5B0C53C1 instead if you want Ragdoll enabled, which is equal to:
--- \*(DWORD \*)(playerPedAddress + 0x188) |= (1 << 9);
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PLAYER_INVINCIBLE](?\_0x239528EACDC3E7DE).**
---@param player number
---@param toggle boolean
---@return any
function SetPlayerInvincible(player, toggle)
end

--- GET_INTERIOR_PORTAL_ROOM_TO
---
---@param interiorId any
---@param portalIndex any
---@return any
function GetInteriorPortalRoomTo(interiorId, portalIndex)
end

--- GET_ROPE_TIME_MULTIPLIER
---
---@param rope any
---@return number
function GetRopeTimeMultiplier(rope)
end

--- GET_PLAYER_SERVER_ID
---
---@param player number
---@return any
function GetPlayerServerId(player)
end

--- GET_PLAYER_ROUTING_BUCKET
---Gets the routing bucket for the specified player.
--- 
--- Routing buckets are also known as 'dimensions' or 'virtual worlds' in past echoes, however they are population-aware.
---@param playerSrc any
---@return any
function GetPlayerRoutingBucket(playerSrc)
end

--- GET_VEHICLE_HEADLIGHTS_COLOUR
---
---@param vehicle any
---@return any
function GetVehicleHeadlightsColour(vehicle)
end

--- SET_VEHICLE_WHEEL_WIDTH
---Sets vehicle's wheels' width (width is the same for all the wheels, cannot get/set specific wheel of vehicle).
--- Only works on non-default wheels.
--- Returns whether change was successful (can be false if trying to set width for non-default wheels).
---@param vehicle any
---@param width number
---@return boolean
function SetVehicleWheelWidth(vehicle, width)
end

--- SET_WEATHER_OWNED_BY_NETWORK
---Sets whether or not the weather should be owned by the network subsystem.
--- 
--- To be able to use [\_SET_WEATHER_TYPE_TRANSITION](#\_0x578C752848ECFA0C), this has to be set to false.
---@param network boolean
---@return any
function SetWeatherOwnedByNetwork(network)
end

--- ADD_TEXT_ENTRY_BY_HASH
---
---@param entryKey any
---@param entryText any
---@return any
function AddTextEntryByHash(entryKey, entryText)
end

--- FIND_FIRST_OBJECT
---
---@param outEntity any
---@return any
function FindFirstObject(outEntity)
end

--- GET_PED_DENSITY_MULTIPLIER
---A getter for [SET_PED_DENSITY_MULTIPLIER_THIS_FRAME](#\_0x95E3D6257B166CF2).
---@return number
function GetPedDensityMultiplier()
end

--- IS_VEHICLE_WANTED
---
---@param vehicle any
---@return boolean
function IsVehicleWanted(vehicle)
end

--- SET_VEHICLE_HANDLING_VECTOR
---Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using SET_HANDLING_VECTOR, this might require some experimentation.
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value { x: number, y: number, z: number }
---@return any
function SetVehicleHandlingVector(vehicle, class_, fieldName, value)
end

--- UPDATE_MAPDATA_ENTITY
---Transiently updates the entity with the specified mapdata index and entity index.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param mapdata any
---@param entity any
---@param entityDef any
---@return any
function UpdateMapdataEntity(mapdata, entity, entityDef)
end

--- GET_PLAYER_ENDPOINT
---
---@param playerSrc any
---@return any
function GetPlayerEndpoint(playerSrc)
end

--- GET_PLAYER_PED
---
---@param playerSrc any
---@return number
function GetPlayerPed(playerSrc)
end

--- GET_PLAYER_VEHICLE_DAMAGE_MODIFIER
---A getter for [SET_PLAYER_VEHICLE_DAMAGE_MODIFIER](#\_0xA50E117CDDF82F0C).
---@param playerId number
---@return number
function GetPlayerVehicleDamageModifier(playerId)
end

--- GET_RESOURCE_METADATA
---Gets the metadata value at a specified key/index from a resource's manifest.
--- See also: [Resource manifest](https://docs.fivem.net/resources/manifest/)
---@param resourceName any
---@param metadataKey any
---@param index any
---@return any
function GetResourceMetadata(resourceName, metadataKey, index)
end

--- GET_ENTITY_TYPE
---Gets the entity type (as an integer), which can be one of the following defined down below:
--- 
--- **The following entities will return type 2:**
--- 
--- *   Automobile
--- *   Bike
--- *   Boat
--- *   Heli
--- *   Plane
--- *   Submarine
--- *   Trailer
--- *   Train
--- *   DraftVeh (Red Dead Redemption 2)
--- 
--- **The following entities will return type 1:**
--- 
--- *   Ped
--- *   Player
--- *   Animal (Red Dead Redemption 2)
--- *   Horse (Red Dead Redemption 2)
--- 
--- **The following entities will return type 3:**
--- 
--- *   Object
--- *   Door
--- *   Pickup
--- 
--- Otherwise, a value of 0 will be returned.
---@param entity number
---@return any
function GetEntityType(entity)
end

--- GET_ENTITY_VELOCITY
---
---@param entity number
---@return { x: number, y: number, z: number }
function GetEntityVelocity(entity)
end

--- UNREGISTER_RAW_NUI_CALLBACK
---Will unregister and cleanup a registered NUI callback handler.
--- 
--- Use along side the REGISTER_RAW_NUI_CALLBACK native.
---@param callbackType any
---@return any
function UnregisterRawNuiCallback(callbackType)
end

--- GET_ENTITY_HEADING
---
---@param entity number
---@return number
function GetEntityHeading(entity)
end

--- GET_LANDING_GEAR_STATE
---See the client-side [GET_LANDING_GEAR_STATE](#\_0x9B0F3DCA3DB0F4CD) native for a description of landing gear states.
---@param vehicle any
---@return any
function GetLandingGearState(vehicle)
end

--- GET_PLAYER_INVINCIBLE_2
---Unlike [GET_PLAYER_INVINCIBLE](#\_0xB721981B2B939E07) this native gets both [SET_PLAYER_INVINCIBLE_KEEP_RAGDOLL_ENABLED](#\_0x6BC97F4F4BB3C04B) and [SET_PLAYER_INVINCIBLE](#\_0x239528EACDC3E7DE) invincibility state.
---@param player number
---@return boolean
function GetPlayerInvincible2(player)
end

--- GET_VEHICLE_WHEEL_SUSPENSION_COMPRESSION
---Gets the current suspension compression of a wheel.
--- Returns a positive value. 0 means the suspension is fully extended, the wheel is off the ground.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelSuspensionCompression(vehicle, wheelIndex)
end

--- SET_RUNTIME_TEXTURE_PIXEL
---Sets a pixel in the specified runtime texture. This will have to be committed using COMMIT_RUNTIME_TEXTURE to have any effect.
---@param tex any
---@param x any
---@param y any
---@param r any
---@param g any
---@param b any
---@param a any
---@return any
function SetRuntimeTexturePixel(tex, x, y, r, g, b, a)
end

--- SET_WEAPONS_NO_AUTOSWAP
---Disables autoswapping to another weapon when the current weapon runs out of ammo.
---@param state boolean
---@return any
function SetWeaponsNoAutoswap(state)
end

--- SET_VEHICLE_ALARM
---**This is the server-side RPC native equivalent of the client native [SET_VEHICLE_ALARM](?\_0xCDE5E70C1DDB954C).**
---@param vehicle any
---@param state boolean
---@return any
function SetVehicleAlarm(vehicle, state)
end

--- GET_PLAYER_MAX_STAMINA
---
---@param playerId number
---@return number
function GetPlayerMaxStamina(playerId)
end

--- GET_ROPE_UPDATE_ORDER
---
---@param rope any
---@return any
function GetRopeUpdateOrder(rope)
end

--- GET_VEHICLE_GRAVITY_AMOUNT
---
---@param vehicle any
---@return number
function GetVehicleGravityAmount(vehicle)
end

--- FIND_FIRST_VEHICLE
---
---@param outEntity any
---@return any
function FindFirstVehicle(outEntity)
end

--- GET_VEHICLE_WHEEL_RIM_COLLIDER_SIZE
---
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelRimColliderSize(vehicle, wheelIndex)
end

--- SET_NUI_FOCUS_KEEP_INPUT
---
---@param keepInput boolean
---@return any
function SetNuiFocusKeepInput(keepInput)
end

--- SET_PED_COMPONENT_VARIATION
---This native is used to set component variation on a ped. Components, drawables and textures IDs are related to the ped model.
--- 
--- ### MP Freemode list of components
--- 
--- **0**: Face\
--- **1**: Mask\
--- **2**: Hair\
--- **3**: Torso\
--- **4**: Leg\
--- **5**: Parachute / bag\
--- **6**: Shoes\
--- **7**: Accessory\
--- **8**: Undershirt\
--- **9**: Kevlar\
--- **10**: Badge\
--- **11**: Torso 2
--- 
--- ### Related and useful natives
--- 
--- [GET_NUMBER_OF_PED_DRAWABLE_VARIATIONS](#\_0x27561561732A7842)\
--- [GET_NUMBER_OF_PED_TEXTURE_VARIATIONS](#\_0x8F7156A3142A6BAD)
--- [List of component/props ID](gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html) of player_two with examples
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_COMPONENT_VARIATION](?\_0x262B14F48D29DE80).**
---@param ped number
---@param componentId any
---@param drawableId any
---@param textureId any
---@param paletteId any
---@return any
function SetPedComponentVariation(ped, componentId, drawableId, textureId, paletteId)
end

--- DELETE_ENTITY
---Deletes the specified entity.
---@param entity number
---@return any
function DeleteEntity(entity)
end

--- GET_ENTITY_ROTATION
---
---@param entity number
---@return { x: number, y: number, z: number }
function GetEntityRotation(entity)
end

--- CREATE_VEHICLE_SERVER_SETTER
---Equivalent to CREATE_VEHICLE, but it uses 'server setter' logic (like the former CREATE_AUTOMOBILE) as a workaround for
--- reliability concerns regarding entity creation RPC.
--- 
--- Unlike CREATE_AUTOMOBILE, this supports other vehicle types as well.
---@param modelHash any
---@param type any
---@param x number
---@param y number
---@param z number
---@param heading number
---@return any
function CreateVehicleServerSetter(modelHash, type, x, y, z, heading)
end

--- SET_VEHICLE_ALARM_TIME_LEFT
---
---@param vehicle any
---@param time any
---@return any
function SetVehicleAlarmTimeLeft(vehicle, time)
end

--- SET_ENTITY_MATRIX
---Sets an entity's matrix. Arguments are in the same order as with GET_ENTITY_MATRIX.
---@param entity number
---@param forwardX number
---@param forwardY number
---@param forwardZ number
---@param rightX number
---@param rightY number
---@param rightZ number
---@param upX number
---@param upY number
---@param upZ number
---@param atX number
---@param atY number
---@param atZ number
---@return any
function SetEntityMatrix(entity, forwardX, forwardY, forwardZ, rightX, rightY, rightZ, upX, upY, upZ, atX, atY, atZ)
end

--- MUMBLE_ADD_VOICE_TARGET_PLAYER_BY_SERVER_ID
---Adds the specified player to the target list for the specified Mumble voice target ID.
---@param targetId any
---@param serverId any
---@return any
function MumbleAddVoiceTargetPlayerByServerId(targetId, serverId)
end

--- REGISTER_STREAMING_FILE_FROM_KVS
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a KVP value as an asset with the GTA streaming module system. This function currently won't work.
---@param kvsKey any
---@return any
function RegisterStreamingFileFromKvs(kvsKey)
end

--- SET_VEHICLE_HANDLING_INT
---Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using SET_HANDLING_INT, this might require some experimentation.
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value any
---@return any
function SetVehicleHandlingInt(vehicle, class_, fieldName, value)
end

--- CLEAR_PED_PROP
---List of component/props ID
--- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
--- 
--- **This is the server-side RPC native equivalent of the client native [CLEAR_PED_PROP](?\_0x0943E5B8E078E76E).**
---@param ped number
---@param propId any
---@return any
function ClearPedProp(ped, propId)
end

--- GET_PLAYER_MAX_HEALTH
---
---@param playerSrc any
---@return any
function GetPlayerMaxHealth(playerSrc)
end

--- GET_VEHICLE_FUEL_LEVEL
---
---@param vehicle any
---@return number
function GetVehicleFuelLevel(vehicle)
end

--- GET_VEHICLE_XENON_LIGHTS_CUSTOM_COLOR
---Returns vehicle xenon lights custom RGB color values. Do note this native doesn't return non-RGB colors that was set with [\_SET_VEHICLE_XENON_LIGHTS_COLOR](#\_0xE41033B25D003A07).
---@param vehicle any
---@param red any
---@param green any
---@param blue any
---@return boolean
function GetVehicleXenonLightsCustomColor(vehicle, red, green, blue)
end

--- GET_INTERIOR_ROOM_FLAG
---
---@param interiorId any
---@param roomIndex any
---@return any
function GetInteriorRoomFlag(interiorId, roomIndex)
end

--- SEND_DUI_MOUSE_UP
---Injects a 'mouse up' event for a DUI object. Coordinates are expected to be set using SEND_DUI_MOUSE_MOVE.
---@param duiObject any
---@param button any
---@return any
function SendDuiMouseUp(duiObject, button)
end

--- SET_SNAKEOIL_FOR_ENTRY
---
---@param name any
---@param path any
---@param data any
---@return any
function SetSnakeoilForEntry(name, path, data)
end

--- GET_WEAPON_COMPONENT_RANGE_DAMAGE_MODIFIER
---A getter for CWeaponFallOffModifier damage modifier value in a weapon component.
---@param componentHash any
---@return number
function GetWeaponComponentRangeDamageModifier(componentHash)
end

--- IS_ENTITY_VISIBLE
---This native checks if the given entity is visible.
---@param entity number
---@return boolean
function IsEntityVisible(entity)
end

--- SET_HANDLING_VECTOR
---Sets a global handling override for a specific vehicle class. The name is supposed to match the handlingName field from handling.meta.
--- Example: SetHandlingVector('AIRTUG', 'CHandlingData', 'vecCentreOfMassOffset', vector3(0.0, 0.0, -5.0))
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value { x: number, y: number, z: number }
---@return any
function SetHandlingVector(vehicle, class_, fieldName, value)
end

--- SET_VEHICLE_WHEEL_HEALTH
---
---@param vehicle any
---@param wheelIndex any
---@param health number
---@return any
function SetVehicleWheelHealth(vehicle, wheelIndex, health)
end

--- GET_INTERIOR_ENTITIES_EXTENTS
---
---@param interiorId any
---@param bbMinX any
---@param bbMinY any
---@param bbMinZ any
---@param bbMaxX any
---@param bbMaxY any
---@param bbMaxZ any
---@return any
function GetInteriorEntitiesExtents(interiorId, bbMinX, bbMinY, bbMinZ, bbMaxX, bbMaxY, bbMaxZ)
end

--- GET_ENTITY_POPULATION_TYPE
---This native gets an entity's population type.
---@param entity number
---@return any
function GetEntityPopulationType(entity)
end

--- GET_PLAYER_WANTED_LEVEL
---
--- Returns given players wanted level server-side.
--- 
---@param playerSrc any
---@return any
function GetPlayerWantedLevel(playerSrc)
end

--- GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM
---
---@param vehicle any
---@return boolean
function GetIsVehiclePrimaryColourCustom(vehicle)
end

--- SEND_LOADING_SCREEN_MESSAGE
---Sends a message to the loadingScreen NUI frame, which contains the HTML page referenced in loadscreen resources.
---@param jsonString any
---@return boolean
function SendLoadingScreenMessage(jsonString)
end

--- SET_VEHICLE_WHEEL_RIM_COLLIDER_SIZE
---Not sure what this changes, probably determines physical rim size in case the tire is blown.
---@param vehicle any
---@param wheelIndex any
---@param value number
---@return any
function SetVehicleWheelRimColliderSize(vehicle, wheelIndex, value)
end

--- SET_VEHICLE_WHEEL_BRAKE_PRESSURE
---Sets brake pressure of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
--- Normal values around 1.0f
---@param vehicle any
---@param wheelIndex any
---@param pressure number
---@return any
function SetVehicleWheelBrakePressure(vehicle, wheelIndex, pressure)
end

--- TASK_GO_STRAIGHT_TO_COORD
---**This is the server-side RPC native equivalent of the client native [TASK_GO_STRAIGHT_TO_COORD](?\_0xD76B57B44F1E6F8B).**
---@param ped number
---@param x number
---@param y number
---@param z number
---@param speed number
---@param timeout any
---@param targetHeading number
---@param distanceToSlide number
---@return any
function TaskGoStraightToCoord(ped, x, y, z, speed, timeout, targetHeading, distanceToSlide)
end

--- GET_CAM_MATRIX
---Returns the world matrix of the specified camera. To turn this into a view matrix, calculate the inverse.
---@param camera any
---@param rightVector any
---@param forwardVector any
---@param upVector any
---@param position any
---@return any
function GetCamMatrix(camera, rightVector, forwardVector, upVector, position)
end

--- GET_ALL_ROPES
---Returns all rope handles. The data returned adheres to the following layout:
--- 
--- 
--- [ 770, 1026, 1282, 1538, 1794, 2050, 2306, 2562, 2818, 3074, 3330, 3586, 3842, 4098, 4354, 4610, ...]
--- 
---@return any
function GetAllRopes()
end

--- GET_INTERIOR_ROOM_TIMECYCLE
---
---@param interiorId any
---@param roomIndex any
---@return any
function GetInteriorRoomTimecycle(interiorId, roomIndex)
end

--- GET_VEHICLE_DASHBOARD_BOOST
---
---@return number
function GetVehicleDashboardBoost()
end

--- GET_VEHICLE_CURRENT_RPM
---
---@param vehicle any
---@return number
function GetVehicleCurrentRpm(vehicle)
end

--- SET_NETWORK_WALK_MODE
---
---@param enabled boolean
---@return any
function SetNetworkWalkMode(enabled)
end

--- IS_PLAYER_COMMERCE_INFO_LOADED
---Requests whether or not the commerce data for the specified player has loaded.
---@param playerSrc any
---@return boolean
function IsPlayerCommerceInfoLoaded(playerSrc)
end

--- SEND_NUI_MESSAGE
---
---@param jsonString any
---@return boolean
function SendNuiMessage(jsonString)
end

--- GET_PLAYER_IDENTIFIER_BY_TYPE
---Get an identifier from a player by the type of the identifier.
---@param playerSrc any
---@param identifierType any
---@return any
function GetPlayerIdentifierByType(playerSrc, identifierType)
end

--- GET_VEHICLE_DENSITY_MULTIPLIER
---A getter for [SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME](#\_0x245A6883D966D537).
---@return number
function GetVehicleDensityMultiplier()
end

--- GET_PLAYER_VEHICLE_DEFENSE_MODIFIER
---A getter for [SET_PLAYER_VEHICLE_DEFENSE_MODIFIER](#\_0x4C60E6EFDAFF2462).
---@param playerId number
---@return number
function GetPlayerVehicleDefenseModifier(playerId)
end

--- GET_TRAIN_CARRIAGE_ENGINE
---
---@param train any
---@return any
function GetTrainCarriageEngine(train)
end

--- GET_PED_MOVEMENT_CLIPSET
---
---@param ped number
---@return any
function GetPedMovementClipset(ped)
end

--- _ADD_BLIP_FOR_AREA
---Adds a rectangular blip for the specified coordinates/area.
--- It is recommended to use [SET_BLIP_ROTATION](#\_0xF87683CDF73C3F6E) and [SET_BLIP_COLOUR](#\_0x03D7FB09E75D6B7E) to make the blip not rotate along with the camera.
--- By default, the blip will show as a *regular* blip with the specified color/sprite if it is outside of the minimap view.
--- Example image:
--- ![minimap](https://w.wew.wtf/pdcjig.png)
--- ![big map](https://w.wew.wtf/zgcjcm.png)
--- (Native name is *likely* to actually be ADD_BLIP_FOR_AREA, but due to the usual reasons this can't be confirmed)
--- 
--- **This is the server-side RPC native equivalent of the client native [\_ADD_BLIP_FOR_AREA](?\_0xCE5D0E5E315DB238).**
---@param x number
---@param y number
---@param z number
---@param width number
---@param height number
---@return any
function AddBlipForArea(x, y, z, width, height)
end

--- REGISTER_RESOURCE_ASSET
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a cached resource asset with the resource system, similar to the automatic scanning of the stream/ folder.
---@param resourceName any
---@param fileName any
---@return any
function RegisterResourceAsset(resourceName, fileName)
end

--- REMOVE_DRY_VOLUME
---Removes a dry volume from the game session.
--- See CREATE_DRY_VOLUME for more info
---@param handle any
---@return any
function RemoveDryVolume(handle)
end

--- START_FIND_KVP
---
---@param prefix any
---@return any
function StartFindKvp(prefix)
end

--- LOAD_PLAYER_COMMERCE_DATA_EXT
---Requests the commerce data from Tebex for the specified player, including the owned SKUs. Use IS_PLAYER_COMMERCE_INFO_LOADED to check if it has loaded.
---@param playerSrc any
---@return any
function LoadPlayerCommerceDataExt(playerSrc)
end

--- GET_ENTITY_MAPDATA_OWNER
---Retrieves the map data and entity handles from a specific entity.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param entity number
---@param mapdataHandle any
---@param entityHandle any
---@return boolean
function GetEntityMapdataOwner(entity, mapdataHandle, entityHandle)
end

--- SET_PED_DEFAULT_COMPONENT_VARIATION
---Sets Ped Default Clothes
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_DEFAULT_COMPONENT_VARIATION](?\_0x45EEE61580806D63).**
---@param ped number
---@return any
function SetPedDefaultComponentVariation(ped)
end

--- GET_PLAYER_GUID
---
---@param playerSrc any
---@return any
function GetPlayerGuid(playerSrc)
end

--- GET_INTERIOR_ROOM_INDEX_BY_HASH
---
---@param interiorId any
---@param roomHash any
---@return any
function GetInteriorRoomIndexByHash(interiorId, roomHash)
end

--- GET_VEHICLE_TOP_SPEED_MODIFIER
---A getter for [MODIFY_VEHICLE_TOP_SPEED](#\_0x93A3996368C94158). Returns -1.0 if a modifier is not set.
---@param vehicle any
---@return number
function GetVehicleTopSpeedModifier(vehicle)
end

--- MUMBLE_IS_PLAYER_TALKING
---
---@param player number
---@return boolean
function MumbleIsPlayerTalking(player)
end

--- SET_VEHICLE_WHEEL_TIRE_COLLIDER_SIZE
---Use along with SetVehicleWheelSize to resize the wheels (this native sets the collider size affecting physics while SetVehicleWheelSize will change visual size).
---@param vehicle any
---@param wheelIndex any
---@param value number
---@return any
function SetVehicleWheelTireColliderSize(vehicle, wheelIndex, value)
end

--- GET_ENTITY_INDEX_FROM_MAPDATA
---Returns the transient entity index for a specified mapdata/entity pair.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param mapdata any
---@param entity any
---@return any
function GetEntityIndexFromMapdata(mapdata, entity)
end

--- IS_VEHICLE_SIREN_ON
---
---@param vehicle any
---@return boolean
function IsVehicleSirenOn(vehicle)
end

--- IS_STREAMING_FILE_READY
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Returns whether an asynchronous streaming file registration completed.
---@param registerAs any
---@return boolean
function IsStreamingFileReady(registerAs)
end

--- IS_PED_A_PLAYER
---This native checks if the given ped is a player.
---@param ped number
---@return boolean
function IsPedAPlayer(ped)
end

--- SET_VEHICLE_COLOUR_COMBINATION
---Sets the selected vehicle's colors to their default value (specific variant specified using the colorCombination parameter).
--- Range of possible values for colorCombination is currently unknown, I couldn't find where these values are stored either (Disquse's guess was vehicles.meta but I haven't seen it in there.)
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_COLOUR_COMBINATION](?\_0x33E8CD3322E2FE31).**
---@param vehicle any
---@param colorCombination any
---@return any
function SetVehicleColourCombination(vehicle, colorCombination)
end

--- CLEAR_PED_TASKS_IMMEDIATELY
---Immediately stops the pedestrian from whatever it's doing. The difference between this and [CLEAR_PED_TASKS](#\_0xE1EF3C1216AFF2CD) is that this one teleports the ped but does not change the position of the ped.
--- 
--- **This is the server-side RPC native equivalent of the client native [CLEAR_PED_TASKS_IMMEDIATELY](?\_0xAAA34F8A7CB32098).**
---@param ped number
---@return any
function ClearPedTasksImmediately(ped)
end

--- GET_WORLD_COORD_FROM_SCREEN_COORD
---Converts a screen coordinate into its relative world coordinate.
---@param screenX number
---@param screenY number
---@param worldVector any
---@param normalVector any
---@return any
function GetWorldCoordFromScreenCoord(screenX, screenY, worldVector, normalVector)
end

--- MUMBLE_IS_ACTIVE
---
---@return boolean
function MumbleIsActive()
end

--- SET_TEXT_CHAT_ENABLED
---
---@param enabled boolean
---@return boolean
function SetTextChatEnabled(enabled)
end

--- SET_NUI_FOCUS
---
---@param hasFocus boolean
---@param hasCursor boolean
---@return any
function SetNuiFocus(hasFocus, hasCursor)
end

--- SET_VEHICLE_WHEEL_Y_ROTATION
---
---@param vehicle any
---@param wheelIndex any
---@param value number
---@return any
function SetVehicleWheelYRotation(vehicle, wheelIndex, value)
end

--- MUMBLE_ADD_VOICE_TARGET_CHANNEL
---Adds the specified channel to the target list for the specified Mumble voice target ID.
---@param targetId any
---@param channel any
---@return any
function MumbleAddVoiceTargetChannel(targetId, channel)
end

--- IS_ENTITY_POSITION_FROZEN
---A getter for [FREEZE_ENTITY_POSITION](#\_0x428CA6DBD1094446).
---@param entity number
---@return boolean
function IsEntityPositionFrozen(entity)
end

--- SET_ENTITY_ROUTING_BUCKET
---Sets the routing bucket for the specified entity.
--- 
--- Routing buckets are also known as 'dimensions' or 'virtual worlds' in past echoes, however they are population-aware.
---@param entity number
---@param bucket any
---@return any
function SetEntityRoutingBucket(entity, bucket)
end

--- TRIGGER_SERVER_EVENT_INTERNAL
---The backing function for TriggerServerEvent.
---@param eventName any
---@param eventPayload any
---@param payloadLength any
---@return any
function TriggerServerEventInternal(eventName, eventPayload, payloadLength)
end

--- SET_PED_HEAD_OVERLAY
---
--- OverlayID ranges from 0 to 12, index from 0 to _GET_NUM_OVERLAY_VALUES(overlayID)-1, and opacity from 0.0 to 1.0.
--- overlayID       Part                  Index, to disable
--- 0               Blemishes             0 - 23, 255
--- 1               Facial Hair           0 - 28, 255
--- 2               Eyebrows              0 - 33, 255
--- 3               Ageing                0 - 14, 255
--- 4               Makeup                0 - 74, 255
--- 5               Blush                 0 - 6, 255
--- 6               Complexion            0 - 11, 255
--- 7               Sun Damage            0 - 10, 255
--- 8               Lipstick              0 - 9, 255
--- 9               Moles/Freckles        0 - 17, 255
--- 10              Chest Hair            0 - 16, 255
--- 11              Body Blemishes        0 - 11, 255
--- 12              Add Body Blemishes    0 - 1, 255
--- 
--- 
--- **Note:**
--- You may need to call [SetPedHeadBlendData](#0x9414E18B9434C2FE) prior to calling this native in order for it to work.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_HEAD_OVERLAY](?\_0x48F44967FA05CC1E).**
---@param ped number
---@param overlayID any
---@param index any
---@param opacity number
---@return any
function SetPedHeadOverlay(ped, overlayID, index, opacity)
end

--- GET_WEAPON_DAMAGE_MODIFIER
---A getter for [\_SET_WEAPON_DAMAGE_MODIFIER](#\_0x4757F00BC6323CFE).
---@param weaponHash any
---@return number
function GetWeaponDamageModifier(weaponHash)
end

--- SET_FLASH_LIGHT_KEEP_ON_WHILE_MOVING
---Allows Weapon-Flashlight beams to stay visible while moving. Normally it only stays on while aiming.
---@param state boolean
---@return any
function SetFlashLightKeepOnWhileMoving(state)
end

--- SET_AUDIO_SUBMIX_EFFECT_RADIO_FX
---Assigns a RadioFX effect to a submix effect slot.
--- 
--- The parameter values for this effect are as follows (backticks are used to represent hashes):
--- 
--- | Index | Type | Description |
--- |-|-|-|
--- | \enabled\ | int | Enables or disables RadioFX on this DSP. |
--- | \default\ | int | Sets default parameters for the RadioFX DSP and enables it. |
--- | \freq_low\ | float |  |
--- | \freq_hi\ | float |  |
--- | \fudge\ | float |  |
--- | \rm_mod_freq\ | float |  |
--- | \rm_mix\ | float |  |
--- | \o_freq_lo\ | float |  |
--- | \o_freq_hi\ | float |  |
---@param submixId any
---@param effectSlot any
---@return any
function SetAudioSubmixEffectRadioFx(submixId, effectSlot)
end

--- GET_VEHICLE_DASHBOARD_SPEED
---
---@param vehicle any
---@return number
function GetVehicleDashboardSpeed(vehicle)
end

--- SET_MILLISECONDS_PER_GAME_MINUTE
---Overrides how many real ms are equal to one game minute.
--- A setter for [GetMillisecondsPerGameMinute](#\_0x2F8B4D1C595B11DB).
---@param value any
---@return any
function SetMillisecondsPerGameMinute(value)
end

--- GET_DUI_HANDLE
---Returns the NUI window handle for a specified DUI browser object.
---@param duiObject any
---@return any
function GetDuiHandle(duiObject)
end

--- GET_ENTITY_SCRIPT
---
---@param entity number
---@return any
function GetEntityScript(entity)
end

--- GET_PED_SCRIPT_TASK_COMMAND
---Gets the script task command currently assigned to the ped.
---@param ped number
---@return any
function GetPedScriptTaskCommand(ped)
end

--- MUMBLE_SET_VOICE_TARGET
---Sets the current Mumble voice target ID to broadcast voice to.
---@param targetId any
---@return any
function MumbleSetVoiceTarget(targetId)
end

--- MUMBLE_REMOVE_VOICE_TARGET_CHANNEL
---Removes the specified voice channel from the user's voice targets.
--- 
--- Performs the opposite operation of [MUMBLE_ADD_VOICE_TARGET_CHANNEL](#\_0x4D386C9E)
---@param targetId any
---@param channel any
---@return any
function MumbleRemoveVoiceTargetChannel(targetId, channel)
end

--- CREATE_AUDIO_SUBMIX
---Creates an audio submix with the specified name, or gets the existing audio submix by that name.
---@param name any
---@return any
function CreateAudioSubmix(name)
end

--- IS_PLAYER_EVADING_WANTED_LEVEL
---
--- This will return true if the player is evading wanted level, meaning that the wanted level stars are blink.
--- Otherwise will return false.
--- 
--- If the player is not wanted, it simply returns false.
--- 
---@param playerSrc any
---@return boolean
function IsPlayerEvadingWantedLevel(playerSrc)
end

--- GET_VEHICLE_WHEEL_TIRE_COLLIDER_SIZE
---
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelTireColliderSize(vehicle, wheelIndex)
end

--- SET_IGNORE_VEHICLE_OWNERSHIP_FOR_STOWING
---Sets whether or not ownership checks should be performed while trying to stow a carriable on a hunting wagon.
---@param ignore boolean
---@return any
function SetIgnoreVehicleOwnershipForStowing(ignore)
end

--- GET_NETWORK_WALK_MODE
---
---@return boolean
function GetNetworkWalkMode()
end

--- GET_PLAYER_IDENTIFIER
---
---@param playerSrc any
---@param identifier any
---@return any
function GetPlayerIdentifier(playerSrc, identifier)
end

--- MUMBLE_SET_AUDIO_INPUT_INTENT
---Use this native to disable noise suppression and high pass filters.
--- 
--- The possible intents for this are as follows (backticks are used to represent hashes):
--- 
--- | Index | Description |
--- |-|-|
--- | \speech\ | Default intent |
--- | \music\ | Disable noise suppression and high pass filter |
---@param intentHash any
---@return any
function MumbleSetAudioInputIntent(intentHash)
end

--- GET_STATE_BAG_VALUE
---Returns the value of a state bag key.
---@param bagName any
---@param key any
---@return any
function GetStateBagValue(bagName, key)
end

--- IS_PLAYER_USING_SUPER_JUMP
---
---@param playerSrc any
---@return boolean
function IsPlayerUsingSuperJump(playerSrc)
end

--- GIVE_WEAPON_COMPONENT_TO_PED
---**This is the server-side RPC native equivalent of the client native [GIVE_WEAPON_COMPONENT_TO_PED](?\_0xD966D51AA5B28BB9).**
---@param ped number
---@param weaponHash any
---@param componentHash any
---@return any
function GiveWeaponComponentToPed(ped, weaponHash, componentHash)
end

--- SET_VEHICLE_DIRT_LEVEL
---Sets the dirt level of the passed vehicle.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_DIRT_LEVEL](?\_0x79D3B596FE44EE8B).**
---@param vehicle any
---@param dirtLevel number
---@return any
function SetVehicleDirtLevel(vehicle, dirtLevel)
end

--- CREATE_RUNTIME_TEXTURE_FROM_DUI_HANDLE
---Creates a runtime texture from a DUI handle.
---@param txd any
---@param txn any
---@param duiHandle any
---@return any
function CreateRuntimeTextureFromDuiHandle(txd, txn, duiHandle)
end

--- GET_PASSWORD_HASH
---
---@param password any
---@return any
function GetPasswordHash(password)
end

--- GET_SCENARIO_PED_DENSITY_MULTIPLIER
---A getter for [SET_SCENARIO_PED_DENSITY_MULTIPLIER_THIS_FRAME](#\_0x7A556143A1C03898).
---@return number
function GetScenarioPedDensityMultiplier()
end

--- SET_PED_RANDOM_COMPONENT_VARIATION
---p1 is always 0 in R\* scripts; and a quick disassembly seems to indicate that p1 is unused.
--- List of component/props ID:
--- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_RANDOM_COMPONENT_VARIATION](?\_0xC8A9481A01E63C28).**
---@param ped number
---@param p1 any
---@return any
function SetPedRandomComponentVariation(ped, p1)
end

--- IS_VEHICLE_PREVIOUSLY_OWNED_BY_PLAYER
---
---@param vehicle any
---@return boolean
function IsVehiclePreviouslyOwnedByPlayer(vehicle)
end

--- GET_VEHICLE_WHEEL_BRAKE_PRESSURE
---Gets brake pressure of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
--- Normal values around 1.0f when braking.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelBrakePressure(vehicle, wheelIndex)
end

--- SET_VEHICLE_WHEEL_X_OFFSET
---Adjusts the offset of the specified wheel relative to the wheel's axle center.
--- Needs to be called every frame in order to function properly, as GTA will reset the offset otherwise.
--- This function can be especially useful to set the track width of a vehicle, for example:
--- 
--- 
--- function SetVehicleFrontTrackWidth(vehicle, width)
--- SetVehicleWheelXOffset(vehicle, 0, -width/2)
--- SetVehicleWheelXOffset(vehicle, 1, width/2)
--- end
--- 
---@param vehicle any
---@param wheelIndex any
---@param offset number
---@return any
function SetVehicleWheelXOffset(vehicle, wheelIndex, offset)
end

--- GET_MAPDATA_ENTITY_MATRIX
---Returns mapdata's entity matrix. This function supports SDK infrastructure and is not intended to be used directly from your code.
--- 
--- This should be used from JavaScript or another language supporting mutable buffers like ArrayBuffer.
--- 
--- Matrix layout is as follows:
--- 
--- *   Element \[0], \[1] and \[2] should represent the right vector.
--- *   Element \[4], \[5] and \[6] should represent the forward vector.
--- *   Element \[8], \[9] and \[10] should represent the up vector.
--- *   Element \[12], \[13] and \[14] should represent X, Y and Z translation coordinates.
--- *   All other elements should be \[0, 0, 0, 1].
---@param mapDataHash any
---@param entityInternalIdx any
---@param matrixPtr any
---@return boolean
function GetMapdataEntityMatrix(mapDataHash, entityInternalIdx, matrixPtr)
end

--- HAS_ENTITY_BEEN_MARKED_AS_NO_LONGER_NEEDED
---
---@param vehicle any
---@return boolean
function HasEntityBeenMarkedAsNoLongerNeeded(vehicle)
end

--- MUMBLE_SET_VOICE_CHANNEL
---
---@param channel any
---@return any
function MumbleSetVoiceChannel(channel)
end

--- SET_PLAYER_ROUTING_BUCKET
---Sets the routing bucket for the specified player.
--- 
--- Routing buckets are also known as 'dimensions' or 'virtual worlds' in past echoes, however they are population-aware.
---@param playerSrc any
---@param bucket any
---@return any
function SetPlayerRoutingBucket(playerSrc, bucket)
end

--- CREATE_RUNTIME_TEXTURE
---Creates a blank runtime texture.
---@param txd any
---@param txn any
---@param width any
---@param height any
---@return any
function CreateRuntimeTexture(txd, txn, width, height)
end

--- GET_INTERIOR_ROTATION
---
---@param interiorId any
---@param rotx any
---@param rotY any
---@param rotZ any
---@param rotW any
---@return any
function GetInteriorRotation(interiorId, rotx, rotY, rotZ, rotW)
end

--- SET_DISCORD_RICH_PRESENCE_ASSET
---This native sets the image asset for the discord rich presence implementation.
---@param assetName any
---@return any
function SetDiscordRichPresenceAsset(assetName)
end

--- GET_MAPDATA_FROM_HASH_KEY
---Returns the transient map data index for a specified hash.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param mapdataHandle any
---@return any
function GetMapdataFromHashKey(mapdataHandle)
end

--- GET_INTERIOR_PORTAL_FLAG
---
---@param interiorId any
---@param portalIndex any
---@return any
function GetInteriorPortalFlag(interiorId, portalIndex)
end

--- GET_VEHICLE_DASHBOARD_RPM
---
---@return number
function GetVehicleDashboardRpm()
end

--- IS_BIGMAP_ACTIVE
---<!-- Native implemented by Disquse. 0xFFF65C63 -->
--- 
--- Returns true if the minimap is currently expanded. False if it's the normal minimap state.
--- Use [IsBigmapFull](#\_0x66EE14B2) to check if the full map is currently revealed on the minimap.
---@return boolean
function IsBigmapActive()
end

--- GET_VEHICLE_TYRE_SMOKE_COLOR
---
---@param vehicle any
---@param r any
---@param g any
---@param b any
---@return any
function GetVehicleTyreSmokeColor(vehicle, r, g, b)
end

--- REGISTER_CONSOLE_LISTENER
---Registers a listener for console output messages.
---@param listener any
---@return any
function RegisterConsoleListener(listener)
end

--- SET_MINIMAP_CLIP_TYPE
---Sets the type for the minimap blip clipping object to be either rectangular or rounded.
---@param type any
---@return any
function SetMinimapClipType(type)
end

--- GET_ENTITY_ROTATION_VELOCITY
---
---@param entity number
---@return { x: number, y: number, z: number }
function GetEntityRotationVelocity(entity)
end

--- GET_VEHICLE_STEERING_ANGLE
---
---@param vehicle any
---@return number
function GetVehicleSteeringAngle(vehicle)
end

--- SET_VEHICLE_AUTO_REPAIR_DISABLED
---Disables the vehicle from being repaired when a vehicle extra is enabled.
---@param vehicle any
---@param value boolean
---@return any
function SetVehicleAutoRepairDisabled(vehicle, value)
end

--- SET_VEHICLE_WHEEL_ROTATION_SPEED
---Sets the rotation speed of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@param speed number
---@return any
function SetVehicleWheelRotationSpeed(vehicle, wheelIndex, speed)
end

--- SET_ENTITY_DRAW_OUTLINE_COLOR
---Sets color for entity outline. 255, 0, 255, 255 by default.
---@param red any
---@param green any
---@param blue any
---@param alpha any
---@return any
function SetEntityDrawOutlineColor(red, green, blue, alpha)
end

--- FIND_FIRST_PED
---
---@param outEntity any
---@return any
function FindFirstPed(outEntity)
end

--- GET_ALL_OBJECTS
---Returns all object handles known to the server.
--- The data returned adheres to the following layout:
--- 
--- 
--- [127, 42, 13, 37]
--- 
---@return any
function GetAllObjects()
end

--- GET_ENTITY_FROM_STATE_BAG_NAME
---Returns the entity handle for the specified state bag name. For use with [ADD_STATE_BAG_CHANGE_HANDLER](?\_0x5BA35AAF).
---@param bagName any
---@return number
function GetEntityFromStateBagName(bagName)
end

--- GET_TRAIN_DOOR_OPEN_RATIO
---Gets the ratio that a door is open for on a train.
---@param train any
---@param doorIndex any
---@return number
function GetTrainDoorOpenRatio(train, doorIndex)
end

--- GET_VEHICLE_WHEEL_ROTATION_SPEED
---Gets the rotation speed of a wheel.
--- This is used internally to calcuate GET_VEHICLE_WHEEL_SPEED.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelRotationSpeed(vehicle, wheelIndex)
end

--- IS_VEHICLE_NEEDS_TO_BE_HOTWIRED
---
---@param vehicle any
---@return boolean
function IsVehicleNeedsToBeHotwired(vehicle)
end

--- SET_PED_AMMO
---NativeDB Added Parameter 4: BOOL p3
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_AMMO](?\_0x14E56BC5B5DB6A19).**
---@param ped number
---@param weaponHash any
---@param ammo any
---@return any
function SetPedAmmo(ped, weaponHash, ammo)
end

--- SET_VEHICLE_DOOR_BROKEN
---See eDoorId declared in [SET_VEHICLE_DOOR_SHUT](#\_0x93D9BD300D7789E5)
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_DOOR_BROKEN](?\_0xD4D4F6A4AB575A33).**
---@param vehicle any
---@param doorIndex any
---@param deleteDoor boolean
---@return any
function SetVehicleDoorBroken(vehicle, doorIndex, deleteDoor)
end

--- REGISTER_RESOURCE_BUILD_TASK_FACTORY
---Registers a build task factory for resources.
--- The function should return an object (msgpack map) with the following fields:
--- 
--- 
--- {
--- // returns whether the specific resource should be built
--- shouldBuild = func(resourceName: string): bool,
--- 
--- // asynchronously start building the specific resource.
--- // call cb when completed
--- build = func(resourceName: string, cb: func(success: bool, status: string): void): void
--- }
--- 
---@param factoryId any
---@param factoryFn any
---@return any
function RegisterResourceBuildTaskFactory(factoryId, factoryFn)
end

--- SET_MP_GAMER_TAGS_USE_VEHICLE_BEHAVIOR
---Sets whether all tags should group (normal game behavior) or should remain independent and above each ped's respective head when in a vehicle.
---@param enabled boolean
---@return any
function SetMpGamerTagsUseVehicleBehavior(enabled)
end

--- SET_DISCORD_RICH_PRESENCE_ASSET_TEXT
---This native sets the hover text of the image asset for the discord rich presence implementation.
---@param text any
---@return any
function SetDiscordRichPresenceAssetText(text)
end

--- CLEAR_PED_TASKS
---Clear a ped's tasks. Stop animations and other tasks created by scripts.
--- 
--- **This is the server-side RPC native equivalent of the client native [CLEAR_PED_TASKS](?\_0xE1EF3C1216AFF2CD).**
---@param ped number
---@return any
function ClearPedTasks(ped)
end

--- GET_VEHICLE_WHEEL_Y_ROTATION
---
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelYRotation(vehicle, wheelIndex)
end

--- NETWORK_GET_VOICE_PROXIMITY_OVERRIDE
---
---@param playerSrc any
---@return { x: number, y: number, z: number }
function NetworkGetVoiceProximityOverride(playerSrc)
end

--- IS_DUPLICITY_VERSION
---Gets whether or not this is the CitizenFX server.
---@return boolean
function IsDuplicityVersion()
end

--- SET_PED_ARMOUR
---Sets the armor of the specified ped.
--- ped: The Ped to set the armor of.
--- amount: A value between 0 and 100 indicating the value to set the Ped's armor to.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_ARMOUR](?\_0xCEA04D83135264CC).**
---@param ped number
---@param amount any
---@return any
function SetPedArmour(ped, amount)
end

--- GET_ENTITY_COORDS
---Gets the current coordinates for a specified entity. This native is used server side when using OneSync.
--- 
--- See [GET_ENTITY_COORDS](#\_0x3FEF770D40960D5A) for client side.
---@param entity number
---@return { x: number, y: number, z: number }
function GetEntityCoords(entity)
end

--- GET_WEAPON_COMPONENT_CAMERA_HASH
---A getter for CameraHash in a weapon scope component.
---@param componentHash any
---@return any
function GetWeaponComponentCameraHash(componentHash)
end

--- REGISTER_STREAMING_FILE_FROM_URL
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a file from an URL as a streaming asset in the GTA streaming subsystem. This will asynchronously register the asset, and caching is done based on the URL itself - cache headers are ignored.
--- 
--- Use IS_STREAMING_FILE_READY to check if the asset has been registered successfully.
---@param registerAs any
---@param url any
---@return any
function RegisterStreamingFileFromUrl(registerAs, url)
end

--- GET_PED_SPECIFIC_TASK_TYPE
---Gets the type of a ped's specific task given an index of the CPedTaskSpecificDataNode nodes.
--- A ped will typically have a task at index 0, if a ped has multiple tasks at once they will be in the order 0, 1, 2, etc.
---@param ped number
---@param index any
---@return any
function GetPedSpecificTaskType(ped, index)
end

--- GET_VEHICLE_TURBO_PRESSURE
---
---@param vehicle any
---@return number
function GetVehicleTurboPressure(vehicle)
end

--- SET_RESOURCE_KVP
---A setter for [GET_RESOURCE_KVP_STRING](#\_0x5240DA5A).
---@param key any
---@param value any
---@return any
function SetResourceKvp(key, value)
end

--- GET_VEHICLE_WINDOW_TINT
---
---@param vehicle any
---@return any
function GetVehicleWindowTint(vehicle)
end

--- IS_ACE_ALLOWED
---
---@param object any
---@return boolean
function IsAceAllowed(object)
end

--- PERFORM_HTTP_REQUEST_INTERNAL
---
---@param requestData any
---@param requestDataLength any
---@return any
function PerformHttpRequestInternal(requestData, requestDataLength)
end

--- SET_INTERIOR_PORTAL_ROOM_TO
---
---@param interiorId any
---@param portalIndex any
---@param roomTo any
---@return any
function SetInteriorPortalRoomTo(interiorId, portalIndex, roomTo)
end

--- GIVE_WEAPON_TO_PED
---**This is the server-side RPC native equivalent of the client native [GIVE_WEAPON_TO_PED](?\_0xBF0FD6E56C964FCB).**
---@param ped number
---@param weaponHash any
---@param ammoCount any
---@param isHidden boolean
---@param bForceInHand boolean
---@return any
function GiveWeaponToPed(ped, weaponHash, ammoCount, isHidden, bForceInHand)
end

--- END_FIND_VEHICLE
---
---@param findHandle any
---@return any
function EndFindVehicle(findHandle)
end

--- FORCE_SNOW_PASS
---Forces the game snow pass to render.
---@param enabled boolean
---@return any
function ForceSnowPass(enabled)
end

--- GET_ALL_VEHICLE_MODELS
---Returns all registered vehicle model names, including non-dlc vehicles and custom vehicles in no particular order.
--- 
--- **Example output**
--- 
--- 
--- 	["dubsta", "dubsta2", "dubsta3", "myverycoolcar", "sultan", "sultanrs", ...]
--- 
--- 
--- This native will not return vehicles that are unregistered (i.e from a resource being stopped) during runtime.
---@return any
function GetAllVehicleModels()
end

--- GET_VEHICLE_CURRENT_GEAR
---
---@param vehicle any
---@return any
function GetVehicleCurrentGear(vehicle)
end

--- IS_PRINCIPAL_ACE_ALLOWED
---
---@param principal any
---@param object any
---@return boolean
function IsPrincipalAceAllowed(principal, object)
end

--- PROFILER_EXIT_SCOPE
---Scope exit for profiler.
---@return any
function ProfilerExitScope()
end

--- REGISTER_COMMAND
---Registered commands can be executed by entering them in the client console (this works for client side and server side registered commands). Or by entering them in the server console/through an RCON client (only works for server side registered commands). Or if you use a supported chat resource, like the default one provided in the cfx-server-data repository, then you can enter the command in chat by prefixing it with a /.
--- 
--- Commands registered using this function can also be executed by resources, using the [ExecuteCommand native](#\_0x561C060B).
--- 
--- The restricted bool is not used on the client side. Permissions can only be checked on the server side, so if you want to limit your command with an ace permission automatically, make it a server command (by registering it in a server script).
--- 
--- **Example result**:
--- 
--- ![](https://i.imgur.com/TaCnG09.png)
---@param commandName any
---@param handler any
---@param restricted boolean
---@return any
function RegisterCommand(commandName, handler, restricted)
end

--- SET_INTERIOR_ROOM_EXTENTS
---
---@param interiorId any
---@param roomIndex any
---@param bbMinX number
---@param bbMinY number
---@param bbMinZ number
---@param bbMaxX number
---@param bbMaxY number
---@param bbMaxZ number
---@return any
function SetInteriorRoomExtents(interiorId, roomIndex, bbMinX, bbMinY, bbMinZ, bbMaxX, bbMaxY, bbMaxZ)
end

--- END_FIND_PED
---
---@param findHandle any
---@return any
function EndFindPed(findHandle)
end

--- GET_HELI_TAIL_ROTOR_HEALTH
---
---@param vehicle any
---@return number
function GetHeliTailRotorHealth(vehicle)
end

--- GET_VEHICLE_RADIO_STATION_INDEX
---
---@param vehicle any
---@return any
function GetVehicleRadioStationIndex(vehicle)
end

--- SET_HANDLING_INT
---Sets a global handling override for a specific vehicle class. The name is supposed to match the handlingName field from handling.meta.
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value any
---@return any
function SetHandlingInt(vehicle, class_, fieldName, value)
end

--- TASK_ENTER_VEHICLE
---speed 1.0 = walk, 2.0 = run
--- p5 1 = normal, 3 = teleport to vehicle, 8 = normal/carjack ped from seat, 16 = teleport directly into vehicle
--- p6 is always 0
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_ENTER_VEHICLE](?\_0xC20E50AA46D09CA8).**
---@param ped number
---@param vehicle any
---@param timeout any
---@param seatIndex any
---@param speed number
---@param flag any
---@param p6 any
---@return any
function TaskEnterVehicle(ped, vehicle, timeout, seatIndex, speed, flag, p6)
end

--- REGISTER_STREAMING_FILE_FROM_CACHE
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a dynamic streaming asset from the server with the GTA streaming module system.
---@param resourceName any
---@param fileName any
---@param cacheString any
---@return any
function RegisterStreamingFileFromCache(resourceName, fileName, cacheString)
end

--- MUMBLE_SET_AUDIO_INPUT_DISTANCE
---Sets the current input distance. The player will be able to talk to other players within this distance.
---@param distance number
---@return any
function MumbleSetAudioInputDistance(distance)
end

--- VERIFY_PASSWORD_HASH
---
---@param password any
---@param hash any
---@return boolean
function VerifyPasswordHash(password, hash)
end

--- DUPLICATE_FUNCTION_REFERENCE
---
---@param referenceIdentity any
---@return any
function DuplicateFunctionReference(referenceIdentity)
end

--- GET_NUM_PLAYER_TOKENS
---
---@param playerSrc any
---@return any
function GetNumPlayerTokens(playerSrc)
end

--- GET_RESOURCE_PATH
---Returns the physical on-disk path of the specified resource.
---@param resourceName any
---@return any
function GetResourcePath(resourceName)
end

--- SET_INTERIOR_ROOM_FLAG
---
---@param interiorId any
---@param roomIndex any
---@param flag any
---@return any
function SetInteriorRoomFlag(interiorId, roomIndex, flag)
end

--- SET_FLY_THROUGH_WINDSCREEN_PARAMS
---Sets some in-game parameters which is used for checks is ped needs to fly through windscreen after a crash.
---@param vehMinSpeed number
---@param unkMinSpeed number
---@param unkModifier number
---@param minDamage number
---@return boolean
function SetFlyThroughWindscreenParams(vehMinSpeed, unkMinSpeed, unkModifier, minDamage)
end

--- GET_PED_HAIR_COLOR
---A getter for [\_SET_PED_HAIR_COLOR](#\_0x4CFFC65454C93A49). Returns -1 if fails to get.
---@param ped number
---@return any
function GetPedHairColor(ped)
end

--- GET_PLAYER_NAME
---
---@param playerSrc any
---@return any
function GetPlayerName(playerSrc)
end

--- GET_WEAPON_COMPONENT_ACCURACY_MODIFIER
---A getter for CWeaponAccuracyModifier in a weapon component.
---@param componentHash any
---@return number
function GetWeaponComponentAccuracyModifier(componentHash)
end

--- SET_INTERIOR_PORTAL_ENTITY_FLAG
---
---@param interiorId any
---@param portalIndex any
---@param entityIndex any
---@param flag any
---@return any
function SetInteriorPortalEntityFlag(interiorId, portalIndex, entityIndex, flag)
end

--- SET_VEHICLE_ENGINE_TEMPERATURE
---
---@param vehicle any
---@param temperature number
---@return any
function SetVehicleEngineTemperature(vehicle, temperature)
end

--- START_FIND_EXTERNAL_KVP
---Equivalent of [START_FIND_KVP](#\_0xDD379006), but for another resource than the current one.
---@param resourceName any
---@param prefix any
---@return any
function StartFindExternalKvp(resourceName, prefix)
end

--- CALL_MINIMAP_SCALEFORM_FUNCTION
---This is similar to the PushScaleformMovieFunction natives, except it calls in the TIMELINE of a minimap overlay.
---@param miniMap any
---@param fnName any
---@return boolean
function CallMinimapScaleformFunction(miniMap, fnName)
end

--- DELETE_RESOURCE_KVP
---
---@param key any
---@return any
function DeleteResourceKvp(key)
end

--- GET_PED_DESIRED_HEADING
---
---@param ped number
---@return number
function GetPedDesiredHeading(ped)
end

--- SET_CONVAR_REPLICATED
---Used to replicate a server variable onto clients.
---@param varName any
---@param value any
---@return any
function SetConvarReplicated(varName, value)
end

--- SET_MAP_NAME
---
---@param mapName any
---@return any
function SetMapName(mapName)
end

--- APPLY_FORCE_TO_ENTITY
---Applies a force to the specified entity.
--- **List of force types (p1)**:
--- 
--- 
--- public enum ForceType
--- {
--- MinForce = 0,
--- MaxForceRot = 1,
--- MinForce2 = 2,
--- MaxForceRot2 = 3,
--- ForceNoRot = 4,
--- ForceRotPlusForce = 5
--- }
--- 
--- 
--- Research/documentation on the gtaforums can be found [here](https://gtaforums.com/topic/885669-precisely-define-object-physics/) and [here](https://gtaforums.com/topic/887362-apply-forces-and-momentums-to-entityobject/).
--- 
--- **This is the server-side RPC native equivalent of the client native [APPLY_FORCE_TO_ENTITY](?\_0xC5F68BE9613E2D18).**
---@param entity number
---@param forceType any
---@param x number
---@param y number
---@param z number
---@param offX number
---@param offY number
---@param offZ number
---@param boneIndex any
---@param isDirectionRel boolean
---@param ignoreUpVec boolean
---@param isForceRel boolean
---@param p12 boolean
---@param p13 boolean
---@return any
function ApplyForceToEntity(entity, forceType, x, y, z, offX, offY, offZ, boneIndex, isDirectionRel, ignoreUpVec, isForceRel, p12, p13)
end

--- GET_ALL_VEHICLES
---Returns all vehicle handles known to the server.
--- The data returned adheres to the following layout:
--- 
--- 
--- [127, 42, 13, 37]
--- 
---@return any
function GetAllVehicles()
end

--- GET_NUI_CURSOR_POSITION
---
---@param x any
---@param y any
---@return any
function GetNuiCursorPosition(x, y)
end

--- MUMBLE_SET_PLAYER_MUTED
---Mutes or unmutes the specified player
---@param playerSrc any
---@param toggle boolean
---@return any
function MumbleSetPlayerMuted(playerSrc, toggle)
end

--- GET_MAPDATA_ENTITY_HANDLE
---Retrieves the map data entity handle.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@param mapDataHash any
---@param entityInternalIdx any
---@param entityHandle any
---@return boolean
function GetMapdataEntityHandle(mapDataHash, entityInternalIdx, entityHandle)
end

--- FIND_NEXT_PED
---
---@param findHandle any
---@param outEntity any
---@return boolean
function FindNextPed(findHandle, outEntity)
end

--- GET_VEHICLE_ALARM_TIME_LEFT
---
---@param vehicle any
---@return any
function GetVehicleAlarmTimeLeft(vehicle)
end

--- PROFILER_IS_RECORDING
---Returns true if the profiler is active.
---@return boolean
function ProfilerIsRecording()
end

--- MUMBLE_IS_PLAYER_MUTED
---Checks if the player is currently muted
---@param playerSrc any
---@return boolean
function MumbleIsPlayerMuted(playerSrc)
end

--- SET_ENTITY_DRAW_OUTLINE_SHADER
---Sets variant of shader that will be used to draw entity outline.
--- 
--- Variants are:
--- 
--- *   **0**: Default value, gauss shader.
--- *   **1**: 2px wide solid color outline.
--- *   **2**: Fullscreen solid color except for entity.
---@param shader any
---@return any
function SetEntityDrawOutlineShader(shader)
end

--- ENABLE_ENHANCED_HOST_SUPPORT
---
---@param enabled boolean
---@return any
function EnableEnhancedHostSupport(enabled)
end

--- GET_PARKED_VEHICLE_DENSITY_MULTIPLIER
---A getter for [SET_PARKED_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME](#\_0xEAE6DCC7EEE3DB1D).
---@return number
function GetParkedVehicleDensityMultiplier()
end

--- GET_VEHICLE_HIGH_GEAR
---
---@param vehicle any
---@return any
function GetVehicleHighGear(vehicle)
end

--- OVERRIDE_POP_GROUPS
---Replaces the popgroups (CPopGroupList) meta file with the file in the specified path.
---@param path any
---@return any
function OverridePopGroups(path)
end

--- REGISTER_ENTITIES
---**Experimental**: This native may be altered or removed in future versions of CitizenFX without warning.
--- 
--- Registers a set of entities with the game engine. These should match CEntityDef class information from the game.
--- At this time, this function **should not be used in a live environment**.
---@param factory any
---@return any
function RegisterEntities(factory)
end

--- SET_INTERIOR_PORTAL_ROOM_FROM
---
---@param interiorId any
---@param portalIndex any
---@param roomFrom any
---@return any
function SetInteriorPortalRoomFrom(interiorId, portalIndex, roomFrom)
end

--- ADD_STATE_BAG_CHANGE_HANDLER
---Adds a handler for changes to a state bag.
--- 
--- The function called expects to match the following signature:
--- 
--- ts
--- function StateBagChangeHandler(bagName: string, key: string, value: any, reserved: number, replicated: boolean);
--- 
--- 
--- *   **bagName**: The internal bag ID for the state bag which changed. This is usually player:Source, entity:NetID
---     or localEntity:Handle.
--- *   **key**: The changed key.
--- *   **value**: The new value stored at key. The old value is still stored in the state bag at the time this callback executes.
--- *   **reserved**: Currently unused.
--- *   **replicated**: Whether the set is meant to be replicated.
--- 
--- At this time, the change handler can't opt to reject changes.
--- 
--- If bagName refers to an entity, use [GET_ENTITY_FROM_STATE_BAG_NAME](?\_0x4BDF1868) to get the entity handle
--- If bagName refers to a player, use [GET_PLAYER_FROM_STATE_BAG_NAME](?\_0xA56135E0) to get the player handle
---@param keyFilter any
---@param bagFilter any
---@param handler any
---@return any
function AddStateBagChangeHandler(keyFilter, bagFilter, handler)
end

--- GET_VEHICLE_HANDLING_INT
---Returns the effective handling data of a vehicle as an integer value.
--- Example: local modelFlags = GetVehicleHandlingInt(vehicle, 'CHandlingData', 'strModelFlags')
---@param vehicle any
---@param class_ any
---@param fieldName any
---@return any
function GetVehicleHandlingInt(vehicle, class_, fieldName)
end

--- GET_VEHICLE_WHEEL_SPEED
---Gets speed of a wheel at the tyre.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelSpeed(vehicle, wheelIndex)
end

--- GET_VEHICLE_LIGHTS_STATE
---
---@param vehicle any
---@param lightsOn any
---@param highbeamsOn any
---@return boolean
function GetVehicleLightsState(vehicle, lightsOn, highbeamsOn)
end

--- HAS_VEHICLE_BEEN_OWNED_BY_PLAYER
---
---@param vehicle any
---@return boolean
function HasVehicleBeenOwnedByPlayer(vehicle)
end

--- SET_TRAINS_FORCE_DOORS_OPEN
---Enables or disables whether train doors should be forced open whilst a player is inside the train. This is enabled by default in multiplayer.
---@param forceOpen boolean
---@return any
function SetTrainsForceDoorsOpen(forceOpen)
end

--- CAN_PLAYER_START_COMMERCE_SESSION
---Returns whether or not the specified player has enough information to start a commerce session for.
---@param playerSrc any
---@return boolean
function CanPlayerStartCommerceSession(playerSrc)
end

--- FLAG_SERVER_AS_PRIVATE
---
---@param private_ boolean
---@return any
function FlagServerAsPrivate(private_)
end

--- GET_NUM_PLAYER_INDICES
---
---@return any
function GetNumPlayerIndices()
end

--- SET_HANDLING_FIELD
---Sets a global handling override for a specific vehicle class. The name is supposed to match the handlingName field from handling.meta.
--- Example: SetHandlingField('AIRTUG', 'CHandlingData', 'fSteeringLock', 360.0)
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value any
---@return any
function SetHandlingField(vehicle, class_, fieldName, value)
end

--- TASK_COMBAT_PED
---Makes the specified ped attack the target ped.
--- p2 should be 0
--- p3 should be 16
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_COMBAT_PED](?\_0xF166E48407BAC484).**
---@param ped number
---@param targetPed number
---@param p2 any
---@param p3 any
---@return any
function TaskCombatPed(ped, targetPed, p2, p3)
end

--- GET_VEHICLE_PED_IS_IN
---Gets the vehicle the specified Ped is/was in depending on bool value. This native is used server side when using OneSync.
---@param ped number
---@param lastVehicle boolean
---@return any
function GetVehiclePedIsIn(ped, lastVehicle)
end

--- RESET_PED_MODEL_PERSONALITY
---Restores an overridden ped model personality type to the default value.
---@param modelHash any
---@return any
function ResetPedModelPersonality(modelHash)
end

--- SET_ENTITY_DISTANCE_CULLING_RADIUS
---It overrides the default distance culling radius of an entity. Set to 0.0 to reset.
--- If you want to interact with an entity outside of your players' scopes set the radius to a huge number.
---@param entity number
---@param radius number
---@return any
function SetEntityDistanceCullingRadius(entity, radius)
end

--- IS_NUI_FOCUSED
---Returns the current NUI focus state previously set with SET_NUI_FOCUS.
---@return boolean
function IsNuiFocused()
end

--- CREATE_PED_INSIDE_VEHICLE
---**This is the server-side RPC native equivalent of the client native [CREATE_PED_INSIDE_VEHICLE](?\_0x7DD959874C1FD534).**
---@param vehicle any
---@param pedType any
---@param modelHash any
---@param seat any
---@param isNetwork boolean
---@param bScriptHostPed boolean
---@return number
function CreatePedInsideVehicle(vehicle, pedType, modelHash, seat, isNetwork, bScriptHostPed)
end

--- GET_INTERIOR_PORTAL_ENTITY_ARCHETYPE
---
---@param interiorId any
---@param portalIndex any
---@param entityIndex any
---@return any
function GetInteriorPortalEntityArchetype(interiorId, portalIndex, entityIndex)
end

--- GET_HASH_KEY
---This native converts the passed string to a hash.
---@param model any
---@return any
function GetHashKey(model)
end

--- IS_PLAYER_COMMERCE_INFO_LOADED_EXT
---Requests whether or not the commerce data for the specified player has loaded from Tebex.
---@param playerSrc any
---@return boolean
function IsPlayerCommerceInfoLoadedExt(playerSrc)
end

--- TASK_GO_TO_COORD_ANY_MEANS
---example from fm_mission_controller
--- TASK::TASK_GO_TO_COORD_ANY_MEANS(l\_649, sub_f7e86(-1, 0), 1.0, 0, 0, 786603, 0xbf800000);
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_GO_TO_COORD_ANY_MEANS](?\_0x5BC448CB78FA3E88).**
---@param ped number
---@param x number
---@param y number
---@param z number
---@param speed number
---@param p5 any
---@param p6 boolean
---@param walkingStyle any
---@param p8 number
---@return any
function TaskGoToCoordAnyMeans(ped, x, y, z, speed, p5, p6, walkingStyle, p8)
end

--- GET_CURRENT_SERVER_ENDPOINT
---Returns the peer address of the remote game server that the user is currently connected to.
---@return any
function GetCurrentServerEndpoint()
end

--- GET_PLAYER_WEAPON_DAMAGE_MODIFIER
---A getter for [SET_PLAYER_WEAPON_DAMAGE_MODIFIER](#\_0xCE07B9F7817AADA3).
---@param playerId number
---@return number
function GetPlayerWeaponDamageModifier(playerId)
end

--- GET_PLAYER_WANTED_CENTRE_POSITION
---Gets the current known coordinates for the specified player from cops perspective. This native is used server side when using OneSync.
---@param playerSrc any
---@return { x: number, y: number, z: number }
function GetPlayerWantedCentrePosition(playerSrc)
end

--- REMOVE_ALL_PED_WEAPONS
---Parameter p1 does not seem to be used or referenced in game binaries.\
--- **Note:** When called for networked entities, a CRemoveAllWeaponsEvent will be created per request.
--- 
--- **This is the server-side RPC native equivalent of the client native [REMOVE_ALL_PED_WEAPONS](?\_0xF25DF915FA38C5F3).**
---@param ped number
---@param p1 boolean
---@return any
function RemoveAllPedWeapons(ped, p1)
end

--- GET_NUM_RESOURCE_METADATA
---Gets the amount of metadata values with the specified key existing in the specified resource's manifest.
--- See also: [Resource manifest](https://docs.fivem.net/resources/manifest/)
---@param resourceName any
---@param metadataKey any
---@return any
function GetNumResourceMetadata(resourceName, metadataKey)
end

--- SET_VEHICLE_WHEELIE_STATE
---Example script: https://pastebin.com/J6XGbkCW
--- 
--- List of known states:
--- 
--- 
--- 1: Not wheeling.
--- 65: Vehicle is ready to do wheelie (burnouting).
--- 129: Vehicle is doing wheelie.
--- 
---@param vehicle any
---@param state any
---@return any
function SetVehicleWheelieState(vehicle, state)
end

--- ADD_BLIP_FOR_COORD
---Creates a blip for the specified coordinates. You can use SET_BLIP_ natives to change the blip.
--- 
--- **This is the server-side RPC native equivalent of the client native [ADD_BLIP_FOR_COORD](?\_0x5A039BB0BCA604B6).**
---@param x number
---@param y number
---@param z number
---@return any
function AddBlipForCoord(x, y, z)
end

--- GET_PLAYER_TEAM
---
---@param playerSrc any
---@return any
function GetPlayerTeam(playerSrc)
end

--- GET_RUNTIME_TEXTURE_HEIGHT
---Gets the height of the specified runtime texture.
---@param tex any
---@return any
function GetRuntimeTextureHeight(tex)
end

--- GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX
---
---@param vehicle any
---@return any
function GetVehicleNumberPlateTextIndex(vehicle)
end

--- GET_VEHICLE_FLIGHT_NOZZLE_POSITION
---Gets the flight nozzel position for the specified vehicle. See the client-side [\_GET_VEHICLE_FLIGHT_NOZZLE_POSITION](#\_0xDA62027C8BDB326E) native for usage examples.
---@param vehicle any
---@return number
function GetVehicleFlightNozzlePosition(vehicle)
end

--- NETWORK_GET_NETWORK_ID_FROM_ENTITY
---
---@param entity number
---@return any
function NetworkGetNetworkIdFromEntity(entity)
end

--- ADD_REPLACE_TEXTURE
---Experimental natives, please do not use in a live environment.
---@param origTxd any
---@param origTxn any
---@param newTxd any
---@param newTxn any
---@return any
function AddReplaceTexture(origTxd, origTxn, newTxd, newTxn)
end

--- DESTROY_DUI
---Destroys a DUI browser.
---@param duiObject any
---@return any
function DestroyDui(duiObject)
end

--- GET_ROPE_LENGTH_CHANGE_RATE
---
---@param rope any
---@return number
function GetRopeLengthChangeRate(rope)
end

--- SET_ENTITY_ROTATION
---**This is the server-side RPC native equivalent of the client native [SET_ENTITY_ROTATION](?\_0x8524A8B0171D5E07).**
---@param entity number
---@param pitch number
---@param roll number
---@param yaw number
---@param rotationOrder any
---@param p5 boolean
---@return any
function SetEntityRotation(entity, pitch, roll, yaw, rotationOrder, p5)
end

--- PROFILER_ENTER_SCOPE
---Scope entry for profiler.
---@param scopeName any
---@return any
function ProfilerEnterScope(scopeName)
end

--- SET_DISCORD_RICH_PRESENCE_ACTION
---Sets a clickable button to be displayed in a player's Discord rich presence.
---@param index any
---@param label any
---@param url any
---@return any
function SetDiscordRichPresenceAction(index, label, url)
end

--- SET_VEHICLE_HANDLING_FIELD
---Sets a handling override for a specific vehicle. Certain handling flags can only be set globally using SET_HANDLING_FIELD, this might require some experimentation.
--- Example: SetVehicleHandlingField(vehicle, 'CHandlingData', 'fSteeringLock', 360.0)
---@param vehicle any
---@param class_ any
---@param fieldName any
---@param value any
---@return any
function SetVehicleHandlingField(vehicle, class_, fieldName, value)
end

--- SET_PLAYER_MAX_STAMINA
---
---@param playerId number
---@param maxStamina number
---@return boolean
function SetPlayerMaxStamina(playerId, maxStamina)
end

--- WAS_EVENT_CANCELED
---Returns whether or not the currently executing event was canceled.
---@return boolean
function WasEventCanceled()
end

--- SET_VISUAL_SETTING_FLOAT
---Overrides a floating point value from visualsettings.dat temporarily.
---@param name any
---@param value number
---@return any
function SetVisualSettingFloat(name, value)
end

--- GET_VEHICLE_CLUTCH
---
---@param vehicle any
---@return number
function GetVehicleClutch(vehicle)
end

--- GET_VEHICLE_LIGHT_MULTIPLIER
---
---@param vehicle any
---@return number
function GetVehicleLightMultiplier(vehicle)
end

--- IS_PLAYER_ACE_ALLOWED
---
---@param playerSrc any
---@param object any
---@return boolean
function IsPlayerAceAllowed(playerSrc, object)
end

--- PRINT_STRUCTURED_TRACE
---Prints 'structured trace' data to the server file descriptor 3 channel. This is not generally useful outside of
--- server monitoring utilities.
---@param jsonString any
---@return any
function PrintStructuredTrace(jsonString)
end

--- SET_VEHICLE_DOORS_LOCKED
---// Source GTA VC miss2 leak, matching constants for 0/2/4, testing
--- // They use 10 in am_mp_property_int, don't know what it does atm.
--- enum eCarLock {
--- CARLOCK_NONE = 0,
--- CARLOCK_UNLOCKED = 1,
--- CARLOCK_LOCKED = 2,
--- CARLOCK_LOCKOUT_PLAYER_ONLY = 3,
--- CARLOCK_LOCKED_PLAYER_INSIDE = 4,
--- CARLOCK_LOCKED_INITIALLY = 5,
--- CARLOCK_FORCE_SHUT_DOORS = 6,
--- CARLOCK_LOCKED_BUT_CAN_BE_DAMAGED = 7
--- };
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_DOORS_LOCKED](?\_0xB664292EAECF7FA6).**
---@param vehicle any
---@param doorLockStatus any
---@return any
function SetVehicleDoorsLocked(vehicle, doorLockStatus)
end

--- GET_RESOURCE_KVP_INT
---A getter for [SET_RESOURCE_KVP_INT](#\_0x6A2B1E8).
---@param key any
---@return any
function GetResourceKvpInt(key)
end

--- MUMBLE_ADD_VOICE_CHANNEL_LISTEN
---Starts listening to the specified channel, when available.
---@param channel any
---@return any
function MumbleAddVoiceChannelListen(channel)
end

--- IS_BIGMAP_FULL
---<!-- Native implemented by Disquse. 0x66EE14B2 -->
---@return boolean
function IsBigmapFull()
end

--- SET_PED_HEAD_BLEND_DATA
---For more info please refer to [this](https://gtaforums.com/topic/858970-all-gtao-face-ids-pedset-ped-head-blend-data-explained) topic.
--- **Other information:**
--- IDs start at zero and go Male Non-DLC, Female Non-DLC, Male DLC, and Female DLC.</br>
--- This native function is often called prior to calling natives such as:
--- 
--- *   [SetPedHairColor](#0xBB43F090)
--- *   [SetPedHeadOverlayColor](#0x78935A27)
--- *   [SetPedHeadOverlay](#0xD28DBA90)
--- *   [SetPedFaceFeature](#0x6C8D4458)
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_HEAD_BLEND_DATA](?\_0x9414E18B9434C2FE).**
---@param ped number
---@param shapeFirstID any
---@param shapeSecondID any
---@param shapeThirdID any
---@param skinFirstID any
---@param skinSecondID any
---@param skinThirdID any
---@param shapeMix number
---@param skinMix number
---@param thirdMix number
---@param isParent boolean
---@return any
function SetPedHeadBlendData(ped, shapeFirstID, shapeSecondID, shapeThirdID, skinFirstID, skinSecondID, skinThirdID, shapeMix, skinMix, thirdMix, isParent)
end

--- GET_AMBIENT_PED_RANGE_MULTIPLIER
---A getter for [SET_AMBIENT_PED_RANGE_MULTIPLIER_THIS_FRAME](#\_0x0B919E1FB47CC4E0).
---@return number
function GetAmbientPedRangeMultiplier()
end

--- GET_VEHICLE_DASHBOARD_WATER_TEMP
---
---@return number
function GetVehicleDashboardWaterTemp()
end

--- GET_VEHICLE_TYPE
---Returns the type of the passed vehicle.
--- 
--- ### Vehicle types
--- 
--- *   automobile
--- *   bike
--- *   boat
--- *   heli
--- *   plane
--- *   submarine
--- *   trailer
--- *   train
---@param vehicle any
---@return any
function GetVehicleType(vehicle)
end

--- GET_VEHICLE_WHEEL_TRACTION_VECTOR_LENGTH
---Gets the traction vector length of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@return number
function GetVehicleWheelTractionVectorLength(vehicle, wheelIndex)
end

--- MUMBLE_IS_CONNECTED
---This native will return true if the user succesfully connected to the voice server.
--- If the user disabled the voice-chat setting it will return false.
---@return boolean
function MumbleIsConnected()
end

--- START_RESOURCE
---
---@param resourceName any
---@return boolean
function StartResource(resourceName)
end

--- STOP_RESOURCE
---
---@param resourceName any
---@return boolean
function StopResource(resourceName)
end

--- SET_PED_CAN_RAGDOLL
---**This is the server-side RPC native equivalent of the client native [SET_PED_CAN_RAGDOLL](?\_0xB128377056A54E2A).**
---@param ped number
---@param toggle boolean
---@return any
function SetPedCanRagdoll(ped, toggle)
end

--- GET_NUM_PLAYER_IDENTIFIERS
---
---@param playerSrc any
---@return any
function GetNumPlayerIdentifiers(playerSrc)
end

--- GET_INTERIOR_POSITION
---
---@param interiorId any
---@param posX any
---@param posY any
---@param posZ any
---@return any
function GetInteriorPosition(interiorId, posX, posY, posZ)
end

--- GET_PLAYER_PING
---
---@param playerSrc any
---@return any
function GetPlayerPing(playerSrc)
end

--- CLEAR_PED_SECONDARY_TASK
---**This is the server-side RPC native equivalent of the client native [CLEAR_PED_SECONDARY_TASK](?\_0x176CECF6F920D707).**
---@param ped number
---@return any
function ClearPedSecondaryTask(ped)
end

--- REMOVE_BLIP
---Removes the blip from your map.
--- 
--- **This is the server-side RPC native equivalent of the client native [REMOVE_BLIP](?\_0x86A652570E5F25DD).**
---@param blip any
---@return any
function RemoveBlip(blip)
end

--- SET_RICH_PRESENCE
---Sets the player's rich presence detail state for social platform providers to a specified string.
---@param presenceState any
---@return any
function SetRichPresence(presenceState)
end

--- SET_CURRENT_PED_WEAPON
---**This is the server-side RPC native equivalent of the client native [SET_CURRENT_PED_WEAPON](?\_0xADF692B254977C0C).**
---@param ped number
---@param weaponHash any
---@param bForceInHand boolean
---@return any
function SetCurrentPedWeapon(ped, weaponHash, bForceInHand)
end

--- TASK_HANDS_UP
---In the scripts, p3 was always -1.
--- p3 seems to be duration or timeout of turn animation.
--- Also facingPed can be 0 or -1 so ped will just raise hands up.
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_HANDS_UP](?\_0xF2EAB31979A7F910).**
---@param ped number
---@param duration any
---@param facingPed number
---@param p3 any
---@param p4 boolean
---@return any
function TaskHandsUp(ped, duration, facingPed, p3, p4)
end

--- SET_PLAYER_WANTED_LEVEL
---Call SET_PLAYER_WANTED_LEVEL_NOW for immediate effect
--- wantedLevel is an integer value representing 0 to 5 stars even though the game supports the 6th wanted level but no police will appear since no definitions are present for it in the game files
--- disableNoMission-  Disables When Off Mission- appears to always be false
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PLAYER_WANTED_LEVEL](?\_0x39FF19C64EF7DA5B).**
---@param player number
---@param wantedLevel any
---@param disableNoMission boolean
---@return any
function SetPlayerWantedLevel(player, wantedLevel, disableNoMission)
end

--- GET_PED_SOURCE_OF_DAMAGE
---Get the last entity that damaged the ped. This native is used server side when using OneSync.
---@param ped number
---@return number
function GetPedSourceOfDamage(ped)
end

--- GET_VEHICLE_HANDBRAKE
---
---@param vehicle any
---@return boolean
function GetVehicleHandbrake(vehicle)
end

--- SET_INTERIOR_PORTAL_CORNER_POSITION
---
---@param interiorId any
---@param portalIndex any
---@param cornerIndex any
---@param posX number
---@param posY number
---@param posZ number
---@return any
function SetInteriorPortalCornerPosition(interiorId, portalIndex, cornerIndex, posX, posY, posZ)
end

--- DISABLE_IDLE_CAMERA
---Disables the game's afk camera that starts panning around after 30 seconds of inactivity.
---@param state boolean
---@return any
function DisableIdleCamera(state)
end

--- GET_PED_DECORATIONS
---Returns a list of decorations applied to a ped.
--- 
--- The data returned adheres to the following layout:
--- 
--- 
--- [ [ collectionHash1, overlayHash1 ], ..., [c ollectionHashN, overlayHashN ] ]
--- 
--- 
--- This command will return undefined data if invoked on a remote player ped.
---@param ped number
---@return any
function GetPedDecorations(ped)
end

--- SET_RESOURCE_KVP_FLOAT
---A setter for [GET_RESOURCE_KVP_FLOAT](#\_0x35BDCEEA).
---@param key any
---@param value number
---@return any
function SetResourceKvpFloat(key, value)
end

--- SET_VEHICLE_CUSTOM_PRIMARY_COLOUR
---p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_VEHICLE_CUSTOM_PRIMARY_COLOUR](?\_0x7141766F91D15BEA).**
---@param vehicle any
---@param r any
---@param g any
---@param b any
---@return any
function SetVehicleCustomPrimaryColour(vehicle, r, g, b)
end

--- CLEAR_VEHICLE_XENON_LIGHTS_CUSTOM_COLOR
---Removes vehicle xenon lights custom RGB color.
---@param vehicle any
---@return any
function ClearVehicleXenonLightsCustomColor(vehicle)
end

--- EXPERIMENTAL_LOAD_CLONE_SYNC
---This native is not implemented.
---@param entity number
---@param data any
---@return any
function ExperimentalLoadCloneSync(entity, data)
end

--- SET_VEHICLE_CURRENT_RPM
---
---@param vehicle any
---@param rpm number
---@return any
function SetVehicleCurrentRpm(vehicle, rpm)
end

--- REGISTER_RESOURCE_AS_EVENT_HANDLER
---An internal function which allows the current resource's HLL script runtimes to receive state for the specified event.
---@param eventName any
---@return any
function RegisterResourceAsEventHandler(eventName)
end

--- SET_VEHICLE_HIGH_GEAR
---
---@param vehicle any
---@param gear any
---@return any
function SetVehicleHighGear(vehicle, gear)
end

--- ENSURE_ENTITY_STATE_BAG
---Internal function for ensuring an entity has a state bag.
---@param entity number
---@return any
function EnsureEntityStateBag(entity)
end

--- GET_LAST_PED_IN_VEHICLE_SEAT
---
---@param vehicle any
---@param seatIndex any
---@return number
function GetLastPedInVehicleSeat(vehicle, seatIndex)
end

--- GET_VEHICLE_DASHBOARD_TEMP
---
---@return number
function GetVehicleDashboardTemp()
end

--- GET_WEAPON_ANIMATION_OVERRIDE
---A getter for [SET_WEAPON_ANIMATION_OVERRIDE](\_0x1055AC3A667F09D9).
---@param ped number
---@return any
function GetWeaponAnimationOverride(ped)
end

--- GET_CURRENT_RESOURCE_NAME
---Returns the name of the currently executing resource.
---@return any
function GetCurrentResourceName()
end

--- DOOR_SYSTEM_GET_SIZE
---
---@return any
function DoorSystemGetSize()
end

--- GET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER
---A getter for [SET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER](#\_0x4A3DC7ECCC321032).
---@param playerId number
---@return number
function GetPlayerMeleeWeaponDamageModifier(playerId)
end

--- SET_PED_INTO_VEHICLE
---**This is the server-side RPC native equivalent of the client native [SET_PED_INTO_VEHICLE](?\_0xF75B0D629E1C063D).**
---@param ped number
---@param vehicle any
---@param seatIndex any
---@return any
function SetPedIntoVehicle(ped, vehicle, seatIndex)
end

--- SET_DEFAULT_VEHICLE_NUMBER_PLATE_TEXT_PATTERN
---Sets the default number plate text pattern for vehicles seen on the local client with the specified plate index as their *default* index (plateProbabilities from carvariations).
--- 
--- For consistency, this should be used with the same value on all clients, since vehicles *without* custom text will use a seeded random number generator with this pattern to determine the default plate text.
--- 
--- The default value is 11AAA111, and using this or a NULL string will revert to the default game RNG.
--- 
--- ### Pattern string format
--- 
--- *   1 will lead to a random number from 0-9.
--- *   A will lead to a random letter from A-Z.
--- *   . will lead to a random letter *or* number, with 50% probability of being either.
--- *   ^1 will lead to a literal 1 being emitted.
--- *   ^A will lead to a literal A being emitted.
--- *   Any other character will lead to said character being emitted.
--- *   A string shorter than 8 characters will be padded on the right.
---@param plateIndex any
---@param pattern any
---@return any
function SetDefaultVehicleNumberPlateTextPattern(plateIndex, pattern)
end

--- SET_WEAPONS_NO_AUTORELOAD
---Disables the game's built-in auto-reloading.
---@param state boolean
---@return any
function SetWeaponsNoAutoreload(state)
end

--- FREEZE_ENTITY_POSITION
---Freezes or unfreezes an entity preventing its coordinates to change by the player if set to true. You can still change the entity position using SET_ENTITY_COORDS.
--- 
--- **This is the server-side RPC native equivalent of the client native [FREEZE_ENTITY_POSITION](?\_0x428CA6DBD1094446).**
---@param entity number
---@param toggle boolean
---@return any
function FreezeEntityPosition(entity, toggle)
end

--- SET_BLIP_SPRITE
---<!--
--- _loc1_.map((name, idx) => | ${idx} | ${name} | ![${name}](https://runtime.fivem.net/blips/${name}.svg) |).join('\n')
--- -->
--- 
--- Sets the displayed sprite for a specific blip.
--- There's a [list of sprites](https://docs.fivem.net/game-references/blips/) on the FiveM documentation site.
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_BLIP_SPRITE](?\_0xDF735600A4696DAF).**
---@param blip any
---@param spriteId any
---@return any
function SetBlipSprite(blip, spriteId)
end

--- TASK_PLAY_ANIM_ADVANCED
---It's similar to the one above, except the first 6 floats let you specify the initial position and rotation of the task. (Ped gets teleported to the position).
--- [Animations list](https://alexguirre.github.io/animations-list/)
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_PLAY_ANIM_ADVANCED](?\_0x83CDB10EA29B370B).**
---@param ped number
---@param animDict any
---@param animName any
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param animEnterSpeed number
---@param animExitSpeed number
---@param duration any
---@param flag any
---@param animTime number
---@param p14 any
---@param p15 any
---@return any
function TaskPlayAnimAdvanced(ped, animDict, animName, posX, posY, posZ, rotX, rotY, rotZ, animEnterSpeed, animExitSpeed, duration, flag, animTime, p14, p15)
end

--- TASK_LEAVE_ANY_VEHICLE
---Flags are the same flags used in [TASK_LEAVE_VEHICLE](#\_0xD3DBCE61A490BE02)
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_LEAVE_ANY_VEHICLE](?\_0x504D54DF3F6F2247).**
---@param ped number
---@param p1 any
---@param flags any
---@return any
function TaskLeaveAnyVehicle(ped, p1, flags)
end

--- GET_VEHICLE_DRAWN_WHEEL_ANGLE_MULT
---Gets a vehicle's multiplier used with a wheel's GET_VEHICLE_WHEEL_STEERING_ANGLE to determine the angle the wheel is rendered.
---@param vehicle any
---@return number
function GetVehicleDrawnWheelAngleMult(vehicle)
end

--- SET_VEHICLE_GRAVITY_AMOUNT
---
---@param vehicle any
---@param gravity number
---@return any
function SetVehicleGravityAmount(vehicle, gravity)
end

--- SET_VEHICLE_OIL_LEVEL
---
---@param vehicle any
---@param level number
---@return any
function SetVehicleOilLevel(vehicle, level)
end

--- HAS_MINIMAP_OVERLAY_LOADED
---Returns whether or not the specific minimap overlay has loaded.
---@param id any
---@return boolean
function HasMinimapOverlayLoaded(id)
end

--- MUMBLE_CLEAR_VOICE_TARGET
---Clears the target list for the specified Mumble voice target ID.
---@param targetId any
---@return any
function MumbleClearVoiceTarget(targetId)
end

--- FIND_NEXT_PICKUP
---
---@param findHandle any
---@param outEntity any
---@return boolean
function FindNextPickup(findHandle, outEntity)
end

--- GET_ENTITY_ROUTING_BUCKET
---Gets the routing bucket for the specified entity.
--- 
--- Routing buckets are also known as 'dimensions' or 'virtual worlds' in past echoes, however they are population-aware.
---@param entity number
---@return any
function GetEntityRoutingBucket(entity)
end

--- GET_VEHICLE_DASHBOARD_COLOUR
---
---@param vehicle any
---@param color any
---@return any
function GetVehicleDashboardColour(vehicle, color)
end

--- SET_HTTP_HANDLER
---
---@param handler any
---@return any
function SetHttpHandler(handler)
end

--- GET_EXTERNAL_KVP_STRING
---A getter for [SET_RESOURCE_KVP](#\_0x21C7A35B), but for a specified resource.
---@param resource any
---@param key any
---@return any
function GetExternalKvpString(resource, key)
end

--- GET_AIR_DRAG_MULTIPLIER_FOR_PLAYERS_VEHICLE
---
---@param playerSrc any
---@return number
function GetAirDragMultiplierForPlayersVehicle(playerSrc)
end

--- GET_RANDOM_VEHICLE_DENSITY_MULTIPLIER
---A getter for [SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME](#\_0xB3B3359379FE77D3).
--- Same as vehicle density multiplier.
---@return number
function GetRandomVehicleDensityMultiplier()
end

--- MUMBLE_CLEAR_VOICE_TARGET_PLAYERS
---Clears players from the target list for the specified Mumble voice target ID.
---@param targetId any
---@return any
function MumbleClearVoiceTargetPlayers(targetId)
end

--- REMOVE_REPLACE_TEXTURE
---Experimental natives, please do not use in a live environment.
---@param origTxd any
---@param origTxn any
---@return any
function RemoveReplaceTexture(origTxd, origTxn)
end

--- REQUEST_RESOURCE_FILE_SET
---Requests a resource file set with the specified name to be downloaded and mounted on top of the current resource.
--- 
--- Resource file sets are specified in fxmanifest.lua with the following syntax:
--- 
--- lua
--- file_set 'addon_ui' {
---     'ui/addon/index.html',
---     'ui/addon/**.js',
--- }
--- 
--- 
--- This command will trigger a script error if the request failed.
---@param setName any
---@return boolean
function RequestResourceFileSet(setName)
end

--- SET_ENTITY_HEADING
---Set the heading of an entity in degrees also known as "Yaw".
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_ENTITY_HEADING](?\_0x8E2530AA8ADA980E).**
---@param entity number
---@param heading number
---@return any
function SetEntityHeading(entity, heading)
end

--- GET_INSTANCE_ID
---
---@return any
function GetInstanceId()
end

--- GET_PED_SOURCE_OF_DEATH
---Get the entity that killed the ped. This native is used server side when using OneSync.
---@param ped number
---@return number
function GetPedSourceOfDeath(ped)
end

--- IS_DUI_AVAILABLE
---Returns whether or not a browser is created for a specified DUI browser object.
---@param duiObject any
---@return boolean
function IsDuiAvailable(duiObject)
end

--- GET_INTERIOR_PORTAL_ENTITY_ROTATION
---
---@param interiorId any
---@param portalIndex any
---@param entityIndex any
---@param rotX any
---@param rotY any
---@param rotZ any
---@param rotW any
---@return any
function GetInteriorPortalEntityRotation(interiorId, portalIndex, entityIndex, rotX, rotY, rotZ, rotW)
end

--- GET_RESOURCE_STATE
---Returns the current state of the specified resource.
---@param resourceName any
---@return any
function GetResourceState(resourceName)
end

--- SET_DISCORD_APP_ID
---This native sets the app id for the discord rich presence implementation.
---@param appId any
---@return any
function SetDiscordAppId(appId)
end

--- SHUTDOWN_LOADING_SCREEN_NUI
---Shuts down the loadingScreen NUI frame, similarly to SHUTDOWN_LOADING_SCREEN.
---@return any
function ShutdownLoadingScreenNui()
end

--- GET_CONVAR
---Can be used to get a console variable of type char*, for example a string.
---@param varName any
---@param default_ any
---@return any
function GetConvar(varName, default_)
end

--- GET_PED_CAUSE_OF_DEATH
---
---@param ped number
---@return any
function GetPedCauseOfDeath(ped)
end

--- GET_GAME_NAME
---Returns the current game being executed.
--- 
--- Possible values:
--- 
--- | Return value | Meaning                        |
--- | ------------ | ------------------------------ |
--- | fxserver   | Server-side code ('Duplicity') |
--- | fivem      | FiveM for GTA V                |
--- | libertym   | LibertyM for GTA IV            |
--- | redm       | RedM for Red Dead Redemption 2 |
---@return any
function GetGameName()
end

--- GET_GAME_BUILD_NUMBER
---Returns the internal build number of the current game being executed.
--- 
--- Possible values:
--- 
--- *   FiveM
---     *   1604
---     *   2060
---     *   2189
---     *   2372
---     *   2545
---     *   2612
---     *   2699
---     *   2802
--- *   RedM
---     *   1311
---     *   1355
---     *   1436
---     *   1491
--- *   LibertyM
---     *   43
--- *   FXServer
---     *   0
---@return any
function GetGameBuildNumber()
end

--- GET_PLAYER_FROM_STATE_BAG_NAME
---On the server this will return the players source, on the client it will return the player handle.
---@param bagName any
---@return any
function GetPlayerFromStateBagName(bagName)
end

--- IS_VEHICLE_TYRE_BURST
---
---@param vehicle any
---@param wheelID any
---@param completely boolean
---@return boolean
function IsVehicleTyreBurst(vehicle, wheelID, completely)
end

--- SET_PED_MODEL_PERSONALITY
---Overrides a ped model personality type.
---@param modelHash any
---@param personalityHash any
---@return any
function SetPedModelPersonality(modelHash, personalityHash)
end

--- SET_MINIMAP_TYPE
---Possible Types:
--- 
--- 
--- 0 = Off,
--- 1 = Regular,
--- 2 = Expanded,
--- 3 = Simple,
--- 
---@param type any
---@return any
function SetMinimapType(type)
end

--- END_FIND_OBJECT
---
---@param findHandle any
---@return any
function EndFindObject(findHandle)
end

--- DOES_PLAYER_OWN_SKU
---Requests whether or not the player owns the specified SKU.
---@param playerSrc any
---@param skuId any
---@return boolean
function DoesPlayerOwnSku(playerSrc, skuId)
end

--- GET_INTERIOR_PORTAL_ENTITY_COUNT
---
---@param interiorId any
---@param portalIndex any
---@return any
function GetInteriorPortalEntityCount(interiorId, portalIndex)
end

--- REMOVE_WEAPON_COMPONENT_FROM_PED
---**This is the server-side RPC native equivalent of the client native [REMOVE_WEAPON_COMPONENT_FROM_PED](?\_0x1E8BE90C74FB4C09).**
---@param ped number
---@param weaponHash any
---@param componentHash any
---@return any
function RemoveWeaponComponentFromPed(ped, weaponHash, componentHash)
end

--- TRIGGER_LATENT_CLIENT_EVENT_INTERNAL
---The backing function for TriggerLatentClientEvent.
---@param eventName any
---@param eventTarget any
---@param eventPayload any
---@param payloadLength any
---@param bps any
---@return any
function TriggerLatentClientEventInternal(eventName, eventTarget, eventPayload, payloadLength, bps)
end

--- SET_PED_PROP_INDEX
---This native is used to set prop variation on a ped. Components, drawables and textures IDs are related to the ped model.
--- 
--- ### MP Freemode list of props
--- 
--- **0**: Hat\
--- **1**: Glass\
--- **2**: Ear\
--- **6**: Watch\
--- **7**: Bracelet
--- 
--- ### Related and useful natives
--- 
--- [GET_NUMBER_OF_PED_PROP_DRAWABLE_VARIATIONS](#\_0x5FAF9754E789FB47)\
--- [GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS](#\_0xA6E7F1CEB523E171)
--- [List of component/props ID](https://gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html) of player_two with examples
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_PROP_INDEX](?\_0x93376B65A266EB5F).**
---@param ped number
---@param componentId any
---@param drawableId any
---@param textureId any
---@param attach boolean
---@return any
function SetPedPropIndex(ped, componentId, drawableId, textureId, attach)
end

--- GET_TRAIN_CARRIAGE_INDEX
---
---@param train any
---@return any
function GetTrainCarriageIndex(train)
end

--- GET_VEHICLE_WHEELIE_STATE
---List of known states:
--- 
--- 
--- 1: Not wheeling.
--- 65: Vehicle is ready to do wheelie (burnouting).
--- 129: Vehicle is doing wheelie.
--- 
---@param vehicle any
---@return any
function GetVehicleWheelieState(vehicle)
end

--- MUMBLE_CLEAR_VOICE_CHANNEL
---
---@return any
function MumbleClearVoiceChannel()
end

--- ENABLE_EDITOR_RUNTIME
---Enables the editor runtime mode, changing game behavior to track entity metadata.
--- This function supports SDK infrastructure and is not intended to be used directly from your code.
---@return any
function EnableEditorRuntime()
end

--- ADD_BLIP_FOR_RADIUS
---Create a blip with a radius for the specified coordinates (it doesnt create the blip sprite, so you need to use [AddBlipCoords](#\_0xC6F43D0E))
--- Example image:
--- ![example](https://i.imgur.com/9hQl3DB.png)
--- 
--- **This is the server-side RPC native equivalent of the client native [ADD_BLIP_FOR_RADIUS](?\_0x46818D79B1F7499A).**
---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@return any
function AddBlipForRadius(posX, posY, posZ, radius)
end

--- CREATE_OBJECT
---Creates an object (prop) with the specified model at the specified position, offset on the Z axis by the radius of the object's model.
--- This object will initially be owned by the creating script as a mission entity, and the model should be loaded already (e.g. using REQUEST_MODEL).
--- 
--- **This is the server-side RPC native equivalent of the client native [CREATE_OBJECT](?\_0x509D5878EB39E842).**
---@param modelHash any
---@param x number
---@param y number
---@param z number
---@param isNetwork boolean
---@param netMissionEntity boolean
---@param doorFlag boolean
---@return number
function CreateObject(modelHash, x, y, z, isNetwork, netMissionEntity, doorFlag)
end

--- SET_PED_RESET_FLAG
---PED::SET_PED_RESET_FLAG(PLAYER::PLAYER_PED_ID(), 240, 1);
--- Known values:
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_RESET_FLAG](?\_0xC1E8A365BF3B29F2).**
---@param ped number
---@param flagId any
---@param doReset boolean
---@return any
function SetPedResetFlag(ped, flagId, doReset)
end

--- GET_NUM_RESOURCES
---
---@return any
function GetNumResources()
end

--- GET_VEHICLE_HANDLING_VECTOR
---Returns the effective handling data of a vehicle as a vector value.
--- Example: local inertiaMultiplier = GetVehicleHandlingVector(vehicle, 'CHandlingData', 'vecInertiaMultiplier')
---@param vehicle any
---@param class_ any
---@param fieldName any
---@return { x: number, y: number, z: number }
function GetVehicleHandlingVector(vehicle, class_, fieldName)
end

--- SET_RESOURCE_KVP_INT
---A setter for [GET_RESOURCE_KVP_INT](#\_0x557B586A).
---@param key any
---@param value any
---@return any
function SetResourceKvpInt(key, value)
end

--- SET_PED_RANDOM_PROPS
---List of component/props ID
--- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
--- 
--- **This is the server-side RPC native equivalent of the client native [SET_PED_RANDOM_PROPS](?\_0xC44AA05345C992C6).**
---@param ped number
---@return any
function SetPedRandomProps(ped)
end

--- GET_INTERIOR_PORTAL_ENTITY_POSITION
---
---@param interiorId any
---@param portalIndex any
---@param entityIndex any
---@param posX any
---@param posY any
---@param posZ any
---@return any
function GetInteriorPortalEntityPosition(interiorId, portalIndex, entityIndex, posX, posY, posZ)
end

--- GET_VEHICLE_DASHBOARD_OIL_TEMP
---
---@return number
function GetVehicleDashboardOilTemp()
end

--- REGISTER_NUI_CALLBACK_TYPE
---
---@param callbackType any
---@return any
function RegisterNuiCallbackType(callbackType)
end

--- TASK_LEAVE_VEHICLE
---Flags from decompiled scripts:
--- 0 = normal exit and closes door.
--- 1 = normal exit and closes door.
--- 16 = teleports outside, door kept closed.  (This flag does not seem to work for the front seats in buses, NPCs continue to exit normally)
--- 64 = normal exit and closes door, maybe a bit slower animation than 0.
--- 256 = normal exit but does not close the door.
--- 4160 = ped is throwing himself out, even when the vehicle is still.
--- 262144 = ped moves to passenger seat first, then exits normally
--- Others to be tried out: 320, 512, 131072.
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_LEAVE_VEHICLE](?\_0xD3DBCE61A490BE02).**
---@param ped number
---@param vehicle any
---@param flags any
---@return any
function TaskLeaveVehicle(ped, vehicle, flags)
end

--- GET_INTERIOR_ROOM_NAME
---
---@param interiorId any
---@param roomIndex any
---@return any
function GetInteriorRoomName(interiorId, roomIndex)
end

--- GET_ROPE_FLAGS
---cpp
--- enum eRopeFlags
--- {
---     DrawShadowEnabled = 2,
--- 	Breakable = 4,
--- 	RopeUnwindingFront = 8,
--- 	RopeWinding = 32
--- }
--- 
---@param rope any
---@return any
function GetRopeFlags(rope)
end

--- GET_WEAPON_RECOIL_SHAKE_AMPLITUDE
---A getter for the recoil shake amplitude of a weapon.
---@param weaponHash any
---@return number
function GetWeaponRecoilShakeAmplitude(weaponHash)
end

--- SET_VEHICLE_SUSPENSION_HEIGHT
---Sets the height of the vehicle's suspension.
--- This changes the same value set by Suspension in the mod shop.
--- Negatives values raise the car. Positive values lower the car.
--- 
--- This is change is visual only. The collision of the vehicle will not move.
---@param vehicle any
---@param newHeight number
---@return any
function SetVehicleSuspensionHeight(vehicle, newHeight)
end

--- SET_VEHICLE_WHEEL_FLAGS
---Sets the flags of a wheel.
--- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
---@param vehicle any
---@param wheelIndex any
---@param flags any
---@return any
function SetVehicleWheelFlags(vehicle, wheelIndex, flags)
end

--- TASK_SHOOT_AT_COORD
---Firing Pattern Hash Information: https://pastebin.com/Px036isB
--- 
--- **This is the server-side RPC native equivalent of the client native [TASK_SHOOT_AT_COORD](?\_0x46A6CC01E0826106).**
---@param ped number
---@param x number
---@param y number
---@param z number
---@param duration any
---@param firingPattern any
---@return any
function TaskShootAtCoord(ped, x, y, z, duration, firingPattern)
end

--- EXPERIMENTAL_SAVE_CLONE_SYNC
---This native is not implemented.
---@param entity number
---@return any
function ExperimentalSaveCloneSync(entity)
end

--- GET_INTERIOR_ROOM_COUNT
---
---@param interiorId any
---@return any
function GetInteriorRoomCount(interiorId)
end

--- SET_DISCORD_RICH_PRESENCE_ASSET_SMALL_TEXT
---This native sets the hover text of the small image asset for the discord rich presence implementation.
---@param text any
---@return any
function SetDiscordRichPresenceAssetSmallText(text)
end

