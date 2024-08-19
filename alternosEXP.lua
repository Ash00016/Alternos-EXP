local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local SideMenu = Instance.new("Frame")
local HomeTab = Instance.new("TextButton")
local CombatTab = Instance.new("TextButton")
local WorldTab = Instance.new("TextButton")
local SettingTab = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local HomePage = Instance.new("Frame")
local PlayerHighlightToggle = Instance.new("TextButton")
local PlayerBoxToggle = Instance.new("TextButton")
local PlayerTraceToggle = Instance.new("TextButton")
local PlayerNameToggle = Instance.new("TextButton")

local UserInputService = game:GetService("UserInputService")

-- Parent the ScreenGui to the player's PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- MainFrame Properties
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.Visible = true -- Start with the guide visible

-- TopBar Properties
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.Position = UDim2.new(0, 0, 0, 0)

-- TitleLabel Properties
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TopBar
TitleLabel.Text = "Alternos Guide Universal"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)

-- MinimizeButton Properties
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 18
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)

-- CloseButton Properties
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)

-- SideMenu Properties
SideMenu.Name = "SideMenu"
SideMenu.Parent = MainFrame
SideMenu.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
SideMenu.Size = UDim2.new(0, 150, 1, -30)
SideMenu.Position = UDim2.new(0, 0, 0, 30)

-- Tab Buttons
local function createTabButton(name, text, order)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name
    TabButton.Parent = SideMenu
    TabButton.Text = text
    TabButton.Font = Enum.Font.SourceSansBold
    TabButton.TextSize = 18
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Position = UDim2.new(0, 0, 0, 40 * (order - 1))
    return TabButton
end

HomeTab = createTabButton("HomeTab", "Home", 1)
CombatTab = createTabButton("CombatTab", "Combat", 2)
WorldTab = createTabButton("WorldTab", "World", 3)
SettingTab = createTabButton("SettingTab", "Setting", 4)

-- ContentFrame Properties
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ContentFrame.Size = UDim2.new(1, -150, 1, -30)
ContentFrame.Position = UDim2.new(0, 150, 0, 30)

-- HomePage Layout
HomePage.Name = "HomePage"
HomePage.Parent = ContentFrame
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
HomePage.Visible = true

local function createToggleButton(name, text, order)
    local ButtonFrame = Instance.new("Frame")
    ButtonFrame.Name = name .. "Frame"
    ButtonFrame.Parent = HomePage
    ButtonFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    ButtonFrame.Size = UDim2.new(1, -10, 0, 50)
    ButtonFrame.Position = UDim2.new(0, 5, 0, 10 + 55 * (order - 1))

    local ButtonLabel = Instance.new("TextLabel")
    ButtonLabel.Name = name .. "Label"
    ButtonLabel.Parent = ButtonFrame
    ButtonLabel.Text = text
    ButtonLabel.Font = Enum.Font.SourceSansBold
    ButtonLabel.TextSize = 18
    ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ButtonLabel.BackgroundTransparency = 1
    ButtonLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ButtonLabel.Position = UDim2.new(0, 10, 0, 0)

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = name .. "Toggle"
    ToggleButton.Parent = ButtonFrame
    ToggleButton.Text = ""
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ToggleButton.Size = UDim2.new(0, 30, 0, 30)
    ToggleButton.Position = UDim2.new(0.85, 0, 0.25, 0)

    return ToggleButton
end

PlayerHighlightToggle = createToggleButton("PlayerHighlight", "Player Highlight", 1)
PlayerBoxToggle = createToggleButton("PlayerBox", "Player Box", 2)
PlayerTraceToggle = createToggleButton("PlayerTrace", "Player Trace", 3)
PlayerNameToggle = createToggleButton("PlayerName", "Player Name", 4)

-- Variables to track if guide is minimized
local isMinimized = false
local minimizedSize = UDim2.new(0, 100, 0, 30)
local minimizedPosition = UDim2.new(0.5, -50, 0.5, -15)

-- Script to handle the toggle functionality for player highlights and other features

local toggles = {
    PlayerHighlightToggle = false,
    PlayerBoxToggle = false,
    PlayerTraceToggle = false,
    PlayerNameToggle = false
}

-- Function to highlight players
local function highlightPlayers(enable)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local highlight = player.Character and player.Character:FindFirstChild("Highlight")
            if player.Character then
                if enable then
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Adornee = player.Character
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    end
                else
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
end

