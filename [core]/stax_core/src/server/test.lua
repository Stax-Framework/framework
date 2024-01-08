Citizen.CreateThread(function()
  ---@type StaxPlayerManager
  local PlayerManager = Stax.RequireAsync("PlayerManager")
  ---@type StaxPlayer
  local Player = Stax.RequireAsync("Player")

  PlayerManager.Add(Player.Create("Player1"))
  PlayerManager.Add(Player.Create("Player2"))

  local players = PlayerManager.Fetch()

  if players then
    print("PLAYERS: " .. json.encode(players))
  end
end)