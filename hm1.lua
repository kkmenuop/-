repeat
	wait(.1)
until game:IsLoaded() and game.Players.LocalPlayer and game.CoreGui
if getgenv().ScriptExecuted then
	return
end;
getgenv().ScriptExecuted = true;
-- // Hop \\ --


function v0_()
local Player = game.Players.LocalPlayer    
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place,_id = game.PlaceId, game.JobId
local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Next; repeat
   local Servers = ListServers(Next)
   for i,v in next, Servers.data do
       if v.playing < v.maxPlayers and v.id ~= _id then
           local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
           if s then break end
       end
   end
   
   Next = Servers.nextPageCursor
until not Next
end;


-- // Funny Thing \\ --
local v0 = game.Players.LocalPlayer.PlayerGui.Main
v0.Fragments.TextColor3 = Color3.fromRGB(255, 0, 255)
v0.Fragments.Text = "Kakah Menu #1"
local v1 = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
v0.Fragments.FontFace = v1
v0.Beli.FontFace = v1


-- // Save Setting \\ --


getgenv().Settings = {
	skibidi = false,
	FastAttack = true,
	v23_ = true,
	AutoRejoin = true
}
function v4()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("ORGHub") then
			makefolder("ORGHub")
		end
		if not isfolder("ORGHub/Blox Fruits/") then
			makefolder("ORGHub/Blox Fruits/")
		end
		if not isfile("ORGHub/Blox Fruits/ORGHub.json") then
			writefile("ORGHub/Blox Fruits/ORGHub.json", game:GetService("HttpService"):JSONEncode(getgenv().Settings))
		else
			local sk = game:GetService("HttpService"):JSONDecode(readfile("ORGHub/Blox Fruits/ORGHub.json"))
			for hi, his in pairs(sk) do
				getgenv().Settings[hi] = his
			end
		end
	else
		return
	end
end

function v5()
	if readfile and writefile and isfile and isfolder then
		if not isfile("ORGHub/Blox Fruits/ORGHub.json") then
			v2()
		else
			local hsiw = game:GetService("HttpService"):JSONDecode(readfile("ORGHub/Blox Fruits/ORGHub.json"))
			local input = {}
			for quiqui, ququ in pairs(getgenv().Settings) do
				input[quiqui] = ququ
			end
			writefile("ORGHub/Blox Fruits/ORGHub.json", game:GetService("HttpService"):JSONEncode(input))
		end
	else
		return
	end
end
v4()


-- // Value Of DropDown \\ --


local v6 = game.PlaceId;
if v6 == 2753915549 then
	v3_ = true
elseif v6 == 4442272183 then
	v4_ = true
elseif v6 == 7449423635 then
	v5_ = true
end;
if v3_ then
	v6_ = {
		"The Gorilla King",
		"Bobby",
		"Yeti",
		"Mob Leader",
		"Vice Admiral",
		"Warden",
		"Chief Warden",
		"Swan",
		"Magma Admiral",
		"Fishman Lord",
		"Wysper",
		"Thunder God",
		"Cyborg",
		"Saber Expert"
	}
elseif v4_ then
	v6_ = {
		"Diamond",
		"Jeremy",
		"Fajita",
		"Don Swan",
		"Smoke Admiral",
		"Cursed Captain",
		"Darkbeard",
		"Order",
		"Awakened Ice Admiral",
		"Tide Keeper"
	}
elseif v5_ then
	v6_ = {
		"Stone",
		"Island Empress",
		"Kilo Admiral",
		"Captain Elephant",
		"Beautiful Pirate",
		"rip_indra True Form",
		"Longma",
		"Soul Reaper",
		"Cake Queen"
	}
end;
local v7;
if v3_ then
	v7 = {
		"Magma Ore",
		"Leather",
		"Scrap Metal",
		"Angel Wings",
		"Fish Tail"
	}
elseif v4_ then
	v7 = {
		"Magma Ore",
		"Scrap Metal",
		"Radioactive Material",
		"Vampire Fang",
		"Mystic Droplet"
	}
elseif v5_ then
	v7 = {
		"Mini Tusk",
		"Fish Tail",
		"Scrap Metal",
		"Dragon Scale",
		"Conjured Cocoa",
		"Demonic Wisp",
		"Gunpowder"
	}
end;
table.sort(v7)


-- // Window | Tab \\ --


local v8 = loadstring(game:HttpGet("https://paste.gg/p/Akaka/cb553e9429444131aacae4f478fd7d0b/files/7f57ca26540845c99a586ad7129b8b3d/raw"))()
local v9 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local v10 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local v11 = v8:CreateWindow({
	Title = "KakahMenu",
	SubTitle = "KakahMenu,
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})

local v12 = {
	Page1 = v11:AddTab({
		Title = "Tab Inicio",
		Icon = ""
	}),
	Page2 = v11:AddTab({
		Title = "Tab Status",
		Icon = ""
	}),
	Page3 = v11:AddTab({
		Title = "Tab Config",
		Icon = ""
	}),
	Page4 = v11:AddTab({
		Title = "Tab Loja",
		Icon = ""
	}),
	Page5 = v11:AddTab({
		Title = "Tab Item Farm",
		Icon = ""
	}),
	Page6 = v11:AddTab({
		Title = "Tab Auto Mundo",
		Icon = ""
	}),
	Page8 = v11:AddTab({
		Title = "Tab Misc",
		Icon = ""
	}),
}


local v13 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Selecione Weapon",
	Description = "Selecione Weapon",
	Values = {
		"Melee",
		"Sword",
		"Fruit"
	},
	Multi = false,
	Default = getgenv().Settings.SelectWeapon,
})
v13:SetValue("Melee")
v13:OnChanged(function(v106)
	v7_ = v106
	getgenv().Settings.SelectWeapon = v106
end)


local v14 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Fast Attack Velocidade",
	Description = "Fast Attack Velocidade",
	Values = {
		"0",
		"0.08",
		"0.1",
		"0.15",
		"0.2",
		"0.3",
		"0.4",
		"0.5"
	},
	Multi = false,
	Default = getgenv().Settings.FastType,
})
v14:OnChanged(function(v107)
	getgenv()["FastType"] = v107
	getgenv().Settings.FastType = v107
end)


local v15 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Selecione Farm Metodo",
	Description = "Selecione Farm Metodo",
	Values = {
		"Up",
		"Below",
		"Behind",
	},
	Multi = false,
	Default = getgenv().Settings.FarmPos,
})
v15:OnChanged(function(v108)
	getgenv()["PosFarm"] = v108
	getgenv().Settings.FarmPos = v108
end)


local v16 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Selecione Farm Mode",
	Description = "Selecione Farm Mode",
	Values = {
		"Farm Level",
		"Bone",
		"Cake Prince"
	},
	Multi = false,
	Default = getgenv().Settings.ModeFarm,
})
v16:OnChanged(function(v109)
	getgenv()["FarmMode"] = v109
	getgenv().Settings.ModeFarm = v109
end)


local v17 = v12.Page1:AddToggle("MyToggle", {
	Title = "Auto Farm Mode Selecionado",
	Description = "Auto Farm Mode Selecionado",
	Default = getgenv().Settings.AutoFarm
})
v17:OnChanged(function(v110)
	getgenv()["AutoFarm"] = v110;
	getgenv().Settings.AutoFarm = v110
	getgenv()["AutoStatsMelee"] = v110;
end)


if v3_ then
	local v111 = v12.Page1:AddToggle("MyToggle", {
		Title = "Skip Level 1 -> 300",
		Default = getgenv().Settings.FarmFast
	})
	v111:OnChanged(function(v112)
		getgenv()["AutoFarmFast"] = v112;
		getgenv().Settings.FarmFast = v112
	end)
end


local v18 = v12.Page1:AddToggle("Skibidi", {
	Title = "Auto Spawn Cake Prince",
	Description = "Auto Spawn Cake Prince",
	Default = getgenv().Settings.AutoSpawnCakePrince
})
v18:OnChanged(function(v113)
	getgenv().Settings.AutoSpawnCakePrince = v113
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", bF)
end)


local v19 = v12.Page1:AddToggle("Skibidi", {
	Title = "Auto Farm Baú",
	Description = "Auto Farm Baú",
	Default = getgenv().Settings.FarmChestTween
})
v19:OnChanged(function(v114)
	getgenv()["AutoFarmChest"] = v114;
	getgenv().Settings.FarmChestTween = v114
end)
getgenv().MagnitudeAdd = 0;


local v20 = v12.Page1:AddToggle("Skibidi", {
	Title = "Auto Farm Baú Fast",
	Description = "Auto Farm Baú Rápido",
	Default = getgenv().Settings.ChestBypass
})
v20:OnChanged(function(v115)
	getgenv().ChestBypass = v115
	getgenv().Settings.ChestBypass = v115
end)


local v21 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Selecione Material",
	Description = "Selecione Material",
	Values = v7,
	Multi = false,
	Default = getgenv().Settings.SelectModeMaterial,
})
v21:OnChanged(function(v116)
	v8_ = v116
	getgenv().Settings.SelectModeMaterial = v116
end)


local v22 = v12.Page1:AddToggle("Skibidi", {
	Title = "Auto Farm Selecione Material",
	Description = "Auto Farm Selecione Material",
	Default = getgenv().Settings.FarmMaterial
})
v22:OnChanged(function(v117)
	getgenv()["AutoFarmMaterial"] = v117
	getgenv().Settings.FarmMaterial = v117
end)


local v23 = v12.Page1:AddDropdown("Dropdown", {
	Title = "Selecione Boss",
	Description = "Escolha o Boss",
	Values = v6_,
	Multi = false,
	Default = getgenv().Settings.SelectBoss,
})
v23:OnChanged(function(v118)
	getgenv().SelectBoss = v118
	getgenv().Settings.SelectBoss = v118
end)


local v24 = v12.Page1:AddToggle("Skibidi", {
	Title = "Auto Farm Selecionado Boss",
	Description = "Auto Farm Selecionado Boss",
	Default = getgenv().Settings.AutoFarmBoss
})
v24:OnChanged(function(v119)
	getgenv()["AutoFarmBoss"] = v119;
	getgenv().Settings.AutoFarmBoss = v119
end)


local v25 = v12.Page2:AddParagraph({
	Title = "Bones Status",
	Content = ""
})
    
    
local v26 = v12.Page2:AddParagraph({
	Title = "Cake Prince Status",
	Content = ""
})


local v27 = v12.Page2:AddParagraph({
	Title = "Elite Status",
	Content = ""
})


local v28 = v12.Page2:AddParagraph({
	Title = "Elite",
	Content = ""
})


local v29 = v12.Page3:AddToggle("Skibidi", {
	Title = "Ativação Auto Ken Haki",
	Description = "Ativação Auto Ken Haki",
	Default = getgenv().Settings.AutoKen 
})
v29:OnChanged(function(v120)
	getgenv().AutoKen = v120
	getgenv().Settings.AutoKen = v120
end)


local v30 = v12.Page3:AddToggle("Skibidi", {
	Title = "Desativar Dano",
	Description = "Desativar Dano",
	Default = getgenv().Settings.Disdame 
})
v30:OnChanged(function(v121)
	getgenv().Disdamage = v121;
	getgenv().Settings.Disdame = v121
end)


