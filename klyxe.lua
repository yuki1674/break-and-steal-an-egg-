-- // Klyxe Hub - Custom UI Script
-- // Theme: Modern Blue / Cyan Accent

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Prevent duplicate UI instances
if CoreGui:FindFirstChild("KlyxeHub") then
    CoreGui.KlyxeHub:Destroy()
end

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KlyxeHub"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 28) -- Deep dark blue
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
MainFrame.Size = UDim2.new(0, 350, 0, 220)
MainFrame.Active = true
MainFrame.Draggable = true

-- UICorner for Smooth Edges
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- UIStroke for Blue Border Glow
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 140, 255) -- Bright Blue
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Top Bar / Header
local Header = Instance.new("TextLabel")
Header.Name = "Header"
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(20, 28, 48) -- Lighter blue tint for header
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Font = Enum.Font.GothamBold
Header.Text = "  Klyxe Hub"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextSize = 16.0
Header.TextXAlignment = Enum.TextXAlignment.Left

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

-- Fix bottom corners of header to be square
local HeaderCover = Instance.new("Frame")
HeaderCover.Parent = Header
HeaderCover.BackgroundColor3 = Color3.fromRGB(20, 28, 48)
HeaderCover.BorderSizePixel = 0
HeaderCover.Position = UDim2.new(0, 0, 1, -5)
HeaderCover.Size = UDim2.new(1, 0, 0, 5)

-- TikTok / Creator Watermark Label
local TikTokLabel = Instance.new("TextLabel")
TikTokLabel.Parent = MainFrame
TikTokLabel.BackgroundTransparency = 1
TikTokLabel.Position = UDim2.new(0, 15, 0, 55)
TikTokLabel.Size = UDim2.new(1, -30, 0, 30)
TikTokLabel.Font = Enum.Font.GothamSemibold
TikTokLabel.Text = "TikTok: @klyxehub"
TikTokLabel.TextColor3 = Color3.fromRGB(140, 180, 230) -- Light icy blue text
TikTokLabel.TextSize = 14.0
TikTokLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Action Button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255) -- Electric Blue
ExecuteButton.Position = UDim2.new(0, 15, 0, 100)
ExecuteButton.Size = UDim2.new(1, -30, 0, 45)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Run Script"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 15.0

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ExecuteButton

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 15, 0, 160)
StatusLabel.Size = UDim2.new(1, -30, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(100, 210, 255) -- Cyan status text
StatusLabel.TextSize = 13.0
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Button Functionality
ExecuteButton.MouseButton1Click:Connect(function()
    StatusLabel.Text = "Status: Executing..."
    
    -- // ==========================================
    -- // PLACE YOUR MAIN SCRIPT/LOGIC HERE
    -- // ==========================================
    task.wait(1)
    print("Klyxe Hub Executed Successfully!")
    
    StatusLabel.Text = "Status: Successfully Executed!"
end)
