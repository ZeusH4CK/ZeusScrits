getgenv().AutoSteal = true

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local brainName = "La Vaca Saturna Saturnita" -- ajusta si el objeto tiene otro nombre
local basePosition = Vector3.new(0, 5, 0) -- cambia por la posición real de tu base

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

while AutoSteal do
    pcall(stealBrain)
    task.wait(2)
end
