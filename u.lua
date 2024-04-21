repeat
	task.wait(0.5)
until not UESP_LOADING and not USCRIPT_LOADING
getgenv().UAIM_LOADING = true
if not AimbotSettings then
	getgenv().AimbotSettings = {
		TeamCheck = true, -- Press ] to toggle
		VisibleCheck = true,
		IgnoreTransparency = true, -- if enabled, visible check will automatically filter transparent objects
		IgnoredTransparency = 0.5, -- all parts with a transparency greater than this will be ignored (IgnoreTransparency has to be enabled)
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = "MouseButton2",
		ToggleKey = "RightShift",
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
		AlwaysActive = false,
		Aimbot = {
			Enabled = true,
			TargetPart = "Head",
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			AimType = "Hold", -- "Hold" or "Toggle"
			AimAtNearestPart = false
		},
		AimAssist = {
			Enabled = false,
			MinFov = 15,
			MaxFov = 80,
			DynamicFov = true,
			ShowFov = false, -- Shows Min & Max fov
			Strength = 55, -- 1% - 100%
			SlowSensitivity = true,
			SlowFactor = 1.75, -- 1% - 10%
			RequireMovement = true
		},
		FovCircle = {
			Enabled = true,
			Dynamic = true,
			Radius = 100,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			NumSides = 64,
		},
		TriggerBot = {
			Enabled = false,
			Delay = 60, -- how long it waits before clicking (milliseconds)
			Spam = true, -- for semi-auto weapons
			ClicksPerSecond = 10, -- set this to 0 to get anything higher than 37 cps
			UseKeybind = false, -- if enabled, your keybind must be held to use trigger bot
		},
		Crosshair = {
			Enabled = false,
			Transparency = 1,
			TransparencyKeybind = 1, -- when the keybind is held, the crosshair's transparency will be changed to this
			Color = Color3.fromRGB(255, 0, 0),
			RainbowColor = false,
			Length = 15,
			Thickness = 2,
			Offset = 0
		},
		Prediction = {
			Enabled = false,
			Strength = 2
		},
		Priority = {},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = true, -- Automatically adds friends to the whitelist
		Ignore = {} -- Raycast Ignore
	}
end

if UAIM then
	return
end
getgenv().OldInstance = nil

local function Load(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)), file)()
end

local UI
--[[ old icons
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Aimbot'] = "https://i.imgur.com/Bcaku7A.png",
	['Aim Assist'] = "https://i.imgur.com/Bcaku7A.png",
	['Settings'] = "https://i.imgur.com/6uJAQON.png",
	['Fov Circle'] = "https://i.imgur.com/HGAgY9G.png",
	['Trigger Bot'] = "https://i.imgur.com/ePrh1aW.png",
	['Players'] = "https://i.imgur.com/EB8OOKv.png",
	['Other'] = "https://i.imgur.com/Lwl0iV7.png",
	['Configs'] = "https://i.imgur.com/bcuIP5f.png",
}]]
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Aimbot'] = "https://i.imgur.com/cPAL549.png",
	['Aim Assist'] = "https://i.imgur.com/KbhgUWz.png",
	['Settings'] = "https://i.imgur.com/ENNQDl3.png",
	['Fov Circle'] = "https://i.imgur.com/FwxEP7R.png",
	['Trigger Bot'] = "https://i.imgur.com/4ighciz.png",
	['Crosshair'] = "https://i.imgur.com/9riS2nl.png",
	['Prediction'] = "https://i.imgur.com/opT8Y2s.png",
	['Players'] = "https://i.imgur.com/rSSostV.png",
	['Other'] = "https://i.imgur.com/2HCDHHU.png",
	['Configs'] = "https://i.imgur.com/AAiWa00.png",
}
for i,v in next, icons do
	local folder = "UAIM_Icons"
	if not isfolder("UAIM_Icons") then
		makefolder("UAIM_Icons")
	end
	local path = folder.."\\"..i..".png"
	if not isfile(path) then
		writefile(path, game:HttpGet(v))
	end
end

function page(title)
	return UI.new({Title = title, ImageId = "UAIM_Icons\\"..title..".png", ImageSize = Vector2.new(20, 20)})
end

