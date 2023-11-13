local Events = Stax.Events()
local CBManager = Stax.CallbackManager()

Citizen.CreateThread(function()
  Citizen.Wait(1000)
  CBManager.FireServer("hello_world", {}, function (results)
    print(json.encode(results))
  end)
end)

local firstSpawn = true

Events.CreateEvent("playerSpawned", function(spawnData)
  FirstSpawn()
end)

Events.CreateNetEvent("STAX::Core::Client::PluginMounted", function(resource)
  if GetCurrentResourceName() ~= resource then return end

  CreateThreads()

  print("Plugin Mounted")
end)

Events.CreateNetEvent("STAX::Core::Client::PluginUnMounted", function (resource)
  if GetCurrentResourceName() ~= resource then return end

  print("Plugin UnMounted")
end)

function CreateThreads()
  Citizen.CreateThread(function()
    local player = PlayerId()
    local DisableAI = Stax.Config:Get("game.disable_ai")
    local DisableWanted = Stax.Config:Get("game.disable_wanted")

    print("Disable AI: " .. tostring(DisableAI))
    print("Disable Wanted: " .. tostring(DisableWanted))

    while true do

      SetPlayerHealthRechargeLimit(player, 0.0)

      if DisableAI then
        DisableAI()
      end

      if DisableWanted then
        DisableWantedLevel(player)
      end

      Citizen.Wait(0)
    end
  end)
end

function FirstSpawn()
  if firstSpawn then
    SetNuiFocus(false, false)

    local DisablePvP = Stax.Config:Get("game.disable_pvp")

    if not DisablePvP then
      EnablePVP()
    end

    exports.spawnmanager:spawnPlayer()
    exports.spawnmanager:setAutoSpawn(false)

    TriggerServerEvent("STAX::Core::Server::PlayerFirstSpawned")
    firstSpawn = false
  end
end

function EnablePVP()
  SetCanAttackFriendly(PlayerPedId(), true, false)
  NetworkSetFriendlyFireOption(true)
end

function DisableAI()
  SetPedDensityMultiplierThisFrame(0.0)
  SetVehicleDensityMultiplierThisFrame(0.0)
  SetParkedVehicleDensityMultiplierThisFrame(0.0)
end

function DisableWantedLevel(player)
  if GetPlayerWantedLevel(player) ~= 0 then
    SetPoliceIgnorePlayer(player, true)
    SetDispatchCopsForPlayer(player, false)
    SetPlayerWantedLevel(player, 0, false)
    SetPlayerWantedLevelNow(player, false)
  end
end