local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "B0Z0CKFischGui"

-- Create the main frame with background gradient
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0) -- Frame size
mainFrame.Position = UDim2.new(0.6, 0, 0.2, 0) -- Frame position

-- Create a gradient for the main frame
local gradient = Instance.new("UIGradient", mainFrame)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
}
gradient.Rotation = 90

-- Create rounded corners for the main frame
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 10)

-- Create the title label
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Text = "B0Z0CK Fisch"
titleLabel.Size = UDim2.new(1, 0, 0.1, 0) -- Title size
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Background color
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Title text color
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.TextScaled = true

-- Create the tab frame
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, 0, 0.1, 0) -- Tab frame size
tabFrame.Position = UDim2.new(0, 0, 0.1, 0) -- Tab frame position
tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Tab background color
tabFrame.BackgroundTransparency = 0.1 -- Tab background transparency

-- Create rounded corners for the tab frame
local tabCorner = Instance.new("UICorner", tabFrame)
tabCorner.CornerRadius = UDim.new(0, 10)

-- Function to create tab buttons
local function createTabButton(parent, text, position)
    local button = Instance.new("TextButton", parent)
    button.Text = text
    button.Size = UDim2.new(0.32, 0, 1, 0) -- Button size
    button.Position = position -- Button position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Button background color
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Button text color

    -- Create rounded corners for the button
    local buttonCorner = Instance.new("UICorner", button)
    buttonCorner.CornerRadius = UDim.new(0, 10)

    -- Button hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- Lighter color on hover
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Original color
    end)

    return button
end

local homeTabButton = createTabButton(tabFrame, "Home", UDim2.new(0, 0, 0, 0))
local mainTabButton = createTabButton(tabFrame, "Main", UDim2.new(0.34, 0, 0, 0))
local teleportTabButton = createTabButton(tabFrame, "Teleport", UDim2.new(0.68, 0, 0, 0))

-- Create the buttons for actions
local function createActionButton(text, position)
    local button = Instance.new("TextButton", mainFrame)
    button.Text = text
    button.Size = UDim2.new(0.8, 0, 0.1, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- Grey color
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Text color
    
    -- Create rounded corners for the button
    local buttonCorner = Instance.new("UICorner", button)
    buttonCorner.CornerRadius = UDim.new(0, 10)

    -- Button hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(180, 180, 180) -- Lighter grey on hover
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- Original color
    end)

    return button
end

local sellFishButton = createActionButton("Sell Holding Fish", UDim2.new(0.1, 0, 0.25, 0))
local sellAllFishButton = createActionButton("Sell All Fishes", UDim2.new(0.1, 0, 0.4, 0))
local unlimitedOxygenButton = createActionButton("Unlimited Oxygen: OFF", UDim2.new(0.1, 0, 0.55, 0))

-- Create the teleport section as a Scrolling Frame
local teleportFrame = Instance.new("ScrollingFrame", mainFrame)
teleportFrame.Size = UDim2.new(1, 0, 0.6, 0) -- Adjusted height to fit well
teleportFrame.Position = UDim2.new(0, 0, 0.2, 0) -- Position it below tabs
teleportFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Background color
teleportFrame.BackgroundTransparency = 0.3 -- Increased transparency for visual aesthetics
teleportFrame.ScrollBarThickness = 15 -- Scroll bar thickness
teleportFrame.Visible = false -- Start as invisible

-- Make teleportFrame use a CanvasSize that can grow with buttons
local teleportLayout = Instance.new("UIListLayout", teleportFrame)
teleportLayout.Padding = UDim.new(0, 10) -- Space between buttons

