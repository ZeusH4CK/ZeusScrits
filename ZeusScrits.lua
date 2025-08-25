-- Zeus Hud | Exclusivo para Delta | Steal a Brainrot
if not identifyexecutor or identifyexecutor() ~= "Delta" then
    return warn("Este script solo funciona con Delta Executor.")
end

-- GUI principal
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ZeusHud"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 120)
frame.Position = UDim2.new(0.5, -150, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.3

-- Animación de entrada
frame:TweenPosition(UDim2.new(0.5, -150, 0.15, 0), "Out", "Bounce", 1)

-- Título visual
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Text = "⚡ ZeusH4CK HUD ⚡"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.Arcade
title.TextSize = 24
title.BackgroundTransparency = 1

-- Botón activador
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.9, 0, 0.5, 0)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.Text = "Activar AutoBrainrot"
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.BorderSizePixel = 0

-- Efecto glitch visual
local glow = Instance.new("UIStroke", frame)
glow.Thickness = 2
glow.Color = Color3.fromRGB(0, 255, 255)

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

-- Función TP con Brainrot
local function tpBrainrot()
    local char = game.Players.LocalPlayer.Character
    local brain = nil
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "Brainrot" and obj:IsA("Part") then
            brain = obj
            break
        end
    end
    if brain and char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = brain.CFrame
        wait(0.5)
        char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0) -- TP base
    end
end

-- Activador del HUD
button.MouseButton1Click:Connect(function()
    button.Text = "AutoBrainrot ACTIVADO"
    antiHit()
    spawn(function()
        while true do
            pcall(tpBrainrot)
            wait(2)
        end
    end)
end)
