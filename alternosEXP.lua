local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

-- Function to send a small notification
local function sendNotification()
    StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "This guide is created by Ash, Thx for using",
        Duration = 10
    })
end

local guide = Instance.new("ScreenGui")
guide.Name = "AlternosGuide"
guide.ResetOnSpawn = false
guide.DisplayOrder = 999

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromHex("#151515") -- Dark background color
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White outline
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = guide

local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 10)
uiCornerMainFrame.Parent = mainFrame

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 60, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0) -- Sidebar aligned with main frame
sidebar.BackgroundColor3 = Color3.fromHex("#151515") -- Sidebar color
sidebar.BorderSizePixel = 2
sidebar.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White outline
sidebar.Parent = mainFrame

local uiCornerSidebar = Instance.new("UICorner")
uiCornerSidebar.CornerRadius = UDim.new(0, 10)
uiCornerSidebar.Parent = sidebar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Text = "▼"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Minimize button text color
minimizeButton.BackgroundColor3 = Color3.fromHex("#151515")
minimizeButton.Size = UDim2.new(0, 25, 0, 25) -- Smaller size
minimizeButton.Position = UDim2.new(0, 10, 0, 10)
minimizeButton.BorderSizePixel = 2
minimizeButton.BorderColor3 = Color3.fromRGB(50, 50, 50) -- Darker outline for 3D effect
minimizeButton.Parent = sidebar

local minimizeButtonShadow = Instance.new("UIStroke")
minimizeButtonShadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
minimizeButtonShadow.Color = Color3.fromRGB(200, 200, 200) -- Lighter border for 3D effect
minimizeButtonShadow.Thickness = 2
minimizeButtonShadow.Parent = minimizeButton

local homeButton = Instance.new("ImageButton")
homeButton.Image = "http://www.roblox.com/asset/?id=18839963989" -- Replace with your uploaded home icon asset ID
homeButton.Size = UDim2.new(0, 20, 0, 20)
homeButton.Position = UDim2.new(0, 10, 0, 60)
homeButton.BackgroundTransparency = 1
homeButton.Parent = sidebar

local settingsButton = Instance.new("ImageButton")
settingsButton.Image = "http://www.roblox.com/asset/?id=18839971220" -- Replace with your uploaded settings icon asset ID
settingsButton.Size = UDim2.new(0, 20, 0, 20)
settingsButton.Position = UDim2.new(0, 10, 0, 110)
settingsButton.BackgroundTransparency = 1
settingsButton.Parent = sidebar

