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
local Mouse = LocalPlayer:GetMouse()

-- Variáveis para Aimbot
local target = nil
local aiming = false
local triggerbot = false

-- Variáveis para ESP
local espEnabled = false
local teamCheck = true
local boxEnabled = true
local tracerEnabled = true
local boxColor = Color3.new(1, 0, 0) -- Vermelho por padrão
local tracerColor = Color3.new(1, 1, 1) -- Branco por padrão

-- Funções para ESP
local function CreateESP(player)
    if espEnabled and player.Character and player ~= LocalPlayer then
        if not teamCheck or player.Team ~= LocalPlayer.Team then
            -- Box ESP
            local box = Drawing.new("Square")
            box.Thickness = 2
            box.Color = boxColor
            box.Filled = false
            box.Visible = boxEnabled

            -- Tracer ESP
            local tracer = Drawing.new("Line")
            tracer.Thickness = 2
            tracer.Color = tracerColor
            tracer.Visible = tracerEnabled

            -- Atualizar ESP
            RunService.RenderStepped:Connect(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = player.Character.HumanoidRootPart
                    local head = player.Character:FindFirstChild("Head")
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

                    if rootPart and head and humanoid then
                        local rootPos, rootVis = Camera:WorldToViewportPoint(rootPart.Position)
                        local headPos, headVis = Camera:WorldToViewportPoint(head.Position)
                        local legPos, legVis = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

                        if rootVis and headVis and legVis then
                            box.Size = Vector2.new(2000 / rootPos.Z, headPos.Y - legPos.Y)
                            box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                            box.Visible = boxEnabled

                            tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            tracer.To = Vector2.new(rootPos.X, rootPos.Y)
                            tracer.Visible = tracerEnabled

                            box.Color = boxColor
                            tracer.Color = tracerColor
                        else
                            box.Visible = false
                            tracer.Visible = false
                        end
                    else
                        box.Visible = false
                        tracer.Visible = false
                    end
                else
                    box.Visible = false
                    tracer.Visible = false
                end
            end)
        end
    end
end

local function RemoveESP(player)
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("Drawing") then
                v:Remove()
            end
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
    Title = "Ligar ESP",
    Callback = function()
        espEnabled = true
        CreateESPForAllPlayers()
    end
})

Tabs.ESP:AddButton({
    Title = "Desligar ESP",
    Callback = function()
        espEnabled = false
        RemoveESPFromAllPlayers()
    end
})

Tabs.ESP:AddButton({
    Title = "Ligar Team Check",
    Callback = function()
        teamCheck = not teamCheck
        RemoveESPFromAllPlayers()
        CreateESPForAllPlayers()
    end
})

Tabs.ESP:AddButton({
    Title = "Ligar Box ESP",
    Callback = function()
        boxEnabled = not boxEnabled
    end
})

Tabs.ESP:AddButton({
    Title = "Ligar Tracer ESP",
    Callback = function()
        tracerEnabled = not tracerEnabled
    end
})

Tabs.ESP:AddColorPicker({
    Title = "Cor da Box",
    Default = boxColor,
    Callback = function(color)
        boxColor = color
    end
})

Tabs.ESP:AddColorPicker({
    Title = "Cor do Tracer",
    Default = tracerColor,
    Callback = function(color)
        tracerColor = color
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
    Title = "Ligar Triggerbot",
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
    screenGui.Name =