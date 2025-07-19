
-- Updated Minimalist Exploit GUI
-- Key changes:
-- * Minimalist styling
-- * Smooth tab animations
-- * Disable redundant refresh
-- * Cleaner toggles, sliders, buttons
-- * Organized and readable

local library = {}
local tweenservice = game:GetService("TweenService")

-- UI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MinimalistGUI"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- UICorner for smooth edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = MainFrame

-- Tabs panel
local TabsFrame = Instance.new("Frame")
TabsFrame.Size = UDim2.new(0, 150, 1, 0)
TabsFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabsFrame.BorderSizePixel = 0
TabsFrame.Parent = MainFrame

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 8)
TabList.Parent = TabsFrame

-- Content area
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -150, 1, 0)
ContentFrame.Position = UDim2.new(0, 150, 0, 0)
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- Sample tab creation function
function library:CreateTab(name)
    local Button = Instance.new("TextButton")
    Button.Text = name
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.BackgroundTransparency = 0.2
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = Button

    Button.Parent = TabsFrame

    -- Click function (switch content)
    Button.MouseButton1Click:Connect(function()
        if ContentFrame:FindFirstChild("ActiveTab") == name then return end
        for _, child in ipairs(ContentFrame:GetChildren()) do
            if child:IsA("Frame") then
                tweenservice:Create(child, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                task.wait(0.3)
                child:Destroy()
            end
        end
        local TabContent = Instance.new("Frame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.Name = name
        TabContent.Parent = ContentFrame
        tweenservice:Create(TabContent, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        ContentFrame.ActiveTab = name
    end)
end

-- Example tabs
library:CreateTab("Main")
library:CreateTab("Settings")
library:CreateTab("Credits")

return library
