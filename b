
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RejoinButton"
gui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Name = "Rejoin"
button.Size = UDim2.new(0, 190, 0, 48)
button.Position = UDim2.new(0.5, -95, 0.8, 0)
button.BackgroundColor3 = Color3.fromRGB(180, 35, 45)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "إعادة دخول السيرفر"
button.TextSize = 16
button.Font = Enum.Font.GothamBold
button.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = button

button.Activated:Connect(function()
    button.Text = "جاري إعادة الدخول..."

    local ok, err = pcall(function()
        TeleportService:Teleport(game.PlaceId, player)
    end)

    if not ok then
        button.Text = "فشلت إعادة الدخول"
        warn(err)
    end
end)

gui.Parent = game:GetService("CoreGui")
