if queue_on_teleport then queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/cichonowek/HACK/refs/heads/master/COM.lua")) end

local function SetGcValue(str, val)

    local garbage = getgc(true)

    for i, Table in next, garbage do

        if type(Table) == "table" then

if table.isfrozen(Table) then

make_writeable(Table)

end

            if rawget(Table, str) ~= nil then

                rawset(Table, str, val)

print("SetGarbageCollectionValue - Method Completed " .. str .. " Set To " .. tostring(val))

            end

        end

    end

end

    SetGcValue("Ammo", 999)
    SetGcValue("HeadshotMultiplier", 100000)
    SetGcValue("MaxSpread", 0)
    SetGcValue("FireRate", 0)
    SetGcValue("AmmoPerMag", 999)
    SetGcValue("ReloadTime", 0)
SetGcValue("Health", 100000)
SetGcValue("HealthPercent", 0)
SetGcValue("HealingIncrement", 5000)
SetGcValue("HeadshotMultiplierIncrement", 50000)

