local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local WindUI = {}

function WindUI:CreateWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WindUI"
    ScreenGui.Parent = game.CoreGui

    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 560, 0, 340)
    MainFrame.Position = UDim2.new(0.5, -280, 0.5, -170)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    MainFrame.ClipsDescendants = true
    MainFrame.AutomaticSize = Enum.AutomaticSize.Y

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 35)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TitleBar.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = config.Title or "WindUI"
    TitleLabel.Font = Enum.Font.GothamMedium
    TitleLabel.TextSize = 14
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -60, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar

    -- Container
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 1, -35)
    Container.Position = UDim2.new(0, 0, 0, 35)
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Container
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    function WindUI:Toggle(options)
        local Toggle = Instance.new("TextButton")
        Toggle.Size = UDim2.new(1, -12, 0, 32)
        Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Toggle.Text = ""
        Toggle.AutoButtonColor = false
        Toggle.Parent = Container

        local UICornerToggle = Instance.new("UICorner")
        UICornerToggle.CornerRadius = UDim.new(0, 6)
        UICornerToggle.Parent = Toggle

        local Title = Instance.new("TextLabel")
        Title.Text = options.Title or "Toggle"
        Title.Font = Enum.Font.Gotham
        Title.TextSize = 13
        Title.TextColor3 = Color3.fromRGB(230, 230, 230)
        Title.BackgroundTransparency = 1
        Title.Size = UDim2.new(1, -40, 1, 0)
        Title.Position = UDim2.new(0, 10, 0, 0)
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Toggle

        local StateIndicator = Instance.new("Frame")
        StateIndicator.Size = UDim2.new(0, 16, 0, 16)
        StateIndicator.Position = UDim2.new(1, -24, 0.5, -8)
        StateIndicator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        StateIndicator.Parent = Toggle

        local UICornerState = Instance.new("UICorner")
        UICornerState.CornerRadius = UDim.new(1, 0)
        UICornerState.Parent = StateIndicator

        local Enabled = false
        Toggle.MouseButton1Click:Connect(function()
            Enabled = not Enabled
            TweenService:Create(StateIndicator, TweenInfo.new(0.2), {
                BackgroundColor3 = Enabled and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 60)
            }):Play()
            if options.Callback then
                options.Callback(Enabled)
            end
        end)
    end

    return WindUI
end

return WindUI
