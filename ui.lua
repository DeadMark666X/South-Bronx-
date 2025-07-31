local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

OrionLib:MakeNotification({
    Name = "YoxanHub",
    Content = "✅ UI berhasil dimuat!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

local Window = OrionLib:MakeWindow({
    Name = "YoxanHub | South Bronx",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "YoxanData"
})

local MainTab = Window:MakeTab({
    Name = "🏠 Main",
    Icon = "rbxassetid://6034509993",
    PremiumOnly = false
})

MainTab:AddLabel("YoxanHub Loaded ✅")

MainTab:AddButton({
    Name = "Test Button",
    Callback = function()
        print("Tombol berhasil diklik")
    end
})
