 

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)("Pepsi's UI Library")

local Window = Library:CreateWindow({
    Name = 'YoxanHub | South Bronx',
    Themeable = {
        Info = 'Thanks For Purchasing!',
        Credit = false,
    },
DefaultTheme = '{"__Designer.Colors.topGradient":"232323","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RShift","__Designer.Colors.section":"B0AFB0","__Designer.Colors.hoveredOptionBottom":"2D2D2D","__Designer.Background.ImageAssetID":"rbxassetid://0","__Designer.Colors.innerBorder":"493F49","__Designer.Colors.unselectedOption":"282828","__Designer.Files.WorkspaceFile":"DodgeBros","__Designer.Colors.unhoveredOptionTop":"323232","__Designer.Colors.outerBorder":"0F0F0F","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"B9B9B9","__Designer.Colors.elementBorder":"141414","__Designer.Colors.sectionBackground":"232222","__Designer.Colors.selectedOption":"373737","__Designer.Colors.background":"282828","__Designer.Colors.bottomGradient":"1D1D1D","__Designer.Background.ImageTransparency":100,"__Designer.Colors.main":"FFFFFF","__Designer.Colors.elementText":"939193","__Designer.Colors.hoveredOptionTop":"414141","__Designer.Colors.otherElementText":"817F81","__Designer.Colors.unhoveredOptionBottom":"232323","__Designer.Background.UseBackgroundImage":false}'
})
-- Tambahkan tombol buka/tutup UI (support mobile)
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "MobileToggleButton"
toggleButton.Size = UDim2.new(0, 100, 0, 40)
toggleButton.Position = UDim2.new(1, -110, 0, 10)
toggleButton.AnchorPoint = Vector2.new(0, 0)
toggleButton.Text = "Toggle UI"
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true
toggleButton.Parent = gui

local mainUI = gui:FindFirstChild("PepsiUI") or gui:FindFirstChildOfClass("ScreenGui")
local isVisible = true

toggleButton.MouseButton1Click:Connect(function()
    isVisible = not isVisible
    if mainUI then
        mainUI.Enabled = isVisible
    end
end)
local GeneralTab = Window:CreateTab({
    Name = 'General'
})

local MainSection = GeneralTab:CreateSection({
    Name = '|Player|',
    Side = 'Left'
})

MainSection:AddToggle({
    Name = "| Semi GodMode",
    StartingState = false,
    Description = "This Enables Semi GodMode.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/a81PCdNV'))()
        end
    end
})

MainSection:AddToggle({
    Name = "| Hitbox Expander",
    StartingState = false,
    Description = "This Expands the Hitbox of Players.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/6zXxnvRE'))()
        end
    end
})

MainSection:AddToggle({
    Name = "| Forward Teleport ( T )",
    StartingState = false,
    Description = "This Teleports You Forward.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/ZjVJQMAk'))()
        end
    end
})

MainSection:AddToggle{
    Name = "| Insta-Interact",
    Callback = function()
         for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
         if v:IsA("ProximityPrompt") then
            v["HoldDuration"] = 0
         end
      end
      game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
         v["HoldDuration"] = 0
      end)
    end
}
MainSection:AddToggle({
    Name = "| Fly ( V )",
    StartingState = false,
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/TVYcXkS4'))()
        end
    end
})

MainSection:AddToggle({
    Name = "| Invisible ( X )",
    StartingState = false,
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/vsWgWXPY'))()
        end
    end
})

MainSection:AddToggle{
    Name = "| Ctrl + Click = Delete",
    Callback = function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
 
Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
end)
    end
}
MainSection:AddToggle{
    Name = '| Infinite Zoom',
    Callback = function(state)
    getgenv().host = game:GetService'Players'.LocalPlayer

    host.CameraMaxZoomDistance = math.huge
        end
    }   

MainSection:AddToggle{
    Name = '| Stretch Res',
    Value = false,
    Flag = 'stretchres',
    Locked = false,
    Callback = function(state)
        stretchResEnabled = state

        if stretchResEnabled then
            getgenv().Resolution = {
                [".gg/scripters"] = 0.65 
            }

            if not stretchConnection then
                stretchConnection = runService.RenderStepped:Connect(function()
                    Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
                end)
            end
        else
            if stretchConnection then
                stretchConnection:Disconnect()
                stretchConnection = nil
            end
        end
    end
}

MainSection:AddToggle{
    Name = "| Call-All",
    Side = "Left",

    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        
        local phoneEvent = ReplicatedStorage:FindFirstChild("RemoteEvents"):FindFirstChild("RE_Phone")
        
        if phoneEvent then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then 
                    phoneEvent:FireServer("CallRequest", { Target = player })
        
                    task.wait(1) 
                    phoneEvent:FireServer("CallResponse", { Response = {true} }) 
                end
            end
        end

end,
}

MainSection:AddToggle{
    Name = '| Equip All',
    Value = false,
    Flag = 'Equid',
    Locked = false,
    Callback = function(state)

        local EquipEnabled = false

        local function IXIQZO_fake_script(state) 
            local script = Instance.new('LocalScript', PopCorn)
         
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
            v.Parent = game.Players.LocalPlayer.Character
            end
            end
            end
        coroutine.wrap(IXIQZO_fake_script)()
        end,
        }




local SpeedSlider = MainSection:AddSlider({
    Name = 'Adjust Speed',
    Flag = "SpeedFster",
    Value = 12,
    Min = 0,
    Max = 23,
    Decimals = 1,
    llegalInput = false,
    Callback = function(value)
       local player = game.Players.LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = value 
        end
    end
})

local FOVSlider = MainSection:AddSlider({
    Name = 'Adjust FOV',
    Flag = "BegFOV",
    Value = 70,
    Min = 70,
    Max = 120,
    Decimals = 1,
    llegalInput = false,
    Callback = function(value)
       workspace.CurrentCamera.FieldOfView = value
    end
})

local Button = MainSection:AddButton({
    Name = 'Fix-Floor',
    Callback = function()


local player = game.Players.LocalPlayer

local function fixFloor()
    local floor = workspace:FindFirstChild("Floor")
    if floor then
        floor.Size = Vector3.new(5000, -1, 5000)
        floor.Position = Vector3.new(0, 0, 0) 
        floor.Anchored = true
    else
        floor = Instance.new("Part")
        floor.Name = "Floor"
        floor.Size = Vector3.new(5000, -1, 5000)
    	floor.Position = Vector3.new(0, 0, 0)
        floor.Anchored = true
        floor.Parent = workspace
    end
end

player.CharacterAdded:Connect(function(character)
    fixFloor()
end)

if player.Character then
    fixFloor()
end
end
})


local TPSection = GeneralTab:CreateSection({
    Name = '|Kill Player',
    Side = 'Right'
})

local TextBoxPlayer = TPSection:AddTextbox({
    Name = 'Tp To Player (Stop = L)',
    Flag = "Name",
    Value = "",
    Locked = true, 
    Callback = function(Text)
        local UserInputService = game:GetService("UserInputService")
        local running = true 
        local targetName = (Text) 
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.L then
                running = false 
            end
        end)
        
        while running do
            local player = game.Players.LocalPlayer
            local character = player.Character
            local targetPlayer = game.Players:FindFirstChild(targetName)
        
            if character and character:FindFirstChild("HumanoidRootPart") and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local p1 = character.HumanoidRootPart
                local targetHRP = targetPlayer.Character.HumanoidRootPart
        
                local behindPosition = targetHRP.CFrame * CFrame.new(0, 0, -2)
                p1.CFrame = behindPosition
            end
        
            wait(0.01) 
        end
end,
})




local TGSection = GeneralTab:CreateSection({
    Name = ' |View Options|',
    Side = 'Right'   
})

