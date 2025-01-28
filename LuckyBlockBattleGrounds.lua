local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

local Window = Library:AddWindow({
	title = {"Luck Block Battle Grounds", "By Yeahyeah1234"},
	theme = {
		Accent = Color3.fromRGB(199, 0, 217)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})


local MainTab = Window:AddTab("Main", {default = false})
local MainSection = MainTab:AddSection("Main", {default = false})

local PlayerTab = Window:AddTab("Player", {default = false})
local PlayerSection = PlayerTab:AddSection("Movement", {default = false})

local AllPlayers = {}
for i,v in pairs(game.Players:GetPlayers()) do
    table.insert(AllPlayers, v.Name)
end
local PlayerDropdown = MainSection:AddDropdown("Teleport to Players", AllPlayers, {default = ""}, function(selected)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selected].Character.HumanoidRootPart.CFrame
end)

local GalaxyLuckyBlockButton = MainSection:AddButton("Get Galaxy Block Items", function()
    game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
end)

local RainbowLuckyBlockButton = MainSection:AddButton("Get Rainbow Block Items", function()
    game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
end)

local DiamondLuckyBlockButton = MainSection:AddButton("Get Diamond Block Items", function()
    game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
end)

local Super LuckyBlockButton = MainSection:AddButton("Get Super Lucky Block Items", function()
    game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
end)

local LuckyBlockButton = MainSection:AddButton("Get Lucky Block Items", function()
    game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
end)

local KillPlayersButton = MainSection:AddButton("Press a Few Times To Kill All Players (HexSplitter required)", function()
    local AllPlayers = {}
    for i,v in pairs(game.Players:GetPlayers()) do
        table.insert(AllPlayers, v.Name)
    end

    for i,v in AllPlayers do
        local args = {
            [1] = "RayHit",
            [2] = {
                ["Position"] = Vector3.new(-919.9605102539062, 191.46726989746094, -171.5617218017578),
                ["Hit"] = game.Players[tostring(v)].Character.HumanoidRootPart
            }
        }

        game:GetService("Players").LocalPlayer.Character.HexSpitter.Remotes.ServerControl:InvokeServer(unpack(args))
    end
end)

---------------------------------------------------------------------
local WalkSpeedSlider = PlayerSection:AddSlider("WalkSpeed", 16, 500, 1, {toggleable = true, default = true, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

local JumpPowerSlider = PlayerSection:AddSlider("JumpPower", 50, 500, 1, {toggleable = true, default = true, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
end)