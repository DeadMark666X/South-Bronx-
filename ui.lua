--// YoxanHub - South Bronx v1.0
if not getgenv().YoxanHubLoaded then
    getgenv().YoxanHubLoaded = true
else
    return
end

-- Key
local KEY = "YoxanFree10"

-- Load Orion UI
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

-- Key UI Window
local KeyWindow = OrionLib:MakeWindow({
    Name = "YoxanHub | Key System",
    HidePremium = false,
    SaveConfig = false
})

KeyWindow:MakeTab({
    Name = "Enter Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
}):AddTextbox({
    Name = "Enter Access Key",
    Default = "",
    TextDisappear = true,
    Callback = function(inputKey)
        if inputKey == KEY then
            OrionLib:MakeNotification({
                Name = "✅ Access Granted",
                Content = "Key is correct. Loading YoxanHub...",
                Time = 3
            })

            task.wait(1)
            KeyWindow:Destroy()

            -- Load UI again (important)
            OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

            local Window = OrionLib:MakeWindow({
                Name = "YoxanHub | South Bronx",
                HidePremium = false,
                SaveConfig = true,
                ConfigFolder = "YoxanHub"
            })

            ---------------------------
            --===[ Tab: Player ]===--
            ---------------------------
            local Tab = Window:MakeTab({
                Name = "Player",
                Icon = "rbxassetid://4483345998",
                PremiumOnly = false
            })

            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local RunService = game:GetService("RunService")
            local UIS = game:GetService("UserInputService")
            local Camera = workspace.CurrentCamera

            -- Fly Variables
            local flying = false
            local flySpeed = 50
            local keys = {W=false,A=false,S=false,D=false,Space=false,LeftShift=false}

            -- Detect Key Presses
            for k in pairs(keys) do
                UIS.InputBegan:Connect(function(i,g)
                    if not g and i.KeyCode.Name == k then keys[k] = true end
                end)
                UIS.InputEnded:Connect(function(i,g)
                    if not g and i.KeyCode.Name == k then keys[k] = false end
                end)
            end

            -- Fly Toggle
            Tab:AddToggle({
                Name = "Fly (PC + Mobile)",
                Default = false,
                Callback = function(state)
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local hrp = char:WaitForChild("HumanoidRootPart")
                    if state then
                        flying = true
                        task.spawn(function()
                            while flying and hrp and hrp.Parent do
                                local move = Vector3.zero
                                local cam = Camera.CFrame
                                if keys.W then move += cam.LookVector end
                                if keys.S then move -= cam.LookVector end
                                if keys.A then move -= cam.RightVector end
                                if keys.D then move += cam.RightVector end
                                if keys.Space then move += cam.UpVector end
                                if keys.LeftShift then move -= cam.UpVector end
                                if move.Magnitude > 0 then
                                    hrp.CFrame = hrp.CFrame + move.Unit * flySpeed * 0.1
                                end
                                task.wait()
                            end
                        end)
                    else
                        flying = false
                    end
                end
            })

            -- Fly Speed
            Tab:AddSlider({
                Name = "Fly Speed",
                Min = 10,
                Max = 150,
                Default = 50,
                Increment = 5,
                ValueName = "Speed",
                Callback = function(v)
                    flySpeed = v
                end
            })

            -- CTRL+Click Delete
            local delConn
            Tab:AddToggle({
                Name = "CTRL + Click = Delete",
                Default = false,
                Callback = function(state)
                    if delConn then delConn:Disconnect() delConn = nil end
                    if state then
                        local mouse = LocalPlayer:GetMouse()
                        delConn = mouse.Button1Down:Connect(function()
                            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target then
                                mouse.Target:Destroy()
                            end
                        end)
                    end
                end
            })

            -- Inventory Viewer
            local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
            local targetName = ""
            local invScreen = nil

            Tab:AddTextbox({
                Name = "Target Name (Inventory)",
                Default = "",
                TextDisappear = false,
                Callback = function(input)
                    targetName = input
                end
            })

            Tab:AddButton({
                Name = "Show Inventory",
                Callback = function()
                    if invScreen then invScreen:Destroy() end
                    local targetPlayer = nil
                    for _, p in ipairs(Players:GetPlayers()) do
                        if string.find(p.Name:lower(), targetName:lower()) or (p.DisplayName and string.find(p.DisplayName:lower(), targetName:lower())) then
                            targetPlayer = p
                            break
                        end
                    end
                    if not targetPlayer then return end

                    invScreen = Instance.new("ScreenGui", PlayerGui)
                    invScreen.Name = "YoxanInventory"

                    local bg = Instance.new("Frame", invScreen)
                    bg.Size = UDim2.new(0, 250, 0, 300)
                    bg.Position = UDim2.new(1, -260, 0, 100)
                    bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    bg.BorderSizePixel = 1

                    local title = Instance.new("TextLabel", bg)
                    title.Size = UDim2.new(1, 0, 0, 30)
                    title.BackgroundTransparency = 1
                    title.Text = targetPlayer.DisplayName .. "'s Inventory"
                    title.TextColor3 = Color3.fromRGB(255,255,255)
                    title.Font = Enum.Font.SourceSansBold
                    title.TextSize = 16

                    local scroll = Instance.new("ScrollingFrame", bg)
                    scroll.Position = UDim2.new(0, 0, 0, 35)
                    scroll.Size = UDim2.new(1, 0, 1, -35)
                    scroll.CanvasSize = UDim2.new(0, 0, 5, 0)
                    scroll.ScrollBarThickness = 4
                    scroll.BackgroundTransparency = 1

                    local layout = Instance.new("UIListLayout", scroll)
                    layout.Padding = UDim.new(0, 2)

                    for i = 1, 20 do
                        local item = Instance.new("TextLabel", scroll)
                        item.Size = UDim2.new(1, -6, 0, 20)
                        item.BackgroundTransparency = 1
                        item.Text = "Item #" .. i .. " (Contoh)"
                        item.TextColor3 = Color3.fromRGB(200,200,200)
                        item.Font = Enum.Font.SourceSans
                        item.TextSize = 14
                    end
                end
            })

        else
            OrionLib:MakeNotification({
                Name = "❌ Invalid Key",
                Content = "The key you entered is incorrect!",
                Time = 4
            })
        end
    end
})
