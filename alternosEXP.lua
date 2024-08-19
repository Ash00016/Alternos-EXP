local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local function sendNotification()
    StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "This guide is created by Ash.",
        Duration = 10
    })
end

local guide = Instance.new("ScreenGui")
guide.Name = "AlternosGuide"
guide.ResetOnSpawn = false
guide.DisplayOrder = 999

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = guide

local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 10)
uiCornerMainFrame.Parent = mainFrame

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 70, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
sidebar.Parent = mainFrame

local pages = Instance.new("Frame")
pages.Size = UDim2.new(1, -70, 1, 0)
pages.Position = UDim2.new(0, 70, 0, 0)
pages.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
pages.Parent = mainFrame

local uiCornerPages = Instance.new("UICorner")
uiCornerPages.CornerRadius = UDim.new(0, 10)
uiCornerPages.Parent = pages

local function createTab(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60, 0, 40)
    button.Position = UDim2.new(0, 5, 0, position)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Parent = sidebar
    
    return button
end

local homeTab = createTab("Home", 10)
-- Add more tabs as needed

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
closeButton.Parent = mainFrame

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -60, 0, 5)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
minimizeButton.Parent = mainFrame

local homePage = Instance.new("Frame")
homePage.Size = UDim2.new(1, 0, 1, 0)
homePage.Position = UDim2.new(0, 0, 0, 0)
homePage.Visible = false
homePage.Parent = pages

local function createToggleOption(name, position)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 200, 0, 40)
    label.Position = UDim2.new(0, 10, 0, position)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = homePage
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 40, 0, 40)
    toggle.Position = UDim2.new(0, 220, 0, position)
    toggle.Text = ""
    toggle.BackgroundColor3 = Color3.fromRGB(255,0, 0) -- Red for off
    toggle.Parent = homePage
    
    toggle.MouseButton1Click:Connect(function()
        toggle.BackgroundColor3 = toggle.BackgroundColor3 == Color3.fromRGB(255, 0, 0) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)

    return toggle
end

-- Create toggle options
local highlightToggle = createToggleOption("Player Highlight", 10)
local playerBoxToggle = createToggleOption("Player Box", 60)
local playerTraceToggle = createToggleOption("Player Trace", 110)
local playerNameToggle = createToggleOption("Player Name", 160)

-- Functionality for new features
-- Placeholder functions for Player Box and Player Trace
local function togglePlayerBox()
    -- Implementation for creating a player box
end

local function togglePlayerTrace()
    -- Implementation for tracing a line to the player
end

playerBoxToggle.MouseButton1Click:Connect(togglePlayerBox)
playerTraceToggle.MouseButton1Click:Connect(togglePlayerTrace)

-- Connect home tab button
homeTab.MouseButton1Click:Connect(function()
    homePage.Visible = true
    -- Hide any other pages if existing
end)

-- Minimize and close button functions
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    -- Add animation if desired
end)

closeButton.MouseButton1Click:Connect(function()
    guide:Destroy()
    -- Uninject or remove any traces if needed
end)

Players.PlayerAdded:Connect(applyHighlight)

sendNotification()

guide.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")