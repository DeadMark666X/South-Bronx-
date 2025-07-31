local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Test UI",
    LoadingTitle = "Testing...",
    LoadingSubtitle = "By ChatGPT",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false
})
Window:CreateTab("Test"):CreateButton({
    Name = "Click Me",
    Callback = function()
        print("UI works!")
    end
})