local title = Instance.new("TextLabel")
title.Text = "Alternos Guide"
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Title text color
title.BackgroundColor3 = Color3.fromHex("#151515")
title.BorderSizePixel = 0 -- Removed outline
title.Size = UDim2.new(1, -60, 0, 50)
title.Position = UDim2.new(0, 60, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.Gotham
title.Parent = mainFrame

local titleUnderline = Instance.new("Frame")
titleUnderline.Size = UDim2.new(1, -60, 0, 2)
titleUnderline.Position = UDim2.new(0, 60, 0, 48)
titleUnderline.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White underline
titleUnderline.Parent = mainFrame

local highlightLabel = Instance.new("TextLabel")
highlightLabel.Text = "ESP"
highlightLabel.TextSize = 15
highlightLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Label text color
highlightLabel.BackgroundColor3 = Color3.fromHex("#151515")
highlightLabel.BorderSizePixel = 0 -- Removed outline
highlightLabel.Size = UDim2.new(1, -110, 0, 30) -- Adjusted size to leave space for the button
highlightLabel.Position = UDim2.new(0, 60, 0, 60)
highlightLabel.TextXAlignment = Enum.TextXAlignment.Left
highlightLabel.Font = Enum.Font.Gotham
highlightLabel.Parent = mainFrame

local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Text = "Player Name"
playerNameLabel.TextSize = 15
playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Label text color
playerNameLabel.BackgroundColor3 = Color3.fromHex("#151515")
playerNameLabel.BorderSizePixel = 0 -- Removed outline
playerNameLabel.Size = UDim2.new(1, -110, 0, 30) -- Adjusted size to leave space for the button
playerNameLabel.Position = UDim2.new(0, 60, 0, 100)
playerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
playerNameLabel.Font = Enum.Font.Gotham
playerNameLabel.Parent = mainFrame

local highlightToggleButton = Instance.new("TextButton")
highlightToggleButton.Text = ""
highlightToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red for off
highlightToggleButton.Size = UDim2.new(0, 45, 0, 25) -- Smaller size
highlightToggleButton.Position = UDim2.new(1, -55, 0, 65) -- Adjusted position
highlightToggleButton.BorderSizePixel = 2
highlightToggleButton.BorderColor3 = Color3.fromRGB(50, 50, 50) -- Darker outline for 3D effect
highlightToggleButton.Parent = mainFrame

local highlightToggleButtonShadow = Instance.new("UIStroke")
highlightToggleButtonShadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
highlightToggleButtonShadow.Color = Color3.fromRGB(200, 200, 200) -- Lighter border for 3D effect
highlightToggleButtonShadow.Thickness = 2
highlightToggleButtonShadow.Parent = highlightToggleButton

local nameToggleButton = Instance.new("TextButton")
nameToggleButton.Text = ""
nameToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red for off
nameToggleButton.Size = UDim2.new(0, 45, 0, 25) -- Smaller size
nameToggleButton.Position = UDim2.new(1, -55, 0, 105) -- Adjusted position
nameToggleButton.BorderSizePixel = 2
nameToggleButton.BorderColor3 = Color3.fromRGB(50, 50, 50) -- Darker outline for 3D effect
nameToggleButton.Parent = mainFrame

local nameToggleButtonShadow = Instance.new("UIStroke")
nameToggleButtonShadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
nameToggleButtonShadow.Color = Color3.fromRGB(200, 200, 200) -- Lighter border for 3D effect
nameToggleButtonShadow.Thickness = 2
nameToggleButtonShadow.Parent = nameToggleButton

local minimizedBox = Instance.new("Frame")
minimizedBox.Size = UDim2.new(0, 100, 0, 40)
minimizedBox.Position = UDim2.new(0, 10, 0, 10)
minimizedBox.BackgroundColor3 = Color3.fromHex("#151515")
minimizedBox.BorderSizePixel = 2
minimizedBox.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White outline
minimizedBox.Visible = false
minimizedBox.Active = true
minimizedBox.Draggable = true
minimizedBox.Parent = guide

local uiCornerMinimizedBox = Instance.new("UICorner")
uiCornerMinimizedBox.CornerRadius = UDim.new(0, 10)
uiCornerMinimizedBox.Parent = minimizedBox

local expandButton = Instance.new("TextButton")
expandButton.Text = "▲"
expandButton.TextColor3 = Color3.fromRGB(255, 255, 255)
expandButton.BackgroundColor3 = Color3.fromHex("#151515")
expandButton.BorderSizePixel = 2
expandButton.BorderColor3 = Color3.fromRGB(255, 255, 255) -- White outline
expandButton.Size = UDim2.new(0, 40, 0, 40)
expandButton.Position = UDim2.new(0.5, -20, 0.5, -20)
expandButton.Parent = minimizedBox

local uiCornerExpandButton = Instance.new("UICorner")
uiCornerExpandButton.CornerRadius = UDim.new(0, 10)
uiCornerExpandButton.Parent = expandButton

local highlightsEnabled = false
local namesEnabled = false

local function applyHighlight(player)
    local function onCharacterAdded(character)
        if highlightsEnabled then
            -- Add highlight to character
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.new(1, 1, 1) -- White highlight
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.Parent = character
        end

        if namesEnabled then
            -- Show player name
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Size = UDim2.new(0, 200, 0, 50)
            billboardGui.StudsOffset = Vector3.new(0, 2, 0)
            billboardGui.AlwaysOnTop = true

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Text = player.Name
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextScaled = true
            nameLabel.Parent = billboardGui

            billboardGui.Parent = character:FindFirstChild("Head")
        end
    end

    player.CharacterAdded:Connect(onCharacterAdded)

    -- Apply to the current character if it exists
    if player.Character then
        onCharacterAdded(player.Character)
    end
end

local function toggleHighlights()
    highlightsEnabled = not highlightsEnabled
    highlightToggleButton.BackgroundColor3 = highlightsEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0) -- Green for on, Red for off

    for _, player in pairs(Players:GetPlayers()) do
        if highlightsEnabled then
            applyHighlight(player)
        else
            -- Remove highlight from character
            if player.Character then
                local highlight = player.Character:FindFirstChildOfClass("Highlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end
    end
end

local function toggleNames()
    namesEnabled = not namesEnabled
    nameToggleButton.BackgroundColor3 = namesEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0) -- Green for on, Red for off

    for _, player in pairs(Players:GetPlayers()) do
        if namesEnabled then
            applyHighlight(player)
        else
            -- Remove name label from character
            if player.Character and player.Character:FindFirstChild("Head") then
                local billboardGui = player.Character.Head:FindFirstChildOfClass("BillboardGui")
                if billboardGui then
                    billboardGui:Destroy()
                end
            end
        end
    end
end

highlightToggleButton.MouseButton1Click:Connect(toggleHighlights)
nameToggleButton.MouseButton1Click:Connect(toggleNames)

minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    minimizedBox.Visible = true
end)

expandButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    minimizedBox.Visible = false
end)

Players.PlayerAdded:Connect(applyHighlight)

-- Initial call to send the notification before the guide is loaded
sendNotification()

guide.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")