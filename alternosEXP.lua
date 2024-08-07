local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local guide = Instance.new("ScreenGui")
guide.Name = "AlternosGuide"
guide.ResetOnSpawn = false
guide.DisplayOrder = 999

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = guide

local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 10)
uiCornerMainFrame.Parent = mainFrame

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 60, 1, 0)
sidebar.Position = UDim2.new(0, -60, 0, 0) -- Adjusted position to create the space
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local uiCornerSidebar = Instance.new("UICorner")
uiCornerSidebar.CornerRadius = UDim.new(0, 10)
uiCornerSidebar.Parent = sidebar

local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -50, 0, 10) -- Adjusted position
closeButton.Parent = sidebar

local homeButton = Instance.new("ImageButton")
homeButton.Image = "rbxassetid://18839963989"
homeButton.Size = UDim2.new(0, 40, 0, 40)
homeButton.Position = UDim2.new(0, 10, 0, 60)
homeButton.BackgroundTransparency = 1
homeButton.Parent = sidebar

local settingsButton = Instance.new("ImageButton")
settingsButton.Image = "rbxassetid://18839971220"
settingsButton.Size = UDim2.new(0, 40, 0, 40)
settingsButton.Position = UDim2.new(0, 10, 1, -50)
settingsButton.BackgroundTransparency = 1
settingsButton.Parent = sidebar

local title = Instance.new("TextLabel")
title.Text = "📱 Alternos Guide - EXP!"
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
title.Size = UDim2.new(1, -60, 0, 50)
title.Position = UDim2.new(0, 50, 0, 0) -- Adjusted position
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local uiCornerTitle = Instance.new("UICorner")
uiCornerTitle.CornerRadius = UDim.new(0, 10)
uiCornerTitle.Parent = title

local highlightLabel = Instance.new("TextLabel")
highlightLabel.Text = "Player Highlight"
highlightLabel.TextSize = 18
highlightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
highlightLabel.Size = UDim2.new(1, -60, 0, 30)
highlightLabel.Position = UDim2.new(0, 50, 0, 60) -- Adjusted position
highlightLabel.TextXAlignment = Enum.TextXAlignment.Left
highlightLabel.Font = Enum.Font.Gotham
highlightLabel.Parent = mainFrame

local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Text = "Player Name"
playerNameLabel.TextSize = 18
playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
playerNameLabel.Size = UDim2.new(1, -60, 0, 30)
playerNameLabel.Position = UDim2.new(0, 50, 0, 100) -- Adjusted position
playerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
playerNameLabel.Font = Enum.Font.Gotham
playerNameLabel.Parent = mainFrame

local highlightToggleButton = Instance.new("TextButton")
highlightToggleButton.Text = ""
highlightToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
highlightToggleButton.Size = UDim2.new(0, 50, 0, 30)
highlightToggleButton.Position = UDim2.new(1, -60, 0, 60)
highlightToggleButton.Parent = mainFrame

local uiCornerHighlightToggleButton = Instance.new("UICorner")
uiCornerHighlightToggleButton.CornerRadius = UDim.new(0, 10)
uiCornerHighlightToggleButton.Parent = highlightToggleButton

local nameToggleButton = Instance.new("TextButton")
nameToggleButton.Text = ""
nameToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
nameToggleButton.Size = UDim2.new(0, 50, 0, 30)
nameToggleButton.Position = UDim2.new(1, -60, 0, 100)
nameToggleButton.Parent = mainFrame

local uiCornerNameToggleButton = Instance.new("UICorner")
uiCornerNameToggleButton.CornerRadius = UDim.new(0, 10)
uiCornerNameToggleButton.Parent = nameToggleButton

local highlightsEnabled = false
local namesEnabled = false

local function applyHighlight(player)
    local function onCharacterAdded(character)
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local highlight = character:FindFirstChild("Highlight")
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Adornee = character
            highlight.Parent = character
        end
        highlight.Enabled = highlightsEnabled
        highlight.FillColor = Color3.new(1, 1, 1)
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

        local billboardGui = character:FindFirstChild("NameBillboard")
        if not billboardGui then
            billboardGui = Instance.new("BillboardGui")
            billboardGui.Name = "NameBillboard"
            billboardGui.Size = UDim2.new(0, 100, 0, 25)
            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
            billboardGui.AlwaysOnTop = true
            billboardGui.Adornee = character:WaitForChild("Head")
            billboardGui.Parent = character

            local textLabel = Instance.new("TextLabel")
            textLabel.Text = player.Name
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextScaled = true
            textLabel.Parent = billboardGui
        end
        billboardGui.Enabled = namesEnabled
    end

    if player.Character then
        onCharacterAdded(player.Character)
    end

    player.CharacterAdded:Connect(onCharacterAdded)
end

local function toggleHighlights()
    highlightsEnabled = not highlightsEnabled
    highlightToggleButton.BackgroundColor3 = highlightsEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    for _, player in ipairs(Players:GetPlayers()) do
        applyHighlight(player)
    end
end

local function toggleNames()
    namesEnabled = not namesEnabled
    nameToggleButton.BackgroundColor3 = namesEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local billboardGui = player.Character:FindFirstChild("NameBillboard")
            if billboardGui then
                billboardGui.Enabled = namesEnabled
            end
        end
    end
end

highlightToggleButton.MouseButton1Click:Connect(toggleHighlights)
nameToggleButton.MouseButton1Click:Connect(toggleNames)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

Players.PlayerAdded:Connect(function(player)
    applyHighlight(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    applyHighlight(player)
end

local player = Players.LocalPlayer
guide.Parent = player:WaitForChild("PlayerGui")