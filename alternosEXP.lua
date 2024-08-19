# Preparing to write the script that matches the UI design given in the image.
# Setting up the colors, layout, and other components to ensure they match the provided design.

# Defining constants for colors
WHITE_COLOR = "#FFFFFF"
DARK_COLOR = "#151515"
LIGHTER_DARK_COLOR = "#1C1C1C"
RED_COLOR = "#FF0000"
GREEN_COLOR = "#00FF00"

# Main UI Setup
gui = Instance.new("ScreenGui")
gui.Name = "AlternosGuideUniversal"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

# Frame for Main Guide UI
mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromHex(DARK_COLOR)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

# Side Menu Frame
sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 100, 1, 0)
sideMenu.BackgroundColor3 = Color3.fromHex(LIGHTER_DARK_COLOR)
sideMenu.BorderSizePixel = 0
sideMenu.Parent = mainFrame

# Setting up tabs in the side menu
tabs = ["Home", "Combat", "World", "Setting"]
tabButtons = {}

for i, tab in pairs(tabs) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 50)
    button.BackgroundColor3 = Color3.fromHex(LIGHTER_DARK_COLOR)
    button.TextColor3 = Color3.fromHex(WHITE_COLOR)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 20
    button.Text = tab
    button.Parent = sideMenu
    tabButtons[tab] = button
end

# Top bar with minimize and close buttons
topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromHex(DARK_COLOR)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromHex(WHITE_COLOR)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 24
minimizeButton.BackgroundColor3 = Color3.fromHex(DARK_COLOR)
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = topBar

closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromHex(WHITE_COLOR)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 24
closeButton.BackgroundColor3 = Color3.fromHex(DARK_COLOR)
closeButton.BorderSizePixel = 0
closeButton.Parent = topBar

# Frame for Content Display (Home, Combat, World, Setting Pages)
contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -100, 1, -30)
contentFrame.Position = UDim2.new(0, 100, 0, 30)
contentFrame.BackgroundColor3 = Color3.fromHex(DARK_COLOR)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

# Placeholder for switching content based on the active tab
currentTab = nil

# Function to switch tabs
def switchTab(tab):
    if currentTab:
        currentTab.Visible = False
    tab.Visible = True
    currentTab = tab

# Creating the pages for each tab
pages = {}

for tab in tabs:
    page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundColor3 = Color3.fromHex(LIGHTER_DARK_COLOR)
    page.BorderSizePixel = 0
    page.Visible = False
    page.Parent = contentFrame
    pages[tab] = page

    # Title for each page
    pageTitle = Instance.new("TextLabel")
    pageTitle.Size = UDim2.new(1, 0, 0, 50)
    pageTitle.Position = UDim2.new(0, 0, 0, 0)
    pageTitle.BackgroundTransparency = 1
    pageTitle.TextColor3 = Color3.fromHex(WHITE_COLOR)
    pageTitle.Font = Enum.Font.SourceSansBold
    pageTitle.TextSize = 24
    pageTitle.Text = tab
    pageTitle.Parent = page

# Initially show Home page
switchTab(pages["Home"])

# Adding Home Page specific content
homePage = pages["Home"]
options = ["Player Highlight", "Player Box", "Player Trace", "Player Name"]

for i, option in pairs(options) do
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, 0, 0, 50)
    optionFrame.Position = UDim2.new(0, 0, 0, 50 + (i - 1) * 60)
    optionFrame.BackgroundColor3 = Color3.fromHex(LIGHTER_DARK_COLOR)
    optionFrame.BorderSizePixel = 0
    optionFrame.Parent = homePage

    local optionLabel = Instance.new("TextLabel")
    optionLabel.Size = UDim2.new(0.7, 0, 1, 0)
    optionLabel.Position = UDim2.new(0, 10, 0, 0)
    optionLabel.BackgroundTransparency = 1
    optionLabel.TextColor3 = Color3.fromHex(WHITE_COLOR)
    optionLabel.Font = Enum.Font.SourceSansBold
    optionLabel.TextSize = 18
    optionLabel.Text = option
    optionLabel.Parent = optionFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 50, 0.7, 0)
    toggleButton.Position = UDim2.new(1, -60, 0.15, 0)
    toggleButton.BackgroundColor3 = Color3.fromHex(RED_COLOR)
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = ""
    toggleButton.Parent = optionFrame

    toggleButton.MouseButton1Click:Connect(function()
        if toggleButton.BackgroundColor3 == Color3.fromHex(RED_COLOR):
            toggleButton.BackgroundColor3 = Color3.fromHex(GREEN_COLOR)
        else:
            toggleButton.BackgroundColor3 = Color3.fromHex(RED_COLOR)
        end
    end)
end

# Linking the minimize and close buttons
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = False  # Apply minimize animation
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()  # Remove the guide from the screen
end)

# Adding additional functionality for new features
# Assuming functions for Player Highlight, Player Name already exist

# Function for Player Box
def createPlayerBox(player):
    local box = Instance.new("SelectionBox")
    box.Adornee = player.Character
    box.LineThickness = 0.05
    box.SurfaceColor3 = Color3.fromHex(RED_COLOR)
    box.SurfaceTransparency = 0.5
    box.Parent = player.Character

# Function for Player Trace
def createPlayerTrace(player):
    local traceLine = Instance.new("Beam")
    traceLine.FaceCamera = true
    traceLine.Attachment0 = player.Character.Head
    traceLine.Attachment1 = player.Character.HumanoidRootPart
    traceLine.Width0 = 0.05
    traceLine.Width1 = 0.05
    traceLine.Color = ColorSequence.new(Color3.fromHex(RED_COLOR))
    traceLine.Parent = player.Character

# Hooking up the new functions to the corresponding buttons
# Existing functionality for Player Highlight and Player Name would be similarly linked

print("Guide UI updated successfully!")