--// YoxanHub | Tab 1/10 - Player | with Key System

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CorrectKey = "yoxanfree"
local HasAccess = false

-- TEMPORARY WINDOW FOR KEY
local KeyWindow = OrionLib:MakeWindow({
	Name = "YoxanHub | Key System",
	HidePremium = true,
	SaveConfig = false,
	ConfigFolder = "YoxanHubKeyUI"
})

local KeyTab = KeyWindow:MakeTab({
	Name = "🔑 Enter Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

KeyTab:AddTextbox({
	Name = "Enter Your Key",
	Default = "",
	TextDisappear = true,
	Callback = function(value)
		if value == CorrectKey then
			HasAccess = true
			OrionLib:MakeNotification({
				Name = "Access Granted!",
				Content = "Correct key. Loading YoxanHub...",
				Image = "rbxassetid://7733964641",
				Time = 4
			})
			wait(1)
			OrionLib:Destroy()
			wait(0.5)
			loadYoxanHubUI()
		else
			OrionLib:MakeNotification({
				Name = "Invalid Key",
				Content = "Wrong key! Try again.",
				Image = "rbxassetid://7733911828",
				Time = 4
			})
		end
	end
})

--// MAIN UI LOADER
function loadYoxanHubUI()
    local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
    local Window = OrionLib:MakeWindow({
        Name = "YoxanHub | South Bronx",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "YoxanHub"
    })

    local Tab_Player = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local flying = false
    local flySpeed = 50
    local flyKeys = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

    for key in pairs(flyKeys) do
        UserInputService.InputBegan:Connect(function(i, g)
            if not g and i.KeyCode.Name == key then flyKeys[key] = true end
        end)
        UserInputService.InputEnded:Connect(function(i, g)
            if not g and i.KeyCode.Name == key then flyKeys[key] = false end
        end)
    end

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
                        local move = Vector3.zero
                        local camCF = Camera.CFrame
                        local hum = char:FindFirstChildWhichIsA("Humanoid")
                        if hum and hum.MoveDirection.Magnitude > 0 then
                            move += hum.MoveDirection
                        end
                        if flyKeys.W then move += camCF.LookVector end
                        if flyKeys.S then move -= camCF.LookVector end
                        if flyKeys.A then move -= camCF.RightVector end
                        if flyKeys.D then move += camCF.RightVector end
                        if flyKeys.Space then move += camCF.UpVector end
                        if flyKeys.LeftShift then move -= camCF.UpVector end
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

    local delConnection = nil
    Tab_Player:AddToggle({
        Name = "CTRL + Click = Delete",
        Default = false,
        Callback = function(state)
            if delConnection then delConnection:Disconnect() delConnection = nil end
            if state then
                local mouse = LocalPlayer:GetMouse()
                delConnection = mouse.Button1Down:Connect(function()
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target then
                        mouse.Target:Destroy()
                    end
                end)
            end
        end
    })
end
