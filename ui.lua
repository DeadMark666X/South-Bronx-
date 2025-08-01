-- YoxanHub | Key System + Main UI (Fly Fixed) | Key: YoxanFree10

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local KEY = "YoxanFree10"
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- Show Key UI first
local KeyWindow = OrionLib:MakeWindow({
    Name = "YoxanHub | Key Verification",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "Yoxan_Key"
})

local KeyTab = KeyWindow:MakeTab({
    Name = "Enter Key",
    Icon = "rbxassetid://6031071050",
    PremiumOnly = false
})

KeyTab:AddTextbox({
    Name = "Enter Key to Unlock UI",
    Default = "",
    TextDisappear = true,
    Callback = function(input)
        if input == KEY then
            OrionLib:MakeNotification({
                Name = "✅ Key Correct",
                Content = "Access Granted. Loading YoxanHub...",
                Time = 3
            })

            task.wait(1.5)
            for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
                if gui.Name:find("Orion") then
                    pcall(function() gui:Destroy() end)
                end
            end

            task.wait(1)

            OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

            -- MAIN UI
            local Window = OrionLib:MakeWindow({
                Name = "YoxanHub | South Bronx",
                HidePremium = false,
                SaveConfig = true,
                ConfigFolder = "YoxanHub_Config"
            })

            local Tab = Window:MakeTab({
                Name = "Player",
                Icon = "rbxassetid://4483345998",
                PremiumOnly = false
            })

            -- Fly Variables
            local flying = false
            local speed = 50
            local move = {W=false,A=false,S=false,D=false,Up=false,Down=false}

            -- Input for PC
            UserInputService.InputBegan:Connect(function(i,gpe)
                if gpe then return end
                if i.KeyCode == Enum.KeyCode.W then move.W = true end
                if i.KeyCode == Enum.KeyCode.A then move.A = true end
                if i.KeyCode == Enum.KeyCode.S then move.S = true end
                if i.KeyCode == Enum.KeyCode.D then move.D = true end
                if i.KeyCode == Enum.KeyCode.Space then move.Up = true end
                if i.KeyCode == Enum.KeyCode.LeftShift then move.Down = true end
            end)
            UserInputService.InputEnded:Connect(function(i,gpe)
                if gpe then return end
                if i.KeyCode == Enum.KeyCode.W then move.W = false end
                if i.KeyCode == Enum.KeyCode.A then move.A = false end
                if i.KeyCode == Enum.KeyCode.S then move.S = false end
                if i.KeyCode == Enum.KeyCode.D then move.D = false end
                if i.KeyCode == Enum.KeyCode.Space then move.Up = false end
                if i.KeyCode == Enum.KeyCode.LeftShift then move.Down = false end
            end)

            -- Fly Toggle
            Tab:AddToggle({
                Name = "Fly (Mobile & PC)",
                Default = false,
                Callback = function(val)
                    flying = val
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local root = char:WaitForChild("HumanoidRootPart")
                    task.spawn(function()
                        while flying and root do
                            local cf = Camera.CFrame
                            local direction = Vector3.zero
                            if move.W then direction += cf.LookVector end
                            if move.S then direction -= cf.LookVector end
                            if move.A then direction -= cf.RightVector end
                            if move.D then direction += cf.RightVector end
                            if move.Up then direction += Vector3.new(0,1,0) end
                            if move.Down then direction -= Vector3.new(0,1,0) end

                            if direction.Magnitude > 0 then
                                root.Velocity = direction.Unit * speed
                            else
                                root.Velocity = Vector3.zero
                            end
                            RunService.Heartbeat:Wait()
                        end
                    end)
                end
            })

            Tab:AddSlider({
                Name = "Fly Speed",
                Min = 10,
                Max = 150,
                Default = 50,
                Increment = 5,
                ValueName = "Speed",
                Callback = function(val)
                    speed = val
                end
            })

        else
            OrionLib:MakeNotification({
                Name = "❌ Wrong Key",
                Content = "Key Invalid. Try again.",
                Time = 4
            })
        end
    end
})