-- Teleporting buttons
local teleportButtons = {
    {Title = "Sunstone Island", Position = CFrame.new(-913.630615234375, 137.29348754882812, -1129.8995361328125)},
    {Title = "Roslit Bay", Position = CFrame.new(-1501.675537109375, 133, 416.2070007324219)},
    {Title = "Random Islands", Position = CFrame.new(237.6944580078125, 139.34976196289062, 43.103424072265625)},
    {Title = "Moosewood", Position = CFrame.new(433.7972106933594, 147.07003784179688, 261.80218505859375)},
    {Title = "Executive Headquarters", Position = CFrame.new(-36.46199035644531, -246.55001831054688, 205.77120971679688)},
    {Title = "Enchant Room", Position = CFrame.new(1310.048095703125, -805.292236328125, -162.34507751464844)},
    {Title = "Statue Of Sovereignty", Position = CFrame.new(22.098665237426758, 159.01470947265625, -1039.8543701171875)},
    {Title = "Mushgrove Swamp", Position = CFrame.new(2442.805908203125, 130.904052734375, -686.1648559570312)},
    {Title = "Snowcap Island", Position = CFrame.new(2589.534912109375, 134.9249267578125, 2333.099365234375)},
    {Title = "Terrapin Island", Position = CFrame.new(152.3716278076172, 154.91015625, 2000.9171142578125)},
    {Title = "Enchant Relic", Position = CFrame.new(1309.2784423828125, -802.427001953125, -83.36397552490234)},
}

for _, button in ipairs(teleportButtons) do
    local teleportButton = Instance.new("TextButton", teleportFrame)
    teleportButton.Text = button.Title
    teleportButton.Size = UDim2.new(0.7, 0, 0.05, 0) -- Smaller button size
    teleportButton.Position = UDim2.new(0.15, 0, 0, 0) -- Center the button horizontally
    teleportButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)  -- Grey color
    teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Text color

    -- Create rounded corners for teleport buttons
    local teleportButtonCorner = Instance.new("UICorner", teleportButton)
    teleportButtonCorner.CornerRadius = UDim.new(0, 10)

    -- Button hover effect
    teleportButton.MouseEnter:Connect(function()
        teleportButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180) -- Lighter grey on hover
    end)
    teleportButton.MouseLeave:Connect(function()
        teleportButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- Original color
    end)

    teleportButton.MouseButton1Click:Connect(function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = button.Position
        end
    end)
end

-- Show initial Home tab
teleportFrame.Visible = false -- Hide teleport frame initially
sellFishButton.Visible = true
sellAllFishButton.Visible = true
unlimitedOxygenButton.Visible = true

-- Tab button click handlers
homeTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = false -- Hide teleport frame when showing Home tab
    sellFishButton.Visible = true
    sellAllFishButton.Visible = true
    unlimitedOxygenButton.Visible = true
end)

mainTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = false -- Hide teleport frame when showing Main tab
    sellFishButton.Visible = true
    sellAllFishButton.Visible = true
    unlimitedOxygenButton.Visible = true
end)

teleportTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = true -- Show teleport frame
    sellFishButton.Visible = false
    sellAllFishButton.Visible = false
    unlimitedOxygenButton.Visible = false
end)

-- Sell fish button callback
sellFishButton.MouseButton1Click:Connect(function()
    local merchant = Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant")
    if merchant then
        merchant:WaitForChild("sell"):InvokeServer()
    end
end)

-- Sell all fishes button callback
sellAllFishButton.MouseButton1Click:Connect(function()
    local merchant = Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant")
    if merchant then
        merchant:WaitForChild("sellall"):InvokeServer()
    end
end)

-- Unlimited Oxygen toggle functionality
local oxygenEnabled = false
unlimitedOxygenButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    oxygenEnabled = not oxygenEnabled  -- Toggle state

    if oxygenEnabled then
        unlimitedOxygenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green for enabled
        unlimitedOxygenButton.Text = "Unlimited Oxygen: ON"
        print("Unlimited Oxygen is ON")

        local function disableOxygen()
            if character and character:FindFirstChild("client") and character.client:FindFirstChild("oxygen") then
                character.client.oxygen.Enabled = false
            end
        end

        disableOxygen()
        
        player.CharacterAdded:Connect(disableOxygen)

    else
        unlimitedOxygenButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- Grey color for disabled
        unlimitedOxygenButton.Text = "Unlimited Oxygen: OFF"
        print("Oxygen is now enabled.")
        
        if character and character:FindFirstChild("client") and character.client:FindFirstChild("oxygen") then
            character.client.oxygen.Enabled = true
        end
    end
end)