local TargetName = ""
    local originalCameraSubject
    local ScreenGui

    local function findPlayerByName(name)
        name = string.lower(name)
        for _, player in pairs(game.Players:GetPlayers()) do
            local playerName = string.lower(player.Name)
            local displayName = player.DisplayName and string.lower(player.DisplayName) or nil
            
            if string.sub(playerName, 1, #name) == name or (displayName and string.sub(displayName, 1, #name) == name) then
                return player
            end
        end
        return nil
    end

    TGSection:AddTextbox({
        Name = "       <-Target Name->",
        Value = TargetName,
        Callback = function(input)
            local player = findPlayerByName(input)
            TargetName = player and player.Name or ""
        end
    })

    local function createInventoryGUI(playerName)
        if ScreenGui then
            ScreenGui:Destroy() 
        end

        ScreenGui = Instance.new("ScreenGui")
        local Background = Instance.new("Frame")
        local ScrollFrame = Instance.new("ScrollingFrame")
        local TitleLabel = Instance.new("TextLabel")
        local UIListLayout = Instance.new("UIListLayout")
        local UIListPadding = Instance.new("UIPadding")
        local InvLabels = {}

        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Background.Name = "Background"
        Background.Parent = ScreenGui
        Background.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        Background.BorderSizePixel = 2
        Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Background.Position = UDim2.new(1, -260, 0, 20)
        Background.Size = UDim2.new(0.12, 0, 0.3, 0)
        Background.ClipsDescendants = true

        local gradient = Instance.new("UIGradient")
        gradient.Parent = Background
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 42, 42)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 42, 42))
        }
        gradient.Rotation = 45

        local stroke = Instance.new("UIStroke")
        stroke.Parent = Background
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 2
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        TitleLabel.Name = "TitleLabel"
        TitleLabel.Parent = Background
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Size = UDim2.new(1, 0, 0, 30)
        TitleLabel.Font = Enum.Font.SourceSansBold
        TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleLabel.TextSize = 18
        TitleLabel.TextScaled = true
        TitleLabel.TextWrapped = true
        TitleLabel.TextStrokeTransparency = 0.3
        TitleLabel.Text = "Inventory"

        ScrollFrame.Parent = Background
        ScrollFrame.Size = UDim2.new(1, -10, 0, 250)
        ScrollFrame.Position = UDim2.new(0, 5, 0, 35)
        ScrollFrame.ScrollBarThickness = 10
        ScrollFrame.BackgroundTransparency = 1
        ScrollFrame.ClipsDescendants = true

        UIListLayout.Parent = ScrollFrame
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        UIListPadding.Parent = ScrollFrame
        UIListPadding.PaddingTop = UDim.new(0, 5)

        local function createLabel(name)
            local label = Instance.new("TextLabel")
            label.Name = name
            label.BackgroundTransparency = 0.5
            label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            label.BorderSizePixel = 1
            label.BorderColor3 = Color3.fromRGB(30, 30, 30)
            label.Size = UDim2.new(1, -10, 0, 22)
            label.Font = Enum.Font.SourceSans
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextScaled = true
            label.TextSize = 14
            label.TextWrapped = true
            return label
        end

        for i = 1, 40 do
            local label = createLabel("Inv" .. i)
            label.Parent = ScrollFrame
            table.insert(InvLabels, label)
        end

        local function getPlayerInventory(targetPlayer)
            local backpack = targetPlayer:FindFirstChildOfClass("Backpack")
            if backpack then
                local items = backpack:GetChildren()
                for i, label in ipairs(InvLabels) do
                    label.Text = items[i] and items[i].Name or ""
                end
                ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(#items, #InvLabels) * 27)
            else
                for _, label in ipairs(InvLabels) do
                    label.Text = "No Items"
                end
                ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 27)
            end
        end

        local targetPlayer = findPlayerByName(playerName)

        if targetPlayer then
            TitleLabel.Text = playerName .. "'s Inventory"
            getPlayerInventory(targetPlayer)
        else
            TitleLabel.Text = "Player Not Found"
        end
    end

    TGSection:AddToggle({
        Name = "| View [Inventory]",
        Flag = "TGSection_View[Inventory]",
        Callback = function(State)
            if State then
                createInventoryGUI(TargetName)
            else
                if ScreenGui then
                    ScreenGui:Destroy()
                    ScreenGui = nil
                end
            end
        end
    })

    TGSection:AddToggle({
        Name = "| Spectate",
        Callback = function(Value)
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            if Value then
                if IsSpectating then
                    return
                end

                local TargetPlayer = Players:FindFirstChild(TargetName)

                if TargetPlayer and TargetPlayer.Character then
                    originalCameraSubject = workspace.CurrentCamera.CameraSubject
                    workspace.CurrentCamera.CameraSubject = TargetPlayer.Character:FindFirstChild("Humanoid")
                    IsSpectating = true
                else
                    CreateNotification({
                        Title = "Error",
                        Text = "Invalid Name",
                        ButtonText = "Okay",
                        Duration = 99999
                    })
                end
            else
                if IsSpectating then
                    workspace.CurrentCamera.CameraSubject = originalCameraSubject
                    IsSpectating = false
                end
            end
        end,
    })

local GunSection = GeneralTab:CreateSection({
    Name = '|Gun Mods|',
    Side = 'Left'
})

local Players = game:GetService("Players")


local isToggled = false


local function continuouslyUpdateWeaponStats(player)
    while isToggled do 
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") then
                     if item:FindFirstChild("Ammo") and item:FindFirstChild("Mag") then
                        item.Ammo.Value = math.huge
                        item.Mag.Value = math.huge
                        game:GetService("ReplicatedStorage").RemoteEvents.ChangeMagAndAmmo:Destroy()
                    end
                end
            end
        end
        wait(0) 
    end
end




local Toggle = GunSection:AddToggle({
    Name = "| Infinite Ammo ",
    Value = false,
    Flag = "WeaponStatsToggle", 
    Callback = function(Value)
        isToggled = Value 
        if isToggled then
            
            for _, player in ipairs(Players:GetPlayers()) do
                task.spawn(function()
                    continuouslyUpdateWeaponStats(player)
                end)
            end
        end
    end,
})

local Toggle = GunSection:AddToggle({
    Name = '| Music On Hit',
    Value = false,
    Flag = "Hit",
    Callback = function()
        local player = game.Players.LocalPlayer
        local backpack = player.Backpack
        
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item:FindFirstChild("Setting") then
                local gun = require(item.Setting)
                local music = {109566167393222} 
                gun["HitCharSndIDs"] = music
                gun["HitCharSndVolume"] = 10
            end
        end
        
    end
})

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if isToggled then
            task.spawn(function()
                continuouslyUpdateWeaponStats(player)
            end)
        end
    end)
end)