local version = "v1.1.19"
local aimbot = aimbot or Load("UniversalAimbot")
local cfg = Load("ConfigManager")
local Material = Load("MaterialLuaRemake")
UI = Material.Load({
	Title = "Kakah Menu Legit",
	SubTitle = "EquipeKakahMenu",
	Icon = "http://www.roblox.com/asset/?id=17151235079",
	ShowInNavigator = true,
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
local players = game:GetService("Players")

local Aimbot = page("Aimbot")
local Assist = page("Aim Assist")
local Settings = page("Settings")
local Fov = page("Fov Circle")
local Trigger = page("Trigger Bot")
local Crosshair = page("Crosshair")
local Prediction = page("Prediction")
local Players = page("Players")
local Other = page("Other")
local Configs = page("Configs")
local ss = getgenv().AimbotSettings
local connections = {}
local cfgname,selectedcfg = "",""
local togglekey = Enum.KeyCode.RightControl
local aimbottogglebtn, uitogglebtn

local newsettings = {
	IgnoreTransparency = true,
	IgnoredTransparency = 0.5,
	Aimbot = {
		AimAtNearestPart = false
	},
	TriggerBot = {
		Enabled = false,
		Delay = 60,
		Spam = true,
		ClicksPerSecond = 10,
		UseKeybind = false
	},
	Crosshair = {
		Enabled = false,
		Transparency = 1,
		TransparencyKeybind = false,
		Color = Color3.fromRGB(255, 0, 0),
		RainbowColor = false,
		Length = 15,
		Thickness = 2,
		Offset = 0
	},
	Prediction = {
		Enabled = false,
		Strength = 2
	}
}
for i,v in next, newsettings do
	if ss[i] == nil then
		ss[i] = v
	end
	if typeof(v) == "table" then
		for i2,v2 in next, v do
			if ss[i][i2] == nil then
				ss[i][i2] = v2
			end
		end
	end
end

local function newconn(signal, callback)
	local conn = signal:Connect(callback)
	table.insert(connections, conn)
	return conn
end

local function save(a)
	cfg.Save(a, {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name
		}
	})
end
local function load(a)
	local settings = ((a.Data ~= nil and a.Data.settings ~= nil and a.Data.settings) or a.settings ~= nil and a.settings) or a
	for i,v in next, settings do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				aimbot:Set(i, i2, v2)
			end
		else
			aimbot:Set("Other", i, v)
		end
	end
	task.spawn(function()
		repeat task.wait(0.25) until aimbottogglebtn ~= nil and uitogglebtn ~= nil
		local key = settings.ToggleKey
		aimbottogglebtn:SetBind((typeof(key) == "EnumItem" and key) or Enum.KeyCode[key])
		if a.Data ~= nil and a.Data.ui ~= nil then
			local b = a.Data.ui.ToggleKey
			if b then
				togglekey = Enum.KeyCode[b]
				uitogglebtn:SetBind(togglekey)
			end
		end
	end)
end

cfg.Init("UAIM", {
	settings = ss,
	ui = {
		ToggleKey = togglekey.Name
	}
}, load)

function destroy()
	for _,v in next, connections do
		v:Disconnect()
	end
	aimbot:Destroy()
	UI.UI:Destroy()
	getgenv().UAIM = nil
end
local script = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbotUI.lua"), "UniversalAimbotUI")
function reload(safemode)
	destroy()
	task.wait(0.5)
	if safemode then
		pcall(script)
	else
		script()
	end
end

do -- Aimbot
	local type = "Aimbot"
	local s = ss[type]
	if Krnl and KRNL_LOADED then
		Aimbot.Label({
			Text = "Aviso: Aimbot tem bugs no Codex.",
			Center = true,
			Transparent = true
		})
	end
	Aimbot.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Aimbot.Dropdown({
		Text = "Target Body Part",
		Callback = function(value)
			aimbot:Set(type, "TargetPart", value)
		end,
		Options = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"},
		Def = s.TargetPart,
		Menu = {
			Info = function()
				UI.Banner("alguns jogos não têm certas partes. Por exemplo, o Arsenal não tem Torso, então você terá que selecionar UpperTorso.")
			end
		}
	})
	Aimbot.TextField({
		Text = "Target Body Part (Custom)",
		Type = "Default",
		Callback = function(value)
			aimbot:Set(type, "TargetPart", value)
		end
	})
	Aimbot.Toggle({
		Text = "Use mousemoverel",
		Callback = function(value)
			aimbot:Set(type, "Use_mousemoverel", value)
		end,
		Enabled = s.Use_mousemoverel
	})
	Aimbot.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set(type, "Strength", value)
		end,
		Min = 1,
		Max = 200,
		Def = s.Strength,
		Suffix = "%",
		Menu = {
			Info = function()
				UI.Banner("Se você estiver com tremores, tente aumentar a Taxa de atualização para 10 (se for menor).\nComo alternativa, você pode diminuir a Força.")
			end
		}
	})
	Aimbot.Dropdown({
		Text = "Aim Type",
		Callback = function(value)
			aimbot:Set(type, "AimType", value)
		end,
		Options = {"Hold", "Toggle"},
		Def = s.AimType
	})
	Aimbot.Toggle({
		Text = "Aim at Nearest Part",
		Callback = function(value)
			aimbot:Set(type, "AimAtNearestPart", value)
		end,
		Enabled = s.AimAtNearestPart,
		Menu = {
			Info = function()
				UI.Banner("Em vez de mirar em uma parte específica, o aimbot verifica qual parte está mais próxima do mouse e mira nela.")
			end
		}
	})
