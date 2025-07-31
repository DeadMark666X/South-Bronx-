local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Init window
local Window = OrionLib:MakeWindow({
    Name = "YoxanHub | South Bronx",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YoxanHub"
})

-- Notification
OrionLib:MakeNotification({
	Name = "YoxanHub Loaded!",
	Content = "Welcome to YoxanHub Premium v1.0",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Tab: Player
local PlayerTab = Window:MakeTab({ Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false })
PlayerTab:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerTab:AddSlider({
	Name = "FOV",
	Min = 70,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = Value
	end    
})

PlayerTab:AddToggle({
	Name = "Infinite Zoom",
	Default = false,
	Callback = function(v)
		if v then
			game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
		end
	end
})

-- Tab: Visuals
local Visuals = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false })
Visuals:AddToggle({
	Name = "FullBright",
	Default = false,
	Callback = function(State)
		if State then
			local lighting = game:GetService("Lighting")
			lighting.Brightness = 2
			lighting.ClockTime = 14
			lighting.FogEnd = 100000
			lighting.GlobalShadows = false
			lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
	end
})

-- Tab: Tools
local Tools = Window:MakeTab({ Name = "Tools", Icon = "rbxassetid://4483345998", PremiumOnly = false })

Tools:AddButton({
	Name = "Insta Interact",
	Callback = function()
		for _,v in pairs(game:GetDescendants()) do
			if v:IsA("ProximityPrompt") then
				v.HoldDuration = 0
			end
		end
	end
})

Tools:AddButton({
	Name = "Equip All Tools",
	Callback = function()
		local plr = game.Players.LocalPlayer
		for i,v in pairs(plr.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = plr.Character
			end
		end
	end
})

-- Tab: AutoFarm
local Farm = Window:MakeTab({ Name = "AutoFarm", Icon = "rbxassetid://4483345998", PremiumOnly = false })
Farm:AddToggle({
	Name = "Auto Crate Farm",
	Default = false,
	Callback = function(state)
		getgenv().CrateFarm = state
		while getgenv().CrateFarm do
			local cratePrompt = workspace:FindFirstChild("PlaceHere") and workspace.PlaceHere:FindFirstChildWhichIsA("ProximityPrompt", true)
			if cratePrompt then fireproximityprompt(cratePrompt) end
			task.wait(1)
		end
	end
})

-- Done loading UI
OrionLib:Init()
