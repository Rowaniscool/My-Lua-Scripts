local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

local Window = Library:AddWindow({
	title = {"Clicker Madness", "By Yeahyeah1234"},
	theme = {
		Accent = Color3.fromRGB(255, 0, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})


local MainTab = Window:AddTab("Main", {default = false})
local MainSection = MainTab:AddSection("AutoFarm", {default = false})
local UpgradeSection = MainTab:AddSection("Buy Upgrades", {default = false})
local BossSection = MainTab:AddSection("Farm Boss", {default = false})
local KillSection = MainTab:AddSection("Kill Player", {default = false})

local PlayerTab = Window:AddTab("Player", {default = false})
local PlayerSection = PlayerTab:AddSection("Movement", {default = false})

local TeleportTab = Window:AddTab("Locations", {default = false})
local WorldSection = TeleportTab:AddSection("World", {default = false})
local PlayerTPSection = TeleportTab:AddSection("Players", {default = false})

local MiscTab = Window:AddTab("Misc", {default = false})
local MiscSection = MiscTab:AddSection("General", {default = false})
local SettingSection = MiscTab:AddSection("GUI Settings", {default = false})

----------------------------------MAIN----------------------------------

local multiplier = 1
local MultiplierSlider = MainSection:AddSlider("Multiplier", 1, 11, 1, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
    multiplier = val
end)

local ClickToggle = MainSection:AddToggle("Auto Click + Beast", {flag = "Toggle_Flag", default = false}, function(v)
	    getgenv().AutoClick = v
        while getgenv().AutoClick do
            local args = {
                [1] = multiplier
            }
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.BeastModeService.Begin:FireServer()
            wait(0.001)
    end
end)

local RebirthLabel = MainSection:AddLabel("--Rebirth--")

local RebirthAmount = ""
local Box = MainSection:AddBox("Rebirth Amount", {fireonempty = true}, function(text)
	RebirthAmount = text
end)


local RebirthToggle = MainSection:AddToggle("Rebirth", {flag = "Toggle_Flag", default = false}, function(v)
    getgenv().AutoRebirth = v
    while getgenv().AutoRebirth do
        local args = {
            [1] = tonumber(RebirthAmount)
        }

        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuyRebirths:FireServer(unpack(args))
        wait(0.01)
    end
end)

local SuperRebirthAmount = ""
local Box = MainSection:AddBox("Super Rebirth Amount", {fireonempty = true}, function(text)
	RebirthAmount = text
end)


local SuperRebirthToggle = MainSection:AddToggle("Super Rebirth", {flag = "Toggle_Flag", default = false}, function(v)
    getgenv().AutoSuperRebirth = v
    while getgenv().AutoSuperRebirth do
        local args = {
            [1] = 1
        }
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.RebirthService.BuySuperRebirths:FireServer(unpack(args))
        wait(0.01)
    end
end)

local HatchLabel = MainSection:AddLabel("--Hatching--")

local SelectedEgg = ""
local EggDropdown = MainSection:AddDropdown("Eggs", {"basic", "lava", "desert", "ocean", "winter", "toxic", "candy", "forest", "storm", "blocks", "space", "dominus", "infinity", "future", "city", "moon", "fire", "halloween"}, {default = ""}, function(selected)
	SelectedEgg = selected
end)

local EggToggle = MainSection:AddToggle("Auto Hatch Egg", {flag = "Toggle_Flag", default = false}, function(v)
    getgenv().AutoHatch = v
    while getgenv().AutoHatch do
        local args = {
            [1] = SelectedEgg
        }
        
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.EggService.Purchase:FireServer(unpack(args))
        wait(0.1)
    end
end)

local EggButton = MainSection:AddButton("Hatch Egg", function()
	local args = {
        [1] = SelectedEgg
    }
        
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.EggService.Purchase:FireServer(unpack(args))
end)

NormalUpgrade = ""
local UpgradeDropdown = UpgradeSection:AddDropdown("Upgrades", {"ClickMultiply", "CursorDamage", "WalkSpeed", "PetStorage", "Health", "JumpPower"}, {default = ""}, function(selected)
	NormalUpgrade = selected
end)

local UpgradeButton = UpgradeSection:AddButton("Upgrade", function()
    local args = {
        [1] = NormalUpgrade
    }
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.UpgradeService.BuyUpgrade:FireServer(unpack(args))
end)

local SuperUpgradeLabel = MainSection:AddLabel("--Super Upgrades--")

SuperUpgrade = ""
local SuperUpgradeDropdown = UpgradeSection:AddDropdown("Super Upgrades", {"BossHit", "DoubleDamage", "DoubleHealth", "PetSlots", "PetStorage"}, {default = ""}, function(selected)
	SuperUpgrade = selected
end)

local UpgradeButton = UpgradeSection:AddButton("Super Upgrade", function()
    local args = {
        [1] = SuperUpgrade
    }
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.SuperUpgradeService.BuyUpgrade:FireServer(unpack(args))
end)

local BossToggle = BossSection:AddToggle("Boss Farm", {flag = "Toggle_Flag", default = false}, function(v)
    getgenv().BossFarm = v
    while getgenv().BossFarm do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ScriptObjects.BossTitle.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        local args = {
            [1] = "Zombie"
        }
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.CursorCannonService.FireBoss:FireServer(unpack(args))
        wait(0.01)
    end
end)


local AllPlayers = {}
for i, v in pairs(game.Players:GetPlayers()) do
    table.insert(AllPlayers, v.Name)
end

local PlayerToKill = ""
local UpgradeDropdown = KillSection:AddDropdown("Players", AllPlayers, {default = ""}, function(selected)
    PlayerToKill = selected
end)

local KillToggle = KillSection:AddToggle("Kill Player", {flag = "Toggle_Flag", default = false}, function(v)
    getgenv().AutoKill = v
    while getgenv().AutoKill do

        local targetPlayer = game.Players:FindFirstChild(PlayerToKill)
        local targetPosition = targetPlayer.Character.HumanoidRootPart.CFrame

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPosition + Vector3.new(0, 5, 0)
        local args = {
        [1] = targetPlayer
        }
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.CursorCannonService.FireCursor:FireServer(unpack(args))
        wait(0.01)
        
    end
end)
----------------------------------PLAYER----------------------------------

local WalkSpeedSlider = PlayerSection:AddSlider("WalkSpeed", 16, 500, 1, {toggleable = true, default = true, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

local JumpPowerSlider = PlayerSection:AddSlider("JumpPower", 50, 500, 1, {toggleable = true, default = true, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
end)

----------------------------------LOCATIONS----------------------------------


local LocationDropdown = WorldSection:AddDropdown("Worlds", {"Spawn","Lava", "Desert", "Ocean", "Winter", "Toxic", "Candy", "Forest", "Storm", "Blocks", "Space", "Dominus", "Infinity", "Future", "City", "Moon", "Fire"}, {default = ""}, function(selected)
    if selected == "Lava" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Lava.Teleport.CFrame
    elseif selected == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Desert.Teleport.CFrame
    elseif selected == "Ocean" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Ocean.Teleport.CFrame
    elseif selected == "Winter" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Winter.Teleport.CFrame
    elseif selected == "Toxic" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Toxic.Teleport.CFrame
    elseif selected == "Candy" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Candy.Teleport.CFrame
    elseif selected == "Forest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Forest.Teleport.CFrame
    elseif selected == "Storm" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Storm.Teleport.CFrame
    elseif selected == "Blocks" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Blocks.Teleport.CFrame
    elseif selected == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Space.Teleport.CFrame
    elseif selected == "Dominus" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Dominus.Teleport.CFrame
    elseif selected == "Infinity" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Infinity.Teleport.CFrame
    elseif selected == "Future" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Future.Teleport.CFrame
    elseif selected == "City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.City.Teleport.CFrame
    elseif selected == "Moon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Moon.Teleport.CFrame
    elseif selected == "Fire" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds.Fire.Teleport.CFrame
    elseif selected == "Spawn" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(515, 8.9, -384)
    end
end)

local LocationDropdown = WorldSection:AddDropdown("Other Location", {"King Of The Hill", "Boss Spawn", "Leader Boards", "Dungeon"}, {default = ""}, function(selected)
    if selected == "King Of The Hill" then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ScriptObjects.KOTH.CFrame
    elseif selected == "Boss Spawn" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ScriptObjects.BossTitle.CFrame
    elseif selected == "Leader Boards" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(503, 8.9, -397)
    elseif selected == "Dungeon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Dungeon.Map.Model.Teleport.CFrame
    end
end)
local PlayersTeleport = {}
for i, v in pairs(game.Players:GetPlayers()) do
    table.insert(PlayersTeleport, v.Name)
end

local PlayerDropdown = PlayerTPSection:AddDropdown("Players", PlayersTeleport, {default = ""}, function(selected)
    local targetPlayer = game.Players:FindFirstChild(selected)
    local targetPosition = targetPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPosition
end)

----------------------------------MISC----------------------------------

local FlagButton = MiscSection:AddButton("Claim All Flags", function()
    local FlagLocations = {
        Vector3.new(-301.997406, 7.798141, 2152.86108, 1.47223473e-05, 0.944749177, -0.327794015, -0.99999994, 1.47223473e-05, -2.47359276e-06, 2.47359276e-06, 0.327794015, 0.944749236),
        Vector3.new(1735.28333, 2.24814081, 3291.16992, 1.47223473e-05, 0.944749177, -0.327794015, -0.99999994, 1.47223473e-05, -2.47359276e-06, 2.47359276e-06, 0.327794015, 0.944749236),
        Vector3.new(2919.91455, 4.93814182, -816.359558, -1.8954277e-05, -0.327786177, -0.944751978, -1, 1.8954277e-05, 1.3500452e-05, 1.3500452e-05, 0.944751978, -0.327786207),
        Vector3.new(2212.75928, 5.24814177, 1043.27039, -2.18153e-05, -0.858350158, -0.513064325, -1, 2.17556953e-05, 6.02006912e-06, 6.02006912e-06, 0.513064325, -0.858350277),
        Vector3.new(1046.99951, 2.04814315, 555.040283, 4.04119492e-05, 0.513037324, -0.858366489, -1.00000012, 4.04119492e-05, -2.30073929e-05, 2.30073929e-05, 0.858366489, 0.513037205),
        Vector3.new(-2301.39087, 2.25287294, 453.040466, 4.04119492e-05, 0.513037324, -0.858366489, -1.00000012, 4.04119492e-05, -2.30073929e-05, 2.30073929e-05, 0.858366489, 0.513037205),
        Vector3.new(-1814.16101, 1.91287184, -702.139893, -4.05311584e-05, -0.513037205, 0.858366311, -1, 4.06503677e-05, -2.30073929e-05, -2.30073929e-05, -0.858366311, -0.513037205),
        Vector3.new(-1759.52087, 2.61287212, -2078.69922, -2.18153e-05, -0.858350158, -0.513064325, -1, 2.17556953e-05, 6.02006912e-06, 6.02006912e-06, 0.513064325, -0.858350277),
        Vector3.new(-329.491058, 4.85287237, -2670.04028, -2.18153e-05, -0.858350158, -0.513064325, -1, 2.17556953e-05, 6.02006912e-06, 6.02006912e-06, 0.513064325, -0.858350277),
        Vector3.new(1353.96899, 1.83287394, -2213.5708, 4.04119492e-05, 0.513037324, -0.858366489, -1.00000012, 4.04119492e-05, -2.30073929e-05, 2.30073929e-05, 0.858366489, 0.513037205),
        Vector3.new(607.371033, 16.8682938, -232.948502, -4.05311584e-05, 0.500061035, 0.865990162, -1, -4.05311584e-05, -2.33948231e-05, 2.33948231e-05, -0.865990162, 0.500061035),
        Vector3.new(576.760803, 19.4701462, -1383.16907, -5.36441803e-06, -0.923601389, 0.383354396, -1, 5.36441803e-06, -1.07288361e-06, -1.07288361e-06, -0.383354396, -0.923601389),
        Vector3.new(429.855042, 19.4701462, -420.414368, -1.91926956e-05, -0.078424722, -0.99691999, -1, 1.91926956e-05, 1.77323818e-05, 1.77323818e-05, 0.99691999, -0.0784246922),
        Vector3.new(442.098175, 19.4701462, -1324.03174, 7.62939453e-06, 0.424398363, -0.905475736, -1.00000024, 7.62939453e-06, -4.97698784e-06, 4.97698784e-06, 0.905475736, 0.424398184),
        Vector3.new(660.070312, 19.4701462, -477.722534, 1.95503235e-05, -0.824143708, 0.566380858, -1.00000012, -1.96695328e-05, 6.07967377e-06, 6.07967377e-06, -0.566380858, -0.824143648),
        Vector3.new(1039.84668, 8.73729992, 2203.76538, 4.75645065e-05, 0.720817685, 0.693124712, -1, 4.75645065e-05, 1.9133091e-05, -1.9133091e-05, -0.693124712, 0.720817685),
        Vector3.new(2217.03442, 19.4701462, -1837.12085, 2.62260437e-05, -0.86849308, -0.495701194, -1, -2.62260437e-05, -6.95884228e-06, -6.95884228e-06, 0.495701194, -0.86849308),
        Vector3.new(-2361.88086, 2.28287458, 2957.1626, -1.2755394e-05, 0.819186091, 0.573527873, -1, -1.2755394e-05, -3.9935112e-06, 3.9935112e-06, -0.573527873, 0.819186032),
        Vector3.new(-2415.49683, 2.23287416, 1974.59644, 4.2617321e-05, 0.906304121, -0.422626197, -1, 4.2617321e-05, -9.46223736e-06, 9.46223736e-06, 0.422626197, 0.906304121)
    }

    for i,v in ipairs(FlagLocations) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v) + Vector3.new(0,1,0)
        wait(8)
    end
end)

local ChestButton = MiscSection:AddButton("Open Daily Chest", function()
	local args = {
    [1] = "daily1"
    }
    
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ChestService.OpenChest:FireServer(unpack(args))
end)

local Bind = SettingSection:AddBind("Bind", Enum.KeyCode.RightControl, {toggleable = true, default = false, flag = "Bind_Flag"}, function(keycode)
	Window:SetKey(keycode)
end)

local Picker = SettingSection:AddPicker("Color Picker", {color = Color3.fromRGB(255, 0, 0)}, function(color)
	Window:SetAccent(color)
end)