end

do -- Aim Assist
	local type = "AimAssist"
	local s = ss[type]
	Assist.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Assist.Slider({
		Text = "Minimum Fov",
		Callback = function(value)
			aimbot:Set(type, "MinFov", value)
		end,
		Min = 0,
		Max = 50,
		Def = s.MinFov,
		Suffix = " px"
	})
	Assist.Slider({
		Text = "Maximum Fov",
		Callback = function(value)
			aimbot:Set(type, "MaxFov", value)
		end,
		Min = 0,
		Max = 200,
		Def = s.MaxFov,
		Suffix = " px"
	})
	Assist.Button({
		Text = "What is Maximum and Minimum Fov?",
		Callback = function()
			UI.Banner("Enable <b>Show Fov</b> for some visualization.<br />Maximum Fov is basically the same as your usual fov circle. Minimum Fov is similar. Basically, players within the Maximum Fov AND NOT within the Minimum Fov will be targeted. The Minimum Fov makes Aim Assist not lock on to targets directly, therefore giving the <i>aim assist effect.</i>")
		end
	})
	Assist.Toggle({
		Text = "Dynamic Fov",
		Callback = function(value)
			aimbot:Set(type, "DynamicFov", value)
		end,
		Enabled = s.DynamicFov
	})
	Assist.Toggle({
		Text = "Show Minimum and Maximum Fov",
		Callback = function(value)
			aimbot:Set(type, "ShowFov", value)
		end,
		Enabled = s.ShowFov
	})
	Assist.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set(type, "Strength",value)
		end,
		Min = 1,
		Max = 100,
		Def = s.Strength,
		Suffix = "%"
	})
	Assist.Toggle({
		Text = "Slow Sensitivity",
		Callback = function(value)
			aimbot:Set(type, "SlowSensitivity", value)
		end,
		Enabled = s.SlowSensitivity
	})
	Assist.Slider({
		Text = "Slow Factor",
		Callback = function(value)
			aimbot:Set(type, "SlowFactor", value)
		end,
		Min = 1,
		Max = 10,
		Def = s.SlowFactor,
		Decimals = 2,
		Suffix = "x"
	})
	Assist.Toggle({
		Text = "Require Movement",
		Callback = function(value)
			aimbot:Set(type, "RequireMovement", value)
		end,
		Enabled = s.RequireMovement
	})
end

