-- ZeusHUD | Exclusivo para Delta | Steal a Brainrot
if not identifyexecutor or identifyexecutor() ~= "Delta" then
    return warn("Este script solo funciona con Delta Executor.")
end

-- GUI principal
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ZeusHUD"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 140)
frame.Position = UDim2.new(0.5, -160, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.25

-- Animación de entrada
frame:TweenPosition(UDim2.new(0.5, -160, 0.15, 0), "Out", "Bounce", 1)

-- Glitch visual
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 255, 255)

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Text = "⚡ ZeusHUD ⚡"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.Arcade
title.TextSize = 24
title.BackgroundTransparency = 1

-- Botón activador
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.9, 0, 0.5, 0)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.Text = "Activar AutoRobo"
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.BorderSizePixel = 0

-- Función Anti-Hit
local function antiHit()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Health = math.huge
        char.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            char.Humanoid.Health = math.huge
        end)
    end
end

-- Función AutoRobo de animales
local function autoSteal()
    local char = game.Players.LocalPlayer.Character
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
            -- Verifica si es robable (puedes afinar esto si hay tag específico)
            char.HumanoidRootPart.CFrame = obj.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
            wait(0.5)
            char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0) -- TP base
            wait(1)
        end
    end
end

-- Activador del HUD
button.MouseButton1Click:Connect(function()
    button.Text = "AutoRobo ACTIVADO"
    antiHit()
    spawn(function()
        while true do
            pcall(autoSteal)
            wait(2)
        end
    end)
end)
