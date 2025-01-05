local WeaponEquipped = Stax.Event("Weapons", "Equipped")
local WeaponUnequipped = Stax.Event("Weapons", "Unequipped")

local WeaponHandler = {
    equipped = nil,
    WeaponData = {}
}

function WeaponHandler.GetWeaponInfo()

end

function WeaponHandler.WeaponEquipped()

end

function WeaponHandler.WeaponUnequipped()

end

local function _loadComponents()

end

local function _gameEventHandler(name, args)
    print("GAME EVENT: " .. tostring(name))
end

---[[
--- THREAD HANDLER
---]]
Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local tick = 1000
    
    if not _Config.WeaponSettings.EnableAutoReload then
        SetWeaponsNoAutoreload(true)
    end

    if not _Config.WeaponSettings.EnableAutoSwap then
        SetWeaponsNoAutoswap(true)
    end


    while true do
        local currentWeapon = GetSelectedPedWeapon(ped)

        if not WeaponHandler.equipped then
            
        else

        end

        Citizen.Wait(tick)
    end
end)

---[[
--- EVENTS
---]]
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)
Stax.Event("gameEventTriggered").create(false, _gameEventHandler)

RegisterCommand("weapons", function()
    local ped = PlayerPedId()
    local weapons = {
        `WEAPON_PISTOL`,
        `WEAPON_CARBINERIFLE`,
        `WEAPON_GRENADE`,
        `WEAPON_PARACHUTE`
    }

    for _, weaponHash in pairs(weapons) do
        GiveWeaponToPed(ped, weaponHash, 99999, false, false)
    end
end, false)