do -- Settings
	local type = "Other"
	Settings.Toggle({
		Text = "Team Check",
		Callback = function(value)
			aimbot:Set(type, "TeamCheck", value)
		end,
		Enabled = ss.TeamCheck
	})
	Settings.Toggle({
		Text = "Visible Check",
		Callback = function(value)
			aimbot:Set(type, "VisibleCheck", value)
		end,
		Enabled = ss.VisibleCheck
	})
	Settings.Toggle({
		Text = "Ignore Transparency",
		Callback = function(value)
			aimbot:Set(type, "IgnoreTransparency", value)
		end,
		Enabled = ss.IgnoreTransparency
	})
	Settings.Slider({
		Text = "Ignored Transparency",
		Callback = function(value)
			aimbot:Set(type, "IgnoredTransparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = ss.IgnoredTransparency,
		Decimals = 2,
		Menu = {
			Info = function()
				UI.Banner("Quaisquer partes que tenham uma transparência maior que esse número serão ignoradas.\n<b>IgnoreTransparency</b> deve estar ativado para que isso funcione.")
			end
		}
	})
	Settings.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			aimbot:Set(type, "RefreshRate", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate,
		Suffix = " ms"
	})
	Settings.Keybind({
		Text = "Keybind",
		Callback = function(value)
			aimbot:Set(type, "Keybind", value.Name)
		end,
		Def = Enum.UserInputType[aimbot:Get(type, "Keybind")] or Enum.KeyCode[aimbot:Get(type, "Keybind")],
		AllowMouse = true
	})
	aimbottogglebtn = Settings.Keybind({
		Text = "Toggle Key",
		Callback = function(value)
			aimbot:Set(type, "ToggleKey", value.Name)
		end,
		Def = Enum.KeyCode[aimbot:Get(type, "ToggleKey")],
		AllowMouse = false
	})
	Settings.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			aimbot:Set(type, "MaximumDistance", value)
		end,
		Min = 50,
		Max = 2000,
		Def = ss.MaximumDistance,
		Suffix = " studs"
	})
	Settings.Toggle({
		Text = "Always Active",
		Callback = function(value)
			aimbot:Set(type, "AlwaysActive", value)
		end,
		Enabled = ss.AlwaysActive,
		Menu = {
			Info = function()
				UI.Banner("Se ativado, o aimbot/aim assist estará sempre ativo, mesmo sem segurar o botão direito.")
			end
		}
	})
end

do -- Fov Circle
	local type = "FovCircle"
	local s = ss[type]
	Fov.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Fov.Toggle({
		Text = "Dynamic",
		Callback = function(value)
			aimbot:Set(type, "Dynamic", value)
		end,
		Enabled = s.Dynamic
	})
	Fov.Slider({
		Text = "Radius",
		Callback = function(value)
			aimbot:Set(type, "Radius", value)
		end,
		Min = 0,
		Max = 500,
		Def = s.Radius,
		Suffix = " px"
	})
	Fov.Slider({
		Text = "Transparencia",
		Callback = function(value)
			aimbot:Set(type, "Transparencia", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Fov.ColorPickerNew({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			aimbot:Set(type, "Color", value)
		end
	})
	Fov.Slider({
		Text = "Numero de Sides",
		Callback = function(value)
			aimbot:Set(type, "NumSides", value)
		end,
		Min = 16,
		Max = 128,
		Def = s.NumSides
	})
end

do -- Trigger Bot
	local type = "TriggerBot"
	local s = ss[type]
	Trigger.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("Trigger Bot pode não funcionar em alguns jogos.")
			end
		}
	})
	Trigger.Slider({
		Text = "Delay",
		Callback = function(value)
			aimbot:Set(type, "Delay", value)
		end,
		Min = 0,
		Max = 1000,
		Def = s.Delay,
		Suffix = " ms",
		Menu = {
			Info = function()
				UI.Banner("Isso determina quanto tempo o Trigger Bot espera antes de clicar.\nAtrasos precisos <b>não são garantidos</b>, pois a <b>taxa de atualização</b> pode afetar o tempo que leva. Se você quiser o <i>menor atraso possível</i>, defina <b>Taxa de atualização</b> como <b>0</b>.")
			end
		}
	})
	Trigger.Toggle({
		Text = "Spam",
		Callback = function(value)
			aimbot:Set(type, "Spam", value)
		end,
		Enabled = s.Spam
	})
	Trigger.Slider({
		Text = "Clicks Per Second",
		Callback = function(value)
			aimbot:Set(type, "ClicksPerSecond", value)
		end,
		Min = 0,
		Max = 37,
		Def = s.ClicksPerSecond,
		Menu = {
			Info = function()
				UI.Banner("Defina como 0 para obter algo superior a 37 CPS.")
			end
		}
	})
	Trigger.Toggle({
		Text = "Use Keybind",
		Callback = function(value)
			aimbot:Set(type, "UseKeybind", value)
		end,
		Enabled = s.UseKeybind
	})
end

