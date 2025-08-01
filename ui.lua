local OrionLib =loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "YoxanHub | South Bronx",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "yoxanhub"
})

local Tab_Player = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- WalkSpeed
Tab_Player:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 16,
	Increment = 1,
	ValueName = "Speed",
	Callback = function(val)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
})

-- JumpPower
Tab_Player:AddSlider({
	Name = "JumpPower",
	Min = 50,
	Max = 200,
	Default = 50,
	Increment = 5,
	ValueName = "Power",
	Callback = function(val)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
	end
})

-- Fly Toggle (ringan)
local flying = false
local flyConnection
Tab_Player:AddToggle({
	Name = "Fly (Mobile Friendly)",
	Default = false,
	Callback = function(val)
		local plr = game.Players.LocalPlayer
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")

		if val then
			flying = true
			local bv = Instance.new("BodyVelocity", hrp)
			bv.Name = "YoxanFly"
			bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
			bv.Velocity = Vector3.zero

			flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
				local move = Vector3.zero
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + (workspace.CurrentCamera.CFrame.LookVector) end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - (workspace.CurrentCamera.CFrame.LookVector) end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - (workspace.CurrentCamera.CFrame.RightVector) end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + (workspace.CurrentCamera.CFrame.RightVector) end
				bv.Velocity = move * 100
			end)
		else
			flying = false
			if flyConnection then flyConnection:Disconnect() end
			if hrp:FindFirstChild("YoxanFly") then hrp:FindFirstChild("YoxanFly"):Destroy() end
		end
	end
})

-- Reset Character
Tab_Player:AddButton({
	Name = "Reset Character",
	Callback = function()
		game.Players.LocalPlayer.Character:BreakJoints()
	end
})

-- Anti AFK
Tab_Player:AddToggle({
	Name = "Anti AFK",
	Default = false,
	Callback = function(enabled)
		if enabled then
			game:GetService("Players").LocalPlayer.Idled:Connect(function()
				VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
				wait(1)
				VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			end)
		end
	end
})

-- // ESP Tab
local Tab_ESP = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local Settings = {
    Box_Color = Color3.fromRGB(255, 255, 255),
    Box_Thickness = 1
}

local ESPConnections = {}
local ESPObjects = {}
local BoxESPEnabled = false

local function NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA, quad.PointB, quad.PointC, quad.PointD = Vector2.zero, Vector2.zero, Vector2.zero, Vector2.zero
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

local function Visibility(state, lib)
    if lib then lib.Visible = state end
end

local function CreateESP(plr)
    local box = NewQuad(Settings.Box_Thickness, Settings.Box_Color)
    ESPObjects[plr] = box

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not BoxESPEnabled or not box then
            Visibility(false, box)
            return
        end

        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") then
            local HumPos, OnScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if OnScreen then
                local head = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                box.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY * 2)
                box.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY * 2)
                box.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY * 2)
                box.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY * 2)
                Visibility(true, box)
            else
                Visibility(false, box)
            end
        else
            Visibility(false, box)
            if not Players:FindFirstChild(plr.Name) then
                connection:Disconnect()
            end
        end
    end)

    ESPConnections[plr] = connection
end

local function EnableESP()
    BoxESPEnabled = true
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and not ESPObjects[v] then
            CreateESP(v)
        end
    end

    Players.PlayerAdded:Connect(function(newplr)
        if newplr ~= LocalPlayer then
            CreateESP(newplr)
        end
    end)
end

local function DisableESP()
    BoxESPEnabled = false
    for _, connection in pairs(ESPConnections) do
        if connection then connection:Disconnect() end
    end
    for _, box in pairs(ESPObjects) do
        if box then box:Remove() end
    end
    table.clear(ESPConnections)
    table.clear(ESPObjects)
end

-- Name ESP System
local NameESPConnections = {} 
local NameESPTexts = {}       
local GlobalConnections = {}  

local function removeESP(player)
    if NameESPConnections[player] then
        for _, conn in ipairs(NameESPConnections[player]) do
            pcall(function() conn:Disconnect() end)
        end
        NameESPConnections[player] = nil
    end

    if NameESPTexts[player] then
        pcall(function()
            NameESPTexts[player].Visible = false
            NameESPTexts[player]:Remove()
        end)
        NameESPTexts[player] = nil
    end
end

local function createESP(player, character)
    local head = character:WaitForChild("Head", 5)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if not head or not humanoid then return end

    removeESP(player)

    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Size = 14
    text.Color = Color3.fromRGB(255, 255, 255)

    NameESPTexts[player] = text

    local renderConn = RunService.RenderStepped:Connect(function()
        if not character:IsDescendantOf(workspace) then
            removeESP(player)
            return
        end

        local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
        if onScreen then
            text.Position = Vector2.new(pos.X, pos.Y - 25)
            text.Text = player.DisplayName
            text.Visible = true
        else
            text.Visible = false
        end
    end)

    local deathConn = humanoid.HealthChanged:Connect(function(health)
        if health <= 0 then
            removeESP(player)
        end
    end)

    local ancestorConn = character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            removeESP(player)
        end
    end)

    NameESPConnections[player] = {renderConn, deathConn, ancestorConn}
end

local function handlePlayer(player)
    if player == LocalPlayer then return end

    if player.Character then
        createESP(player, player.Character)
    end

    local charConn = player.CharacterAdded:Connect(function(char)
        createESP(player, char)
    end)

    if not NameESPConnections[player] then
        NameESPConnections[player] = {}
    end
    table.insert(NameESPConnections[player], charConn)
end

local function EnableNameESP()
    for _, player in ipairs(Players:GetPlayers()) do
        handlePlayer(player)
    end

    GlobalConnections["PlayerAdded"] = Players.PlayerAdded:Connect(handlePlayer)

    GlobalConnections["PlayerRemoving"] = Players.PlayerRemoving:Connect(function(player)
        removeESP(player)
    end)
end

local function DisableNameESP()
    for player in pairs(NameESPConnections) do
        removeESP(player)
    end

    for _, conn in pairs(GlobalConnections) do
        pcall(function() conn:Disconnect() end)
    end
    GlobalConnections = {}
end

-- UI Toggle Button (OrionLib)
Tab_ESP:AddToggle({
	Name = "Box ESP",
	Default = false,
	Callback = function(Value)
		if Value then
			EnableESP()
		else
			DisableESP()
		end
	end
})

Tab_ESP:AddToggle({
	Name = "Name ESP",
	Default = false,
	Callback = function(Value)
		if Value then
			EnableNameESP()
		else
			DisableNameESP()
		end
	end
})

-- Init UI
OrionLib:Init()
