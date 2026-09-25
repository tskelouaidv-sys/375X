--[[
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║            🎮  S2 J'R HUB — 375X  🎭                     ║
║                                                           ║
║            Script Duel Interactif Complet                 ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("Hub375X") then
    playerGui.Hub375X:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Hub375X"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 420)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 120, 255)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 30, 70)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🤖 S2 J'R HUB — 375X"
Title.TextColor3 = Color3.fromRGB(100, 200, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✖"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 15
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -30, 0, 38)
TabBar.Position = UDim2.new(0, 15, 0, 55)
TabBar.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = TabBar

local Tabs = {"SYSTEM", "COMBAT", "HACK", "MISC", "SETTINGS"}
local TabButtons = {}

for i, tabName in ipairs(Tabs) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(0.2, -4, 1, 0)
    TabBtn.Position = UDim2.new((i-1) * 0.2, 2, 0, 0)
    TabBtn.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(120, 160, 200)
    TabBtn.TextSize = 11
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Parent = TabBar
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = TabBtn
    
    TabButtons[tabName] = TabBtn
end

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -30, 1, -120)
ContentFrame.Position = UDim2.new(0, 15, 0, 105)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 4
ContentFrame.Parent = MainFrame

local UIGrid = Instance.new("UIGridLayout")
UIGrid.CellSize = UDim2.new(0, 150, 0, 48)
UIGrid.CellPadding = UDim2.new(0, 8, 0, 8)
UIGrid.Parent = ContentFrame

local TabData = {
    SYSTEM = {
        {"RÉACTIVER 375X", "🤖"},
        {"SCAN SYSTÈME", "📡"},
        {"DIAGNOSTIC", "💠"},
        {"EFFACER MÉMOIRE", "🧠"},
        {"REDÉMARRER", "🔄"}
    },
    COMBAT = {
        {"MODE COMBAT", "⚔️"},
        {"AIMBOT 375X", "🎯"},
        {"ANTI-DÉTECTION", "🛡️"},
        {"AUTO-DÉFENSE", "🔫"},
        {"CIBLE : RAE", "👤"},
        {"VERROUILLER", "🔒"}
    },
    HACK = {
        {"HACK SYSTÈME", "💻"},
        {"VOLER ORDRE 3447", "📁"},
        {"BROUILLER PISTE", "🌫️"},
        {"INJECTER VIRUS", "🦠"},
        {"CONTRÔLE TOTAL", "☠️"}
    },
    MISC = {
        {"SAUT INFINI", "🦘"},
        {"BODY LOCK", "🟣"},
        {"ANTI RAGDOLL", "🟢"},
        {"BOX ESP", "🟡"},
        {"TRACERS", "🔵"},
        {"ANTI LAG", "⚡"}
    },
    SETTINGS = {
        {"THÈME 375X", "🌌"},
        {"LOCK UI", "🔒"},
        {"CACHER BOUTONS", "👁️"},
        {"BOUTONS RONDS", "⭕"},
        {"RESET TOUCHES", "🔄"}
    }
}

local function LoadTab(tabName)
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, tab in pairs(TabButtons) do
        tab.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
        tab.TextColor3 = Color3.fromRGB(120, 160, 200)
    end
    
    if TabButtons[tabName] then
        TabButtons[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
        TabButtons[tabName].TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    
    for _, btnData in ipairs(TabData[tabName] or {}) do
        local Btn = Instance.new("TextButton")
        Btn.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
        Btn.Text = btnData[2] .. "  " .. btnData[1]
        Btn.TextColor3 = Color3.fromRGB(180, 220, 255)
        Btn.TextSize = 12
        Btn.Font = Enum.Font.GothamBold
        Btn.Parent = ContentFrame
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Btn
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Color3.fromRGB(0, 80, 160)
        Stroke.Parent = Btn
        
        Btn.MouseEnter:Connect(function()
            TweenService:Create(Btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(0, 60, 120)
            }):Play()
        end)
        
        Btn.MouseLeave:Connect(function()
            TweenService:Create(Btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(20, 30, 55)
            }):Play()
        end)
        
        Btn.MouseButton1Click:Connect(function()
            print("[375X] Exécution : " .. btnData[1])
        end)
    end
end

for tabName, tabBtn in pairs(TabButtons) do
    tabBtn.MouseButton1Click:Connect(function()
        LoadTab(tabName)
    end)
end

LoadTab("COMBAT")

local dragging, dragStart, startPos = false, nil, nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ S2 J'R HUB — 375X chargé !")
