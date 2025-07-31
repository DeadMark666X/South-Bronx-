-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Minimal UI Window
local Window = Rayfield:CreateWindow({
    Name = "Test UI | Rayfield",
    LoadingTitle = "Loading UI...",
    LoadingSubtitle = "Testing UI Load",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Create a Tab
local TestTab = Window:CreateTab("Test", 4483362458)

-- Create a Section
local TestSection = TestTab:CreateSection("UI Check")

-- Add a Toggle
TestSection:CreateToggle({
    Name = "Example Toggle",
    CurrentValue = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})
