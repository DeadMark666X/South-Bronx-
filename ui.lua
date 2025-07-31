-- YOXANHUB | South Bronx Premium Script
-- OrionLib Sidebar Layout | Mobile Friendly | Created by HistoriaX

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
	Name = "🧪 YOXANHUB | South Bronx",
	HidePremium = false,
	IntroEnabled = true,
	IntroText = "Welcome to YOXANHUB",
	SaveConfig = true,
	ConfigFolder = "YOXANHUB_Config"
})

-- Tabs
local PlayerTab = Window:MakeTab({Name = "👤 Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "👁️ ESP", Icon = "rbxassetid://6031075931", PremiumOnly = false})
local AimbotTab = Window:MakeTab({Name = "🎯 Aimbot", Icon = "rbxassetid://6031225810", PremiumOnly = false})
local GunTab = Window:MakeTab({Name = "🔫 GunMods", Icon = "rbxassetid://6031628592", PremiumOnly = false})
local FarmTab = Window:MakeTab({Name = "🧹 Farm", Icon = "rbxassetid://6031265976", PremiumOnly = false})
local VisualTab = Window:MakeTab({Name = "🌈 Visual", Icon = "rbxassetid://6031075938", PremiumOnly = false})
local TeleportTab = Window:MakeTab({Name = "🧭 Teleport", Icon = "rbxassetid://6035192843", PremiumOnly = false})
local MiscTab = Window:MakeTab({Name = "⚙️ Misc", Icon = "rbxassetid://6034971809", PremiumOnly = false})
local CreditsTab = Window:MakeTab({Name = "📜 Credits", Icon = "rbxassetid://6031075931", PremiumOnly = false})

-- Player Tab Sample Components
PlayerTab:AddLabel("Player Settings")
PlayerTab:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(0, 255, 0),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})
PlayerTab:AddToggle({
	Name = "Noclip (Press N)",
	Default = false,
	Callback = function(Value)
		-- example toggle logic
	end
})

-- Notification Example
OrionLib:MakeNotification({
	Name = "YOXANHUB Loaded!",
	Content = "Welcome to the premium hub!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Discord Button
MiscTab:AddButton({
	Name = "Join Discord",
	Callback = function()
		setclipboard("https://discord.gg/YOUR_DISCORD")
		OrionLib:MakeNotification({
			Name = "Discord Link Copied!",
			Content = "Paste it in your browser.",
			Time = 4
		})
	end
})

-- Credits
CreditsTab:AddParagraph("Credits", "Script by HistoriaX\nUI: OrionLib\nInspired by Yero / Dodgebro / VoidHub")

-- Init
OrionLib:Init()
