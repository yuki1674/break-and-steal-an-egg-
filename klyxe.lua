-- // Klyxe Hub - Full Integration Script (Break and Steal an Egg)
-- // Theme: All Blue / Cyan Accent with Treadmill & Custom Speed Boost (Max 1000)

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Prevent duplicate Klyxe Hub UI instances
if CoreGui:FindFirstChild("KlyxeHub") then
    CoreGui.KlyxeHub:Destroy()
end

-- ScreenGui Setup para sa Klyxe Hub Menu
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KlyxeHub"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame (Pinalawak nang kaunti para magkasya ang Speed Boost)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 25) -- Deep blue background
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -160)
MainFrame.Size = UDim2.new(0, 350, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 120, 255) -- Blue border
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Top Bar / Header
local Header = Instance.new("TextLabel")
Header.Name = "Header"
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(15, 25, 45) -- Blue header
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Font = Enum.Font.GothamBold
Header.Text = "  Klyxe Hub"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextSize = 16.0
Header.TextXAlignment = Enum.TextXAlignment.Left

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local HeaderCover = Instance.new("Frame")
HeaderCover.Parent = Header
HeaderCover.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
HeaderCover.BorderSizePixel = 0
HeaderCover.Position = UDim2.new(0, 0, 1, -5)
HeaderCover.Size = UDim2.new(1, 0, 0, 5)

-- TikTok Watermark Label
local TikTokLabel = Instance.new("TextLabel")
TikTokLabel.Parent = MainFrame
TikTokLabel.BackgroundTransparency = 1
TikTokLabel.Position = UDim2.new(0, 15, 0, 48)
TikTokLabel.Size = UDim2.new(1, -30, 0, 25)
TikTokLabel.Font = Enum.Font.GothamSemibold
TikTokLabel.Text = "TikTok: @klyxehub"
TikTokLabel.TextColor3 = Color3.fromRGB(130, 180, 255)
TikTokLabel.TextSize = 14.0
TikTokLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Action Button (Run Script)
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 100, 230)
ExecuteButton.Position = UDim2.new(0, 15, 0, 80)
ExecuteButton.Size = UDim2.new(1, -30, 0, 34)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Run Script"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 14.0

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ExecuteButton

-- Auto Treadmill Toggle Button
local TreadmillButton = Instance.new("TextButton")
TreadmillButton.Parent = MainFrame
TreadmillButton.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
TreadmillButton.Position = UDim2.new(0, 15, 0, 122)
TreadmillButton.Size = UDim2.new(1, -30, 0, 34)
TreadmillButton.Font = Enum.Font.GothamBold
TreadmillButton.Text = "Auto Treadmill: OFF"
TreadmillButton.TextColor3 = Color3.fromRGB(255, 100, 100)
TreadmillButton.TextSize = 14.0

local TreadmillCorner = Instance.new("UICorner")
TreadmillCorner.CornerRadius = UDim.new(0, 8)
TreadmillCorner.Parent = TreadmillButton

-- Speed Boost Toggle Button
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = MainFrame
SpeedButton.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
SpeedButton.Position = UDim2.new(0, 15, 0, 164)
SpeedButton.Size = UDim2.new(0, 215, 0, 34)
SpeedButton.Font = Enum.Font.GothamBold
SpeedButton.Text = "Speed Boost: OFF"
SpeedButton.TextColor3 = Color3.fromRGB(255, 100, 100)
SpeedButton.TextSize = 14.0

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedButton

-- Speed Input Box (TextBox sa gilid ng Speed Boost button, Max limit 1000)
local SpeedBox = Instance.new("TextBox")
SpeedBox.Parent = MainFrame
SpeedBox.BackgroundColor3 = Color3.fromRGB(20, 30, 48)
SpeedBox.Position = UDim2.new(0, 240, 0, 164)
SpeedBox.Size = UDim2.new(0, 95, 0, 34)
SpeedBox.Font = Enum.Font.GothamBold
SpeedBox.PlaceholderText = "Speed"
SpeedBox.Text = "100"
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.TextSize = 14.0
SpeedBox.ClearTextOnFocus = false

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 8)
BoxCorner.Parent = SpeedBox

-- Anti-AFK Toggle Button
local AfkButton = Instance.new("TextButton")
AfkButton.Parent = MainFrame
AfkButton.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
AfkButton.Position = UDim2.new(0, 15, 0, 206)
AfkButton.Size = UDim2.new(1, -30, 0, 34)
AfkButton.Font = Enum.Font.GothamBold
AfkButton.Text = "Anti-AFK: OFF"
AfkButton.TextColor3 = Color3.fromRGB(255, 100, 100)
AfkButton.TextSize = 14.0