local v31 = v12.Page3:AddToggle("Skibidi", {
	Title = "Fast Attack",
	Description = "Ataque Rápido",
	Default = getgenv().Settings.FastAttack
})
v31:OnChanged(function(v122)
	getgenv().FastAttack = v122;
	_G.FastCuaCat = v122
	getgenv().Settings.FastAttack = v122
end)

local v32 = v12.Page4:AddToggle("Skibidi", {
	Title = "Auto Random Bone",
	Description = "Osso Aleatório Automático",
	Default = getgenv().Settings.RandomBone
})
v32:OnChanged(function(v123)
	getgenv().AutoRandomBone = v123
	getgenv().Settings.RandomBone = v123
end)


local v33 = v12.Page3:AddToggle("Skibidi", {
	Title = "Desativar Notification",
	Description = "Desativar Notificação",
	Default = getgenv().Settings.Disableanotify
})
v33:OnChanged(function(v124)
	getgenv().RemoveNotification = v124
	getgenv().Settings.Disableanotify = v124
end)


v12.Page4:AddButton({
	Title = "Compre Geppo",
	Description = "Compre Geppo",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
	end
})
v12.Page4:AddButton({
	Title = "Compre Buso Haki",
	Description = "Compre Haki",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
	end
})
v12.Page4:AddButton({
	Title = "Compre Soru",
	Description = "Compre Soru",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
	end
})
v12.Page4:AddButton({
	Title = "Compre Ken Haki",
	Description = "Compre Haki Quan Sát",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
	end
})
v12.Page4:AddButton({
	Title = "Compre SanguineArt",
	Description = "Compre SanguineArt",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt");
	end
});
v12.Page4:AddButton({
	Title = "Compre God Human",
	Description = "Compre God Human",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman");
	end
});
v12.Page4:AddButton({
	Title = "Compre Sharkman karate",
	Description = "Compre SharkMan Karate",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
	end
});
v12.Page4:AddButton({
	Title = "Compre Electric Claw",
	Description = "Compre Electric Claw",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
	end
});
v12.Page4:AddButton({
	Title = "Compre DeathStep",
	Description = "Compre Death Step",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
	end
});
v12.Page4:AddButton({
	Title = "Compre DragonTalon",
	Description = "Compre Dragon Talon",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
	end
});
v12.Page4:AddButton({
	Title = "Buy SuperHuman",
	Description = "Compre SuperHuman",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
	end
});
v12.Page4:AddButton({
	Title = "Compre DragonClaw",
	Description = "Compre DragonClaw",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
	end
});
v12.Page4:AddButton({
	Title = "Compre BlackLeg",
	Description = "Compre BlackLeg",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
	end
});
v12.Page4:AddButton({
	Title = "Compre Electro",
	Description = "Compre Electro",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
	end
});
v12.Page4:AddButton({
	Title = "Compre FishmanKarate",
	Description = "Compre Fishman Karate",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
	end
});
v12.Page4:AddButton({
	Title = "Reembolse Stats",
	Description = "Reembolse Stats",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
	end
})
v12.Page4:AddButton({
	Title = "Reroll Race",
	Description = "Reroll Race",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
	end
})


local v34 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Swan Glasses",
	Description = "Auto Swan Glasses",
	Default = getgenv().Settings.AutoSwanGlass
})
v34:OnChanged(function(v125)
	getgenv()["AutoSwanGlasses"] = v125;
	getgenv().Settings.AutoSwanGlass = v125
end)


local v35 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Pole",
	Description = "Auto Pole",
	Default = getgenv().Settings.AutoPole
})
v35:OnChanged(function(v126)
	getgenv()["AutoPole"] = v126;
	getgenv().Settings.AutoPole = v126
end)


local v36 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Saber",
	Description = "Auto Saber",
	Default = getgenv().Settings.AutoSaber
})
v36:OnChanged(function(v127)
	getgenv()["AutoSaber"] = v127;
	getgenv().Settings.AutoSaber = v127
end)


local v37 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Observation Haki V2",
	Description = "Auto Observation Haki V2",
	Default = getgenv().Settings.AutoKenHakiV2
})
v37:OnChanged(function(v128)
	getgenv()["AutoKenHakiV2"] = v128;
	getgenv().Settings.AutoKenHakiV2 = v128
end)


local v38 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Farm Observation Haki",
	Description = "Auto Farm Observation Haki",
	Default = getgenv().Settings.AutoFarmKen
})
v38:OnChanged(function(v129)
	getgenv()["AutoObservation"] = v129;
	getgenv().Settings.AutoFarmKen = v129
end)


local v39 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Castle Raid",
	Description = "Lute automaticamente contra monstros na fortaleza",
	Default = getgenv().Settings.AutoRaidCastle
})
v39:OnChanged(function(v130)
	getgenv().AutoCastleRaid = v130;
	getgenv().Settings.AutoRaidCastle = v130
end)


local v40 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Holy Torch",
	Description = "Pega automaticamente a tocha",
	Default = getgenv().Settings.AutoHolyTorch
})
v40:OnChanged(function(v131)
	getgenv()["AutoHolyTorch"] = v131;
	getgenv().Settings.AutoHolyTorch = v131
end)


local v41 = v12.Page5:AddToggle("Skibidi", {
	Title = "Auto Rainbow Haki",
	Description = "Obtenha automaticamente haki de 7 cores",
	Default = getgenv().Settings.AutoRainBowHaki
})
v41:OnChanged(function(v132)
	getgenv().AutoRainbowHaki = v132;
	getgenv().Settings.AutoRainBowHaki = v132
end)


local v42 = v12.Page6:AddToggle("Skibidi", {
	Title = "Auto Third Sea",
	Description = "Vá automaticamente para o mar 3",
	Default = getgenv().Settings.AutoThirdSea
})
v42:OnChanged(function(v133)
	getgenv()["AutoThirdSea"] = v133;
	getgenv().Settings.AutoThirdSea = v133
end)


local v43 = v12.Page6:AddToggle("Skibidi", {
	Title = "Auto Second Sea",
	Description = "Vá automaticamente para o mar 2",
	Default = getgenv().Settings.AutoNewWorld
})
v43:OnChanged(function(v134)
	getgenv()["AutoNewWorld"] = v134;
	getgenv().Settings.AutoNewWorld = v134
end)


v12.Page8:AddButton({
	Title = "Remove Fog",
	Description = "Névoa clara",
	Callback = function()
		game:GetService("Lighting").LightingLayers:Destroy()
		game:GetService("Lighting").Sky:Destroy()
	end
})


v12.Page8:AddButton({
	Title = "Sempre dia",
	Description = "Deixe Sempre de dia",
	Callback = function()
		game:GetService("RunService").Heartbeat:wait(0.1)
		game:GetService("Lighting").ClockTime = 12
	end
})


local v44 = v12.Page8:AddToggle("Skibidi", {
	Title = "Auto Rejoin",
	Description = "Entre novamente no servidor automaticamente",
	Default = getgenv().Settings.AutoRejoin
})
v44:OnChanged(function(v135)
	getgenv().AutoRejoinLinh = v135
	getgenv().Settings.AutoRejoin = v135
end)


v12.Page8:AddButton({
	Title = "Resgate todos Codes",
	Description = "Resgate todos Codes",
	Callback = function()
		v7_()
	end
})


v12.Page8:AddButton({
	Title = "Entre Pirates Team",
	Description = "Entre no time dos Piratas",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
	end
})


v12.Page8:AddButton({
	Title = "Entre Marines Team",
	Description = "Entre no time dos Marinheiros",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
	end
})


v12.Page8:AddButton({
	Title = "Abra Devil Shop Menu",
	Description = "Abra Devil Shop Menu",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
		game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
	end
})


v12.Page8:AddButton({
	Title = "Abra Color Haki Menu",
	Description = "Abra Color Haki Menu",
	Callback = function()
		game.Players.LocalPlayer.PlayerGui.Main.Colors.Visible = true
	end
})


v12.Page8:AddButton({
	Title = "Abra Title Name Menu",
	Description = "Abra Title Name Menu",
	Callback = function()
		local v136 = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v136))
		game.Players.LocalPlayer.PlayerGui.Main.Titles.Visible = true
	end
})


v12.Page8:AddButton({
	Title = "Abra Awakening Menu",
	Description = "Abra Awakening Menu",
	Callback = function()
		game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
	end
})


v12.Page8:AddButton({
	Title = "Hop Server",
	Description = "Procure outro Servidor",
	Callback = function()
		v0_()
	end
})


v12.Page8:AddButton({
	Title = "Reentre no Server",
	Description = "Reentre no servidor",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end
})


-- // Sources \\ --


task.spawn(function()
while task.wait() do
v5()
end
end)
task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v137 = game:GetService("Players").LocalPlayer
			local v138 = game:GetService("Workspace")
			local v139 = game:GetService("ReplicatedStorage")
			local v140 = v137.Character.HumanoidRootPart.Position
			local v141 = getgenv()["AutoSwanGlasses"]
			local v142 = getgenv()["SelectWeapon"]
			local v143 = getgenv().FastAttack
			local v144 = MethodFarm

			if v141 then
				local v145 = v138.Enemies:FindFirstChild("Don Swan")

				if v145 then
					for v146, v147 in pairs(v138.Enemies:GetChildren()) do
						if v147.Name == "Don Swan" and v147.Humanoid.Health > 0 and v147:IsA("Model") and v147:FindFirstChild("Humanoid") and v147:FindFirstChild("HumanoidRootPart") then
							repeat
								wait(0.1)
								v9_, v31 = true, true
								v10_(v142)
								v11_ = v147.HumanoidRootPart.CFrame
								
								if not v143 then
									game:GetService("VirtualUser"):CaptureController()
									game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
								end
								
								v147.Humanoid.JumpPower = 0
								v147.Humanoid.WalkSpeed = 0
								v147.HumanoidRootPart.CanCollide = false
								v147.Humanoid:ChangeState(11)
								v147.Humanoid:ChangeState(14)
								v147.Humanoid:ChangeState(16)
								v12_(v147.HumanoidRootPart.CFrame * v144)
							until not v141 or v147.Humanoid.Health <= 0
							v9_, v31 = false, false
						end
					end
				else
					repeat
						wait(0.1)
						v139.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
					until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - v140).Magnitude <= 4 or not v141
				end
			end
		end)
	end
end)

