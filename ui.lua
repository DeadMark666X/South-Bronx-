-- YoxanHub - Key System + Fly (Mobile & PC)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
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
				if gui.Name:match("Orion") then pcall(function() gui:Destroy() end) end
			end
			task.wait(1)
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

			local flying = false
			local flySpeed = 50
			local dir = {W=false,A=false,S=false,D=false,Space=false,LeftShift=false}

			UserInputService.InputBegan:Connect(function(i,gpe)
				if gpe then return end
				local k = i.KeyCode
				if k == Enum.KeyCode.W then dir.W = true end
				if k == Enum.KeyCode.A then dir.A = true end
				if k == Enum.KeyCode.S then dir.S = true end
				if k == Enum.KeyCode.D then dir.D = true end
				if k == Enum.KeyCode.Space then dir.Space = true end
				if k == Enum.KeyCode.LeftShift then dir.LeftShift = true end
			end)

			UserInputService.InputEnded:Connect(function(i,gpe)
				if gpe then return end
				local k = i.KeyCode
				if k == Enum.KeyCode.W then dir.W = false end
				if k == Enum.KeyCode.A then dir.A = false end
				if k == Enum.KeyCode.S then dir.S = false end
				if k == Enum.KeyCode.D then dir.D = false end
				if k == Enum.KeyCode.Space then dir.Space = false end
				if k == Enum.KeyCode.LeftShift then dir.LeftShift = false end
			end)

			Tab_Player:AddToggle({
				Name = "Fly (PC & Mobile)",
				Default = false,
				Callback = function(state)
					local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
					local hrp = char:WaitForChild("HumanoidRootPart")
					if state then
						flying = true
						task.spawn(function()
							while flying and hrp and hrp.Parent do
								local cam = Camera
								local move = Vector3.zero
								if dir.W then move += cam.CFrame.LookVector end
								if dir.S then move -= cam.CFrame.LookVector end
								if dir.A then move -= cam.CFrame.RightVector end
								if dir.D then move += cam.CFrame.RightVector end
								if dir.Space then move += cam.CFrame.UpVector end
								if dir.LeftShift then move -= cam.CFrame.UpVector end
								if move.Magnitude > 0 then
									hrp.Velocity = move.Unit * flySpeed
								else
									hrp.Velocity = Vector3.zero
								end
								RunService.Heartbeat:Wait()
							end
						end)
					else
						flying = false
						if hrp then hrp.Velocity = Vector3.zero end
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
				Content = "Key incorrect. Try again.",
				Time = 4
			})
		end
	end
})
