
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
	Name = "yoxanhub | South Bronx",
	LoadingTitle = "yoxanhub Premium",
	LoadingSubtitle = "Injecting features...",
	ConfigurationSaving = {
		Enabled = false
	},
	Discord = {
		Enabled = false,
	},
	KeySystem = false
})

-- 🎯 Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local PlayerSection = MainTab:CreateSection("Player Mods")

PlayerSection:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 50},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(Value)
		pcall(function()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		end)
	end,
})

PlayerSection:CreateSlider({
	Name = "FOV",
	Range = {70, 120},
	Increment = 1,
	CurrentValue = 70,
	Callback = function(Value)
		workspace.CurrentCamera.FieldOfView = Value
	end,
})

PlayerSection:CreateToggle({
	Name = "Fly (Press V)",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			loadstring(game:HttpGet("https://pastebin.com/raw/TVYcXkS4"))()
		end
	end
})

-- 🚀 Misc Tab
local MiscTab = Window:CreateTab("Misc", 4483362458)
local VisualsSection = MiscTab:CreateSection("Visual")

VisualsSection:CreateToggle({
	Name = "Full Bright",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			loadstring(game:HttpGet("https://pastebin.com/raw/0FTrG9F1"))()
		end
	end
})

-- 🧩 Gun Mods Tab
local GunTab = Window:CreateTab("Gun Mods", 4483362458)
local GunSection = GunTab:CreateSection("Gun Tweaks")

GunSection:CreateButton({
	Name = "Infinite Ammo",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/a81PCdNV"))()
	end
})

-- 📍 Teleport Tab
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local TeleportSection = TeleportTab:CreateSection("Kill / TP")

TeleportSection:CreateTextbox({
	Name = "TP To Player (L to stop)",
	PlaceholderText = "Enter Name...",
	RemoveTextAfterFocusLost = false,
	Callback = function(input)
		-- tp logic
	end
})

Rayfield:Notify({
	Title = "yoxanhub Injected",
	Content = "UI & Core Ready. Enjoy!",
	Duration = 5
})
