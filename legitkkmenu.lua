-- Carregar bibliotecas Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Criar janela principal
local Window = Fluent:CreateWindow({
    Title = "Kakah Menu",
    SubTitle = "Legit",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true,
    Theme = "Blue",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "" }),
    ESP = Window:AddTab({ Title = "ESP", Icon = "" }),
    Troll = Window:AddTab({ Title = "Troll", Icon = "" }),
    Setting = Window:AddTab({ Title = "Config", Icon = "" }),
}

-- Serviços necessários
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = game:GetService("Workspace").CurrentCamera
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = Players.LocalPlayer:GetMouse()

-- Variáveis para Aimbot
local target = nil
local aiming = false
local triggerbot = false

-- Variáveis para ESP
local espEnabled = false
local teamCheck = true

-- Funções para ESP
local function CreateESP(player)
    if espEnabled and player.Character then
        if not teamCheck or player.Team ~= LocalPlayer.Team then
            local highlight = player.Character:FindFirstChild("ESP")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "ESP"
                highlight.FillColor = Color3.new(1, 0, 0) -- Vermelho
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 1
                highlight.Parent = player.Character
            end
        end
    end
end

local function RemoveESP(player)
    if player.Character then
        local highlight = player.Character:FindFirstChild("ESP")
        if highlight then
            highlight:Destroy()
        end
    end
end

local function CreateESPForAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            CreateESP(player)
        end
    end
end

local function RemoveESPFromAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            RemoveESP(player)
        end
    end
end

-- Funções para Aimbot
local function FindHumanoidRootPart(model)
    return model and model:FindFirstChild("HumanoidRootPart")
end

local function FindHead(model)
    return model and model:FindFirstChild("Head")
end

local function GetNearestVisibleTarget()
    local localTeam = LocalPlayer.Team
    local targets = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and (not localTeam or player.Team ~= localTeam) then
            local humanoidRootPart = FindHumanoidRootPart(player.Character)
            local head = FindHead(player.Character)
            if humanoidRootPart and head then
                table.insert(targets, {rootPart = humanoidRootPart, head = head})
            end
        end
    end

    local closestTarget = nil
    local minDistance = math.huge

    for _, targetInfo in ipairs(targets) do
        local screenPos, onScreen = Camera:WorldToViewportPoint(targetInfo.head.Position)
        if onScreen then
            local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if distance < minDistance then
                minDistance = distance
                closestTarget = targetInfo.head
            end
        end
    end

    return closestTarget
end

local function AimAtTarget()
    if target then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
    end
end

local function Triggerbot()
    if target and Mouse.Target and Mouse.Target.Parent then
        local character = Mouse.Target.Parent
        if character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
            local humanoid = character.Humanoid
            if humanoid and humanoid.Health > 0 then
                Mouse1Press()
                wait()
                Mouse1Release()
            end
        end
    end
end

-- Adicionar botões na aba ESP
Tabs.ESP:AddButton({
    Title = "Toggle ESP",
    Callback = function()
        espEnabled = not espEnabled
        if espEnabled then
            CreateESPForAllPlayers()
        else
            RemoveESPFromAllPlayers()
        end
    end
})

Tabs.ESP:AddButton({
    Title = "Toggle Team Check",
    Callback = function()
        teamCheck = not teamCheck
        RemoveESPFromAllPlayers()
        CreateESPForAllPlayers()
    end
})

-- Adicionar botões na aba Aimbot
Tabs.Aimbot:AddButton({
    Title = "Ligar Aimbot",
    Callback = function()
        aiming = true
        target = GetNearestVisibleTarget()
        if target then
            AimAtTarget()
        end
    end
})

Tabs.Aimbot:AddButton({
    Title = "Desligar Aimbot",
    Callback = function()
        aiming = false
        target = nil
    end
})

Tabs.Aimbot:AddButton({
    Title = "Toggle Triggerbot",
    Callback = function()
        triggerbot = not triggerbot
    end
})

-- Manter ESP atualizado em tempo real
RunService.RenderStepped:Connect(function()
    if espEnabled then
        CreateESPForAllPlayers()
    else
        RemoveESPFromAllPlayers()
    end
end)

-- Atualizar a mira do Aimbot e Triggerbot em tempo real
RunService.RenderStepped:Connect(function()
    if aiming then
        target = GetNearestVisibleTarget()
        if target then
            AimAtTarget()
        end
    end
    if triggerbot then
        Triggerbot()
    end
end)

-- Criar botão para abrir e fechar o menu
local function CreateToggleButton()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ToggleMenuGUI"
    screenGui.Parent = playerGui

    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ToggleMenuButton"
    toggleButton.Parent = screenGui
    toggleButton.Image = "http://www.roblox.com/asset/?id=17151235079"
    toggleButton.Size = UDim2.new(0, 50, 0, 50)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.BackgroundTransparency = 1

    local menuOpen = true

    toggleButton.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        Window:SetVisibility(menuOpen)
    end)

    return screenGui
end

-- Criar botão para alternar o menu
CreateToggleButton()
