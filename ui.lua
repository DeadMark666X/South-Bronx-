
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
	Name = "YoxanHub | South Bronx",
	LoadingTitle = "YoxanHub Loading...",
	LoadingSubtitle = "by HistoriaX & GPT",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "YoxanHub",
		FileName = "Config"
	},
	Discord = {
		Enabled = true,
		Invite = "yoxanhub", 
		RememberJoins = true
	},
	KeySystem = false,
})

-- Tabs
local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)
local VisualTab = Window:CreateTab("🧿 Visual", 4483363011)
local PlayerTab = Window:CreateTab("🏃 Player", 4483362458)
local MiscTab = Window:CreateTab("🧪 Misc", 4483363022)
local TeleportTab = Window:CreateTab("🌍 Teleport", 4483345998)
local GunTab = Window:CreateTab("🔫 Gun Mods", 4483362993)

-- Sections
local CombatMain = CombatTab:CreateSection("Main Combat")
local VisualMain = VisualTab:CreateSection("Visual Tweaks")
local PlayerMain = PlayerTab:CreateSection("Player Mods")
local MiscMain = MiscTab:CreateSection("Utilities")
local TeleportMain = TeleportTab:CreateSection("Locations")
local GunMain = GunTab:CreateSection("Modifications")

-- Example Toggle
PlayerMain:CreateToggle({
	Name = "Semi Godmode",
	CurrentValue = false,
	Flag = "godmode",
	Callback = function(Value)
		if Value then
			loadstring(game:HttpGet("https://pastebin.com/raw/a81PCdNV"))()
		end
	end,
})

-- Example Slider
PlayerMain:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 100},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "WalkSpeed",
	Callback = function(Value)
		pcall(function()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		end)
	end,
})

-- Example Button
VisualMain:CreateButton({
	Name = "Fullbright",
	Callback = function()
		game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
		game:GetService("Lighting").FogEnd = 1e10
	end,
})

-- Infinite Zoom
VisualMain:CreateToggle({
	Name = "Infinite Zoom",
	CurrentValue = false,
	Flag = "InfiniteZoom",
	Callback = function(State)
		if State then
			game.Players.LocalPlayer.CameraMaxZoomDistance = 1000
		end
	end,
})

-- Instant Interact
MiscMain:CreateToggle({
	Name = "Instant Interact (Prompt 0s)",
	CurrentValue = false,
	Flag = "InstantInteract",
	Callback = function(State)
		if State then
			for _,v in pairs(workspace:GetDescendants()) do
				if v:IsA("ProximityPrompt") then
					v.HoldDuration = 0
				end
			end
			workspace.DescendantAdded:Connect(function(v)
				if v:IsA("ProximityPrompt") then
					v.HoldDuration = 0
				end
			end)
		end
	end,
})

-- Placeholder for Kill All
CombatMain:CreateButton({
	Name = "💀 Kill All (Soon)",
	Callback = function()
		Rayfield:Notify({
			Title = "Coming Soon",
			Content = "This feature will be added in the next release.",
			Duration = 4
		})
	end
})

-- Footer Credits
MiscMain:CreateParagraph({Title = "Credits", Content = "YoxanHub v1.0\nby HistoriaX x ChatGPT\nUI: Rayfield\nTheme: OrionLib style\nMobile Ready ✓"})

-- Ready for Expansion
