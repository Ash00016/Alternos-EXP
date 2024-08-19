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
                    box.Transparency = 1  -- Set transparency to make the box outline only
                end
            else
                if box then
                    box:Destroy()
                end
            end
        end
    end
end

-- Ensure guide remains visible on reset
game.Players.PlayerAdded:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        -- Set up player features (e.g., highlight, box, etc.)
        if toggles.PlayerHighlightToggle then
            highlightPlayers(true)
        end
        if toggles.PlayerBoxToggle then
            createPlayerBox(true)
        end
        if toggles.PlayerTraceToggle then
            tracePlayers(true)
        end
        if toggles.PlayerNameToggle then
            showPlayerNames(true)
        end
    end
end)

-- Monitor player reset events
game.Players.PlayerRemoving:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        -- Cleanup on player removal if needed
    end
end)

-- Ensure guide is always draggable
makeDraggable(MainFrame)

-- Minimize Button functionality
MinimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        -- Maximize the guide
        MainFrame.Size = UDim2.new(0, 500, 0, 300)
        MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
        MinimizeButton.Text = "-"
        isMinimized = false
    else
        -- Minimize the guide
        MainFrame.Size = UDim2.new(0, 100, 0, 30)
        MainFrame.Position = UDim2.new(0.5, -50, 0.5, -15)
        MinimizeButton.Text = "+"
        isMinimized = true
    end
end)

-- Close Button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Handle player reset and new players joining
game.Players.PlayerAdded:Connect(function(player)
    if player.Character then
        -- Ensure that the player features (highlight, box, etc.) work for new players
        if toggles.PlayerHighlightToggle then
            highlightPlayers(true)
        end
        if toggles.PlayerBoxToggle then
            createPlayerBox(true)
        end
        if toggles.PlayerTraceToggle then
            tracePlayers(true)
        end
        if toggles.PlayerNameToggle then
            showPlayerNames(true)
        end
    end
end)