-- YoxanHub | Key System + Fly GUI V3 (Mobile/PC)

-- CONFIG
local CorrectKey = "YoxanFree10"

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

-- Step 1: Key UI
local KeyWindow = OrionLib:MakeWindow({
    Name = "YoxanHub | Key System",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "YoxanHubKey"
})

local KeyTab = KeyWindow:MakeTab({
    Name = "Enter Key",
    Icon = "rbxassetid://6031071050",
    PremiumOnly = false
})

KeyTab:AddTextbox({
    Name = "Enter your key",
    Default = "",
    TextDisappear = true,
    Callback = function(input)
        if input == CorrectKey then
            OrionLib:MakeNotification({
                Name = "✅ Access Granted",
                Content = "Key correct! Loading YoxanHub...",
                Time = 3
            })

            task.wait(2)

            -- Remove key UI
            for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do
                if v.Name:find("Orion") then
                    pcall(function() v:Destroy() end)
                end
            end

            task.wait(1)

            -- Reload OrionLib for main UI
            OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

            -- Step 2: Main UI
            local MainWindow = OrionLib:MakeWindow({
                Name = "YoxanHub | South Bronx",
                HidePremium = false,
                SaveConfig = true,
                ConfigFolder = "YoxanHubConfig"
            })

            local TabPlayer = MainWindow:MakeTab({
                Name = "Player",
                Icon = "rbxassetid://4483345998",
                PremiumOnly = false
            })

            TabPlayer:AddButton({
                Name = "Fly GUI V3 (Mobile + PC)",
                Callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
                end
            })

        else
            OrionLib:MakeNotification({
                Name = "❌ Invalid Key",
                Content = "The key you entered is incorrect.",
                Time = 4
            })
        end
    end
})
