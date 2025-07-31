--[[ South Bronx Script - Auto Crate Farm Module (Premium Style) By: RiseHub | Inspired by VoidHub, Yero, and Dodgebro ]]--

-- Helper Functions local function fireProximityPrompt(prompt, action) if prompt and prompt:IsA("ProximityPrompt") then fireproximityprompt(prompt) print("[Action] " .. action) end end

local function tweenToPosition(position, description) local Players = game:GetService("Players") local TweenService = game:GetService("TweenService") local player = Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait() local rootPart = character:WaitForChild("HumanoidRootPart")

local info = TweenInfo.new((rootPart.Position - position).Magnitude / 16, Enum.EasingStyle.Linear)
local goal = {CFrame = CFrame.new(position)}
local tween = TweenService:Create(rootPart, info, goal)

tween:Play()
tween.Completed:Wait()
print("[Tween] " .. description)

end

local function walkToPosition(position, description) local Players = game:GetService("Players") local player = Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait() local humanoid = character:WaitForChild("Humanoid") humanoid:MoveTo(position) humanoid.MoveToFinished:Wait() print("[Walk] " .. description) end

local function hasCrate() local Players = game:GetService("Players") local backpack = Players.LocalPlayer:WaitForChild("Backpack") for _, item in pairs(backpack:GetChildren()) do if item.Name:lower():find("crate") then return true end end return false end

local function isCrateGone() return not hasCrate() end

local function equipCrate() local Players = game:GetService("Players") local backpack = Players.LocalPlayer:WaitForChild("Backpack") for _, item in pairs(backpack:GetChildren()) do if item.Name:lower():find("crate") then item.Parent = Players.LocalPlayer.Character print("[Equip] Crate equipped") break end end end

-- UI Setup local AutoFarmTab = Window:CreateTab("Auto Farm", nil) local Section = AutoFarmTab:CreateSection("Crate Farming")

local running = false

local Toggle = AutoFarmTab:CreateToggle({ Name = "Auto Crate Farm", CurrentValue = false, Flag = "AutoCrateFarm", Callback = function(Value) running = Value task.spawn(function() while running do local cratePrompt = workspace:FindFirstChild("PlaceHere") and workspace.PlaceHere.Attachment:FindFirstChild("ProximityPrompt") if cratePrompt then while not hasCrate() and running do fireProximityPrompt(cratePrompt, "Picking up Crate") task.wait(0.5) end end

tweenToPosition(Vector3.new(-542.4784, 3.5371, -82.6257), "Waypoint 1")
            tweenToPosition(Vector3.new(-404.4160, 3.3621, -82.3717), "Waypoint 2")
            walkToPosition(Vector3.new(-401.8955, 3.3621, -72.6088), "Waypoint 3")

            equipCrate()

            local dropPrompt = workspace.cratetruck2.Model.ClickBox.Attachment:FindFirstChild("ProximityPrompt")
            if dropPrompt then
                while not isCrateGone() and running do
                    fireProximityPrompt(dropPrompt, "Dropping off Crate")
                    task.wait(0.5)
                end
            end

            walkToPosition(Vector3.new(-401.8955, 3.3621, -72.6088), "Returning: Waypoint 3")
            walkToPosition(Vector3.new(-404.4160, 3.3621, -82.3717), "Returning: Waypoint 2")
            tweenToPosition(Vector3.new(-542.4784, 3.5371, -82.6257), "Returning: Waypoint 1")
            walkToPosition(Vector3.new(-551.4426, 3.5371, -85.6194), "Returning to Crates Location")

            task.wait(0.1)
        end
    end)
end,

})