do -- Crosshair
	local type = "Crosshair"
	local s = ss[type]
	Crosshair.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("Miras menores podem parecer desiguais.")
			end
		}
	})
	Crosshair.Slider({
		Text = "Transparency",
		Callback = function(value)
			aimbot:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Crosshair.Slider({
		Text = "Transparency while Keybind held",
		Callback = function(value)
			aimbot:Set(type, "TransparencyKeybind", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.TransparencyKeybind,
		Decimals = 2,
		Menu = {
			Info = function()
				UI.Banner("Se isto estiver habilitado, a transparência da mira será alterada para este valor enquanto o seu Keybind estiver pressionado.")
			end
		}
	})
	Crosshair.ColorPickerNew({
		Text = "Color",
		Callback = function(value)
			aimbot:Set(type, "Color", value)
		end,
		Def = s.Color
	})
	Crosshair.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			aimbot:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Crosshair.Slider({
		Text = "Length",
		Callback = function(value)
			aimbot:Set(type, "Length", value)
		end,
		Min = 1,
		Max = 200,
		Def = s.Length,
		Decimals = 2,
		Suffix = " px"
	})
	Crosshair.Slider({
		Text = "Thickness",
		Callback = function(value)
			aimbot:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 200,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
	Crosshair.Slider({
		Text = "Offset",
		Callback = function(value)
			aimbot:Set(type, "Offset", value)
		end,
		Min = 0,
		Max = 200,
		Def = s.Offset,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- Prediction
	local type = "Prediction"
	local s = ss[type]
	Prediction.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Prediction.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set(type, "Strength", value)
		end,
		Min = 0,
		Max = 20,
		Def = s.Strength,
		Decimals = 2,
		Suffix = "x"
	})
	Prediction.Label({
		Text = "Prediction não está disponível em Phantom Forces.",
		Center = true,
		Transparent = true
	})
end

do -- Players
	local type = "Outros"
	local list = getgenv().AimbotSettings.Whitelisted
	local plr = players.LocalPlayer.Name
	local dd = Players.Dropdown({
		Text = "Lista de Players",
		Callback = function(value)
			plr = value
		end,
		Options = {},
		Def = players.LocalPlayer.Name
	})
	local function update()
		local t = {}
		for _,v in next, players:GetPlayers() do
			table.insert(t, v.Name)
		end
		table.sort(t, function(a,b)
			return a < b
		end)
		dd:SetOptions(t)
	end
	update()
	newconn(players.PlayerAdded, update)
	newconn(players.PlayerRemoving, update)
	Players.Label({
		Text = "━━ Whitelist ━━",
		Center = true,
		Transparent = true
	})
	Players.Button({
		Text = "Whitelist the selected player",
		Callback = function()
			if plr == "" then
				return UI.Banner("Por favor Selecione-o player.")
			end
			if table.find(list, plr) then
				return UI.Banner(plr.." is already whitelisted.")
			end
			table.insert(list, plr)
		end
	})
	Players.Button({
		Text = "Un-whitelist the selected player",
		Callback = function()
			if plr == nil then
				return UI.Banner("Please select a player.")
			end
			if not table.find(list,plr) then
				return UI.Banner(plr.." is not whitelisted.")
			end
			table.remove(list, table.find(list, plr))
		end
	})
	Players.Toggle({
		Text = "Whitelist Friends",
		Callback = function(value)
			aimbot:Set(type, "WhitelistFriends", value)
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Se ativado, seus amigos serão automaticamente colocados na lista de permissões ao entrar no jogo.")
			end
		}
	})

	Players.Label({
		Text = "━━ Prioridade ━━",
		Center = true,
		Transparent = true
	})
	Players.Button({
		Text = "Priorize o jogador selecionado        ",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." não está no jogo.")
				return
			end

			local t = aimbot:Get(type, "Priority")
			if table.find(t, plr) then
				UI.Banner(plr.."já está priorizado")
				return
			end
			table.insert(t, plr)
			aimbot:Set(type, "Priority", t)
		end,
		Menu = {
			Info = function()
				UI.Banner(" Se um jogador priorizado estiver dentro do círculo fov, o aimbot sempre terá como alvo o jogador priorizado, independentemente de ele estar mais distante ou não.")
			end
		}
	})
	Players.Button({
		Text = "Despriorize o jogador selecionado",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			local t = aimbot:Get(type, "Priority")
			local index = table.find(t, plr)
			if not index then
				UI.Banner(plr.." não está priorizado")
				return
			end
			table.remove(t, index)
			aimbot:Set(type, "Priority", t)
		end
	})
end

do -- Other
	Other.Button({
		Text = "Destroy Aimbot",
		Callback = destroy,
		Menu = {
			Info = function()
				UI.Banner("Este botão removerá completamente o Universal Aimbot, incluindo a Ui.")
			end
		}
	})
	Other.Button({
		Text = "Re-Load UI",
		Callback = function()
			UI.Banner({
				Text = "Tem certeza de que deseja recarregar a Ui?",
				Callback = function(value)
					if value == "Yes" then
						reload()
					end
				end,
				Options = {"Sim", "Não"}
			})
		end
	})
	Other.Button({
		Text = "Load Safe Mode",
		Callback = function()
			UI.Banner({
				Text = "Tem certeza de que deseja carregar a Ui no modo de segurança",
				Callback = function(value)
					if value == "Sim" then
						reload(true)
					end
				end,
				Options = {"Sim", "Não"}
			})
		end,
		Menu = {
			Info = function()
				UI.Banner("Recarrega a interface do usuário no modo de segurança. (impede a detecção por meio de erros de script)\nObserve que isso <b>não</b> impede <i>todas</i> as detecções.")
			end
		}
	})
	uitogglebtn = Other.Keybind({
		Text = "UI Toggle Key",
		Callback = function(value)
			togglekey = value
		end,
		Def = togglekey,
		AllowMouse = false
	})
	Other.Button({
		Text = "Hide UI",
		Callback = function()
			UI.Toggle(false)
		end
	})
	Other.Label({
		Text = "Feito por Kakah Menu Team | "..version,
		Center = true,
		Transparent = true
	})
end

do -- Configs
	local list
	local function isempty(s)
		return s:gsub(" ","") == ""
	end
	local function refresh()
		list:SetOptions(cfg.Get())
	end

	Configs.TextField({
		Text = "Config Name",
		Type = "Default",
		Callback = function(value)
			if not isempty(value) then
				cfgname = value
			end
		end
	})
	Configs.Button({
		Text = "Create New Config",
		Callback = function()
			if not isempty(cfgname) then
				save(cfgname)
				UI.Banner("Successfully created <b>"..cfgname.."</b>.")
				refresh()
			else
				UI.Banner("Please enter a name for your config in the text box above.")
			end 
		end
	})
	list = Configs.Dropdown({
		Text = "Your Configs",
		Callback = function(value)
			selectedcfg = value
		end,
		Options = {},
		Def = "Default"
	})
	refresh()
	Configs.Button({
		Text = "Load Selected Config",
		Callback = function()
			cfg.Load(selectedcfg, load)
		end,
		Menu = {
			Info = function()
				UI.Banner("Your settings will not apply to the UI. (cuz im lazy)")
			end
		}
	})
	Configs.Button({
		Text = "Overwrite Selected Config",
		Callback = function()
			save(selectedcfg)
			UI.Banner("Successfully overwritten <b>"..selectedcfg.."</b>.")
		end
	})
	Configs.Button({
		Text = "Delete Selected Config",
		Callback = function()
			if cfg.Valid(selectedcfg) then
				UI.Banner({
					Text = "Are you sure you want to delete <b>"..selectedcfg.."</b>?",
					Options = {"Yes", "No"},
					Callback = function(value)
						if value == "Yes" then
							cfg.Delete(selectedcfg)
							UI.Banner("Successfully deleted <b>"..selectedcfg.."</b>.")
							refresh()
						end
					end
				})
			else
				UI.Banner("<b>"..selectedcfg.."</b> does not exist.")
			end
		end
	})
	Configs.Button({
		Text = "Set Selected Config as Default",
		Callback = function()
			cfg.SetDefault(selectedcfg)
		end,
		Menu = {
			Info = function()
				UI.Banner("This will overwrite your current default config!")
			end
		}
	})
	Configs.Button({
		Text = "Refresh Config List",
		Callback = refresh
	})
end

newconn(game:GetService("UserInputService").InputBegan, function(i, gp)
	if not gp and i.KeyCode == togglekey then
		UI.Toggle()
	end
end)

getgenv().UAIM_LOADING = false