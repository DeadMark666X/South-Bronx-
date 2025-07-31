-- YoxanHub | South Bronx | UI by OrionLib (Sidebar Style)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({
    Name = "YoxanHub | South Bronx",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YoxanSB",
    IntroEnabled = true,
    IntroText = "Welcome to YoxanHub",
})

-- Tabs
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local VisualTab = Window:MakeTab({
    Name = "Visual",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://6031068426",
    PremiumOnly = false
})

local WeaponTab = Window:MakeTab({
    Name = "Weapon",
    Icon = "rbxassetid://6031068426",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://6034509993",
    PremiumOnly = false
})

-- Example Toggle
WeaponTab:AddToggle({
    Name = "Infinite Ammo",
    Default = false,
    Callback = function(Value)
        if Value then
            local player = game.Players.LocalPlayer
            local backpack = player.Backpack

            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") and tool:FindFirstChild("Ammo") then
                    tool.Ammo.Value = math.huge
                end
                if tool:FindFirstChild("Mag") then
                    tool.Mag.Value = math.huge
                end
            end
        end
    end
})

OrionLib:Init()