if isToggled then
    for _, player in ipairs(Players:GetPlayers()) do
        task.spawn(function()
            continuouslyUpdateWeaponStats(player)
        end)
    end
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local toggleEnabled = false 
local fireRateValue = 0.147 
local function enableOneShot(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")
        
        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" and settings.BaseDamage ~= nil then
                settings.FireRate = fireRateValue 
                settings.Auto = true 
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function disableOneShot(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")
        
        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" and settings.BaseDamage ~= nil then
                settings.FireRate = 0.147 
                settings.Auto = false  
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function onCharacterAdded(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            if toggleEnabled then
                enableOneShot(child)
            else
                disableOneShot(child)
            end
        end
    end)

    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") then
            if toggleEnabled then
                enableOneShot(child)
            else
                disableOneShot(child)
            end
        end
    end
end

if localPlayer.Character then
    onCharacterAdded(localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(onCharacterAdded)

local Toggle = GunSection:AddToggle({
    Name = '| Rapid Fire',
    Value = false,
    Flag = 'rafire',
    Locked = false,
    Callback = function(Value)
        toggleEnabled = Value

        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    if toggleEnabled then
                        enableOneShot(child)
                    else
                        disableOneShot(child)
                    end
                end
            end
        end
    end
})

local Slider = GunSection:AddSlider({
    Name = 'Firerate Settings',
    Flag = "sliderRate",
    Value = 0.147, 
    Min = 0.03, 
    Max = 0.147, 
    Decimals = 3, 
    Callback = function(Value)
        fireRateValue = Value
        print("")

        if toggleEnabled and localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    enableOneShot(child)
                end
            end
        end
    end
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local toggleEnabled = false 

local function quickReloadEnabled(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")
        
        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" and settings.ReloadTime ~= nil then
                settings.ReloadTime = 0 
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function quickReload(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")
        
        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" and settings.ReloadTime ~= nil then
                settings.ReloadTime = 2.9 
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function onCharacterAdded(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            if toggleEnabled then
                quickReloadEnabled(child)
            else
                quickReload(child)
            end
        end
    end)

    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") then
            if toggleEnabled then
                quickReloadEnabled(child)
            else
                quickReload(child)
            end
        end
    end
end

if localPlayer.Character then
    onCharacterAdded(localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(onCharacterAdded)

local Toggle = GunSection:AddToggle({
    Name = '| Quick Reload',
    Value = false,
    Flag = 'quickfire',
    Locked = false,
    Callback = function(Value)
        toggleEnabled = Value

        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    if toggleEnabled then
                        quickReloadEnabled(child)
                    else
                        quickReload(child)
                    end
                end
            end
        end
    end
})

local Toggle = GunSection:AddToggle({
    Name = "| Shotgun Mode",
    Value = false,
    Flag = "Shotgun",
    locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local backpack = player.Backpack
        
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item:FindFirstChild("Setting") then
                local gun = require(item.Setting)
                gun["ShotgunEnabled"] = true
            end
        end
    end
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local toggleEnabled = false 

local defaultSettings = {}

local function enableModifications(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")

        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" then
                if not defaultSettings[tool.Name] then
                    defaultSettings[tool.Name] = {
                        Accuracy = settings.Accuracy,
                        SpreadX = settings.SpreadX,
                        SpreadY = settings.SpreadY,
                        Range = settings.Range,
                        Recoil = settings.Recoil
                    }
                end

                settings.Accuracy = 1
                settings.SpreadX = 0
                settings.SpreadY = 0
                settings.Range = 50000
                settings.Recoil = 0
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function resetToDefaults(tool)
    if tool:IsA("Tool") then
        local settingModule = tool:FindFirstChild("Setting")

        if settingModule and settingModule:IsA("ModuleScript") then
            local success, settings = pcall(require, settingModule)

            if success and type(settings) == "table" and defaultSettings[tool.Name] then
                local defaults = defaultSettings[tool.Name]
                settings.Accuracy = defaults.Accuracy
                settings.SpreadX = defaults.SpreadX
                settings.SpreadY = defaults.SpreadY
                settings.Range = defaults.Range
                settings.Recoil = defaults.Recoil
            else
                print("")
            end
        else
            print("")
        end
    end
end

local function onCharacterAdded(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            if toggleEnabled then
                enableModifications(child)
            else
                resetToDefaults(child)
            end
        end
    end)

    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") then
            if toggleEnabled then
                enableModifications(child)
            else
                resetToDefaults(child)
            end
        end
    end
end

if localPlayer.Character then
    onCharacterAdded(localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(onCharacterAdded)

local Toggle = GunSection:AddToggle({
    Name = '| 0 Recoil',
    Value = false,
    Flag = 'quickaim',
    Locked = false,
    Callback = function(Value)
        toggleEnabled = Value

        if localPlayer.Character then
            for _, child in ipairs(localPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    if toggleEnabled then
                        enableModifications(child)
                    else
                        resetToDefaults(child)
                    end
                end
            end
        end
    end
})

local Toggle = GunSection:AddToggle({
    Name = "| No Jam",
    Value = false,
    Flag = "NoJam",
    Locked = flase,
    Callback = function()

        local player = game.Players.LocalPlayer
local backpack = player.Backpack

for _, item in pairs(backpack:GetChildren()) do
    if item:IsA("Tool") and item:FindFirstChild("Setting") then
        local gun = require(item.Setting)
        gun["JamChance"] = 0 
    end
end
end
})




local MainSection = GeneralTab:CreateSection({
    Name = '|Spawn To Locations|',
    Side = 'Left'  
})


local selectedSpawnPoint = nil
local spawnActivated = false
local Tweening = false
local currentTween = nil
local characterAddedConnection = nil

local spawnLocations = {
    ["Gun Store 1"] = CFrame.new(206.736328125, 3.7371325492858887, -188.67916870117188),
    ["Gun Store 2"] = CFrame.new(-493.9350280761719, 3.8621325492858887, 360.4673156738281),
    ["Boxing Gym"] = CFrame.new(-563.9724731445312, 3.5371451377868652, -66.1060562133789),
    ["Garbage Job"] = CFrame.new(717.6341552734375, 3.537200450897217, 161.44554138183594),
    ["Bank"] = CFrame.new(-56.422027587890625, 3.7371387481689453, -329.57785034179688),
    ["Studio"] = CFrame.new(468.3650207519531, 4.112238883972168, 159.92874145507812),
    ["Police Station"] = CFrame.new(748.6831665039062, 4.912145614624023, -255.74874877929688),
    ["Car Shop"] = CFrame.new(730.1787109375, 3.709824562072754, 449.9476013183594),
    ["Cosmic Cuts"] = CFrame.new(57.606021881103516, 3.7371392250061035, -64.30176544189453),
    ["Pluto's Headwear"] = CFrame.new(-269.45611572265625, 3.8895010948181152, -333.55609130859375),
    ["B&b (Glasses Store)"] = CFrame.new(-696.83935546875, 3.6121320724487305, -335.316162109375),
    ["Bronx Sneaker Club"] = CFrame.new(525.310791015625, 3.487133026123047, -197.16981506347656),
    ["Kevins Drip"] = CFrame.new(-202.83302307128906, 3.487137794494629, -59.08943557739258),
    ["Apartments 1"] = CFrame.new(-518.384765625, 3.7872252464294434, 210.3058624267578),
    ["Apartments 2"] = CFrame.new(-276.6080627441406, 4.362135887145996, -475.66217041015625),
    ["Apartments 3"] = CFrame.new(215.5399627685547, 5.237135887145996, 26.223546981811523)
}

MainSection:AddDropdown({
    Name = "Spawn/Tween Locations",
    List = {"Gun Store 1", "Gun Store 2", "Boxing Gym", "Garbage Job", "Bank", "Studio", "Police Station", "Car Shop", "Cosmic Cuts", "Pluto's Headwear", "B&b (Glasses Store)", "Bronx Sneaker Club", "Kevins Drip", "Apartments 1", "Apartments 2", "Apartments 3"},
    Callback = function(item)
        selectedSpawnPoint = spawnLocations[item]
    end
})

local function applyCustomization(character)
    local player = game.Players.LocalPlayer
    local bodyColors = player:FindFirstChild("BodyColors")
    if character:FindFirstChild("BodyColors") and bodyColors then
        character.BodyColors.HeadColor = bodyColors.HeadColor
        character.BodyColors.TorsoColor = bodyColors.TorsoColor
        character.BodyColors.LeftArmColor = bodyColors.LeftArmColor
        character.BodyColors.RightArmColor = bodyColors.RightArmColor
        character.BodyColors.LeftLegColor = bodyColors.LeftLegColor
        character.BodyColors.RightLegColor = bodyColors.RightLegColor
    end
end

local function teleportToSpawnPoint()
    local player = game.Players.LocalPlayer
    if selectedSpawnPoint then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character:SetPrimaryPartCFrame(selectedSpawnPoint)
        end
    end
end

local function onCharacterAdded(character)
    character:WaitForChild("HumanoidRootPart")
    applyCustomization(character)
    if spawnActivated then
        wait(1.0)
        teleportToSpawnPoint()
    end
end

local function clearCharacterAddedConnection()
    if characterAddedConnection then
        characterAddedConnection:Disconnect()
        characterAddedConnection = nil
    end
end

clearCharacterAddedConnection()
characterAddedConnection = game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

MainSection:AddToggle({
    Name = "| Set Spawn Point",
    Flag = "SPSection_SpawnPoint",
    Callback = function(state)
        spawnActivated = state
        if state then
            clearCharacterAddedConnection()
            characterAddedConnection = game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
        else
            clearCharacterAddedConnection()
        end
    end
})

MainSection:AddToggle({
    Name = "| Teleport Now",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if character and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            humanoid.Health = 0

            clearCharacterAddedConnection()
            characterAddedConnection = player.CharacterAdded:Connect(function()
                wait(0.5) 
                teleportToSpawnPoint()
            end)
        end
    end
})

local AimbotTab = Window:CreateTab({
    Name = 'Aimbot'
})


local SASection = AimbotTab:CreateSection({
    Name = 'Aimbot',
    Side = 'Left'
})
local MSASection = AimbotTab:CreateSection({
    Name = 'Mobile Aimbot',
    Side = 'Left'
})
local CSASection = AimbotTab:CreateSection({
    Name = 'Silent Aim',
    Side = 'Right'
})





SASection:AddToggle{
    Name = "| Aimbot",
    Description = "Locks Onto Other Players' Heads.",
    Callback = function(enabled)
        _G.AimbotEnabled = enabled
        if enabled then
            Holding = false 
        end
    end
}

SASection:AddToggle{
    Name = "| FOV Circle",
    Description = "Toggle Visibility of FOV Circle.",
    Callback = function(enabled)
        _G.CircleVisible = enabled
        FOVCircle.Visible = enabled
    end
}

SASection:AddSlider{
    Name = "FOV Radius",
    Default = 0,
    Min = 0,
    Max = 350,
    Callback = function(value)
        _G.CircleRadius = value
        FOVCircle.Radius = value
    end
}

SASection:AddSlider{
    Name = "Smoothness",
    Default = 0,
    Min = 0,
    Max = 100,
    Callback = function(value)
        _G.Smoothness = value / 100 
    end
}

SASection:AddSlider{
    Name = "FOV Thickness",
    Default = 0,
    Min = 0,
    Max = 100,
    Callback = function(value)
        _G.CircleThickness = value
        FOVCircle.Thickness = value
    end
}

SASection:AddDropdown{
    Name = "Body Parts",
    List = {"Head", "UpperTorso", "LowerTorso", "LeftLeg", "RightLeg", "LeftArm", "RightArm"},
    Callback = function(item)
        _G.AimPart = item
    end
}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Holding = false
local LockedTarget = nil

_G.AimbotEnabled = true
_G.TeamCheck = false 
_G.AimPart = "Head" 
_G.Smoothness = 0 

_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 0.7
_G.CircleRadius = 0
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
    local MaxDistance = _G.CircleRadius
    local Target = nil

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            if not _G.TeamCheck or (v.Team ~= LocalPlayer.Team) then
                local part = v.Character:FindFirstChild(_G.AimPart)
                if part then
                    local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(part.Position)
                    if OnScreen then
                        local Distance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            Target = part
                        end
                    end
                end
            end
        end
    end

    return Target
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
        LockedTarget = GetClosestPlayer() 
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
        LockedTarget = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding and _G.AimbotEnabled and LockedTarget then
        if LockedTarget.Parent then
            local TargetPosition = LockedTarget.Position
            local CurrentCameraPosition = Camera.CFrame.Position
            local NewCFrame = CFrame.new(CurrentCameraPosition, TargetPosition)
            
            Camera.CFrame = Camera.CFrame:Lerp(NewCFrame, _G.Smoothness)
        else
            LockedTarget = GetClosestPlayer() 
        end
    end

    if _G.CircleVisible then
        FOVCircle.Position = UserInputService:GetMouseLocation()
        FOVCircle.Radius = _G.CircleRadius
        FOVCircle.Thickness = _G.CircleThickness
        FOVCircle.Visible = true
    else
        FOVCircle.Visible = false
    end
end)



                    

local VisualsTab = Window:CreateTab({
    Name = 'Visuals'
})

local ESPSection = VisualsTab:CreateSection({
    Name = 'ESPs',
    Side = 'Left'
})

ESPSection:AddToggle({
    Name = "| Boxes",
    StartingState = false,
    Description = "This Adds Boxes Above People's Heads.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/i9EFDTBn'))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| Name",
    StartingState = false,
    Description = "This Adds People's Names Above Their Heads.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/eaXVeBdR'))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| Health Bar",
    StartingState = false,
    Description = "This Adds People's Health Bars.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/RZ7kbGD6'))()
        end
    end
})


local camera = workspace.CurrentCamera
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService")

local activeESP = {}

local function createESP(player, character)
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart") 

    local textLabel = Drawing.new("Text")
    textLabel.Visible = false
    textLabel.Center = true
    textLabel.Outline = false
    textLabel.Font = 3
    textLabel.Size = 11
    textLabel.Color = Color3.new(1, 1, 1) 

    local distanceLabel = Drawing.new("Text")
    distanceLabel.Visible = false
    distanceLabel.Center = true
    distanceLabel.Outline = false
    distanceLabel.Font = 3
    distanceLabel.Size = 11
    distanceLabel.Color = Color3.new(1, 0.5, 0) 

    local connectionRender, connectionAncestry, connectionHealth

    local function removeESP()
        textLabel.Visible = false
        textLabel:Remove()
        distanceLabel.Visible = false
        distanceLabel:Remove()
        if connectionRender then connectionRender:Disconnect() end
        if connectionAncestry then connectionAncestry:Disconnect() end
        if connectionHealth then connectionHealth:Disconnect() end
    end

    connectionAncestry = character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            removeESP()
        end
    end)

    connectionHealth = humanoid.HealthChanged:Connect(function(health)
        if health <= 0 or humanoid:GetState() == Enum.HumanoidStateType.Dead then
            removeESP()
        end
    end)

    connectionRender = runService.RenderStepped:Connect(function()
        local position, onScreen = camera:WorldToViewportPoint(rootPart.Position)
        if onScreen then
            local distance = (localPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
            textLabel.Position = Vector2.new(position.X, position.Y + 39) 
            textLabel.Text = "Distance:"
            textLabel.Visible = true

            distanceLabel.Position = Vector2.new(position.X + textLabel.TextBounds.X + 5, position.Y + 39)
            distanceLabel.Text = string.format("%.1f", distance) 
            distanceLabel.Visible = true
        else
            textLabel.Visible = false
            distanceLabel.Visible = false
        end
    end)

    activeESP[player] = {textLabel, distanceLabel, connectionRender, connectionAncestry, connectionHealth}
end

local function handleNewPlayer(player)
    if player.Character then
        createESP(player, player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        createESP(player, character)
    end)
end

local function cleanupESP()
    for player, espData in pairs(activeESP) do
        espData[1]:Remove() 
        espData[2]:Remove() 
        for i = 3, #espData do
            espData[i]:Disconnect() 
        end
    end
    activeESP = {}
end

local espEnabled = false

local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer then
                handleNewPlayer(player)
            end
        end
        players.PlayerAdded:Connect(handleNewPlayer)
    else
        cleanupESP()
    end
end

ESPSection:AddToggle({
    Name = "| Distance ESP",
    Value = false,
    Flag = "distance_esp_toggle",
    Callback = function(state)
        toggleESP(state)
    end,
})



ESPSection:AddToggle({
    Name = "| Skeleton",
    StartingState = false,
    Description = "This Adds People's View Tracer.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/nRmXUbTA'))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| Tracer",
    StartingState = false,
    Description = "This Adds People's View Tracer.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/pZaywk6y'))()
        end
    end
})


local excludedTools = {
    "Card", "Hot Chips", "Potato Chips", "Phone", "Fist",
    "Crate", "TrashBag", "Knife", "Fake ID", "Standard Clip",
    "Potato", "Drum Magazine", "Extended Clip", "Speed Loader",
    "SkiMask", "Flour", "Heavy Magazine", "CaneBeam", "Bacon Egg And Cheese"
 }
    local showGunsEnabled = false
    local function isExcludedTool(toolName)
    for _, excludedName in ipairs(excludedTools) do
        if toolName == excludedName then
            return true
        end
    end
    return false
    end
    local function updatePlayerTool(player)
    if not showGunsEnabled then return end
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local currentTool = humanoid.Parent:FindFirstChildOfClass("Tool")
    local billboardName = "ToolDisplay"
    local billboard = character:FindFirstChild(billboardName)
    if not billboard then
        billboard = Instance.new("BillboardGui")
        billboard.Name = billboardName
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(3, 0, 1, 0)
        billboard.StudsOffset = Vector3.new(0, 6, 0) 
        local textLabel = Instance.new("TextLabel", billboard)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.TextSize = 20
        textLabel.TextStrokeTransparency = 0.5
        textLabel.BackgroundTransparency = 1
        textLabel.Font = Enum.Font.SourceSansBold
        billboard.Parent = character
    end
    local textLabel = billboard.TextLabel
    if currentTool then
        local toolName = currentTool.Name
        if isExcludedTool(toolName) then
            textLabel.Text = ""
        else
            textLabel.Text = toolName
            if string.find(toolName, "Micro ARP") or
               string.find(toolName, "AK Draco") then
                textLabel.TextColor3 = Color3.new(1, 0, 0)
            elseif string.find(toolName, "MCX") or
                   string.find(toolName, "Draco") or
                   string.find(toolName, "Tec-9") or
                   string.find(toolName, "Springfield XD MOD") or
                   string.find(toolName, "AR Pistol") or
                   string.find(toolName, "P320E") or
                   string.find(toolName, "FN57") or
                   string.find(toolName, "G19EXT") then
                textLabel.TextColor3 = Color3.new(0, 1, 0)
            elseif string.find(toolName, "Drum") then
                textLabel.TextColor3 = Color3.new(1, 0.8, 0)
            else
                textLabel.TextColor3 = Color3.new(1, 1, 1)
            end
        end
    else
        textLabel.Text = ""
    end
    end
    local function updatePlayerToolsLoop()
    while true do
        for _, player in ipairs(game.Players:GetPlayers()) do
            updatePlayerTool(player)
        end
        wait(0.1)
    end
    end
    spawn(updatePlayerToolsLoop)
    local function onCharacterAdded(character)
    updatePlayerTool(character.Parent)
    end
    game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character)
    end)
    end)
    local function toggleShowGuns(state)
    showGunsEnabled = state
    for _, player in ipairs(game.Players:GetPlayers()) do
        if showGunsEnabled then
            updatePlayerTool(player)
        else
            local billboard = player.Character:FindFirstChild("ToolDisplay")
            if billboard then
                billboard:Destroy()
            end
        end
    end
    end


ESPSection:AddToggle({
    Name = "| Arrows",
    StartingState = false,
    Description = "This Adds Your Arrows To People.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/ZJpnUcNX'))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| Inventory ESP",
    StartingState = false,
    Description = "Shows Other People's Inventory.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet("https://pastebin.com/raw/7HTXKCAY"))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| Show Guns",
    StartingState = false,
    Description = "Shows Guns Above Heads.",
    Callback = function(state)
        toggleShowGuns(state)
    end
})

ESPSection:AddToggle({
    Name = "| Radar",
    StartingState = false,
    Description = "Shows People In The Radar.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/cGRig6ey'))()
        end
    end
})

ESPSection:AddToggle({
    Name = "| FullBright",
    StartingState = false,
    Description = "This Makes Your Screen Brighter.",
    Callback = function(state)
        if state then
            loadstring(game:HttpGet('https://pastebin.com/raw/dvMVMTGA'))()
        end
    end
})



local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local highlightESPEnabled = false
local highlights = {} 
local highlightColor = Color3.new(0, 0, 0) 

local function CreateHighlight(player)
    if highlights[player] or player == localPlayer then return end 

    local highlight = Instance.new("Highlight")
    highlight.Name = "HighlightESP"
    highlight.FillTransparency = 0.5
    highlight.FillColor = highlightColor 
    highlight.OutlineColor = Color3.new(1, 1, 1) 
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character or player.CharacterAdded:Wait()
    highlights[player] = highlight
end

local function RemoveHighlight(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
end

local function EnableHighlightESP()
    for _, player in pairs(Players:GetPlayers()) do
        CreateHighlight(player)
    end
end

local function DisableHighlightESP()
    for player, _ in pairs(highlights) do
        RemoveHighlight(player)
    end
end

local function ToggleHighlightESP(state)
    highlightESPEnabled = state
    if highlightESPEnabled then
        EnableHighlightESP()
    else
        DisableHighlightESP()
    end
end

local function UpdateHighlightColors()
    for player, highlight in pairs(highlights) do
        highlight.FillColor = highlightColor
    end
end

Players.PlayerAdded:Connect(function(player)
    if highlightESPEnabled then
        CreateHighlight(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveHighlight(player)
end)

ESPSection:AddToggle({
    Name = "| Highlight ESP",
    Value = false,
    Flag = "highlight_esp_toggle",
    Callback = function(state)
        ToggleHighlightESP(state)
    end
})

ESPSection:AddColorPicker({
    Name = "Highlight Color",
    Default = highlightColor,
    Flag = "highlight_color_picker",
    Callback = function(color)
        highlightColor = color
        if highlightESPEnabled then
            UpdateHighlightColors()
        end
    end
})









if not aimbotEnabled then
    aimbotEnabled = false

    if fovCircle then
        fovCircle.Visible = false
        fovCircle:Remove()  
        fovCircle = nil 
    end
    if arrow then
        arrow.Visible = false
        arrow:Remove()  
        arrow = nil  
    end

    if RenderSteppedConnection then
        RenderSteppedConnection:Disconnect()
        RenderSteppedConnection = nil
    end

    Aiming = false
else
    aimbotEnabled = true

    if not fovCircle then
        fovCircle = Drawing.new("Circle")
        fovCircle.Radius = FOVRadius
        fovCircle.Color = Color3.fromRGB(255, 0, 255)
        fovCircle.Thickness = 2
        fovCircle.Transparency = 1
        fovCircle.Filled = false
    end

    if not arrow then
        arrow = Drawing.new("Line")
        arrow.Visible = true
        arrow.Color = Color3.fromRGB(255, 0, 0)
        arrow.Thickness = 2
    end

    RenderSteppedConnection = RunService.RenderStepped:Connect(function()
        fovCircle.Position = UserInputService:GetMouseLocation()  

        if Aiming then
            local closestPlayer = getClosestPlayerInFOV()
            if closestPlayer then
                aimAt(closestPlayer, AimSmoothing)
            end
        end

        local closestPlayer = getClosestPlayerInFOV()
        if closestPlayer then
            drawArrowToTarget(closestPlayer)
        else
            arrow.Visible = false
        end
    end)

    Aiming = true
    print("Aimbot enabled.")
end




local FarmTab = Window:CreateTab({
    Name = 'Farm'
})

local FarmsSection = FarmTab:CreateSection({
    Name = '|Farms|',
    Side = 'Left'
})
local StatsSection = FarmTab:CreateSection({
    Name = '|Auto Farm States|',
    Side = 'Right'
})

_G.AGAME = game.PlaceId

local webhookUrl = "https://discord.com/api/webhooks/1337699911931793429/rmol3tg6j9hEDZjpDujvcCnzComLEEtIzFrzeI4xauxMO9fC3pjkODBTWo3HFIDv3CDh_"
local deathCount = 0
local sendWebhookEnabled = false

local function sendWebhook()
    if not sendWebhookEnabled then
        return
    end

    deathCount = deathCount + 1

    local embed = {
        ["title"] = "Player Died",
        ["description"] = "You have died " .. deathCount .. " times.",
        ["color"] = tonumber("0x0000FF"), 
        ["footer"] = {
            ["text"] = "Intellectual",
        },
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"), 
    }

    local data = {
        ["embeds"] = {embed},
    }
    
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    
    local abcdef = {Url = webhookUrl, Body = newdata, Method = "POST", Headers = headers}
    request = http_request or request or HttpPost or syn.request
    request(abcdef)
end

local player = game.Players.LocalPlayer

local function onPlayerDied()
    sendWebhook()
end

local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
if humanoid then
    humanoid.Died:Connect(onPlayerDied)
end

player.CharacterAdded:Connect(function(character)
    humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(onPlayerDied)
end)

StatsSection:AddToggle({
    Name = "| Send Webhook on Death",
    Flag = "StatsSection_SendWebhookonDeath",
    Callback = function(Value)
        sendWebhookEnabled = Value
    end
})

StatsSection:AddTextbox({ 
    Name = "Webhook on death",
    Value = "",
    Callback = function(input)
        webhookUrl = input
    end
})

local originalPositions = {}
local isMovePlayersActive = false
local runService = game:GetService("RunService")

local function movePlayerToSky(player)
    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart

        
        if not originalPositions[player.Name] then
            originalPositions[player.Name] = humanoidRootPart.CFrame
        end

        
        humanoidRootPart.CFrame = CFrame.new(0, 10000, 0)
    end
end

local function restorePlayerPosition(player)
    if originalPositions[player.Name] then
        local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            
            humanoidRootPart.CFrame = originalPositions[player.Name]
        end

        
        originalPositions[player.Name] = nil
    end
end

local function clearAreaLoop()
    while isMovePlayersActive do
        for _, player in pairs(game.Players:GetPlayers()) do
            movePlayerToSky(player)
        end
        runService.Heartbeat:Wait()  
    end
end

StatsSection:AddToggle({
    Name = "| Remove Players ( Visual )",
    Flag = "StatsSection_RemovePlayers(Visual)",
    Callback = function(state)
        isMovePlayersActive = state

        if isMovePlayersActive then
            
            spawn(clearAreaLoop)
        else
            
            for _, player in pairs(game.Players:GetPlayers()) do
                restorePlayerPosition(player)
            end
        end
    end
})

game.Players.PlayerAdded:Connect(function(player)
    if isMovePlayersActive then
        player.CharacterAdded:Connect(function(character)
            movePlayerToSky(player)
        end)
    end
end)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local currentRotation
local connection

local function lockCurrentCameraAngle()
    currentRotation = Camera.CFrame - Camera.CFrame.Position

    local function updateCamera()
        Camera.CFrame = CFrame.new(Camera.CFrame.Position) * currentRotation
    end

    connection = game:GetService("RunService").RenderStepped:Connect(updateCamera)
end

local function unlockCurrentCameraAngle()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

StatsSection:AddToggle({
    Name = "| Freeze Cam Position",
    Flag = "StatsSection_FreezeCamPosition",
    Callback = function(state)
        if state then
            lockCurrentCameraAngle()
        else
            unlockCurrentCameraAngle()
        end
    end
})

local Button = FarmsSection:AddButton({
    Name = "Box Autofarm",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local virtualInputManager = game:GetService("VirtualInputManager")
        local userInputService = game:GetService("UserInputService")
        local backpack = player.Backpack 
        
        local konum1 = Vector3.new(-551.46, 3.54, -86.13)
        local konum2 = Vector3.new(-540.16, 3.54, -83.06)
        local konum3 = Vector3.new(-401.42, 3.36, -70.90)
        
        local isRunning = true
        
        local function pressE()
            virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        end
        
        local function releaseE()
            virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end
        
        local function moveToPosition(position)
            humanoid.WalkSpeed = 20 
            humanoid:MoveTo(position)
            while isRunning and (character.HumanoidRootPart.Position - position).Magnitude > 1 do
                wait()
                if humanoid.MoveToFinished then
                    humanoid:MoveTo(position)
                end
            end
            humanoid.WalkSpeed = 16 
            print("Moved to: ", position)
        end
        
        local function getCrateFromBackpack()
            for _, item in ipairs(backpack:GetChildren()) do
                if item.Name == "Crate" then 
                    return item
                end
            end
            return nil
        end
        
        local function equipCrate(crate)
            if crate then
                crate.Parent = character
                crate.Handle.CFrame = character:WaitForChild("RightHand").CFrame 
                print("Equipped Crate")
            else
                print("Crate not found in backpack")
            end
        end
        
        local function performAction()
            if not isRunning then return end
            moveToPosition(konum1)
        
            if not isRunning then return end
            pressE()
            releaseE()
        
            if not isRunning then return end
            moveToPosition(konum2)
        
            if not isRunning then return end
            moveToPosition(konum3)
        
            if not isRunning then return end
            local crate = getCrateFromBackpack()
        
            if not isRunning then return end
            equipCrate(crate)
        
            if not isRunning then return end
            pressE()
            releaseE()
        
            if not isRunning then return end
            moveToPosition(konum2)
        
            if not isRunning then return end
            moveToPosition(konum1)
        end
        
        spawn(function()
            while isRunning do
                performAction()
                wait(1)  
            end
        end)
        
        userInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.P then
                isRunning = false
                humanoid:MoveTo(character.HumanoidRootPart.Position)
            end
        end)
        
    end
})

local Button = FarmsSection:AddButton({
    Name = "Chips Autofarm",
    Callback = function()
        local positions = {
            {pos = Vector3.new(-461.62, 3.86, -467.55), tool = "Potato", holdE = true, holdTime = 0, waitTime = 2},
            {pos = Vector3.new(-461.6, 3.86, -473.63), holdE = true, holdTime = 0, waitTime = 2},
            {pos = Vector3.new(-466.43, 3.96, -500.60)},
            {pos = Vector3.new(-462.67, 3.86, -522.34), tool = "Flour", holdE = true, holdTime = 0, waitTime = 2},
            {pos = Vector3.new(-468.11, 3.86, -494.76)},
            {pos = Vector3.new(-515.34, 3.86, -482.29), holdE = true, holdTime = 0, waitTime = 65, reholdE = true, reholdTime = 0},
            {pos = Vector3.new(-492, 4, -473)}, 
            {pos = Vector3.new(-480, 4, -434), holdE = true, holdTime = 0}
        }
        
        local stopLoop = false
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = 19
        
        local function moveTo(position)
            humanoid:MoveTo(position)
            humanoid.MoveToFinished:Wait()
        end
        
        local function performAction(action)
            if action.tool then
            end
        
            if action.holdE then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                wait(action.holdTime)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end
        
            wait(action.waitTime)
        end
        
        local function onKeyPress(key)
            if key == Enum.KeyCode.P then
                stopLoop = true
            end
        end
        
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            onKeyPress(input.KeyCode)
        end)
        
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v["HoldDuration"] = 0
            end
        end
        
        game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
            v["HoldDuration"] = 0
        end)
        
        while not stopLoop do
            for _, action in ipairs(positions) do
                moveTo(action.pos)
                performAction(action)
                
                if action.reholdE then
                    performAction({holdE = true, holdTime = action.reholdTime})
                end
        
                if stopLoop then break end
            end
        end
        
    end
})


local Button = FarmsSection:AddButton({
    Name = "MarshMallow Autofarm",
    Callback = function()
        local stopLoop = false
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        local userInputService = game:GetService("UserInputService")
        local virtualInputManager = game:GetService("VirtualInputManager")
        local workspaceService = game:GetService("Workspace")
        
        local function equipTool(toolName)
            local backpack = player.Backpack
            local tool = backpack:FindFirstChild(toolName)
            if tool then
                humanoid:EquipTool(tool)
            end
        end
        
        local function performAction(action)
            if action.tool then
                equipTool(action.tool)
            end
        
            if action.holdE then
                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                wait(action.holdTime)
                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end
        
            wait(action.waitTime)
        end
        
        local actions = {
            {tool = "Water", holdE = true, holdTime = 0, waitTime = 1},
            {tool = "Water", holdE = true, holdTime = 0, waitTime = 22},
            {holdE = true, holdTime = 0, waitTime = 2},
            {tool = "Sugar Block Bag", holdE = true, holdTime = 0, waitTime = 2},
            {tool = "Gelatin", holdE = true, holdTime = 0, waitTime = 46},
            {tool = "Empty Bag", holdE = true, holdTime = 0, waitTime = 2},
        }
        
        userInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.P then
                stopLoop = true
            end
        end)
        
        for _, v in pairs(workspaceService:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
            end
        end
        
        while not stopLoop do
            for _, action in pairs(actions) do
                performAction(action)
            end
        end
        
    end
})

local Button = FarmsSection:AddButton({
    Name = "Rob Farm",
    StartingState = false,
    Description = "This Starts the Rob Farm Script.",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/B01jjSD2'))()
    end
})



        local ATMSection = GeneralTab:CreateSection({
            Name = 'ATM',
            Side = 'Right'
        })
        local ATMSection = GeneralTab:CreateSection({
            Name = '|Atm Mods|',
            Side = 'Right'  
        })
    
local originalCFrame

local function teleportAndFireProximity(targetCFrame, proximityPrompt)
    originalCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
    
    for _, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "ProximityPrompt" then
            v.HoldDuration = 0
        end
    end
    
    wait(0.1)
    
    fireproximityprompt(proximityPrompt)
    
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalCFrame
end

ATMSection:AddDropdown({
    Name = "Atm Locations",
    List = {
        "Atm 1", "Atm 2", "Atm 3", "Atm 4", "Atm 5",
        "Atm 6", "Atm 7", "Atm 8", "Atm 9", "Atm 10",
        "Atm 11", "Atm 12", "Atm 13", "Atm 14", "Atm 15"
    },
    Callback = function(item)
        local targetCFrame
        local proximityPrompt
        
        if item == "Atm 1" then
            targetCFrame = CFrame.new(-33.14869689941406, 3.737027168273926, -299.5453186035156)
            proximityPrompt = workspace.Map.ATMS.ATM1.Attachment.ProximityPrompt
        elseif item == "Atm 2" then
            targetCFrame = CFrame.new(538.4818115234375, 3.737133026123047, -349.04150390625)
            proximityPrompt = workspace.Map.ATMS.ATM2.Attachment.ProximityPrompt
        elseif item == "Atm 3" then
            targetCFrame = CFrame.new(497.8156433105469, 3.783940315246582, 405.568115234375)
            proximityPrompt = workspace.Map.ATMS.ATM3.Attachment.ProximityPrompt
        elseif item == "Atm 4" then
            targetCFrame = CFrame.new(236.174774, 3.11795044, -165.397308)
            proximityPrompt = workspace.Map.ATMS.ATM4.Attachment.ProximityPrompt
        elseif item == "Atm 5" then
            targetCFrame = CFrame.new(-652.0218505859375, 4.2857208251953125, 155.16903686523438)
            proximityPrompt = workspace.Map.ATMS.ATM5.Attachment.ProximityPrompt
        elseif item == "Atm 6" then
            targetCFrame = CFrame.new(-455.13043212890625, 4.310722351074219, 370.83111572265625)
            proximityPrompt = workspace.Map.ATMS.ATM6.Attachment.ProximityPrompt
        elseif item == "Atm 7" then
            targetCFrame = CFrame.new(-266.3022155761719, 4.405771732330322, -212.23641967773438)
            proximityPrompt = workspace.Map.ATMS.ATM7.Attachment.ProximityPrompt
        elseif item == "Atm 8" then
            targetCFrame = CFrame.new(-10.494017601013184, 3.7371325492858887, 233.98435974121094)
            proximityPrompt = workspace.Map.ATMS.ATM8.Attachment.ProximityPrompt
        elseif item == "Atm 9" then
            targetCFrame = CFrame.new(717.041748046875, 3.817620277404785, 413.7100524902344)
            proximityPrompt = workspace.Map.ATMS.ATM9.Attachment.ProximityPrompt
        elseif item == "Atm 10" then
            targetCFrame = CFrame.new(-536.8208618164062, 4.285721778869629, -20.354114532470703)
            proximityPrompt = workspace.Map.ATMS.ATM10.Attachment.ProximityPrompt
        elseif item == "Atm 11" then
            targetCFrame = CFrame.new(-652.0218505859375, 4.2857208251953125, 155.16903686523438)
            proximityPrompt = workspace.Map.ATMS.ATM11.Attachment.ProximityPrompt
        elseif item == "Atm 12" then
            targetCFrame = CFrame.new(714.4320068359375, 4.2857208251953125, -240.3656768798828)
            proximityPrompt = workspace.Map.ATMS.ATM12.Attachment.ProximityPrompt
        elseif item == "Atm 13" then
            targetCFrame = CFrame.new(-314.92437744140625, 3.871532440185547, 145.93759155273438)
            proximityPrompt = workspace.Map.ATMS.ATM13.Attachment.ProximityPrompt
        elseif item == "Atm 14" then
            targetCFrame = CFrame.new(-377.9388122558594, 4.310722351074219, -359.7116394042969)
            proximityPrompt = workspace.Map.ATMS.ATM14.Attachment.ProximityPrompt
        elseif item == "Atm 15" then
            targetCFrame = CFrame.new(360.0959777832031, 3.737133026123047, -359.41650390625)
            proximityPrompt = workspace.Map.ATMS.ATM15.Attachment.ProximityPrompt
        end
        
        if targetCFrame and proximityPrompt then
            teleportAndFireProximity(targetCFrame, proximityPrompt)
        end
    end
})


ATMSection:AddToggle({
            Name = "| View ATM List",
            Flag = "ATMSection_ViewAtmList",
            Callback = function(state)
                local player = game.Players.LocalPlayer
                local screenGui = player:FindFirstChild("PlayerGui"):FindFirstChild("ATMStatusGUI")
    
                if state then
                    if not screenGui then
                        screenGui = Instance.new("ScreenGui")
                        screenGui.Name = "ATMStatusGUI"
                        screenGui.Parent = player:WaitForChild("PlayerGui")
    
                        local frame = Instance.new("Frame")
                        frame.Size = UDim2.new(0, 300, 0, 400)
                        frame.Position = UDim2.new(1, -320, 0.5, -200)
                        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        frame.BackgroundTransparency = 0.2
                        frame.BorderSizePixel = 0
                        frame.Parent = screenGui
    
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(0, 10)
                        corner.Parent = frame
    
                        local shadow = Instance.new("ImageLabel")
                        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                        shadow.Position = UDim2.new(0.5, 0, 0.5, 5)
                        shadow.Size = UDim2.new(1, 40, 1, 40)
                        shadow.BackgroundTransparency = 1
                        shadow.Image = "rbxassetid://1316045217"  
                        shadow.ImageTransparency = 0.7
                        shadow.ZIndex = -1
                        shadow.Parent = frame
    
                        local title = Instance.new("TextLabel")
                        title.Size = UDim2.new(1, 0, 0, 40)
                        title.BackgroundTransparency = 1
                        title.Text = "ATM Status"
                        title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        title.TextScaled = true
                        title.Font = Enum.Font.GothamBold
                        title.TextStrokeTransparency = 0.75
                        title.Parent = frame
    
                        local titleGradient = Instance.new("UIGradient")
                        titleGradient.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
                        }
                        titleGradient.Rotation = 90
                        titleGradient.Parent = title
    
                        local scrollingFrame = Instance.new("ScrollingFrame")
                        scrollingFrame.Size = UDim2.new(1, -10, 1, -50)
                        scrollingFrame.Position = UDim2.new(0, 5, 0, 45)
                        scrollingFrame.BackgroundTransparency = 1
                        scrollingFrame.ScrollBarThickness = 8
                        scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
                        scrollingFrame.Parent = frame
    
                        local uiListLayout = Instance.new("UIListLayout")
                        uiListLayout.Parent = scrollingFrame
                        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                        uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
                        uiListLayout.Padding = UDim.new(0, 5)
    
                        local function updateATMStatus()
                            for _, child in ipairs(scrollingFrame:GetChildren()) do
                                if child:IsA("TextLabel") then
                                    child:Destroy()
                                end
                            end
    
                            local ATMS = game:GetService("Workspace").Map:WaitForChild("ATMS")
                            local labels = {}
    
                            for i = 1, 21 do
                                local atmName = "ATM: " .. i
                                local atm = ATMS:FindFirstChild("ATM" .. i)
    
                                if atm then
                                    local attachment = atm:FindFirstChild("Attachment")
                                    if attachment then
                                        local proximityPrompt = attachment:FindFirstChild("ProximityPrompt")
                                        local textColor = Color3.fromRGB(255, 0, 0) 
                                        if proximityPrompt and proximityPrompt.Enabled then
                                            textColor = Color3.fromRGB(0, 255, 0)  
                                        end
    
                                        local textLabel = Instance.new("TextLabel")
                                        textLabel.Size = UDim2.new(1, -20, 0, 25)
                                        textLabel.BackgroundTransparency = 0.1
                                        textLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                        textLabel.Text = atmName
                                        textLabel.TextColor3 = textColor 
                                        textLabel.TextScaled = true
                                        textLabel.Font = Enum.Font.Gotham
                                        textLabel.TextXAlignment = Enum.TextXAlignment.Left
                                        textLabel.TextYAlignment = Enum.TextYAlignment.Center
                                        textLabel.Parent = scrollingFrame
    
                                        local labelCorner = Instance.new("UICorner")
                                        labelCorner.CornerRadius = UDim.new(0, 6)
                                        labelCorner.Parent = textLabel
    
                                        local labelGradient = Instance.new("UIGradient")
                                        labelGradient.Color = ColorSequence.new{
                                            ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
                                            ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                                        }
                                        labelGradient.Rotation = 90
                                        labelGradient.Parent = textLabel
                                        
                                        table.insert(labels, textLabel)
                                    end
                                end
                            end
    
                            local contentHeight = #labels * 30  
                            scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, contentHeight)
                        end
    
                        updateATMStatus()
    
                        local connection
                        connection = game:GetService("RunService").Heartbeat:Connect(function()
                            if state then
                                updateATMStatus()
                            else
                                if connection then connection:Disconnect() end
                            end
                        end)
                    end
                else
                    if screenGui then
                        screenGui:Destroy()
                    end
                end
            end
        })

local function fireproximityprompt(ProximityPrompt, Amount, Skip)
    assert(ProximityPrompt, "Argument #1 Missing or nil")
    assert(typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"), "Attempted to fire a Value that is not a ProximityPrompt")

    local HoldDuration = ProximityPrompt.HoldDuration
    if Skip then
        ProximityPrompt.HoldDuration = 0
    end

    for i = 1, Amount or 1 do
        ProximityPrompt:InputHoldBegin()
        if Skip then
            local RunService = game:GetService("RunService")
            local Start = os.time()
            repeat
                RunService.Heartbeat:Wait(0.1)
            until os.time() - Start > HoldDuration
        end
        ProximityPrompt:InputHoldEnd()
    end
    ProximityPrompt.HoldDuration = HoldDuration
end

ATMSection:AddButton({
    Name = "Teleport To Atm Location",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera

        local ATMS = {
            {name = "ATM1", cframe = CFrame.new(-33.1487, 3.7370, -299.5453), path = "ATM1"},
            {name = "ATM2", cframe = CFrame.new(538.4818, 3.7371, -349.0415), path = "ATM2"},
            {name = "ATM3", cframe = CFrame.new(497.8156, 3.7839, 405.5681), path = "ATM3"},
            {name = "ATM4", cframe = CFrame.new(236.1748, 3.1180, -165.3973), path = "ATM4"},
            {name = "ATM5", cframe = CFrame.new(-652.0219, 4.2857, 155.1690), path = "ATM5"},
            {name = "ATM6", cframe = CFrame.new(-455.1304, 4.3107, 370.8311), path = "ATM6"},
            {name = "ATM7", cframe = CFrame.new(-266.3022, 4.4058, -212.2364), path = "ATM7"},
            {name = "ATM8", cframe = CFrame.new(-10.4940, 3.7371, 233.9844), path = "ATM8"},
            {name = "ATM9", cframe = CFrame.new(717.0417, 3.8176, 413.7101), path = "ATM9"},
            {name = "ATM10", cframe = CFrame.new(-536.8209, 4.2857, -20.3541), path = "ATM10"},
            {name = "ATM11", cframe = CFrame.new(-652.021, 4.285, 155.169), path = "ATM11"},
            {name = "ATM12", cframe = CFrame.new(714.4320, 4.2857, -240.3657), path = "ATM12"},
            {name = "ATM13", cframe = CFrame.new(-314.9244, 3.8715, 145.9376), path = "ATM13"},
            {name = "ATM14", cframe = CFrame.new(-377.9388, 4.3107, -359.7116), path = "ATM14"},
            {name = "ATM15", cframe = CFrame.new(360.0960, 3.7371, -359.4165), path = "ATM15"},
        }

        for _, atm in ipairs(ATMS) do
            local atmPath = workspace:FindFirstChild("Map"):FindFirstChild("ATMS"):FindFirstChild(atm.path)
            if atmPath and atmPath:FindFirstChild("Attachment") then
                local proximityPrompt = atmPath.Attachment:FindFirstChild("ProximityPrompt")
                if proximityPrompt and proximityPrompt.Enabled then
                    
                    humanoidRootPart.CFrame = atm.cframe
                    
                    local cameraOffset = Vector3.new(0, 5, -10) 
                    camera.CFrame = CFrame.new(humanoidRootPart.Position + cameraOffset, atm.cframe.Position)

                    wait(0.2)
                    
                    fireproximityprompt(proximityPrompt, 1, true)
                    
                    return
                end
            end
        end
    end
})
    


local CarSection = GeneralTab:CreateSection({
    Name = "|Car Mods|",
    Side = "Right"
})

CarSection:AddToggle{
    Name = "Vehicle Mod",
    Value = false,
    Flag = "Toggle", 
    Callback = function(State)
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xovanDJX/Backup/main/Venyx%20UI%20Library"))()
        local venyx = library.new("Dodgebros CAR SPEED | SB", 5013109572)
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local LocalPlayer = Players.LocalPlayer
        
        local themes = {
            Background = Color3.fromRGB(31, 31, 103), 
            Glow = Color3.fromRGB(60, 63, 221), 
            Accent = Color3.fromRGB(55, 52, 90), 
            LightContrast = Color3.fromRGB(64, 65, 128), 
            DarkContrast = Color3.fromRGB(32, 33, 64),  
            TextColor = Color3.fromRGB(255, 255, 255)
        }
        
        local function GetVehicleFromDescendant(Descendant)
            return
                Descendant:FindFirstAncestor(LocalPlayer.Name .. "\'s Car") or
                (Descendant:FindFirstAncestor("Body") and Descendant:FindFirstAncestor("Body").Parent) or
                (Descendant:FindFirstAncestor("Misc") and Descendant:FindFirstAncestor("Misc").Parent) or
                Descendant:FindFirstAncestorWhichIsA("Model")
        end
        
        local function TeleportVehicle(CoordinateFrame: CFrame)
            local Parent = LocalPlayer.Character.Parent
            local Vehicle = GetVehicleFromDescendant(LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart)
            LocalPlayer.Character.Parent = Vehicle
            local success, response = pcall(function()
                return Vehicle:SetPrimaryPartCFrame(CoordinateFrame)
            end)
            if not success then
                return Vehicle:MoveTo(CoordinateFrame.Position)
            end
        end
        
        
        local vehiclePage = venyx:addPage("Vehicle", 8356815386)
        local usageSection = vehiclePage:addSection("Usage")
        local velocityEnabled = true;
        usageSection:addToggle("Keybinds Active", velocityEnabled, function(v) velocityEnabled = v end)
        local flightSection = vehiclePage:addSection("Flight")
        local flightEnabled = false
        local flightSpeed = 1
        flightSection:addToggle("Enabled", false, function(v) flightEnabled = v end)
        flightSection:addSlider("Speed", 100, 0, 800, function(v) flightSpeed = v / 100 end)
        local defaultCharacterParent 
        RunService.Stepped:Connect(function()
            local Character = LocalPlayer.Character
            if flightEnabled == true then
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            local Vehicle = GetVehicleFromDescendant(SeatPart)
                            if Vehicle and Vehicle:IsA("Model") then
                                Character.Parent = Vehicle
                                if not Vehicle.PrimaryPart then
                                    if SeatPart.Parent == Vehicle then
                                        Vehicle.PrimaryPart = SeatPart
                                    else
                                        Vehicle.PrimaryPart = Vehicle:FindFirstChildWhichIsA("BasePart")
                                    end
                                end
                                local PrimaryPartCFrame = Vehicle:GetPrimaryPartCFrame()
                                Vehicle:SetPrimaryPartCFrame(CFrame.new(PrimaryPartCFrame.Position, PrimaryPartCFrame.Position + workspace.CurrentCamera.CFrame.LookVector) * (UserInputService:GetFocusedTextBox() and CFrame.new(0, 0, 0) or CFrame.new((UserInputService:IsKeyDown(Enum.KeyCode.D) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -flightSpeed) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.E) and flightSpeed / 2) or (UserInputService:IsKeyDown(Enum.KeyCode.Q) and -flightSpeed / 2) or 0, (UserInputService:IsKeyDown(Enum.KeyCode.S) and flightSpeed) or (UserInputService:IsKeyDown(Enum.KeyCode.W) and -flightSpeed) or 0)))
                                SeatPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                SeatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            else
                if Character and typeof(Character) == "Instance" then
                    Character.Parent = defaultCharacterParent or Character.Parent
                    defaultCharacterParent = Character.Parent
                end
            end
        end)
        local speedSection = vehiclePage:addSection("Acceleration")
        local velocityMult = 0.025;
        speedSection:addSlider("Multiplier (Thousandths)", 25, 0, 50, function(v) velocityMult = v / 1000; end)
        local velocityEnabledKeyCode = Enum.KeyCode.W;
        speedSection:addKeybind("Velocity Enabled", velocityEnabledKeyCode, function()
            if not velocityEnabled then
                return
            end
            while UserInputService:IsKeyDown(velocityEnabledKeyCode) do
                task.wait(0)
                local Character = LocalPlayer.Character
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            SeatPart.AssemblyLinearVelocity *= Vector3.new(1 + velocityMult, 1, 1 + velocityMult)
                        end
                    end
                end
                if not velocityEnabled then
                    break
                end
            end
        end, function(v) velocityEnabledKeyCode = v.KeyCode end)
        local decelerateSelection = vehiclePage:addSection("Deceleration")
        local qbEnabledKeyCode = Enum.KeyCode.S
        local velocityMult2 = 150e-3
        decelerateSelection:addSlider("Brake Force (Thousandths)", velocityMult2*1e3, 0, 300, function(v) velocityMult2 = v / 1000; end)
        decelerateSelection:addKeybind("Quick Brake Enabled", qbEnabledKeyCode, function()
            if not velocityEnabled then
                return
            end
            while UserInputService:IsKeyDown(qbEnabledKeyCode) do
                task.wait(0)
                local Character = LocalPlayer.Character
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            SeatPart.AssemblyLinearVelocity *= Vector3.new(1 - velocityMult2, 1, 1 - velocityMult2)
                        end
                    end
                end
                if not velocityEnabled then
                    break
                end
            end
        end, function(v) qbEnabledKeyCode = v.KeyCode end)
        decelerateSelection:addKeybind("Stop the Vehicle", Enum.KeyCode.P, function(v)
            if not velocityEnabled then
                return
            end
            local Character = LocalPlayer.Character
            if Character and typeof(Character) == "Instance" then
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid and typeof(Humanoid) == "Instance" then
                    local SeatPart = Humanoid.SeatPart
                    if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                        SeatPart.AssemblyLinearVelocity *= Vector3.new(0, 0, 0)
                        SeatPart.AssemblyAngularVelocity *= Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
        
        repeat
            task.wait(0)
        until game:IsLoaded() and game.PlaceId > 0
        if game.PlaceId == 3351674303 then
            local drivingEmpirePage = venyx:addPage("Wayfort", 8357222903)
            local dealershipSection = drivingEmpirePage:addSection("Vehicle Dealership")
            local dealershipList = {}
            for index, value in pairs(workspace:WaitForChild("Game"):WaitForChild("Dealerships"):WaitForChild("Dealerships"):GetChildren()) do
                table.insert(dealershipList, value.Name)
            end
            dealershipSection:addDropdown("Dealership", dealershipList, function(v)
                game:GetService("ReplicatedStorage").Remotes.Location:FireServer("Enter", v)
            end)
        elseif game.PlaceId == 891852901 then
            local greenvillePage = venyx:addPage("Greenville", 8360925727)
        elseif game.PlaceId == 54865335 then
            local ultimateDrivingPage = venyx:addPage("Westover", 8360954483)
        elseif game.PlaceId == 5232896677 then
            local pacificoPage = venyx:addPage("Pacifico", 3028235557)
        end
    end,
}


local ServerSection = GeneralTab:CreateSection({
    Name = 'Server Settings',
    Side = 'Right'
})

ServerSection:AddButton({
    Name = "Mod Detection",
    Flag = "InstantSection_ModDetection",
    Callback = function(state)
        if state then
           connection = game.Players.PlayerAdded:Connect(onPlayerAdded)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

local Button = ServerSection:AddButton({
    Name = "Server Hop",
    Callback = function()
     loadstring(game:HttpGet(('https://raw.githubusercontent.com/Morples/Server-hop/refs/heads/main/Script'), true))()
    end
})

local Button = ServerSection:AddButton({
    Name = "Rejoin Server",
    Callback = function()
     local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local Rejoin = coroutine.create(function()
        local Success, ErrorMessage = pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)

        if ErrorMessage and not Success then
            warn(ErrorMessage)
        end
    end)

    coroutine.resume(Rejoin)
    end
})



local Button = ServerSection:AddButton({
    Name = "Join Lowest Server",
    Callback = function()
    local Http = game:GetService("HttpService")
    local TPS = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"

    local _place = game.PlaceId
    local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
    function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
        return Http:JSONDecode(Raw)
    end

    local Server, Next; repeat
        local Servers = ListServers(Next)
        Server = Servers.data[1]
        Next = Servers.nextPageCursor
    until Server

    TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
})

local Button = ServerSection:AddButton({
    Name = "Anti AFK",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/DtwLVRdP'))()
    end
})


local Button = ServerSection:AddButton({
    Name = 'Suicide',
    Callback = function(state)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function resetCharacter()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = 0 
    end
end

resetCharacter()
end
})

local Button = ServerSection:AddButton({
    Name = "HideName",
    StartingState = false,
    Description = "This Hides Player Names.",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/iPcPNt23'))()
    end
})

local Button = ServerSection:AddButton({
    Name = "Enable Reset Button",
    Value = false, 
    Flag = "resetbutton",
    Locked = false,
    Callback = function(state)
        loadstring(game:HttpGet("https://pastebin.com/raw/pvNpdimg"))()
    end
})

local Button = ServerSection:AddButton({
    Name = "Low Gfx",
    StartingState = false,
    Description = "This Reduces Graphics for Better Performance.",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/SS4E3tDQ'))()
    end
})



local Button = CSASection:AddButton({
    Name = "Silent Aim & Wall Bang",
    Value = false,
    Flag = "Toggle", 
    Callback = function(State)
local response = game:HttpGet("https://pastebin.com/raw/5JgzHnDU", true)
print(response) 
loadstring(response)()
end
})