function v13_()
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2UncleKizaru")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("NEWTROLL")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2NOOBMASTER123")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2NoobMaster123")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("StrawHatMaine")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2OfficialNoobie")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2GAMERROBOT_EXP1")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2GAMERROBOT_RESET1")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("THEGREATACE")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("BIGNEWS")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("FUDD10")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("fudd10_v2")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Bluxxy")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Starcodeheo")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("JCWK")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2CAPTAINMAUI")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Magicbus")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2Fer999")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("kittgaming")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("GAMERROBOT")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUBGAMERROBOT")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("ADMINGIVEAWAY")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("KITT_RESET")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SECRET_ADMIN")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2Daigrock")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Axiore")
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("TantaiGaming")
end
task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v149 = game:GetService("Players").LocalPlayer
			local v150 = v149.PlayerGui.Main.Quest
			local v151 = v150.Container.QuestTitle.Title.Text
			local v152 = game:GetService("Workspace").Enemies:GetChildren()

			if getgenv().AutoRainbowHaki then
				if not v150.Visible then
					v12_(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
					if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - v149.Character.HumanoidRootPart.Position).Magnitude <= 30 then
						wait(1.5)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
					end
				else
					local v153 = {
						["Stone"] = CFrame.new(- 1086.11621, 38.8425903, 6768.71436, 0.0231462717, - 0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, - 0.999732077, - 0.0137055516, 0.0186523199),
						["Island Empress"] = CFrame.new(5713.98877, 601.922974, 202.751251, - 0.101080291, 0, - 0.994878292, 0, 1, 0, 0.994878292, 0, - 0.101080291),
						["Kilo Admiral"] = CFrame.new(2877.61743, 423.558685, - 7207.31006, - 0.989591599, 0, - 0.143904909, 0, 1.00000012, 0, 0.143904924, 0, - 0.989591479),
						["Captain Elephant"] = CFrame.new(- 13485.0283, 331.709259, - 8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, - 1.02065748e-07, 1, - 9.94383065e-09, - 0.69961375, - 6.43015241e-08, 0.714521289),
						["Beautiful Pirate"] = CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359)
					}

					for v154, v155 in pairs(v153) do
						if string.find(v151, v154) then
							local v156 = game:GetService("Workspace").Enemies:FindFirstChild(v154)
							if v156 then
								for v157, v158 in pairs(v152) do
									if v158.Name == v154 then
										repeat
											wait(0.1)
											if not v149.Character:FindFirstChild(getgenv()["SelectWeapon"]) then
												wait(0.1)
												v10_(getgenv()["SelectWeapon"])
											end
											v11_ = v158.HumanoidRootPart.CFrame
											if not getgenv().FastAttack then
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end
											v158.Humanoid.JumpPower = 0
											v158.Humanoid.WalkSpeed = 0
											v158.HumanoidRootPart.CanCollide = false
											v158.Humanoid:ChangeState(11)
											v158.Humanoid:ChangeState(14)
											v158.Humanoid:ChangeState(16)
											v12_(v158.HumanoidRootPart.CFrame * MethodFarm)
										until not getgenv().AutoRainbowHaki or v158.Humanoid.Health <= 0 or not v158.Parent or not v150.Visible
										v15_ = false
										v31 = false
									end
								end
							else
								v12_(v155)
							end
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		if getgenv()["AutoHolyTorch"] then
			pcall(function()
				local v159 = {
					Vector3.new(-10752, 417, -9366),
					Vector3.new(-11672, 334, -9474),
					Vector3.new(-12132, 521, -10655),
					Vector3.new(-13336, 486, -6985),
					Vector3.new(-13489, 332, -7925)
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5749.7861328125, 611.9736938476562, - 276.2497863769531))
				wait(1)
				v12_(CFrame.new(5154.54785, 142.129684, 916.826294, 0.00160392188, 7.16881203e-08, 0.999998689, 4.34501235e-09, 1, - 7.1695176e-08, - 0.999998689, 4.45999992e-09, 0.00160392188))
				wait(15)
				v10_("Holy Torch")
				for v160, v161 in pairs(v159) do
					repeat
						v12_(CFrame.new(v161))
						wait(0.1)
					until not getgenv()["AutoHolyTorch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v161).Magnitude <= 10
					wait(1)
				end
			end)
		end
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			if getgenv().AutoCastleRaid then
				local v162 = CFrame.new(- 5118.48682, 314.54129, - 2958.64404, - 0.387232125, 1.81507858e-08, 0.921982229, - 7.54388907e-08, 1, - 5.13709999e-08, - 0.921982229, - 8.94458196e-08, - 0.387232125)
				if (v162.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
					for v163, v164 in pairs(game.Workspace.Enemies:GetChildren()) do
						if v164:FindFirstChild("Humanoid") and v164:FindFirstChild("HumanoidRootPart") and v164.Humanoid.Health > 0 and (v164.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
							repeat
								wait(0.1)
								v11_ = v164.HumanoidRootPart.CFrame
								v10_(getgenv()["SelectWeapon"])
								v15_ = true
								v12_(v164.HumanoidRootPart.CFrame * MethodFarm)
								if (v164.HumanoidRootPart.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
									game:GetService("VirtualUser"):CaptureController()
									game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
								end
							until not getgenv().AutoCastleRaid or not v164.Parent or v164.Humanoid.Health <= 0
							v15_ = false
						end
					end
				else
					if (v162.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
						for v165, v166 in pairs(game.ReplicatedStorage:GetChildren()) do
							if v166:FindFirstChild("Humanoid") and v166:FindFirstChild("HumanoidRootPart") and v166.Humanoid.Health > 0 and (v166.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
								v12_(v166.HumanoidRootPart.CFrame * MethodFarm)
							end
						end
					end
					v12_(v162)
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v167 = game:GetService("Players").LocalPlayer
			local v168 = v167.PlayerGui.ScreenGui
			local v169 = game:GetService("Workspace").Enemies
			local v170 = game:GetService("TeleportService")
			local v171 = {
				World1 = CFrame.new(5533.29785, 88.1079102, 4852.3916),
				World2 = CFrame.new(- 5478.39209, 15.9775667, - 5246.9126),
				World3 = CFrame.new(4530.3540039063, 656.75695800781, - 131.60952758789)
			}

			if getgenv()["AutoObservation"] then
				repeat
					wait(0.1)
					if not v168:FindFirstChild("ImageLabel") then
						wait(5)
						local v172 = game:GetService("VirtualUser")
						v172:CaptureController()
						v172:SetKeyDown("0x65")
						wait(2)
						v172:SetKeyUp("0x65")
					end
				until v168:FindFirstChild("ImageLabel") or not getgenv()["AutoObservation"]

				if v167.VisionRadius.Value >= 6000 then
					print("maxed")
				else
					local v173 = nil
					if World2 then
						v173 = "Lava Pirate"
					elseif World1 then
						v173 = "Galley Captain"
					elseif World3 then
						v173 = "Giant Islander"
					end

					if v173 and v169:FindFirstChild(v173) then
						local v174 = v169:FindFirstChild(v173)
						local v175 = v174.HumanoidRootPart.CFrame
						local v176 = CFrame.new(3, 0, 0)

						repeat
							wait(0.1)
							v167.Character.HumanoidRootPart.CFrame = v175 * v176
						until not getgenv()["AutoObservation"] or v168:FindFirstChild("ImageLabel")

						if not v168:FindFirstChild("ImageLabel") and getgenv()["AutoObservationHop"] then
							v170:Teleport(game.PlaceId, v167)
						end
					else
						v12_(v171[World1 and "World1" or World2 and "World2" or "World3"])
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v177 = getgenv()["AutoKenHakiV2"]
			local v178 = game:GetService("Players").LocalPlayer
			local v179 = v178.PlayerGui.Main
			local v180 = v178.Backpack
			local v181 = v178.Character
			local v182 = game:GetService("ReplicatedStorage")
			local v183 = game:GetService("Workspace").Enemies
			local v184 = game:GetService("VirtualUser")
			local v185 = v179.Quest.Container.QuestTitle.Title.Text

			if v177 then
				if not v179.Quest.Visible then
					repeat
						v12_(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
						wait(0.1)
					until not v177 or (v181.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
					wait(0.1)
					v182.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
					wait(1)
					v182.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
				elseif v180:FindFirstChild("Banana") and v180:FindFirstChild("Apple") and v180:FindFirstChild("Pineapple") then
					repeat
						v12_(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
						wait(0.1)
					until not v177 or (v181.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
					wait(0.1)
					v182.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
				elseif v180:FindFirstChild("Fruit Bowl") or v181:FindFirstChild("Fruit Bowl") then
					repeat
						v12_(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188))
						wait(0.1)
					until not v177 or (v181.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10
					wait(0.1)
					v182.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
					wait(1)
					v182.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
				elseif v185:find("Defeat 50 Forest Pirates") then
					if v183:FindFirstChild("Forest Pirate") then
						for v186, v187 in pairs(v183:GetChildren()) do
							if v187.Name == "Forest Pirate" then
								repeat
									wait(0.1)
									v15_, v31 = true, true
									if not v181:FindFirstChild(getgenv()["SelectWeapon"]) then
										wait(0.1)
										v10_(getgenv()["SelectWeapon"])
									end
									local v188 = v187.HumanoidRootPart
									if not getgenv().FastAttack then
										v184:CaptureController()
										v184:Button1Down(Vector2.new(1280, 672))
									end
									local v189 = v187.Humanoid
									v189.JumpPower = 0
									v189.WalkSpeed = 0
									v188.CanCollide = false
									v189:ChangeState(11)
									v189:ChangeState(14)
									v189:ChangeState(16)
									v12_(v188.CFrame * MethodFarm)
								until not v177 or v187.Humanoid.Health <= 0
								v15_, v31 = false, false
							end
						end
					else
						repeat
							v12_(CFrame.new(- 13277.568359375, 370.34185791016, - 7821.1572265625))
							wait(0.1)
						until not v177 or (v181.HumanoidRootPart.Position - Vector3.new(- 13277.568359375, 370.34185791016, - 7821.1572265625)).Magnitude <= 10
					end
				elseif v185 == "Defeat Captain Elephant (0/1)" then
					if v183:FindFirstChild("Captain Elephant") then
						for v190, v191 in pairs(v183:GetChildren()) do
							if v191.Name == "Captain Elephant" then
								repeat
									wait(0.1)
									v15_, v31 = true, true
									if not v181:FindFirstChild(getgenv()["SelectWeapon"]) then
										wait(0.1)
										v10_(getgenv()["SelectWeapon"])
									end
									local v192 = v191.HumanoidRootPart
									if not getgenv().FastAttack then
										v184:CaptureController()
										v184:Button1Down(Vector2.new(1280, 672))
									end
									local v193 = v191.Humanoid
									v193.JumpPower = 0
									v193.WalkSpeed = 0
									v192.CanCollide = false
									v193:ChangeState(11)
									v193:ChangeState(14)
									v193:ChangeState(16)
									v12_(v192.CFrame * MethodFarm)
								until not v177 or v191.Humanoid.Health <= 0
								v15_, v31 = false, false
							end
						end
					else
						repeat
							v12_(CFrame.new(- 13493.12890625, 318.89553833008, - 8373.7919921875))
							wait(0.1)
						until not v177 or (v181.HumanoidRootPart.Position - Vector3.new(- 13493.12890625, 318.89553833008, - 8373.7919921875)).Magnitude <= 10
					end
				else
					for v194, v195 in pairs(game.Workspace:GetDescendants()) do
						if v195.Name == "Apple" or v195.Name == "Banana" or v195.Name == "Pineapple" then
							v195.Handle.CFrame = v181.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
							wait(0.1)
							firetouchinterest(v181.HumanoidRootPart, v195.Handle, 0)
							wait(0.1)
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v196 = getgenv()["AutoNewWorld"]
			local v197 = getgenv()["AutoFarm"]
			local v198 = game.Players.LocalPlayer.Data.Level.Value
			local v199 = game.Workspace.Map.Ice.Door
			local v200 = game:GetService("ReplicatedStorage")
			local v201 = game:GetService("Workspace").Enemies
			local v202 = game:GetService("VirtualUser")
			
			if v196 and v198 >= 700 then
				if v197 then
					getgenv()["AutoFarm"] = false
				end

				if v199.CanCollide and v199.Transparency == 0 then
					wait(0.1)
					v200.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
					v10_("Key")
					repeat
						wait(0.1)
						v12_(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
					until (CFrame.new(1347.7124, 37.3751602, - 1325.6488).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not getgenv()["AutoNewWorld"]
					wait(3)
				elseif not v199.CanCollide and v199.Transparency == 1 then
					local v203 = v201:FindFirstChild("Ice Admiral")
					if v203 then
						for v204, v205 in pairs(v201:GetChildren()) do
							if v205.Name == "Ice Admiral" and v205.Humanoid.Health > 0 then
								repeat
									wait(0.1)
									v10_(getgenv()["SelectWeapon"])
									v12_(v205.HumanoidRootPart.CFrame * MethodFarm)
									v31 = true
									if not getgenv().FastAttack then
										v202:CaptureController()
										v202:Button1Down(Vector2.new(1280, 672))
									end
									local v206 = v205.Humanoid
									v206.JumpPower = 0
									v206.WalkSpeed = 0
									v205.HumanoidRootPart.CanCollide = false
									v206:ChangeState(11)
									v206:ChangeState(14)
									v206:ChangeState(16)
									v200.Remotes.CommF_:InvokeServer("TravelDressrosa")
								until v205.Humanoid.Health <= 0 or not v205.Parent
								v200.Remotes.CommF_:InvokeServer("TravelDressrosa")
							end
						end
					else
						v12_(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
					end
				else
					v200.Remotes.CommF_:InvokeServer("TravelDressrosa")
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			if getgenv()["AutoThirdSea"] then
				local v207 = game.Players.LocalPlayer
				local v208 = v207.Data.Level.Value
				local v209 = game:GetService("ReplicatedStorage")
				local v210 = v209.Remotes.CommF_
				if v208 >= 1500 then
					if getgenv()["AutoFarm"] then
						getgenv()["AutoFarm"] = false
					end
					if v210:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
						if v210:InvokeServer("GetUnlockables").FlamingoAccess then
							Com("F_", "TravelZou")
							if v210:InvokeServer("ZQuestProgress", "Check") == 0 then
								if game.Workspace.Enemies:FindFirstChild("rip_indra") then
									for v211, v212 in pairs(game.Workspace.Enemies:GetChildren()) do
										if v212.Name == "rip_indra" and v212:FindFirstChild("Humanoid") and v212:FindFirstChild("HumanoidRootPart") and v212.Humanoid.Health > 0 then
											repeat
												wait(0.1)
												local v213 = (v212.HumanoidRootPart.Position - v207.Character.HumanoidRootPart.Position).magnitude
												if v213 > 300 then
													v12_(v212.HumanoidRootPart.Position, v212.HumanoidRootPart.CFrame)
												else
													if not v207.Character:FindFirstChild(getgenv()["SelectWeapon"]) then
														wait(0.1)
														EquipWeapon(getgenv()["SelectWeapon"])
													end
													if not getgenv().FastAttack then
														game:GetService("VirtualUser"):CaptureController()
														game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
													end
													v212.Humanoid.JumpPower = 0
													v212.HumanoidRootPart.CanCollide = false
													v212.Humanoid.WalkSpeed = 0
													v212.Humanoid:ChangeState(11)
													v12_(v212.HumanoidRootPart.CFrame * MethodFarm)
												end
											until not getgenv()["AutoThirdSea"] or not v212.Parent or v212.Humanoid.Health <= 0
											Com("F_", "TravelZou")
										end
									end
								else
									Com("F_", "ZQuestProgress", "Begin")
								end
							elseif v210:InvokeServer("ZQuestProgress", "Check") == 1 then
								Com("F_", "TravelZou")
							end
						else
							for v214, v215 in pairs(v210:InvokeServer("getInventoryFruits")) do
								if v215.Name then
									if v210:InvokeServer("GetFruits")[v215.Name].Price >= 1000000 then
										if not v207.Backpack:FindFirstChild(v215.Name) then
											Com("F_", "LoadFruit", v215.Name)
										else
											Com("F_", "TalkTrevor", "1")
											Com("F_", "TalkTrevor", "2")
											Com("F_", "TalkTrevor", "3")
										end
									end
								end
							end
						end
					elseif v210:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
						if v207.PlayerGui.Main.Quest.Visible and v207.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find("Swan Pirates") then
							if game.Workspace.Enemies:FindFirstChild("Swan Pirate") then
								for v216, v217 in pairs(game.Workspace.Enemies:GetChildren()) do
									if v217.Name == "Swan Pirate" then
										repeat
											wait(0.1)
											local v218 = (v217.HumanoidRootPart.Position - v207.Character.HumanoidRootPart.Position).magnitude
											if v218 > 300 then
												v12_(v217.HumanoidRootPart.Position, v217.HumanoidRootPart.CFrame)
											else
												if not v207.Character:FindFirstChild(getgenv()["SelectWeapon"]) then
													wait(0.1)
													EquipWeapon(getgenv()["SelectWeapon"])
												end
												if not getgenv().FastAttack then
													game:GetService("VirtualUser"):CaptureController()
													game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
												end
												v217.Humanoid.JumpPower = 0
												v217.HumanoidRootPart.CanCollide = false
												v217.Humanoid.WalkSpeed = 0
												v217.Humanoid:ChangeState(11)
												v12_(v217.HumanoidRootPart.CFrame * MethodFarm)
											end
										until not v217.Parent or v217.Humanoid.Health <= 0 or not getgenv()["AutoThirdSea"]
									end
								end
							else
								v12_(CFrame.new(960.976, 141.336, 1216.196).Position, CFrame.new(960.976, 141.336, 1216.196))
							end
						else
							v12_(CFrame.new(- 456.29, 73.02, 299.896).Position, CFrame.new(- 456.29, 73.02, 299.896))
							Com("F_", "StartQuest", "BartiloQuest", 1)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v219 = game.Players.LocalPlayer
			local v220 = game.Workspace
			local v221 = game.ReplicatedStorage
			local v222 = getgenv()["AutoSaber"]
			local v223 = getgenv()["AutoFarm"]
			local v224 = getgenv().BypassTP
			local v225 = getgenv()["SelectWeapon"]
			local v226 = getgenv().FastAttack
			local v227 = MethodFarm

			if v222 and v219.Data.Level.Value >= 200 and not v219.Backpack:FindFirstChild("Saber") and not v219.Character:FindFirstChild("Saber") then
				if v223 then
					getgenv()["AutoFarm"] = false
					getgenv().BypassTP = false
				end

				local v228 = v220.Map.Jungle
				local v229 = v228.Final.Part
				local v230 = v228.QuestPlates
				local v231 = v220.Map.Desert.Burn.Part
				local v232 = v221.Remotes.CommF_

				if v229.Transparency == 0 then
					if v230.Door.Transparency == 0 then
						local v233 = v219.Character.HumanoidRootPart.Position
						local v234 = CFrame.new(- 1612.55884, 36.9774132, 148.719543).Position
						
						if (v234 - v233).Magnitude <= 100 then
							v12_(v219.Character.HumanoidRootPart.CFrame)
							wait(1)
							for v235 = 1, 5 do
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v230["Plate" .. v235].Button.CFrame
								wait(1)
							end
						else
							v12_(CFrame.new(- 1612.55884, 36.9774132, 148.719543))
						end
					elseif v231.Transparency == 0 then
						if v219.Backpack:FindFirstChild("Torch") or v219.Character:FindFirstChild("Torch") then
							v10_("Torch")
							v12_(CFrame.new(1114.61475, 5.04679728, 4350.22803))
						else
							v12_(CFrame.new(- 1610.00757, 11.5049858, 164.001587))
						end
					elseif v232:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
						v232:InvokeServer("ProQuestProgress", "GetCup")
						wait(0.1)
						v10_("Cup")
						wait(0.1)
						v232:InvokeServer("ProQuestProgress", "FillCup", v219.Character.Cup)
						wait(0)
						v232:InvokeServer("ProQuestProgress", "SickMan")
					elseif v232:InvokeServer("ProQuestProgress", "RichSon") == nil then
						v232:InvokeServer("ProQuestProgress", "RichSon")
					elseif v232:InvokeServer("ProQuestProgress", "RichSon") == 0 then
						local v236 = v220.Enemies:FindFirstChild("Mob Leader") or v221:FindFirstChild("Mob Leader")
						if v236 then
							v12_(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703))
							for v237, v238 in pairs(v220.Enemies:GetChildren()) do
								if v238.Name == "Mob Leader" then
									repeat
										wait(0.1)
										v15_, v31 = true, true
										if not v219.Character:FindFirstChild(v225) then
											wait(0.1)
											v10_(v225)
										end
										v12_(v238.HumanoidRootPart.CFrame * v227)
										if not v226 then
											game:GetService("VirtualUser"):CaptureController()
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
										end
										v238.Humanoid.JumpPower = 0
										v238.Humanoid.WalkSpeed = 0
										v238.HumanoidRootPart.CanCollide = false
										v238.Humanoid:ChangeState(11)
										v238.Humanoid:ChangeState(14)
										v238.Humanoid:ChangeState(16)
									until v238.Humanoid.Health <= 0 or not v222
								end
							end
						end
					elseif v232:InvokeServer("ProQuestProgress", "RichSon") == 1 then
						v232:InvokeServer("ProQuestProgress", "RichSon")
						wait(0.1)
						v10_("Relic")
						wait(0.1)
						v12_(CFrame.new(- 1404.91504, 29.9773273, 3.80598116))
					end
				elseif v220.Enemies:FindFirstChild("Saber Expert") or v221:FindFirstChild("Saber Expert") then
					v12_(CFrame.new(- 1401.85046, 29.9773273, 8.81916237))
					for v239, v240 in pairs(v220.Enemies:GetChildren()) do
						if v240.Name == "Saber Expert" then
							repeat
								wait(0.1)
								v15_, v31 = true, true
								if not v219.Character:FindFirstChild(v225) then
									wait(0.1)
									v10_(v225)
								end
								v12_(v240.HumanoidRootPart.CFrame * v227)
								if not v226 then
									game:GetService("VirtualUser"):CaptureController()
									game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
								end
								v240.Humanoid.JumpPower = 0
								v240.Humanoid.WalkSpeed = 0
								v240.HumanoidRootPart.CanCollide = false
								v240.Humanoid:ChangeState(11)
								v240.Humanoid:ChangeState(14)
								v240.Humanoid:ChangeState(16)
								v232:InvokeServer("SetSpawnPoint")
							until v240.Humanoid.Health <= 0 or not v222
							if v240.Humanoid.Health <= 0 then
								v232:InvokeServer("ProQuestProgress", "PlaceRelic")
							end
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local v241 = game.Players.LocalPlayer
			local v242 = game.Workspace
			local v243 = game.ReplicatedStorage
			local v244 = getgenv()["AutoPole"]
			local v245 = getgenv()["SelectWeapon"]
			local v246 = getgenv().FastAttack
			local v247 = MethodFarm

			if v244 then
				local v248 = v243:FindFirstChild("Thunder God") or v242.Enemies:FindFirstChild("Thunder God")

				if v248 then
					for v249, v250 in pairs(v242.Enemies:GetChildren()) do
						if v250.Name == "Thunder God" and v250:FindFirstChild("HumanoidRootPart") and v250:FindFirstChild("Humanoid") and v250.Humanoid.Health > 0 then
							repeat
								wait(0.1)
								local v251 = v250.HumanoidRootPart.Position
								local v252 = v241.Character.HumanoidRootPart.Position
								
								if (v251 - v252).magnitude > 300 then
									v16_ = v12_(v251, v250.HumanoidRootPart.CFrame)
								else
									if v16_ then
										v16_:Stop()
									end
									
									v15_, v31 = true, true
									v10_(v245)
									v12_(v250.HumanoidRootPart.CFrame * v247)
									
									if not v246 then
										game:GetService("VirtualUser"):CaptureController()
										game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
									end
									
									v250.Humanoid.JumpPower = 0
									v250.HumanoidRootPart.CanCollide = false
									v250.Humanoid.WalkSpeed = 0
									v250.Humanoid:ChangeState(11)
									v250.Humanoid:ChangeState(14)
									v250.Humanoid:ChangeState(16)
									
									v243.Remotes.CommF_:InvokeServer("SetSpawnPoint")
								end
							until not v244 or v250.Humanoid.Health <= 0 or not v250.Parent
							
							v15_, v31 = false, false
						end
					end
				else
					v17_ = v12_(CFrame.new(- 7900.66406, 5606.90918, - 2267.46436).Position, CFrame.new(- 7900.66406, 5606.90918, - 2267.46436))
					
					if (CFrame.new(- 7900.66406, 5606.90918, - 2267.46436).Position - v241.Character.HumanoidRootPart.Position).magnitude <= 300 then
						if v17_ then
							v17_:Stop()
						end
						v241.Character.HumanoidRootPart.CFrame = CFrame.new(- 7900.66406, 5606.90918, - 2267.46436)
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv().RemoveNotification then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv()["AutoFarmBoss"] then
			if game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectBoss) then
				for v253, v254 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if v254.Name == getgenv().SelectBoss then
						if v254:FindFirstChild("Humanoid") and v254:FindFirstChild("HumanoidRootPart") and v254.Humanoid.Health > 0 then
							repeat
								wait(0.1)
								v19_()
								v10_(getgenv()["SelectWeapon"])
								v254.HumanoidRootPart.CanCollide = false;
								v254.Humanoid.WalkSpeed = 0;
								v254.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
								v12_(v254.HumanoidRootPart.CFrame * CFrame.new(0, 0, 20))
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", 3250)
							until not getgenv()["AutoFarmBoss"] or not v254.Parent or v254.Humanoid.Health <= 0
						end
					end
				end
			else
				if game:GetService("ReplicatedStorage"):FindFirstChild(getgenv().SelectBoss) then
					v12_(game:GetService("ReplicatedStorage"):FindFirstChild(getgenv().SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2))
				end
			end
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv()["AutoFarmMaterial"] then
			if v8_ ~= "" then
				bk(v8_)
				if bi(MaterialMob) then
					for v255, v256 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if getgenv()["AutoFarmMaterial"] and table.find(MaterialMob, v256.Name) and v256:FindFirstChild("HumanoidRootPart") and v256:FindFirstChild("Humanoid") and v256.Humanoid.Health > 0 then
							repeat
								wait(0.1)
								v20_ = v12_(v256.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
								if v256:FindFirstChild("HumanoidRootPart") and v256:FindFirstChild("Humanoid") and (v256.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
									if v20_ then
										v20_:Stop()
									end;
									for v257, v258 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v258.Name == v256.Name then
											v258.HumanoidRootPart.CFrame = v256.HumanoidRootPart.CFrame;
											v258.Humanoid.JumpPower = 0;
											v258.Humanoid.WalkSpeed = 0;
											v258.HumanoidRootPart.CanCollide = false;
											v258.Humanoid:ChangeState(14)
											v258.Humanoid:ChangeState(11)
											v258.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
											v31 = true;
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v256.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
										end
									end
								end
							until not bi(MaterialMob) or not getgenv()["AutoFarmMaterial"] or v256.Humanoid.Health <= 0 or not v256.Parent;
							v31 = false
						end
					end
				else
					v31 = false;
					v12_(CFrameMon)
				end
			end
		else
			break
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv().ChestBypass then
			for v259, v260 in pairs(game:GetService("Workspace"):GetChildren()) do
				if string.find(v260.Name, "Chest") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v260.CFrame;
					wait(.15)
				end
			end;
			for v261, v262 in pairs(game:GetService("Workspace"):GetDescendants()) do
				if string.find(v262.Name, "Chest") and v262:IsA("TouchTransmitter") then
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v262.Parent, 0)
					wait(0.1)
					firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v262.Parent, 1)
				end
			end
		end
		if getgenv().ChestBypass then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv()["AutoFarmChest"] then
			for v263, v264 in pairs(game:GetService("Workspace"):GetChildren()) do
				if v264.Name:find("Chest") then
					if game:GetService("Workspace"):FindFirstChild(v264.Name) then
						if (v264.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 + getgenv().MagnitudeAdd then
							repeat
								wait(0.1)
								if game:GetService("Workspace"):FindFirstChild(v264.Name) then
									v10_(getgenv()["SelectWeapon"])
									v12_(v264.CFrame)
									v21_(getgenv()["SelectWeapon"])
								end
							until getgenv()["AutoFarmChest"] == false or not v264.Parent;
							v12_(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							getgenv().MagnitudeAdd = getgenv().MagnitudeAdd + 1500;
							break
						end
					end
				end
			end
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv()["PosFarm"] == "Behind" then
			getgenv()["MethodFarm"] = CFrame.new(0, 0, 35)
		elseif getgenv()["PosFarm"] == "Up" then
			getgenv()["MethodFarm"] = CFrame.new(0, 35, 15)
		elseif getgenv()["PosFarm"] == "Below" then
			getgenv()["MethodFarm"] = CFrame.new(0, -35, 15)
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv().AutoRandomBone then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
		end
	end
end)
getgenv().AutoHaki = true
task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			if getgenv().AutoHaki then
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv().AutoKen then
			local v265 = {
				[1] = "Ken",
				[2] = true
			}
			game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(v265))
		end
	end
end)
getgenv().Auto_CFrame = true;
getgenv().TeamMode = "Pirates"
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
		if getgenv().TeamMode == "Marines" then
			for v266, v267 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated)) do
				for v268, v269 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
					v269:Fire()
				end
				v267.Function()
			end
		else
			for v270, v271 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated)) do
				for v272, v273 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
					v273:Fire()
				end
				v271.Function()
			end
		end
	end
end
if getgenv().AutoRejoin then
	getgenv().AutoRejoin = true;
end
function v22_()
	pcall(function()
		local v274 = true
		local v275 = game
		local v276 = v275.Workspace
		local v277 = v275.Lighting
		local v278 = v276.Terrain
		v278.WaterWaveSize = 0
		v278.WaterWaveSpeed = 0
		v278.WaterReflectance = 0
		v278.WaterTransparency = 0
		v277.GlobalShadows = false
		v277.FogEnd = 9e9
		v277.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for v279, v280 in pairs(v275:GetDescendants()) do
			if v280:IsA("Part") or v280:IsA("Union") or v280:IsA("CornerWedgePart") or v280:IsA("TrussPart") then
				v280.Material = "Plastic"
				v280.Reflectance = 0
			elseif v280:IsA("Decal") or v280:IsA("Texture") and v274 then
				v280.Transparency = 1
			elseif v280:IsA("ParticleEmitter") or v280:IsA("Trail") then
				v280.Lifetime = NumberRange.new(0)
			elseif v280:IsA("Explosion") then
				v280.BlastPressure = 1
				v280.BlastRadius = 1
			elseif v280:IsA("Fire") or v280:IsA("SpotLight") or v280:IsA("Smoke") or v280:IsA("Sparkles") then
				v280.Enabled = false
			elseif v280:IsA("MeshPart") then
				v280.Material = "Plastic"
				v280.Reflectance = 0
				v280.TextureID = 10385902758728957
			end
		end
		for v281, v282 in pairs(v277:GetChildren()) do
			if v282:IsA("BlurEffect") or v282:IsA("SunRaysEffect") or v282:IsA("ColorCorrectionEffect") or v282:IsA("BloomEffect") or v282:IsA("DepthOfFieldEffect") then
				v282.Enabled = false
			end
		end
		for v283, v284 in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
			if v284.Name == ("Water;") then
				v284.Transparency = 1
				v284.Material = "Plastic"
			end
		end
	end)
end
if getgenv().FpsBoost then
	v22_()
end
local v45 = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local v46 = v45:FindFirstChild("SkibidiUi")
if v46 then
	v46:Destroy()
end

v46 = Instance.new("ScreenGui")
v46.Name = "SkibidiUi"
v46.ResetOnSpawn = false
v46.Parent = v45

local v47 = "rbxassetid://18801298853"
local v48 = Instance.new("ImageButton")
v48.Image = v47
v48.Size = UDim2.new(0, 50, 0, 50)
v48.Position = UDim2.new(0.1, 0, 0.9, -100)
v48.BackgroundColor3 = Color3.new(255, 255, 255)
v48.BackgroundTransparency = 0
v48.Parent = v46

local v49 = Instance.new("UICorner", v48)
v49.CornerRadius = UDim.new(0.5, 0)

local v50 = Instance.new("TextLabel")
v50.Text = ''
v50.Font = Enum.Font.GothamBold
v50.TextSize = 40
v50.TextScaled = false
v50.RichText = true
v50.Size = UDim2.new(1, 0, 1, 0)
v50.BackgroundTransparency = 1
v50.TextXAlignment = Enum.TextXAlignment.Center
v50.TextYAlignment = Enum.TextYAlignment.Center
v50.Parent = v48

local v51 = false

function v23_()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end

v48.MouseButton1Click:Connect(function()
	if not v51 then
		v23_()
	end
	v51 = not v51
end)

local v52 = 0
local v53 = 0.5

v48.MouseButton1Click:Connect(function()
	local v285 = tick()
	if v285 - v52 < v53 then
		return
	end
	v52 = v285
	if not v51 then
		v23_()
	end
	v51 = not v51
end)
local v56 = game:GetService("VirtualInputManager")
local v57 = game:GetService("TweenService")
local v58 = game:service"TweenService"
local v59 = game:GetService("RunService")
local v60 = game:GetService("Players").LocalPlayer;
local v61 = v60:GetMouse()
local v62 = game:GetService("GuiService")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
function v25_(v286)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(v286) then
		local v287 = game.Players.LocalPlayer.Backpack:FindFirstChild(v286)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(v287)
	end
end;

function v30_()
	local v294 = {
		"Baking Staff",
		"Head Baker",
		"Cake Guard",
		"Cookie Crafter"
	}
	local v295 = workspace.EnemySpawns:GetChildren()
	local v296 = math.random(1, # v295)
	local v297 = v295[v296]
	for v298, v299 in pairs(v294) do
		local v300 = string.gsub(v299, "Lv. ", "")
		local v301 = string.gsub(v300, "[%[%]]", "")
		local v302 = string.gsub(v301, "%d+", "")
		local v303 = string.gsub(v302, "%s+", "")
		local v304 = v303;
		if v297.Name == v303 then
			return v297.CFrame
		end
	end
end;
local v63 = Instance.new("Folder", workspace)
v63.Name = "EnemySpawns"
for v305, v306 in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
	if v306:IsA("Part") then
		local v307 = v306:Clone()
		local v308 = string.gsub(v306.Name, "Lv. ", "")
		local v309 = string.gsub(v308, "[%[%]]", "")
		local v310 = string.gsub(v309, "%d+", "")
		local v311 = string.gsub(v310, "%s+", "")
		v307.Name = v311;
		v307.Parent = workspace.EnemySpawns;
		v307.Anchored = true
	end
end;
for v312, v313 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
	if v313:IsA("Model") and v313:FindFirstChild("HumanoidRootPart") then
		local v314 = v313.HumanoidRootPart:Clone()
		local v315 = string.gsub(v313.Name, "Lv. ", "")
		local v316 = string.gsub(v315, "[%[%]]", "")
		local v317 = string.gsub(v316, "%d+", "")
		local v318 = string.gsub(v317, "%s+", "")
		v314.Name = v318;
		v314.Parent = workspace.EnemySpawns;
		v314.Anchored = true
	end
end;
for v319, v320 in pairs(game.ReplicatedStorage:GetChildren()) do
	if v320:IsA("Model") and v320:FindFirstChild("HumanoidRootPart") then
		local v321 = v320.HumanoidRootPart:Clone()
		local v322 = string.gsub(v320.Name, "Lv. ", "")
		local v323 = string.gsub(v322, "[%[%]]", "")
		local v324 = string.gsub(v323, "%d+", "")
		local v325 = string.gsub(v324, "%s+", "")
		v321.Name = v325;
		v321.Parent = workspace.EnemySpawns;
		v321.Anchored = true
	end
end;
function v31_()
	local v326 = game:GetService("Players").LocalPlayer.Data.Level.Value;
	if v326 >= 1 and v326 <= 9 then
		if tostring(game.Players.LocalPlayer.Team) == "Marines" then
			v32_ = "Trainee"
			v33_ = "MarineQuest"
			v34_ = 1;
			v35_ = "Trainee"
			v36_ = CFrame.new(- 2709.67944, 24.5206585, 2104.24585, - 0.744724929, - 3.97967455e-08, - 0.667371571, 4.32403588e-08, 1, - 1.07884304e-07, 0.667371571, - 1.09201515e-07, - 0.744724929)
		elseif tostring(game.Players.LocalPlayer.Team) == "Pirates" then
			v32_ = "Bandit"
			v35_ = "Bandit"
			v33_ = "BanditQuest1"
			v34_ = 1;
			v36_ = CFrame.new(1059.99731, 16.9222069, 1549.28162, - 0.95466274, 7.29721794e-09, 0.297689587, 1.05190106e-08, 1, 9.22064114e-09, - 0.297689587, 1.19340022e-08, - 0.95466274)
		end;
		return {
			[1] = v34_,
			[2] = v36_,
			[3] = v32_,
			[4] = v33_,
			[5] = v37_,
			[6] = v35_,
			[7] = v38_
		}
	end;
	if v326 >= 210 and v326 <= 249 then
		v32_ = "Dangerous Prisoner"
		v33_ = "PrisonerQuest"
		v34_ = 2;
		v35_ = "Dangerous Prisoner"
		v36_ = CFrame.new(5308.93115, 1.65517521, 475.120514, - 0.0894274712, - 5.00292918e-09, - 0.995993316, 1.60817859e-09, 1, - 5.16744869e-09, 0.995993316, - 2.06384709e-09, - 0.0894274712)
		local v334 = {}
		local v335 = string.gsub(v32_, "Lv. ", "")
		local v336 = string.gsub(v335, "[%[%]]", "")
		local v337 = string.gsub(v336, "%d+", "")
		local v338 = string.gsub(v337, "%s+", "")
		for v339, v340 in pairs(game.Workspace.EnemySpawns:GetChildren()) do
			if v340.Name == v338 then
				table.insert(v334, v340.CFrame)
			end;
			v38_ = v334
		end;
		return {
			[1] = v34_,
			[2] = v36_,
			[3] = v32_,
			[4] = v33_,
			[5] = v37_,
			[6] = v35_,
			[7] = v38_
		}
	end;
	local v327 = require(game:GetService("ReplicatedStorage").GuideModule)
	local v328 = require(game:GetService("ReplicatedStorage").Quests)
	for v341, v342 in pairs(v327["Data"]["NPCList"]) do
		for v343, v344 in pairs(v342["Levels"]) do
			if v326 >= v344 then
				if not v37_ then
					v37_ = 0
				end;
				if v344 > v37_ then
					v36_ = v341["CFrame"]
					v34_ = v343;
					v37_ = v344
				end;
				if # v342["Levels"] == 3 and v34_ == 3 then
					v36_ = v341["CFrame"]
					v34_ = 2;
					v37_ = v342["Levels"][2]
				end
			end
		end
	end;
	if v326 >= 375 and v326 <= 399 then
		if getgenv()["AutoFarm"] and (v36_.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		end
	end;
	if v326 >= 400 and v326 <= 449 then
		if getgenv()["AutoFarm"] and (v36_.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		end
	end;
	for v345, v346 in pairs(v328) do
		for v347, v348 in pairs(v346) do
			if v348["LevelReq"] == v37_ and v345 ~= "CitizenQuest" then
				v33_ = v345;
				for v349, v350 in pairs(v348["Task"]) do
					v32_ = v349;
					v35_ = string.split(v349, " [Lv. " .. v348["LevelReq"] .. "]")[1]
				end
			end
		end
	end;
	if v33_ == "MarineQuest2" then
		v33_ = "MarineQuest2"
		v34_ = 1;
		v32_ = "Chief Petty Officer"
		v35_ = "Chief Petty Officer"
		v37_ = 120
	elseif v33_ == "ImpelQuest" then
		v33_ = "PrisonerQuest"
		v34_ = 2;
		v32_ = "Dangerous Prisoner"
		v35_ = "Dangerous Prisoner"
		v37_ = 210;
		v36_ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
	elseif v33_ == "SkyExp1Quest" then
		if v34_ == 1 then
			v36_ = CFrame.new(- 4721.88867, 843.874695, - 1949.96643, 0.996191859, 0, - 0.0871884301, 0, 1, 0, 0.0871884301, 0, 0.996191859)
		elseif v34_ == 2 then
			v36_ = CFrame.new(- 7859.09814, 5544.19043, - 381.476196, - 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, - 0.422592998)
		end
	elseif v33_ == "Area2Quest" and v34_ == 2 then
		v33_ = "Area2Quest"
		v34_ = 1;
		v32_ = "Swan Pirate"
		v35_ = "Swan Pirate"
		v37_ = 775
	end;
	v32_ = v32_:sub(1, # v32_)
	if not v32_:find("Lv") then
		for v351, v352 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
			v39_ = string.match(v352.Name, "%d+")
			if v352.Name:find(v32_) and # v352.Name > # v32_ and tonumber(v39_) <= v326 + 50 then
				v32_ = v352.Name
			end
		end
	end;
	if not v32_:find("Lv") then
		for v353, v354 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
			v39_ = string.match(v354.Name, "%d+")
			if v354.Name:find(v32_) and # v354.Name > # v32_ and tonumber(v39_) <= v326 + 50 then
				v32_ = v354.Name;
				v35_ = a
			end
		end
	end;
	local v329 = {}
	local v330 = string.gsub(v32_, "Lv. ", "")
	local v331 = string.gsub(v330, "[%[%]]", "")
	local v332 = string.gsub(v331, "%d+", "")
	local v333 = string.gsub(v332, "%s+", "")
	for v355, v356 in pairs(game.Workspace.EnemySpawns:GetChildren()) do
		if v356.Name == v333 then
			table.insert(v329, v356.CFrame)
		else
			table.insert(v329, nil)
		end;
		v38_ = v329
	end;
	return {
		[1] = v34_,
		[2] = v36_,
		[3] = v32_,
		[4] = v33_,
		[5] = v37_,
		[6] = v35_,
		[7] = v38_,
		[8] = MonQ,
		[9] = MobCFrameNuber
	}
end;
print("\nCurrent Level Island : " .. v31_()[6] .. "\nCurrent Quest : " .. v31_()[5] .. "\nCurrent Level : " .. v31_()[4] .. "\n Quest Grade : " .. v31_()[1])
--skidded redz
local v64 = game:GetService("Players")
local v65 = v64.LocalPlayer
local v66 = Instance.new("Part", workspace)
v66.Size = Vector3.new(1, 1, 1)
v66.Name = "player platform ............."
v66.Anchored = true
v66.CanCollide = false
v66.CanTouch = false
v66.Transparency = 1

local v67 = workspace:FindFirstChild(v66.Name)
if v67 and v67 ~= v66 then
	v67:Destroy()
end
task.spawn(function()
	while task.wait(0.1) do
		if v66 and v66.Parent == workspace then
			if getgenv()["AutoFarm"] 
			or getgenv()["AutoNewWorld"] 
			or getgenv()["AutoSaber"] 
			or getgenv()["AutoPole"] 
			or getgenv()["AutoThirdSea"] 
			or getgenv()["AutoSwanGlasses"] 
			or getgenv()["AutoFarm"] 
			or getgenv()["AutoKenHakiV2"] 
			or getgenv()["AutoObservation"] 
			or getgenv()["AutoHolyTorch"] 
			or getgenv()["AutoFarmMaterial"] 
			or getgenv()["AutoFarmChest"] 
			or getgenv()["AutoBossSelect"] 
			or getgenv()["AutoFarmBoss"] then
				getgenv().Tween = true
			else
				getgenv().Tween = false
			end
		else
			getgenv().Tween = false
		end
	end
end)
task.spawn(function()
	repeat
		task.wait(0)
	until v65.Character and v65.Character.PrimaryPart
	v66.CFrame = v65.Character.PrimaryPart.CFrame
	while task.wait(0) do
		pcall(function()
			if getgenv().Tween then
				if v66 and v66.Parent == workspace then
					local v358 = v65.Character and v65.Character.PrimaryPart
					if v358 and (v358.Position - v66.Position).Magnitude <= 200 then
						v358.CFrame = v66.CFrame
					else
						v66.CFrame = v358.CFrame
					end
				end
				local v357 = v65.Character
				if v357 then
					for v359, v360 in pairs(v357:GetChildren()) do
						if v360:IsA("BasePart") then
							v360.CanCollide = false
						end
					end
					if v357:FindFirstChild("Stun") and v357.Stun.Value ~= 0 then
						v357.Stun.Value = 0
					end
					if v357:FindFirstChild("Busy") and v357.Busy.Value then
						v357.Busy.Value = false
					end
				end
			else
				local v361 = v65.Character
				if v361 then
					for v362, v363 in pairs(v361:GetChildren()) do
						if v363:IsA("BasePart") then
							v363.CanCollide = true
						end
					end
				end
			end
		end)
	end
end)
local v68
function v12_(v364)
	v68 = v364.p
	local v365 = v65.Character and v65.Character.PrimaryPart
	if not v365 then
		return
	end
	local v366 = (v365.Position - v364.p).Magnitude
	if v66 then
		if v366 <= 450 then
			local v367 = game:GetService("TweenService"):Create(v66, TweenInfo.new(v366 / tonumber(300 * 1.8), Enum.EasingStyle.Linear), {
				CFrame = v364
			}):Play()
		else
			local v368 = game:GetService("TweenService"):Create(v66, TweenInfo.new(v366 / 300, Enum.EasingStyle.Linear), {
				CFrame = v364
			}):Play()
		end
	end
end
function v40_(v369)
	if (v369.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
		return true
	end;
	return false
end;
function v41_(v370)
	if v370 and v370:IsA("IntValue") then
		v370.Value = 0
	end
end;
function v42_()
	local v371 = game.Players.LocalPlayer.Character;
	if v371 then
		local v372 = v371:FindFirstChild("Stun")
		if v372 then
			v372.Changed:Connect(function()
				v41_(v372)
			end)
		end
	end
end;
v42_()
------
local v69 = game:GetService("ReplicatedStorage")
task.spawn(function()
	while task.wait(.1) do
		if getgenv().Disdamage then
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
		else
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
		end
	end
end)
local v70 = game.Players.LocalPlayer;
local v71 = getupvalues(require(v70.PlayerScripts.CombatFramework))
local v72 = v71[2]
function v43_()
	local v373 = v72.activeController;
	local v374 = v373.blades[1]
	if not v374 then
		return
	end;
	while v374.Parent ~= game.Players.LocalPlayer.Character do
		v374 = v374.Parent
	end;
	return v374
end;
function v44_()
	local v375 = v72.activeController;
	for v376 = 1, 1 do
		local v377 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(v70.Character, {
			v70.Character.HumanoidRootPart
		}, 60)
		local v378 = {}
		local v379 = {}
		for v380, v381 in pairs(v377) do
			if v381.Parent:FindFirstChild("HumanoidRootPart") and not v379[v381.Parent] then
				table.insert(v378, v381.Parent.HumanoidRootPart)
				v379[v381.Parent] = true
			end
		end;
		v377 = v378;
		if # v377 > 0 then
			local v382 = debug.getupvalue(v375.attack, 5)
			local v383 = debug.getupvalue(v375.attack, 6)
			local v384 = debug.getupvalue(v375.attack, 4)
			local v385 = debug.getupvalue(v375.attack, 7)
			local v386 = (v382 * 798405 + v384 * 727595) % v383;
			local v387 = v384 * 798405
			(function()
				v386 = (v386 * v383 + v387) % 1099511627776;
				v382 = math.floor(v386 / v383)
				v384 = v386 - v382 * v383
			end)()
			v385 = v385 + 1;
			debug.setupvalue(v375.attack, 5, v382)
			debug.setupvalue(v375.attack, 6, v383)
			debug.setupvalue(v375.attack, 4, v384)
			debug.setupvalue(v375.attack, 7, v385)
			pcall(function()
				if v70.Character:FindFirstChildOfClass("Tool") and v375.blades and v375.blades[1] then
					getgenv().AnimationId = v375.animator.anims.basic[1]._Object
					getgenv().AnimationId:Play()
					getgenv().AnimationId:AdjustSpeed(0)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(v43_()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(v386 / 1099511627776 * 16777215), v385)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", v377, v376, "")
				end
			end)
		end
	end
end;
task.spawn(function()
	while task.wait() do
		if getgenv().FastAttack then
			pcall(function()
				repeat
					wait(getgenv()["FastAttackDelay"])
					v44_()
				until not getgenv().FastAttack
			end)
		end
	end
end)
game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true;
function v45_()
	if getgenv().RunSpeed then
		if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			local v388 = Instance.new("ParticleEmitter")
			v388.Acceleration = Vector3.new(0, 0, 0)
			v388.Archivable = true;
			v388.Drag = 20;
			v388.EmissionDirection = Enum.NormalId.Top;
			v388.Enabled = true;
			v388.Lifetime = NumberRange.new(0, 0)
			v388.LightInfluence = 0;
			v388.LockedToPart = true;
			v388.Name = "Agility"
			v388.Rate = 500;
			local v389 = {
				NumberSequenceKeypoint.new(0, 0);
				NumberSequenceKeypoint.new(1, 4)
			}
			v388.Size = NumberSequence.new(v389)
			v388.RotSpeed = NumberRange.new(9999, 99999)
			v388.Rotation = NumberRange.new(0, 0)
			v388.Speed = NumberRange.new(30, 30)
			v388.SpreadAngle = Vector2.new(0, 0, 0, 0)
			v388.Texture = ""
			v388.VelocityInheritance = 0;
			v388.ZOffset = 2;
			v388.Transparency = NumberSequence.new(0)
			v388.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
			v388.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		end
	else
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
		end
	end
end;
getgenv().RunSpeed = true;
task.spawn(function()
	if getgenv().RunSpeed then
		v45_()
	end
end)
local v73 = game:GetService("Players")
local v74 = v73.LocalPlayer;
getgenv().AutoRejoin = true;
task.spawn(function()
	while task.wait(.1) do
		if getgenv().AutoRejoin then
			getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v448)
				if v448.Name == 'ErrorPrompt' and v448:FindFirstChild('MessageArea') and v448.MessageArea:FindFirstChild("ErrorFrame") then
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			end)
		end
	end
end)
local v82 = 1
local v83 = 1

task.spawn(function()
	while task.wait(0.4) do
		v82 = math.random(1, 5)
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		local v449 = game.Players.LocalPlayer
		local v450 = v449.Data.Level.Value
		local v451 = v449.PlayerGui.Main.Quest
		local v452 = game:GetService("Workspace").Enemies

		pcall(function()
			if getgenv()["AutoFarm"] and getgenv()["FarmMode"] == "Farm Level" then
				if getgenv()["AutoFarmFast"] and v450 >= 15 and v450 <= 300 then
					v139_()
					return
				end

				if v451.Visible then
					local v453 = v31_()[3]
					local v454 = v452:FindFirstChild(v453)

					if v454 and v454:FindFirstChild("Humanoid") and v454:FindFirstChild("HumanoidRootPart") and v454.Humanoid.Health > 0 then
						repeat
							wait(0.1)

							if getgenv().Auto_CFrame then
								v83 = 1
							end

							if not string.find(v449.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v31_()[6]) then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							else
								v72_ = v454.HumanoidRootPart.CFrame
								v454.HumanoidRootPart.CanCollide = false
								v454.Humanoid.WalkSpeed = 0
								v454.Head.CanCollide = false
								v15_ = true
								v25_(getgenv()["SelectWeapon"])
								v454.HumanoidRootPart.Transparency = 1
								v12_(v454.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
								if not getgenv()["AutoFarm"] then
									getgenv().FastAttack = true
								end
							end
						until not getgenv()["AutoFarm"] or not v454.Parent or v454.Humanoid.Health <= 0 or not v451.Visible or not v454:FindFirstChild("HumanoidRootPart")
					else
						if getgenv().Auto_CFrame and not getgenv()["AutoFarmFast"] then
							v12_(v31_()[7][v83] * getgenv()["MethodFarm"])
							if (v31_()[7][v83].Position - v449.Character.HumanoidRootPart.Position).Magnitude <= 50 then
								v83 = (v83 >= # v31_()[7]) and 1 or v83 + 1
								wait(0.1)
							end
						else
							local v455 = v31_()[7][1] * CFrame.new(0, 30, (v82 == 1 and 20) or (v82 == 2 and -20) or (v82 == 3 and 20) or (v82 == 5 and -20) or 0)
							v12_(v455)
						end
					end
				else
					v12_(v31_()[2])
					if (v31_()[2].Position - v449.Character.HumanoidRootPart.Position).Magnitude <= 1 then
						v15_ = false
						wait(0.2)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", v31_()[4], v31_()[1])
						wait(0.1)
						v12_(v31_()[7][1] * getgenv()["MethodFarm"])
					end
				end
			end
		end)
	end
end)

task.spawn(function()
	while task.wait(.1) do
		if getgenv()["AutoStatsMelee"] then
			if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value <= 2549 then
				local v456 = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = 999
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v456))
			end
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			if v15_ then
				for v457, v458 in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v458.Name, "Boss") and (v458.HumanoidRootPart.Position - v72_.Position).magnitude <= 300 then
						if v40_(v458.HumanoidRootPart) then
							v458.HumanoidRootPart.CFrame = v72_
							v458.Humanoid.JumpPower = 0
							v458.Humanoid.WalkSpeed = 0
                            --v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v458.HumanoidRootPart.Transparency = 1
							v458.HumanoidRootPart.CanCollide = false
							v458.Head.CanCollide = false
							if v458.Humanoid:FindFirstChild("Animator") then
								v458.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 5000)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			if v15_ then
				for v459, v460 in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v460.Name, "Boss") and (v460.HumanoidRootPart.Position - v72_.Position).magnitude <= 300 then
						v460.HumanoidRootPart.CFrame = v72_
						v460.Humanoid.JumpPower = 0
						v460.Humanoid.WalkSpeed = 0
						--v.HumanoidRootPart.Size = Vector3.new(60,60,60)
						v460.HumanoidRootPart.Transparency = 1
						v460.HumanoidRootPart.CanCollide = false
						v460.Head.CanCollide = false
						--v.Humanoid:ChangeState(11)
						--v.Humanoid:ChangeState(14)
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 5000)
					end
				end
			end
		end)
	end
end)
getgenv().ChackPlayer = 0
getgenv().ChackPlayer2 = getgenv().ChackPlayer
local v84 = {}

function v73_()
	local v461 = game.Players:GetPlayers()
	local v462 = game.Players.LocalPlayer.Data.Level.Value
	local v463 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
	getgenv()["PlayersSelected"] = string.split(v463, " ")[2]
	local v464 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
	local v465 = CFrame.new(- 7719.669, 5611.423, - 1445.988)

	if getgenv()["AutoFarm"] and getgenv()["FarmMode"] == "Farm Level" and v462 >= 15 and v462 <= 69 and (v465.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.618, 5547.142, - 380.291))
	end

	if v462 >= 15 and v462 <= 69 then
		for v466, v467 in pairs(game.Workspace.Enemies:GetChildren()) do
			if v467.Name == "Royal Squad" and v467:FindFirstChild("Humanoid") and v467:FindFirstChild("HumanoidRootPart") and v467.Humanoid.Health > 0 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				repeat
					wait(0.1)
					v467.HumanoidRootPart.CanCollide = false
					v467.Humanoid.WalkSpeed = 0
					v467.Head.CanCollide = false
					v15_ = true
					v25_(getgenv()["SelectWeapon"])
					v72_ = v467.HumanoidRootPart.CFrame
					v467.HumanoidRootPart.Transparency = 1
					v12_(v467.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
					if not getgenv()["AutoFarm"] or getgenv().SuperFastAttack then
						getgenv().FastAttack = true
					end
				until not v467.Parent or not getgenv()["AutoFarm"] or v467.Humanoid.Health <= 0
				v12_(v465)
			else
				v15_ = false
				v12_(v465)
			end
		end
	elseif v462 >= 70 and v462 <= 310 then
		if not v464.Visible then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
		elseif v464.Visible and string.find(v463, "Defeat") then
			repeat
				wait(0.1)
				local v468 = game:GetService("Players")[getgenv()["PlayersSelected"]]
				if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
				end
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
				end
				v25_(getgenv()["SelectWeapon"])
				v12_(v468.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
				v468.Character.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
				if (v468.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6 then
					game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
					game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
					game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
					game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
				end
				if not getgenv()["AutoFarm"] or getgenv().SuperFastAttack then
					getgenv().FastAttack = true
				end
			until v468.Character.Humanoid.Health <= 0 or not v73_() or v462 >= 310
		end
	end
end
local v85 = 1
local v86 = {
	["Mon"] = {
		"Reborn Skeleton",
		"Demonic Soul",
		"Living Zombie",
		"Posessed Mummy"
	},
	["Boss"] = {
		"Soul Reaper"
	},
	["Item"] = "Hallow Essence"
}
local v87 = 1

function v74_()
	local v469 = {}
	for v470, v471 in ipairs(v86["Mon"]) do
		local v472 = v471:gsub("Lv. ", ""):gsub("[%[%]]", ""):gsub("%d+", ""):gsub("%s+", "")
		for v473, v474 in ipairs(game.Workspace.EnemySpawns:GetChildren()) do
			if v474.Name == v472 then
				table.insert(v469, v474.CFrame)
			end
		end
	end
	return v469
end

task.spawn(function()
	while task.wait(.1) do
		if getgenv()["AutoFarm"] and (getgenv()["FarmMode"] == "Bone" or getgenv()["Auto_Bone"]) then
			for v475, v476 in ipairs(v86["Boss"]) do
				local v477 = v86["Item"]
				local v478 = game:GetService("Workspace").Enemies
				local v479 = game:GetService("ReplicatedStorage")
				local v480 = game:GetService("Players").LocalPlayer

				if v478:FindFirstChild(v476) or v479:FindFirstChild(v476) then
					for v481, v482 in pairs(v478:GetChildren()) do
						if string.find(v482.Name, v476) and v482:FindFirstChild("Humanoid") and v482:FindFirstChild("HumanoidRootPart") and v482.Humanoid.Health > 0 then
							repeat
								wait(0.1)
								v25_(getgenv()["SelectWeapon"])
								v15_ = true
								v12_(v482.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
								if (v482.HumanoidRootPart.CFrame.Position - v480.Character.HumanoidRootPart.Position).Magnitude <= 50 then
									getgenv().FastAttack = true
								end
							until not getgenv()["AutoFarm"] or v482.Humanoid.Health <= 0 or not v482.Parent
							v15_ = false
						end
					end
				else
					local v483 = v480.Backpack
					local v484 = v480.Character
					local v485 = v480.PlayerGui.Main.Quest
					
					if v483:FindFirstChild(v477) or v484:FindFirstChild(v477) then
						v25_(v477)
						v12_(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)
					else
						if not v485.Visible and getgenv().AceetpQuestBone then
							local v486 = CFrame.new(- 9513.885, 172.131, 6073.371)
							repeat
								wait(0.1)
								v12_(v486)
							until (v486.Position - v480.Character.HumanoidRootPart.Position).Magnitude <= 2 or not getgenv().AceetpQuestBone

							local v487 = {
								"StartQuest",
								"HauntedQuest2",
								v480.Data.Level.Value <= 2049 and 1 or 2
							}
							v479.Remotes.CommF_:InvokeServer(unpack(v487))
						elseif getgenv()["AutoFarm"] and getgenv()["FarmMode"] == "Bone" or v485.Visible or not getgenv().AceetpQuestBone then
							for v488, v489 in ipairs(v86["Mon"]) do
								local v490 = {
									"Reborn Skeleton",
									"Living Zombie",
									"Demonic Soul",
									"Posessed Mummy"
								}
								for v491, v492 in pairs(v478:GetChildren()) do
									if string.find(v492.Name, v489) and v492:FindFirstChild("Humanoid") and v492:FindFirstChild("HumanoidRootPart") and v492.Humanoid.Health > 0 then
										repeat
											wait(0.1)
											v72_ = v492.HumanoidRootPart.CFrame
											v25_(getgenv()["SelectWeapon"])
											v15_ = true
											v12_(v492.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
											if (v492.HumanoidRootPart.CFrame.Position - v480.Character.HumanoidRootPart.Position).Magnitude <= 50 then
												getgenv().FastAttack = true
											end
										until not getgenv()["AutoFarm"] or v492.Humanoid.Health <= 0 or not v492.Parent
									elseif (CFrame.new(- 9513.885, 172.131, 6073.371).Position - v480.Character.HumanoidRootPart.Position).Magnitude > 1000 and not v485.Visible and getgenv().AceetpQuestBone then
										local v493 = CFrame.new(- 9513.885, 172.131, 6073.371)
										repeat
											wait(0.1)
											v12_(v493)
										until (v493.Position - v480.Character.HumanoidRootPart.Position).Magnitude <= 20 or not getgenv()["AutoFarm"]
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait(0.5) do
		if getgenv()["AutoFarm"] and getgenv()["FarmMode"] == "Cake Prince" then
			pcall(function()
				local v494 = game:GetService("Workspace")
				local v495 = game.ReplicatedStorage
				local v496 = game.Players.LocalPlayer
				local v497 = v496.Character.HumanoidRootPart.Position
				local v498 = v494.Enemies
				local v499 = v498:FindFirstChild("Cake Prince") or v495:FindFirstChild("Cake Prince")
				local v500 = v498:FindFirstChild("Dough King") or v495:FindFirstChild("Dough King")
				if v499 or v500 then
					if not v499 then
						for v501, v502 in pairs(v495:GetChildren()) do
							if v502.Name == "Cake Prince" or v502.Name == "Dough King" then
								getgenv()["FastAttackDelay"] = 0.1
								if (v502.HumanoidRootPart.CFrame.Position - v497).Magnitude > 1000 then
									getgenv().BypassTP = false
									wait(3)
									v12_(CFrame.new(- 2145.89722, 70.0088272, - 12399.6016))
									return
								end
							end
						end
					end
					for v503, v504 in pairs(v498:GetChildren()) do
						if v504.Name == "Cake Prince" and v504:FindFirstChild("Humanoid") and v504:FindFirstChild("HumanoidRootPart") and v504.Humanoid.Health > 0 then
							repeat
								wait(0.1)
								local v505 = v504.HumanoidRootPart.Position
								if (v505 - v497).Magnitude > 1000 then
									v12_(CFrame.new(- 2145.89722, 70.0088272, - 12399.6016))
									return
								end
								v25_(getgenv()["SelectWeapon"])
								getgenv().FastAttack = true
								v15_ = true
								v12_(v504.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
								sethiddenproperty(v496, "SimulationRadius", 5000)
							until not getgenv()["AutoFarm"] or not v504.Parent or v504.Humanoid.Health <= 0
						end
					end
				else
					local v506 = v495:FindFirstChild("Cake Prince") or v498:FindFirstChild("Baking Staff") or v498:FindFirstChild("Head Baker") or v498:FindFirstChild("Cake Guard") or v498:FindFirstChild("Cookie Crafter")
					if v506 then
						for v507, v508 in pairs(v498:GetChildren()) do
							if (v508.Name == "Baking Staff" or v508.Name == "Head Baker" or v508.Name == "Cake Guard" or v508.Name == "Cookie Crafter") and v508.Humanoid.Health > 0 then
								repeat
									wait(0.1)
									v72_ = v508.HumanoidRootPart.CFrame
									v25_(getgenv()["SelectWeapon"])
									getgenv().FastAttack = true
									v15_ = true
									v12_(v508.HumanoidRootPart.CFrame * getgenv()["MethodFarm"])
								until not getgenv()["AutoFarm"] or v495:FindFirstChild("Cake Prince") or not v508.Parent or v508.Humanoid.Health <= 0
							end
						end
					else
						v15_ = false
						v12_(v30_() * getgenv()["MethodFarm"])
						wait(0.5)
					end
				end
			end)
		end
	end
end)


task.spawn(function()
	while task.wait(.1) do
		if v7_ == "Melee" then
			for v509, v510 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v510.ToolTip == "Melee" then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v510.Name)) then
						getgenv()["SelectWeapon"] = v510.Name
					end
				end
			end
		elseif v7_ == "Sword" then
			for v511, v512 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v512.ToolTip == "Sword" then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v512.Name)) then
						getgenv()["SelectWeapon"] = v512.Name
					end
				end
			end
		elseif v7_ == "Fruit" then
			for v513, v514 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v514.ToolTip == "Blox Fruit" then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v514.Name)) then
						getgenv()["SelectWeapon"] = v514.Name
					end
				end
			end
		else
			for v515, v516 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v516.ToolTip == "Melee" then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v516.Name)) then
						getgenv()["SelectWeapon"] = v516.Name
					end
				end
			end
		end
	end
end)
task.spawn(function()
	while task.wait(.1) do
		if getgenv()["FastType"] then
			getgenv()["FastAttackDelay"] = tonumber(getgenv()["FastType"]) or 0.1
		end
	end
end)


-- // Set Description For Status \\ --

task.spawn(function()
	while task.wait(.1) do
		local v517 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
		v25:SetDesc("Bone : " .. v517)
		wait(.1)
	end
end)


task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			local v518 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
			if string.len(v518) == 88 then
				v26:SetDesc("Need Kill : " .. string.sub(v518, 39, 41))
			elseif string.len(v518) == 87 then
				v26:SetDesc("Need Kill : " .. string.sub(v518, 39, 40))
			elseif string.len(v518) == 86 then
				v26:SetDesc("Need Kill : " .. string.sub(v518, 39, 39))
			else
				v26:SetDesc("Boss Is Spawning..")
			end;
		end)
	end
end)


task.spawn(function()
	while task.wait(.1) do
		if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
			v28:SetDesc("Status : Spawned🟢")
		else
			v28:SetDesc("Status : Not Spawn Yet🔴")
		end
	end
end)


task.spawn(function()
	while task.wait(.1) do
		pcall(function()
			v27:SetDesc("Killed : " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
		end)
	end
end)