-- Function to create boxes around players
local function createPlayerBox(enable)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local box = player.Character:FindFirstChild("BoxHandleAdornment")
            if enable then
                if not box then
                    box = Instance.new("BoxHandleAdornment")
                    box.Parent = player.Character
                    box.Adornee = player.Character
                    box.Size = player.Character:GetExtentsSize()
                    box.ZIndex = 0
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.fromRGB(255, 0, 0)
                end
            else
                if box then
                    box:Destroy()
                end
            end
        end
    end
end

-- Function to trace players with a line
local function tracePlayers(enable)
    -- Clean up any existing traces
    for _, child in pairs(game.Workspace:GetChildren()) do
        if child:IsA("Beam") and child.Name == "PlayerTrace" then
            child:Destroy()
        end
    end

    if enable then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local attachment0 = Instance.new("Attachment", root)
                    local attachment1 = Instance.new("Attachment", game.Players.LocalPlayer.Character.HumanoidRootPart)

                    local beam = Instance.new("Beam")
                    beam.Name = "PlayerTrace"
                    beam.Parent = game.Workspace
                    beam.Attachment0 = attachment0
                    beam.Attachment1 = attachment1
                    beam.FaceCamera = true
                    beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
                    beam.Width0 = 0.1
                    beam.Width1 = 0.1
                    beam.Texture = "rbxassetid://4483345998"  -- Optional: Add a texture
                    beam.TextureSpeed = 2
                end
            end
        end
    end
end

-- Function to show/hide player names
local function showPlayerNames(enable)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local nameTag = player.Character:FindFirstChild("NameTag")
            if enable then
                if not nameTag then
                    nameTag = Instance.new("BillboardGui")
                    nameTag.Name = "NameTag"
                    nameTag.Parent = player.Character
                    nameTag.Adornee = player.Character.Head
                    nameTag.Size = UDim2.new(0, 100, 0, 20)
                    nameTag.StudsOffset = Vector3.new(0, 2, 0)

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = nameTag
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Text = player.Name
                    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    textLabel.BackgroundTransparency = 1
                end
            else
                if nameTag then
                    nameTag:Destroy()
                end
            end
        end
    end
end

-- Connect toggle buttons to corresponding functions
PlayerHighlightToggle.MouseButton1Click:Connect(function()
    toggles.PlayerHighlightToggle = not toggles.PlayerHighlightToggle
    PlayerHighlightToggle.BackgroundColor3 = toggles.PlayerHighlightToggle and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    highlightPlayers(toggles.PlayerHighlightToggle)
end)

PlayerBoxToggle.MouseButton1Click:Connect(function()
    toggles.PlayerBoxToggle = not toggles.PlayerBoxToggle
    PlayerBoxToggle.BackgroundColor3 = toggles.PlayerBoxToggle and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    createPlayerBox(toggles.PlayerBoxToggle)
end)

PlayerTraceToggle.MouseButton1Click:Connect(function()
    toggles.PlayerTraceToggle = not toggles.PlayerTraceToggle
    PlayerTraceToggle.BackgroundColor3 = toggles.PlayerTraceToggle and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    tracePlayers(toggles.PlayerTraceToggle)
end)

PlayerNameToggle.MouseButton1Click:Connect(function()
    toggles.PlayerNameToggle = not toggles.PlayerNameToggle
    PlayerNameToggle.BackgroundColor3 = toggles.PlayerNameToggle and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    showPlayerNames(toggles.PlayerNameToggle)
end)

local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

makeDraggable(MainFrame)

local function minimizeGuide()
    local function animateResize(targetSize, duration)
        local startTime = tick()
        local startSize = MainFrame.Size
        while tick() - startTime < duration do
            local alpha = (tick() - startTime) / duration
            MainFrame.Size = UDim2.new(startSize.X.Scale, startSize.X.Offset + (targetSize.X.Offset - startSize.X.Offset) * alpha, startSize.Y.Scale, startSize.Y.Offset + (targetSize.Y.Offset - startSize.Y.Offset) * alpha)
            wait()
        end
        MainFrame.Size = targetSize
    end

    if Minimized then
        -- Maximize the guide
        animateResize(UDim2.new(0, 500, 0, 300), 0.3)
        MainFrame.Visible = true
        Minimized = false
        MinimizeButton.Text = "-"
    else
        -- Minimize the guide
        animateResize(UDim2.new(0, 100, 0, 50), 0.3)
        MainFrame.Visible = true
        Minimized = true
        MinimizeButton.Text = "+"
    end
end

local Minimized = false
MinimizeButton.MouseButton1Click:Connect(minimizeGuide)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)