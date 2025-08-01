-- YoxanHub - Full UI With Key System (Fly Fixed, Mobile + PC)

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

-- Key Verification
local KEY = "YoxanFree10"

local KeyWindow = OrionLib:MakeWindow({
    Name = "YoxanHub | Key System",
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
    Name = "Enter Your Key",
    Default = "",
    TextDisappear = true,
    Callback = function(inputKey)
        if inputKey == KEY then
            OrionLib:MakeNotification({
                Name = "✅ Access Granted",
                Content = "Key is correct. Loading YoxanHub...",
                Time = 3
            })

            task.wait(2)

            for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
                if gui.Name:match("Orion") then
                    pcall(function() gui:Destroy() end)
                end
            end

            task.wait(1)

            OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

            task.wait(1)

            local Window = OrionLib:MakeWindow({
                Name = "YoxanHub | South Bronx",
                HidePremium = false,
                SaveConfig = true,
                ConfigFolder = "YoxanHub_Config"
            })

            local Tab_Player = Window:MakeTab({
                Name = "Player",
                Icon = "rbxassetid://4483345998",
                PremiumOnly = false
            })

            -- Fly Feature
            local flying = false
            local flySpeed = 50
            local direction = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

            UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                local code = input.KeyCode
                if code == Enum.KeyCode.W then direction.W = true end
                if code == Enum.KeyCode.A then direction.A = true end
                if code == Enum.KeyCode.S then direction.S = true end
                if code == Enum.KeyCode.D then direction.D = true end
                if code == Enum.KeyCode.Space then direction.Space = true end
                if code == Enum.KeyCode.LeftShift then direction.LeftShift = true end
            end)

            UserInputService.InputEnded:Connect(function(input, gpe)
                if gpe then return end
                local code = input.KeyCode
                if code == Enum.KeyCode.W then direction.W = false end
                if code == Enum.KeyCode.A then direction.A = false end
                if code == Enum.KeyCode.S then direction.S = false end
                if code == Enum.KeyCode.D then direction.D = false end
                if code == Enum.KeyCode.Space then direction.Space = false end
                if code == Enum.KeyCode.LeftShift then direction.LeftShift = false end
            end)

            Tab_Player:AddToggle({
                Name = "Fly (PC + Mobile)",
                Default = false,
                Callback = function(state)
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local hrp = char:WaitForChild("HumanoidRootPart")

                    if state then
                        flying = true
                        task.spawn(function()
                            while flying and hrp and hrp.Parent do
                                local cam = workspace.CurrentCamera
                                local moveVec = Vector3.zero
                                if direction.W then moveVec += cam.CFrame.LookVector end
                                if direction.S then moveVec -= cam.CFrame.LookVector end
                                if direction.A then moveVec -= cam.CFrame.RightVector end
                                if direction.D then moveVec += cam.CFrame.RightVector end
                                if direction.Space then moveVec += cam.CFrame.UpVector end
                                if direction.LeftShift then moveVec -= cam.CFrame.UpVector end
                                if moveVec.Magnitude > 0 then
                                    hrp.Velocity = moveVec.Unit * flySpeed
                                else
                                    hrp.Velocity = Vector3.zero
                                end
                                RunService.Heartbeat:Wait()
                            end
                        end)
                    else
                        flying = false
                        if hrp then
                            hrp.Velocity = Vector3.zero
                        end
                    end
                end
            })

            Tab_Player:AddSlider({
                Name = "Fly Speed",
                Min = 10,
                Max = 150,
                Default = 50,
                Increment = 5,
                ValueName = "Speed",
                Callback = function(val)
                    flySpeed = val
                end
            })

        else
            OrionLib:MakeNotification({
                Name = "❌ Invalid Key",
                Content = "The key you entered is incorrect!",
                Time = 4
            })
        end
    end
})