local AfkCorner = Instance.new("UICorner")
AfkCorner.CornerRadius = UDim.new(0, 8)
AfkCorner.Parent = AfkButton

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 15, 0, 260)
StatusLabel.Size = UDim2.new(1, -30, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
StatusLabel.TextSize = 13.0
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Variables
local autoTreadmillEnabled = false
local speedBoostEnabled = false
local antiAfkEnabled = false

-- Anti-AFK Logic
LocalPlayer.Idled:Connect(function()
    if antiAfkEnabled then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)

-- Button Functionality: I-e-execute ang script at babaguhin ang kulay/pangalan ng ValueHat UI
ExecuteButton.MouseButton1Click:Connect(function()
    StatusLabel.Text = "Status: Executing..."
    
    local success, err = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ValueHat-Script/Valuehat-script/refs/heads/main/BreakAndStealAnEgg.lua'))()
    end)
    
    if success then
        StatusLabel.Text = "Status: Successfully Executed!"
        
        task.spawn(function()
            task.wait(0.5)
            for _, gui in ipairs(CoreGui:GetChildren()) do
                if gui:IsA("ScreenGui") and gui ~= ScreenGui then
                    for _, descendant in ipairs(gui:GetDescendants()) do
                        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                            if string.find(string.lower(descendant.Text), "valuehat") then
                                descendant.Text = "TikTok: @klyxehub"
                            elseif string.find(string.lower(descendant.Text), "break and steal") then
                                descendant.Text = "Klyxe Hub"
                            end
                        end
                        if descendant:IsA("Frame") or descendant:IsA("ScrollingFrame") then
                            descendant.BackgroundColor3 = Color3.fromRGB(12, 18, 30)
                        elseif descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                            descendant.BackgroundColor3 = Color3.fromRGB(0, 100, 230)
                        end
                    end
                 end
            end
        end)
    else
        StatusLabel.Text = "Status: Error Executing!"
        warn(err)
    end 
end)

-- Teleport Function para sa Treadmill
local function teleportAndUseTreadmill()
    pcall(function()
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local closestPart = nil
            local shortestDist = math.huge
            
            for _, obj in ipairs(workspace:GetDescendants()) do
                local nameLower = obj.Name:lower()
                if nameLower:find("treadmill") or nameLower:find("tread") then
                    local targetPos = nil
                    if obj:IsA("Model") and obj.PrimaryPart then
                        targetPos = obj.PrimaryPart.Position
                    elseif obj:IsA("BasePart") then
                        targetPos = obj.Position
                    end
                    
                    if targetPos then
                        local dist = (character.HumanoidRootPart.Position - targetPos).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            if obj:IsA("Model") and obj.PrimaryPart then
                                closestPart = obj.PrimaryPart
                            elseif obj:IsA("BasePart") then
                                closestPart = obj
                            end
                        end
                    end
                end
            end
            
            if closestPart then
                character.HumanoidRootPart.CFrame = closestPart.CFrame + Vector3.new(0, 2, 0)
                for _, prompt in ipairs(closestPart.Parent:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        fireproximityprompt(prompt)
                    end
                end
            end
        end
    end)
end

-- Auto Treadmill Toggle Logic
TreadmillButton.MouseButton1Click:Connect(function()
    autoTreadmillEnabled = not autoTreadmillEnabled
    if autoTreadmillEnabled then
        TreadmillButton.Text = "Auto Treadmill: ON"
        TreadmillButton.TextColor3 = Color3.fromRGB(100, 255, 100)
        StatusLabel.Text = "Status: Connected to Treadmill!"
        teleportAndUseTreadmill()
    else
        TreadmillButton.Text = "Auto Treadmill: OFF"
        TreadmillButton.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "Status: Auto Treadmill Stopped"
    end
end)

-- Speed Boost Toggle Logic
SpeedButton.MouseButton1Click:Connect(function()
    speedBoostEnabled = not speedBoostEnabled
    if speedBoostEnabled then
        SpeedButton.Text = "Speed Boost: ON"
        SpeedButton.TextColor3 = Color3.fromRGB(100, 255, 100)
        StatusLabel.Text = "Status: Speed Boost Enabled!"
    else
        SpeedButton.Text = "Speed Boost: OFF"
        SpeedButton.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "Status: Speed Boost Disabled"
        -- Ibalik sa normal speed (16) kapag naka-OFF
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
            end
        end)
    end
end)

-- Anti-AFK Toggle Logic
AfkButton.MouseButton1Click:Connect(function()
    antiAfkEnabled = not antiAfkEnabled
    if antiAfkEnabled then
        AfkButton.Text = "Anti-AFK: ON"
        AfkButton.TextColor3 = Color3.fromRGB(100, 255, 100)
        StatusLabel.Text = "Status: Anti-AFK Enabled"
    else
        AfkButton.Text = "Anti-AFK: OFF"
        AfkButton.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "Status: Anti-AFK Disabled"
    end
end)

-- Main Loop para sa Auto Treadmill at Speed Boost (May 1000 limit check)
RunService.RenderStepped:Connect(function()
    if autoTreadmillEnabled then
        teleportAndUseTreadmill()
    end
    
    if speedBoostEnabled then
        pcall(function()
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local speedVal = tonumber(SpeedBox.Text) or 16
                    -- Limit check: hindi lalagpas ng 1000 ang bilis
                    if speedVal > 1000 then
                        speedVal = 1000
                        SpeedBox.Text = "1000"
                    elseif speedVal < 0 then
                        speedVal = 0
                    end
                    humanoid.WalkSpeed = speedVal
                end
            end
        end)
    end
end)
