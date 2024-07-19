-- Serviços necessários
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Variável para controlar o estado do ESP
local espEnabled = false

-- Função para criar ESP para um jogador
local function CreateESP(player)
	if espEnabled then
		if player.Character then
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

-- Função para remover ESP de um jogador
local function RemoveESP(player)
	if player.Character then
		local highlight = player.Character:FindFirstChild("ESP")
		if highlight then
			highlight:Destroy()
		end
	end
end

-- Função para criar ESP para todos os jogadores exceto o jogador local
local function CreateESPForAllPlayers()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
			CreateESP(player)
		end
	end
end

-- Função para remover ESP de todos os jogadores exceto o jogador local
local function RemoveESPFromAllPlayers()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			RemoveESP(player)
		end
	end
end

-- Criar um botão no PlayerGui
local function CreateToggleButton()
	local playerGui = LocalPlayer:WaitForChild("PlayerGui")

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ESPToggleGUI"
	screenGui.Parent = playerGui

	local toggleButton = Instance.new("TextButton")
	toggleButton.Name = "ToggleESPButton"
	toggleButton.Parent = screenGui
	toggleButton.Text = "ESP - ON/OFF"
	toggleButton.Size = UDim2.new(0.2, 0, 0.1, 0)
	toggleButton.Position = UDim2.new(0.012, 0,0.385, 0) -- Parte superior esquerda da tela
	toggleButton.BackgroundColor3 = Color3.fromRGB(98, 0, 0)
	toggleButton.Font = Enum.Font.SourceSansBold
	toggleButton.TextSize = 22
	toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	toggleButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- Borda preta
	toggleButton.TextStrokeTransparency = 0

	toggleButton.MouseButton1Click:Connect(function()
		espEnabled = not espEnabled
		if espEnabled then
			CreateESPForAllPlayers() -- Ativar o ESP
		else
			RemoveESPFromAllPlayers() -- Desativar o ESP
		end
	end)

	return screenGui
end

-- Manter o ESP atualizado em tempo real
RunService.RenderStepped:Connect(function()
	if espEnabled then
		CreateESPForAllPlayers() -- Manter o ESP ativo
	else
		RemoveESPFromAllPlayers() -- Garantir que o ESP seja completamente removido
	end
end)

-- Criar o botão para alternar o ESP
CreateToggleButton()

local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local UserInputService = game:GetService("UserInputService")
local Mouse = Players.LocalPlayer:GetMouse()

-- Verificar se o jogador está em um dispositivo móvel
local function IsMobile()
	return UserInputService.TouchEnabled -- Retorna `true` se o jogador estiver no celular ou tablet
end

local target = nil
local aiming = false
local sensitivity = 1 -- Sensibilidade padrão

-- Função para encontrar o HumanoidRootPart de um modelo de jogador ou NPC
local function FindHumanoidRootPart(model)
	return model and model:FindFirstChild("HumanoidRootPart")
end

-- Função para encontrar o Head de um modelo de jogador
local function FindHead(model)
	return model and model:FindFirstChild("Head")
end

-- Função para encontrar o alvo mais próximo visível
local function GetNearestVisibleTarget()
	local localPlayer = Players.LocalPlayer
	local localTeam = localPlayer.Team
	local targets = {}

	-- Adicionar jogadores à lista de alvos, excluindo o jogador local e jogadores do mesmo time
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer and (not localTeam or player.Team ~= localTeam) then
			local humanoidRootPart = FindHumanoidRootPart(player.Character)
			local head = FindHead(player.Character)
			if humanoidRootPart and head then
				table.insert(targets, {rootPart = humanoidRootPart, head = head})
			end
		end
	end

	-- Encontra o alvo mais próximo visível
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

-- Função para mirar no alvo
local function AimAtTarget()
	if target then
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
	end
end

-- Função para alternar entre primeira e terceira pessoa ao pressionar a tecla F
local function ToggleCameraMode()
	local player = Players.LocalPlayer
	if player.CameraMode == Enum.CameraMode.LockFirstPerson then
		player.CameraMode = Enum.CameraMode.Classic
	else
		player.CameraMode = Enum.CameraMode.LockFirstPerson
	end
end

-- Função para processar a entrada do botão direito do mouse
local function OnMouseRightButtonDown()
	aiming = true
	target = GetNearestVisibleTarget()
	if target then
		AimAtTarget() -- Mirar no alvo
	end
end

-- Função para processar a liberação do botão direito do mouse
local function OnMouseRightButtonUp()
	aiming = false
	target = nil
end

-- Função para criar botões para dispositivos móveis
local function CreateMobileButtons()
	local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

	-- Criar ScreenGui para armazenar botões móveis
	local mobileGui = Instance.new("ScreenGui", playerGui)
	mobileGui.Name = "MobileControls"

	-- Criar o botão para mirar
	local aimButton = Instance.new("TextButton", mobileGui)
	aimButton.Size = UDim2.new(0.2, 0, 0.1, 0) 
	aimButton.Position = UDim2.new(0.012, 0,0.243, 0) 
	aimButton.Text = "Aimbot - ON/OFF"
	aimButton.BackgroundColor3 = Color3.fromRGB(98, 0, 0)
	aimButton.Font = Enum.Font.SourceSansBold
	aimButton.TextSize = 22
	aimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	aimButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- Borda preta
	aimButton.TextStrokeTransparency = 0

	return mobileGui, aimButton
end

-- Criar controles para celular se o jogador estiver em um dispositivo móvel
if IsMobile() then
	local mobileGui, aimButton = CreateMobileButtons()

	-- Conectar evento ao pressionar o botão no celular
	aimButton.MouseButton1Click:Connect(function()
		aiming = not aiming -- Alternar entre mirar e não mirar
		if aiming then
			target = GetNearestVisibleTarget()
			AimAtTarget() -- Mirar no alvo mais próximo
		else
			target = nil -- Desativar a mira
		end
	end)
end

-- Atualizar a mira se o jogador estiver mirando e o alvo estiver visível
game:GetService("RunService").RenderStepped:Connect(function()
	if aiming then
		target = GetNearestVisibleTarget()
		AimAtTarget() -- Mirar no alvo
	end
end)
