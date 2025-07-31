local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)("Pepsi's UI Library")

local Window = Library:CreateWindow({
    Name = 'YoxanHub | South Bronx',
    Themeable = {
        Info = 'by HistoriaX',
        Credit = true,
    },
    Background = "rbxassetid://18239728064",
    Theme = [[{
        "__Designer.Colors.topGradient":"1C1C1C",
        "__Designer.Colors.section":"9400D3",
        "__Designer.Colors.hoveredOptionBottom":"9400D3",
        "__Designer.Background.ImageAssetID":"rbxassetid://285099811",
        "__Designer.Colors.selectedOption":"9400D3",
        "__Designer.Colors.unselectedOption":"4D4D4D",
        "__Designer.Colors.unhoveredOptionTop":"1C1C1C",
        "__Designer.Colors.outerBorder":"000000",
        "__Designer.Background.ImageColor":"9400D3",
        "__Designer.Colors.tabText":"FFFFFF",
        "__Designer.Colors.elementBorder":"000000",
        "__Designer.Background.ImageTransparency":85,
        "__Designer.Colors.background":"1A1A1A",
        "__Designer.Colors.innerBorder":"1C1C1C",
        "__Designer.Colors.bottomGradient":"1C1C1C",
        "__Designer.Colors.sectionBackground":"1C1C1C",
        "__Designer.Colors.hoveredOptionTop":"9400D3",
        "__Designer.Colors.otherElementText":"FF00FF",
        "__Designer.Colors.main":"9400D3",
        "__Designer.Colors.elementText":"FFFFFF",
        "__Designer.Colors.unhoveredOptionBottom":"1C1C1C",
        "__Designer.Background.UseBackgroundImage":false
    }]]
})

-- Tabs
local MainTab = Window:CreateTab({Name = "Main"})
local VisualTab = Window:CreateTab({Name = "Visual"})
local PlayerTab = Window:CreateTab({Name = "Player"})
local WeaponTab = Window:CreateTab({Name = "Weapon"})
local MiscTab = Window:CreateTab({Name = "Misc"})

-- Example Section
MainTab:CreateSection({
    Name = "AutoFarm",
    Side = "Left"
}):AddLabel("💡 Masih kosong, lanjut isi fitur")

VisualTab:CreateSection({
    Name = "Shader & Bright",
    Side = "Left"
}):AddLabel("✨ Shader setup coming soon")

PlayerTab:CreateSection({
    Name = "Speed & Fly",
    Side = "Left"
}):AddLabel("🚶 WalkSpeed, Fly, Dash")

WeaponTab:CreateSection({
    Name = "Gun Mods",
    Side = "Left"
}):AddLabel("🔫 Infinite Ammo")

MiscTab:CreateSection({
    Name = "Misc Tools",
    Side = "Left"
}):AddLabel("🎮 Inventory, Teleport, AntiAFK")
