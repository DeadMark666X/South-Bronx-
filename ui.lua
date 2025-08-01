-- YoxanHub - Full UI With Key System (Mobile + PC Friendly)

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

            -- Re-load OrionLib after UI cleared
            OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

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

            -- Fly System
            local flying = false
            local flySpeed = 50
            local moveKeys = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

            for key in pairs(moveKeys) do
                UserInputService.InputBegan:Connect(function(i, g)
                    if not g and i.KeyCode.Name == key then moveKeys[key] = true end
                end)
                UserInputService.InputEnded:Connect(function(i, g)
                    if not g and i.KeyCode.Name == key then moveKeys[key] = false end
                end)
            end

            Tab_Player:AddToggle({
                Name = "Fly (Mobile + PC)",
                Default = false,
                Callback = function(state)
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local hrp = char:WaitForChild("HumanoidRootPart")

                    if state then
                        flying = true
                        task.spawn(function()
                            while flying and hrp and hrp.Parent do
                                local move = Vector3.zero
                                local camCF = Camera.CFrame

                                if moveKeys.W then move += camCF.LookVector end
                                if moveKeys.S then move -= camCF.LookVector end
                                if moveKeys.A then move -= camCF.RightVector end
                                if moveKeys.D then move += camCF.RightVector end
                                if moveKeys.Space then move += camCF.UpVector end
                                if moveKeys.LeftShift then move -= camCF.UpVector end

                                if move.Magnitude > 0 then
                                    hrp.CFrame = hrp.CFrame + move.Unit * flySpeed * 0.1
                                end
                                task.wait()
                            end
                        end)
                    else
                        flying = false
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

            Tab_Player:AddToggle({
                Name = "CTRL + Click = Delete",
                Default = false,
                Callback = function(state)
                    if state then
                        local mouse = LocalPlayer:GetMouse()
                        mouse.Button1Down:Connect(function()
                            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target then
                                mouse.Target:Destroy()
                            end
                        end)
                    end
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
