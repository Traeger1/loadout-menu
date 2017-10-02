LSPD = {
    {"WEAPON_PISTOL"},
    {"WEAPON_NIGHTSTICK"},
    {"WEAPON_STUNGUN"},
    {"WEAPON_Flashlight"},
    {"WEAPON_CarbineRifle"},
    {"WEAPON_PumpShotgun"},
    {"WEAPON_FIREEXTINGUISHER"},
}

Sheriff = {
    {"WEAPON_PISTOL"},
    {"WEAPON_NIGHTSTICK"},
    {"WEAPON_STUNGUN"},
    {"WEAPON_Flashlight"},
    {"WEAPON_CarbineRifle"},
    {"WEAPON_PumpShotgun"},
    {"WEAPON_FIREEXTINGUISHER"},
}

CHP = {
    {"WEAPON_PISTOL"},
    {"WEAPON_NIGHTSTICK"},
    {"WEAPON_STUNGUN"},
    {"WEAPON_Flashlight"},
    {"WEAPON_CarbineRifle"},
    {"WEAPON_PumpShotgun"},
    {"WEAPON_FIREEXTINGUISHER"},
}

fire = {
    {"WEAPON_Hatchet"},
    {"WEAPON_PetrolCan"},
    {"WEAPON_Flashlight"},
    {"WEAPON_Flare"},
    {"WEAPON_Crowbar"},
    {"WEAPON_FIREEXTINGUISHER"},
}

medic = {
    {"WEAPON_Hatchet"},
    {"WEAPON_PetrolCan"},
    {"WEAPON_Flashlight"},
    {"WEAPON_Flare"},
    {"WEAPON_Crowbar"},
    {"WEAPON_FIREEXTINGUISHER"},
}

swat = {
    {"WEAPON_PISTOL"},
    {"WEAPON_NIGHTSTICK"},
    {"WEAPON_STUNGUN"},
    {"WEAPON_Flashlight"},
    {"WEAPON_CarbineRifle"},
    {"WEAPON_PumpShotgun"},
    {"WEAPON_SmokeGrenade"},
    {"WEAPON_FIREEXTINGUISHER"},
}


Citizen.CreateThread(function() -- Ooooh, warmenu time :D
    local items = { "LSPD", "Sheriff", "CHP", "Fire", "Medic", "SWAT"}
    local currentItemIndex = 1
    local selectedItemIndex = 1
    local checkbox = true

    WarMenu.CreateMenu('loadout', 'Loadout Menu')
    WarMenu.SetSubTitle("loadout", "Loadout Menu")


    while true do


        if WarMenu.IsMenuOpened('loadout') then
            if WarMenu.ComboBox('Loadout', items, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
                    currentItemIndex = currentIndex
                    selectedItemIndex = selectedIndex

                    -- Do your stuff here if current index was changed (don't forget to check it)
                end) then
                    -- Do your stuff here if current item was activated

            elseif WarMenu.Button("Set Loadout") then
                if selectedItemIndex == 1 then
                    setloadout(1) -- Functions cause its less ugly (not really but kinda)
                elseif selectedItemIndex == 2 then
                    setloadout(2)
                elseif selectedItemIndex == 3 then
                    setloadout(3)
                elseif selectedItemIndex == 4 then
                    setloadout(4)
                elseif selectedItemIndex == 5 then
                    setloadout(5)
                elseif selectedItemIndex == 6 then
                    setloadout(6)
                end
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 244) then --M by default
            --WarMenu.OpenMenu('loadout')
        end

        Citizen.Wait(0)
    end
end)

RegisterCommand("loadouts", function()
    WarMenu.OpenMenu('loadout') --Added a comand to stop any accidental key pressin'
end, false)

function setloadout(loadoutnum)  -- Seriously, this fucking code is ugly, its what i get for spending like 1 hr on it but it works :P
    local player = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    RemoveAllPedWeapons(PlayerPedId(), 0)
    if loadoutnum == 1 then
        RequestModel("s_m_y_cop_01")
        while not HasModelLoaded("s_m_y_cop_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_y_cop_01"))
        for k, w in pairs(LSPD) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    elseif loadoutnum == 2 then
        RequestModel("s_m_y_sheriff_01")
        while not HasModelLoaded("s_m_y_sheriff_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_y_sheriff_01"))
        for k, w in pairs(Sheriff) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    elseif loadoutnum == 3 then
        RequestModel("s_m_y_hwaycop_01")
        while not HasModelLoaded("s_m_y_hwaycop_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_y_hwaycop_01"))
        for k, w in pairs(CHP) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    elseif loadoutnum == 4 then
        RequestModel("s_m_y_fireman_01")
        while not HasModelLoaded("s_m_y_fireman_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_y_fireman_01"))
        for k, w in pairs(fire) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    elseif loadoutnum == 5 then
        RequestModel("s_m_m_paramedic_01")
        while not HasModelLoaded("s_m_m_paramedic_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_m_paramedic_01"))
        for k, w in pairs(medic) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    elseif loadoutnum == 6 then
        RequestModel("s_m_y_swat_01")
        while not HasModelLoaded("s_m_y_swat_01") do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), GetHashKey("s_m_y_swat_01"))
        for k, w in pairs(swat) do
            GiveWeaponToPed(GetPlayerPed(-1), w[1], 1000, false, false)
        end
    end
    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
    Citizen.Wait(500)
    DoScreenFadeIn(1000)   
end
