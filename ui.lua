-- YoxanHub | South Bronx - Tab Player (1/10)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CorrectKey = "yoxanfree"
local KeyWindow = OrionLib:MakeWindow({
	Name = "YoxanHub | Key System",
	HidePremium = true,
	SaveConfig = false,
	ConfigFolder = "YoxanKey"
})

KeyWindow:MakeTab({
	Name = "🔑 Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
}):AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = false,
	Callback = function(value)
		if value == CorrectKey then
			OrionLib:Destroy()

			local Hub = OrionLib:MakeWindow({
				Name = "YoxanHub | South Bronx",
				HidePremium = false,
				SaveConfig = true,
				ConfigFolder = "YoxanMain"
			})

			local Tab_Player = Hub:MakeTab({
				Name = "Player",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})

			-- Fly
			local flying = false
			local flySpeed = 50
			local flyKeys = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}
			for key in pairs(flyKeys) do
				UserInputService.InputBegan:Connect(function(i, g)
					if not g and i.KeyCode.Name == key then flyKeys[key] = true end
				end)
				UserInputService.InputEnded:Connect(function(i, g)
					if not g and i.KeyCode.Name == key then flyKeys[key] = false end
				end)
			end

			Tab_Player:AddToggle({
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
								local camCF = Camera.CFrame
								local hum = char:FindFirstChildWhichIsA("Humanoid")
								if hum and hum.MoveDirection.Magnitude > 0 then move += hum.MoveDirection end
								if flyKeys.W then move += camCF.LookVector end
								if flyKeys.S then move -= camCF.LookVector end
								if flyKeys.A then move -= camCF.RightVector end
								if flyKeys.D then move += camCF.RightVector end
								if flyKeys.Space then move += camCF.UpVector end
								if flyKeys.LeftShift then move -= camCF.UpVector end
								if move.Magnitude > 0 then hrp.CFrame = hrp.CFrame + move.Unit * flySpeed * 0.1 end
								task.wait()
							end
						end)
					else
						flying = false
					end
				end
			})

			Tab_Player:AddSlider({
				Name = "Fly Speed",
				Min = 10,
				Max = 150,
				Default = 50,
				Increment = 5,
				ValueName = "Speed",
				Callback = function(val)
					flySpeed = val
				end
			})

			-- CTRL + Click Delete
			local delConnection = nil
			Tab_Player:AddToggle({
				Name = "CTRL + Click = Delete",
				Default = false,
				Callback = function(state)
					if delConnection then delConnection:Disconnect() delConnection = nil end
					if state then
						local mouse = LocalPlayer:GetMouse()
						delConnection = mouse.Button1Down:Connect(function()
							if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target then
								mouse.Target:Destroy()
							end
						end)
					end
				end
			})

			-- Inventory Viewer
			local targetName = ""
			local invScreen = nil
			Tab_Player:AddTextbox({
				Name = "Target Name (Inventory)",
				Default = "",
				TextDisappear = false,
				Callback = function(input)
					targetName = input
				end
			})

			Tab_Player:AddButton({
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

			-- Spectate
			local IsSpectating = false
			local originalCameraSubject = nil
			Tab_Player:AddToggle({
				Name = "Spectate",
				Default = false,
				Callback = function(Value)
					local Target = Players:FindFirstChild(targetName)
					if Value then
						if Target and Target.Character and Target.Character:FindFirstChild("Humanoid") then
							originalCameraSubject = Camera.CameraSubject
							Camera.CameraSubject = Target.Character:FindFirstChild("Humanoid")
							IsSpectating = true
						end
					else
						if IsSpectating then
							Camera.CameraSubject = originalCameraSubject
							IsSpectating = false
						end
					end
				end
			})
		end
	end
})
