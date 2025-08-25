-- ZeusH4CK HUD con botón activador
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")

ScreenGui.Name = "ZeusHud"
ScreenGui.Parent = game.CoreGui

Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.Text = "Activar AutoSteal"
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20

local AutoSteal = false
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local brainName = "La Vaca Saturna Saturnita"
local basePosition = Vector3.new(0, 5, 0)

function teleportTo(pos)
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

function stealBrain()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == brainName and obj:IsA("Part") then
            teleportTo(obj.Position)
            task.wait(0.5)
            teleportTo(basePosition)
            task.wait(1)
        end
    end
end

Button.MouseButton1Click:Connect(function()
    AutoSteal = not AutoSteal
    Button.Text = AutoSteal and "AutoSteal ACTIVADO" or "Activar AutoSteal"
    spawn(function()
        while AutoSteal do
            pcall(stealBrain)
            task.wait(2)
        end
    end)
end)
