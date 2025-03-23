local message = "CrackWare"

print("========================")
print("===    " .. message .. "    ===")
print("========================")

warn("CrackWare is running...")

loadstring(game:HttpGet("https://raw.githubusercontent.com/lakysq/EasyAntyRpgg/refs/heads/main/RPGEASY", true))()

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/SerenityHUB/Fluent/master/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

    local Window = Fluent:CreateWindow({
    Title = "CrackWare | War Tycoon",
    SubTitle = "Made by pixel",
    TabWidth = 160,
    Size = UDim2.fromOffset(720, 460), 
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightAlt
})

    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "" }),
        Tycoons = Window:AddTab({ Title = "Tycoons", Icon = ""}),
		Teleports = Window:AddTab({ Title = "Teleports", Icon = ""}),
        Fly = Window:AddTab({ Title = "Fly", Icon = ""}),
        Combats = Window:AddTab({ Title = "Combats", Icon = ""}),
        Visual = Window:AddTab({ Title = "Visual", Icon = ""}),
        ViewModels = Window:AddTab({ Title = "ViewModels", Icon = ""}),
        Extra = Window:AddTab({ Title = "Extra", Icon = ""}),
        Settings = Window:AddTab({ Title = "Settings", Icon = "" })
    }


    local Options = Fluent.Options


        Tabs.Main:AddParagraph({
            Title = "Humanoid",
            Content = ""
        })


    local Toggle = Tabs.Main:AddToggle("InfJump", {Title = "Infinite Jump", Default = false })

local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local infJumpEnabled = false 
local connection 

local function enableInfJump()
    if not connection then
        connection = UserInputService.JumpRequest:Connect(function()
            if Player.Character then
                local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        print("[InfJump] Enabled ")
    end
end

local function disableInfJump()
    if connection then
        connection:Disconnect()
        connection = nil
        print("[InfJump] Disabled ")
    end
end

Toggle:OnChanged(function(state)
    infJumpEnabled = state
    if infJumpEnabled then
        enableInfJump()
    else
        disableInfJump()
    end
end)

Options.InfJump:SetValue(false)


        
        
        local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "Speed",
        Default = 16,
        Min = 0,
        Max = 300, 
        Rounding = 1,
        Callback = function(Value)
            local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = Value
        end
        })

		Tabs.Main:AddButton({
			Title = "No lag",
			Description = "",
			Callback = function()
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1

for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
    elseif v:IsA("Decal") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    end
end

for _, v in ipairs(Lighting:GetDescendants()) do
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v.Enabled = false
    end
end

workspace.DescendantAdded:Connect(function(child)
    task.defer(function()
        if child:IsA("ForceField") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire") then
            child:Destroy()
        end
    end)
end)

			end
		})

		Tabs.Main:AddButton({
			Title = "Rejoin",
			Description = "",
			Callback = function()
			local TeleportService = game:GetService("TeleportService")
			local Players = game:GetService("Players")

			local function rejoinSameServer()
    		local player = Players.LocalPlayer
    		local placeId = game.PlaceId
    		local jobId = game.JobId
    
    
    		TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
			end

			rejoinSameServer()
			end
		})


		Tabs.Main:AddButton({
			Title = "Anti Laser",
			Description = "You can only see these lasers, but you can easily pass through them",
			Callback = function()
                for k, v in pairs(Workspace.Tycoon.Tycoons:GetChildren()) do
                    for x, y in pairs(v.PurchasedObjects:GetChildren()) do
                        if (y.Name:find("Door") or y.Name:find("Gate")) then
                            y:destroy();
                        end;
                    end
                end
			end
		})


		
        Tabs.Main:AddButton({
            Title = "NofallDamage",
            Description = "",
            Callback = function()
    local function safeDestroy(parent, childName, notFoundMessage)
        local child = parent:FindFirstChild(childName)
        if child then
            child:Destroy()
            print(childName .. " Eshkereeee")
        else
            print(notFoundMessage or (childName .. " Eshkereeee"))
        end
    end

    local replicatedStorage = game:GetService("ReplicatedStorage")
    safeDestroy(replicatedStorage, "Freefall", "Freefall не найден в ReplicatedStorage")
    local acsEngine = replicatedStorage:FindFirstChild("ACS_Engine")
    if acsEngine then
        local events = acsEngine:FindFirstChild("Events")
        if events then
            safeDestroy(events, "FDMG", "FDMG не найден в ACS_Engine -> Events")
        else
            print("Events не найден в ACS_Engine")
        end
    else
        print("ACS_Engine не найден в ReplicatedStorage")
    end
            end
        })
        
        Tabs.Main:AddButton({
            Title = "3 ebalo",
            Description = "",
            Callback = function()
                local player = game.Players.LocalPlayer

    local function ensureThirdPerson()
        if player.CameraMode == Enum.CameraMode.LockFirstPerson then
            player.CameraMode = Enum.CameraMode.Classic
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom 
        end
    end

    if not player then
        repeat
            task.wait()
            player = game.Players.LocalPlayer
        until player
    end

    ensureThirdPerson()

    player:GetPropertyChangedSignal("CameraMode"):Connect(function()
        ensureThirdPerson()
    end)
            end
        })
        Tabs.Main:AddButton({
        Title = "Inf camera zoom",
        Description = "",
        Callback = function()
        local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function setInfiniteZoom()
    LocalPlayer.CameraMaxZoomDistance = math.huge
end

setInfiniteZoom()

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5) 
    setInfiniteZoom()
end)

        end
    })

		Tabs.Main:AddButton({
			Title = "Target GUI",
			Description = "ID War Tycoon | 4639625707",
			Callback = function()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local GUI = Instance.new("Frame")
GUI.Size = UDim2.new(0, 563, 0, 365)
GUI.Position = UDim2.new(0.285, 0, 0.269, 0)
GUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GUI.Parent = screenGui

local Title = Instance.new("Frame")
Title.Size = UDim2.new(0, 563, 0, 64) 
Title.Position = UDim2.new(0.285, 0, 0.208, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.6  
Title.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.Parent = Title

local TargetGUI = Instance.new("TextLabel")
TargetGUI.Size = UDim2.new(0, 100, 0, 31)
TargetGUI.Position = UDim2.new(0.41, 0, 0, 0)
TargetGUI.BackgroundTransparency = 1
TargetGUI.Text = "Target Gui"
TargetGUI.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetGUI.TextSize = 14
TargetGUI.Font = Enum.Font.SourceSansBold 
TargetGUI.Parent = Title 

local MadeByPixel = Instance.new("TextLabel")
MadeByPixel.Size = UDim2.new(0, 100, 0, 19)
MadeByPixel.Position = UDim2.new(0.41, 0, 0.346, 0)
MadeByPixel.BackgroundTransparency = 1
MadeByPixel.Text = "Made By Pixel"
MadeByPixel.TextColor3 = Color3.fromRGB(255, 255, 255)
MadeByPixel.TextSize = 14
MadeByPixel.Font = Enum.Font.SourceSansBold 
MadeByPixel.Parent = Title

local TargetScript1 = Instance.new("TextLabel")
TargetScript1.Size = UDim2.new(0, 100, 0, 31)
TargetScript1.Position = UDim2.new(0.11, 0, 1.141, 0)
TargetScript1.BackgroundTransparency = 1
TargetScript1.Text = "Target Script"
TargetScript1.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetScript1.TextSize = 14
TargetScript1.Font = Enum.Font.SourceSansBold 
TargetScript1.Parent = Title

local TargetScript2 = Instance.new("TextLabel")  
TargetScript2.Size = UDim2.new(0, 100, 0, 31)
TargetScript2.Position = UDim2.new(0.675, 0, 1.141, 0)
TargetScript2.BackgroundTransparency = 1
TargetScript2.Text = "Target List"
TargetScript2.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetScript2.TextSize = 14
TargetScript2.Font = Enum.Font.SourceSansBold  
TargetScript2.Parent = Title

local Fon = Instance.new("TextLabel")
Fon.Size = UDim2.new(0, 486, 0, 260)
Fon.Position = UDim2.new(0.073, 0, 1.64, 0)
Fon.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
Fon.Text = ""
Fon.TextColor3 = Color3.fromRGB(2, 2, 2)
Fon.Font = Enum.Font.SourceSansBold  
Fon.Parent = Title

local FonUiCorner = Instance.new("UICorner")
FonUiCorner.Parent = Fon

local Nemo = Instance.new("TextLabel")
Nemo.Size = UDim2.new(0, 100, 0, 22)
Nemo.Position = UDim2.new(0.675, 0, 1.703, 0)
Nemo.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
Nemo.BorderColor3 = Color3.fromRGB(23, 23, 23)
Nemo.Text = "s1mpleboy123 - nemo"
Nemo.TextSize = 14
Nemo.TextColor3 = Color3.fromRGB(177, 177, 177)
Nemo.Font = Enum.Font.SourceSansBold  
Nemo.Parent = Title

local proryv = Instance.new("TextLabel")
proryv.Size = UDim2.new(0, 100, 0, 22)
proryv.Position = UDim2.new(0.675, 0, 2.047, 0)
proryv.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
proryv.BorderColor3 = Color3.fromRGB(23, 23, 23)
proryv.Text = "LayzyFn - proryv"
proryv.TextSize = 14
proryv.TextColor3 = Color3.fromRGB(177, 177, 177)
proryv.Font = Enum.Font.SourceSansBold  
proryv.Parent = Title

local JoR1ck = Instance.new("TextLabel")
JoR1ck.Size = UDim2.new(0, 100, 0, 22)
JoR1ck.Position = UDim2.new(0.675, 0, 2.391, 0)
JoR1ck.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
JoR1ck.BorderColor3 = Color3.fromRGB(23, 23, 23)
JoR1ck.Text = "lura_466 - JoR1ck"
JoR1ck.TextSize = 14
JoR1ck.TextColor3 = Color3.fromRGB(177, 177, 177)
JoR1ck.Font = Enum.Font.SourceSansBold  
JoR1ck.Parent = Title

local anla9k = Instance.new("TextLabel")
anla9k.Size = UDim2.new(0, 100, 0, 22)
anla9k.Position = UDim2.new(0.675, 0, 2.734, 0)
anla9k.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
anla9k.BorderColor3 = Color3.fromRGB(23, 23, 23)
anla9k.Text = "Dima84124 - anla9k"
anla9k.TextSize = 14
anla9k.TextColor3 = Color3.fromRGB(177, 177, 177)
anla9k.Font = Enum.Font.SourceSansBold  
anla9k.Parent = Title

local b1ida = Instance.new("TextLabel")
b1ida.Size = UDim2.new(0, 100, 0, 22)
b1ida.Position = UDim2.new(0.675, 0, 3.078, 0)
b1ida.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
b1ida.BorderColor3 = Color3.fromRGB(23, 23, 23)
b1ida.Text = "MaL4iK_MaZeRaTe - b1ida"
b1ida.TextSize = 14
b1ida.TextColor3 = Color3.fromRGB(177, 177, 177)
b1ida.Font = Enum.Font.SourceSansBold  
b1ida.Parent = Title

local fimakr = Instance.new("TextLabel")
fimakr.Size = UDim2.new(0, 100, 0, 22)
fimakr.Position = UDim2.new(0.675, 0, 3.422, 0)
fimakr.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
fimakr.BorderColor3 = Color3.fromRGB(23, 23, 23)
fimakr.Text = "FimaKr09 - fimakr"
fimakr.TextSize = 14
fimakr.TextColor3 = Color3.fromRGB(177, 177, 177)
fimakr.Font = Enum.Font.SourceSansBold  
fimakr.Parent = Title

local gameid = Instance.new("TextBox")
gameid.Size = UDim2.new(0, 127, 0, 29)
gameid.Position = UDim2.new(0.088, 0, 2.201, 0)
gameid.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
gameid.BorderColor3 = Color3.fromRGB(23, 23, 23)
gameid.Text = "Place ID" 
gameid.TextColor3 = Color3.fromRGB(178, 178, 178) 
gameid.Parent = Title

local username = Instance.new("TextBox")
username.Size = UDim2.new(0, 127, 0, 29)
username.Position = UDim2.new(0.088, 0, 1.748, 0)
username.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
username.BorderColor3 = Color3.fromRGB(23, 23, 23)
username.Text = "@Username" 
username.TextColor3 = Color3.fromRGB(178, 178, 178) 
username.Parent = Title


local function ClearTextBox(textbox, defaultText)
    textbox.Focused:Connect(function()
        if textbox.Text == defaultText then
            textbox.Text = ""
            textbox.TextColor3 = Color3.fromRGB(255, 255, 255) 
        end
    end)
    
    textbox.FocusLost:Connect(function()
        if textbox.Text == "" then
            textbox.Text = defaultText
            textbox.TextColor3 = Color3.fromRGB(178, 178, 178) 
        end
    end)
end

ClearTextBox(gameid, "Place ID")
ClearTextBox(username, "Username")

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 35, 0, 31)
close.Position = UDim2.new(0.936, 0, -0.122, 0)
close.BackgroundColor3 = Color3.fromRGB(177, 177, 177)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 30
close.Font = Enum.Font.SourceSansBold
close.Parent = GUI

close.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)


local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local gameid = Instance.new("TextBox")
gameid.Size = UDim2.new(0, 127, 0, 29)
gameid.Position = UDim2.new(0.088, 0, 2.201, 0)
gameid.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
gameid.BorderColor3 = Color3.fromRGB(23, 23, 23)
gameid.Text = "Place ID"
gameid.TextColor3 = Color3.fromRGB(178, 178, 178)
gameid.Parent = Title

local username = Instance.new("TextBox")
username.Size = UDim2.new(0, 127, 0, 29)
username.Position = UDim2.new(0.088, 0, 1.748, 0)
username.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
username.BorderColor3 = Color3.fromRGB(23, 23, 23)
username.Text = "@Username"
username.TextColor3 = Color3.fromRGB(178, 178, 178)
username.Parent = Title

local function ClearTextBox(textbox, defaultText)
    textbox.Focused:Connect(function()
        if textbox.Text == defaultText then
            textbox.Text = ""
            textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)

    textbox.FocusLost:Connect(function()
        if textbox.Text == "" then
            textbox.Text = defaultText
            textbox.TextColor3 = Color3.fromRGB(178, 178, 178)
        end
    end)
end

ClearTextBox(gameid, "Place ID")
ClearTextBox(username, "@Username")

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 112, 0, 28)
StartButton.Position = UDim2.new(0.115, 0, 2.734, 0)
StartButton.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
StartButton.BorderColor3 = Color3.fromRGB(23, 23, 23)
StartButton.Text = "Click To Start Search Target"
StartButton.TextColor3 = Color3.fromRGB(177, 177, 177)
StartButton.TextSize = 14
StartButton.Font = Enum.Font.SourceSansBold
StartButton.Parent = Title

local searching = false

local function HttpGet(url)
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    return success and result or nil
end

local function Status(text)
    StartButton.Text = text
    task.delay(3, function()
        if StartButton.Text == text then
            StartButton.Text = "Click To Start Search Target"
        end
    end)
end

local function getServers(id, cursor)
    local url = "https://games.roblox.com/v1/games/" .. id .. "/servers/Public?limit=100"
    if cursor then
        url = url .. "&cursor=" .. cursor
    end
    return HttpGet(url)
end

local function teleport(placeId, guid)
    TeleportService:TeleportToPlaceInstance(placeId, guid, Players.LocalPlayer)
end

StartButton.MouseButton1Click:Connect(function()
    if searching then
        searching = false
        Status("Canceled")
        return
    end

    local placeId = tonumber(gameid.Text) 
    local targetUsername = username.Text  

    if not placeId then
        return Status("Invalid Place ID!")
    end
    if targetUsername == "" or targetUsername == "@Username" then
        return Status("Enter Username!")
    end

    searching = true
    Status("Fetching player ID...")

    local success, userId = pcall(function()
        return Players:GetUserIdFromNameAsync(targetUsername)
    end)

    if not success or not userId then
        searching = false
        return Status("Player not found!")
    end

    Status("Searching for player (" .. userId .. ")...")
    local cursor
    local serverList = {}

    while searching do
        local data = getServers(placeId, cursor)
        if not data or not data.data then
            searching = false
            return Status("Error fetching servers!")
        end

        for _, server in ipairs(data.data) do
            if server.id and server.playing > 0 then
                table.insert(serverList, server.id)
            end
        end

        cursor = data.nextPageCursor
        if not cursor then break end
        task.wait(1)
    end

    if #serverList == 0 then
        searching = false
        return Status("No servers found!")
    end

    Status("Checking servers...")

    for _, serverId in ipairs(serverList) do
        if not searching then return end

        teleport(placeId, serverId)

        local maxWaitTime = 10
        local found = false

        for i = 1, maxWaitTime do
            if not searching then return end
            
            for _, player in ipairs(Players:GetPlayers()) do
                if player.UserId == userId then
                    found = true
                    searching = false
                    Status("Player found! ✅")
                    return
                end
            end

            task.wait(1)
        end

        if not found then
            Status("Not here, checking next...")
        end
    end

    searching = false
    return Status("Player not found in servers!")
end)

			end
		})

        

        Tabs.Teleports:AddButton({
        Title = "Teleport | ctrl + Mouse1Click",
        Description = "Distances greater than 3000 studs are not teleported to for saving.",
        Callback = function()
            local UserInputService = game:GetService("UserInputService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local MAX_DISTANCE = 3000

            local function toggleDamageProtection(character, protect)
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    if protect then
                        humanoid:SetAttribute("NoDamage", true)
                    else
                        humanoid:SetAttribute("NoDamage", false)
                    end
                end
            end

            local function teleportToMouse()
                local mouse = LocalPlayer:GetMouse()
                local character = LocalPlayer.Character

                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    local currentPosition = humanoidRootPart.Position
                    local targetPosition = mouse.Hit.p

                    local distance = (targetPosition - currentPosition).Magnitude
                    if distance <= MAX_DISTANCE then

                        toggleDamageProtection(character, true)

                        humanoidRootPart.CFrame = CFrame.new(targetPosition)

                        toggleDamageProtection(character, false)
                    else
                        warn("Distances greater than 3000 studs are not teleported to for saving.")
                    end
                end
            end

            UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    teleportToMouse()
                end
            end) 
        end 
    })

    local Input = Tabs.Teleports:AddInput("Input", {
    Title = "Teleport to Player",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "Enter Name...",
    Callback = function(Value)
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer 

        if not Value or Value == "" then
            warn("Enter name player")
            return
        end

        local targetPlayer = nil
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name:lower() == Value:lower() then
                targetPlayer = player
                break
            end
        end

        if not targetPlayer then
            warn("player " .. Value .. " Not found")
            return
        end

        local targetCharacter = targetPlayer.Character
        local localCharacter = localPlayer.Character

        if targetCharacter and localCharacter then
            local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
            local localRoot = localCharacter:FindFirstChild("HumanoidRootPart")

            if targetRoot and localRoot then
                localRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0) 
                print("teleported to" .. targetPlayer.Name)
            else
                warn("Failed to find HumanoidRootPart!")
            end
        else
            warn("player dont have humanoid lox")
        end
    end
})

    Tabs.Teleports:AddButton({
	Title = "Alpha",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1127.65759, 64.9999695, -4625.14502, 0.971414387, 4.37177192e-08, 0.237390086, -1.74242594e-08, 1, -1.12858729e-07, -0.237390086, 1.05496248e-07, 0.971414387)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Bravo",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-246.867355, 64.9999847, -4744.6499, 0.999873161, -2.60599387e-09, 0.0159270614, 4.01510869e-09, 1, -8.84410269e-08, -0.0159270614, 8.84937563e-08, 0.999873161)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Charlie",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(780.177856, 66.9999695, -4554.39551, 0.96430552, 6.9545516e-09, -0.264792144, 2.04475082e-13, 1, 2.62649351e-08, 0.264792144, -2.5327477e-08, 0.96430552)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Delta",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1934.40186, 66.9999695, -3829.53296, 0.706679523, 3.07617256e-08, -0.707533777, -2.13870206e-11, 1, 4.34560334e-08, 0.707533777, -3.06943555e-08, 0.706679523)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Echo",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2591.99658, 66.9999771, -2931.4458, 0.366751939, -1.47487498e-08, -0.930318773, -4.41158205e-13, 1, -1.585361e-08, 0.930318773, 5.81475268e-09, 0.366751939)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Foxtrot",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2874.02637, 66.9999847, -1761.13477, -0.0758419782, 9.6938706e-08, -0.997119844, 2.59807605e-12, 1, 9.72185106e-08, 0.997119844, 7.37065387e-09, -0.0758419782)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Golf",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3184.71948, 66.9999771, -536.342957, -0.030095581, -4.38030234e-08, -0.999547005, 3.02745893e-13, 1, -4.38228831e-08, 0.999547005, -1.31917777e-09, -0.030095581)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Hotel",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3108.33691, 66.9999771, 588.776611, -0.169170573, 5.49059607e-08, -0.985586762, 1.35979295e-13, 1, 5.57088811e-08, 0.985586762, 9.42416989e-09, -0.169170573)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Juliet",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2787.39355, 66.9999695, 1782.74011, -0.291530579, -5.35900142e-08, -0.956561506, -4.97980726e-13, 1, -5.60234419e-08, 0.956561506, -1.63320699e-08, -0.291530579)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Kilo",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2392.77734, 67.2972488, 2853.41626, -0.49742201, -1.31921296e-09, -0.867508709, -9.44088151e-14, 1, -1.52063717e-09, 0.867508709, -7.56316454e-10, -0.49742201)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Lima",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(829.887024, 66.9999695, 3338.7146, -0.327652693, -2.80577037e-08, -0.944798231, 2.52922994e-09, 1, -3.05741601e-08, 0.944798231, -1.24073178e-08, -0.327652693)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Omega",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-355.676514, 66.9999695, 3749.54102, -0.999987543, 9.92128255e-12, -0.0049886452, -7.01814856e-11, 1, 1.6056843e-08, 0.0049886452, 1.6056994e-08, -0.999987543)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Romeo",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1421.13037, 66.9999771, 3541.24072, -0.887257516, -2.92807947e-08, 0.461274445, 3.68070673e-13, 1, 6.3478744e-08, -0.461274445, 5.63221612e-08, -0.887257516)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Sierra",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2422.73511, 66.9999771, 2397.44995, -0.701951921, -6.08555517e-09, 0.712224364, 2.9463606e-12, 1, 8.54733972e-09, -0.712224364, 6.00191985e-09, -0.701951921)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Tango",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2870.41284, 66.9999695, 1382.82275, -0.561316371, 8.67727579e-08, 0.827601314, 5.10610235e-11, 1, -1.04813864e-07, -0.827601314, -5.87914819e-08, -0.561316371)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Yankee",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3452.67822, 67.0635681, 531.434753, -0.529557049, -7.69421593e-09, 0.84827435, -3.37554183e-14, 1, 9.07041287e-09, -0.84827435, 4.803272e-09, -0.529557049)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Victor",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3786.59937, 64.9999847, -366.570251, -0.278832614, -2.62085074e-08, 0.960339725, 3.44937024e-13, 1, 2.72909713e-08, -0.960339725, 7.60994467e-09, -0.278832614)
  	end    
})

    Tabs.Teleports:AddButton({
	Title = "Zulu",
    Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3867.22217, 64.9999695, -1365.61926, 0.0119220912, 7.72118156e-08, 0.999928951, -1.64763159e-09, 1, -7.71976616e-08, -0.999928951, -7.27156946e-10, 0.0119220912)
  	end    
})


Tabs.Tycoons:AddButton({
    Title = "Teleport to Oil Capture 1",
    Description = "",
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(-1208.1964111328125,	72.9034423828125, -1873.2877197265625))
    end
})

Tabs.Tycoons:AddButton({
    Title = "Teleport to Oil Capture 2",
    Description = "", 
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(668.802978515625,	125.74710845947266, 774.5590209960938))
    end
})

Tabs.Tycoons:AddButton({
    Title = "Teleport to Oil Capture 3",
    Description = "", 
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(-1683.39697265625,	125.74710845947266, -3536.2412109375))
    end
})

Tabs.Tycoons:AddButton({
    Title = "Teleport to Oil Capture 4",
    Description = "", 
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(-3526.697021484375,	125.74710845947266, -2661.2412109375))
    end
})


Tabs.Tycoons:AddButton({
    Title = "Teleport to Oil Capture 5",
    Description = "", 
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(-968.9966430664062,	74.82612609863281, -811.82763671875))
    end
})

Tabs.Tycoons:AddButton({
    Title = "Teleport to Capture Point",
    Description = "", 
    Callback = function()
        local function teleportPlayer(player, position)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
            end
            end
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer  
            teleportPlayer(player, Vector3.new(-653.8825073242188,	121.41300582885742, -1257.492919921875)) 
    end
})

    Tabs.Combats:AddParagraph({
        Title = "Aimbot",
        Content = ""
    })
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    
    local AimbotEnabled = false
    local WallCheckEnabled = false
    local AimbotLocked = false
    local LockedTarget = nil
    local SelectedPart = "Head"
    local AimbotFOV = 100
    local TeamCheckEnabled = true 
    
    local ToggleAimbot = Tabs.Combats:AddToggle("AimbotEnabled", {Title = "Aimbot Enabled", Default = false})
    local ToggleWallCheck = Tabs.Combats:AddToggle("WallCheck", {Title = "Wall Check", Default = false})
    local ToggleTeamCheck = Tabs.Combats:AddToggle("TeamCheck", {Title = "Team Check", Default = true}) 
    
    local Slider = Tabs.Combats:AddSlider("AimbotFOV", {
        Title = "Aimbot FOV Circle",
        Min = 10,
        Max = 285,
        Default = 100,
        Rounding = 1
    })
    
    local Dropdown = Tabs.Combats:AddDropdown("AimbotParts", {
        Title = "Aimbot Parts",
        Values = {"Head", "Torso", "Left Leg", "Right Leg"},
        Multi = false,
        Default = "Head",
    })
    
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Visible = false
    FOVCircle.Thickness = 2
    FOVCircle.Filled = false
    FOVCircle.Color = Color3.fromRGB(255, 255, 255)
    FOVCircle.Transparency = 1
                       
    local function updateAimbot()
        if AimbotEnabled then
            FOVCircle.Visible = true
            FOVCircle.Radius = AimbotFOV
        else
            FOVCircle.Visible = false
            AimbotLocked = false
            LockedTarget = nil
        end
    end
    
    local function isTargetVisible(targetPart)
        if not WallCheckEnabled then return true end 
    
        local origin = Camera.CFrame.Position
        local direction = (targetPart.Position - origin).unit * (targetPart.Position - origin).Magnitude
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastParams.IgnoreWater = true 
    
        local result = workspace:Raycast(origin, direction, raycastParams)
    
        return result == nil or result.Instance:IsDescendantOf(targetPart.Parent)
    end
    
    local function findClosestTarget()
        local closestTarget = nil
        local shortestDistance = AimbotFOV
    
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                if TeamCheckEnabled and player.Team == LocalPlayer.Team then
                    continue 
                end
                
                local targetPart = player.Character:FindFirstChild(SelectedPart)
    
                if targetPart then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
    
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
    
                        if distance < shortestDistance and (not WallCheckEnabled or isTargetVisible(targetPart)) then
                            shortestDistance = distance
                            closestTarget = player
                        end
                    end
                end
            end
        end
    
        return closestTarget
    end
    
    local function aimAtTarget(target)
        if target and target.Character then
            local targetPart = target.Character:FindFirstChild(SelectedPart)
            if targetPart then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
            end
        end
    end
    
    ToggleAimbot:OnChanged(function(state)
        AimbotEnabled = state
        updateAimbot()
    end)
    
    ToggleWallCheck:OnChanged(function(state)
        WallCheckEnabled = state
    end)
    
    ToggleTeamCheck:OnChanged(function(state)
        TeamCheckEnabled = state
    end)
    
    Slider:OnChanged(function(Value)
        AimbotFOV = Value
        updateAimbot()
    end)
    
    Dropdown:OnChanged(function(Value)
        SelectedPart = Value
    end)
    
    RunService.RenderStepped:Connect(function()
        if AimbotEnabled then
            FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
            if AimbotLocked and LockedTarget then
                aimAtTarget(LockedTarget)
            end
        end
    end)
    
    UserInputService.InputBegan:Connect(function(input, isProcessed)
        if not isProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotEnabled then
            local target = findClosestTarget()
            if target then
                AimbotLocked = true
                LockedTarget = target
                print("🎯 Аимбот зафиксирован на цели:", target.Name)
            else
                print("🚫 Нет доступных целей!")
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, isProcessed)
        if not isProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotEnabled then
            AimbotLocked = false
            LockedTarget = nil
            print("🔓 Аимбот отключен")
        end
    end)


    Tabs.Combats:AddParagraph({
        Title = "Triggerbot Settings",
        Content = ""
    })

 local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService('RunService')

local isTriggerbotActive = false
local triggerbotDelay = 0
local hitChance = 100  

local Toggle = Tabs.Combats:AddToggle("Triggerbot", {Title = "Triggerbot", Default = false})

local DelaySlider = Tabs.Combats:AddSlider("TriggerbotDelay", {
    Title = "Triggerbot Delay",
    Description = "Time before a shot is taken (in seconds)",
    Default = 0,
    Min = 0,
    Max = 4,
    Rounding = 2,
    Callback = function(Value)
        triggerbotDelay = Value
    end
})

local HitChanceSlider = Tabs.Combats:AddSlider("HitChance", {
    Title = "Hit Chance",
    Description = "Chance to fire when an enemy is targeted",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        hitChance = Value
    end
})

local function shouldShoot()
    return math.random(0, 100) <= hitChance
end

local function startTriggerbot()
    while isTriggerbotActive do
        RunService.RenderStepped:Wait()

        if Mouse.Target then
            local character = Mouse.Target:FindFirstAncestorOfClass('Model')

            if character and character:FindFirstChild('Head') and shouldShoot() then
                task.wait(triggerbotDelay)
                mouse1click()  
            end
        end
    end
end

Toggle:OnChanged(function(state)
    isTriggerbotActive = state

    if isTriggerbotActive then
        print("✅ Triggerbot enabled | Delay:", triggerbotDelay, "Hit Chance:", hitChance, "%")
        task.spawn(startTriggerbot)
    else
        print("❌ Triggerbot disabled")
    end
end)

Tabs.Combats:AddParagraph({
    Title = "Triggerbot Settings",
    Content = "Adjust delay and hit chance to control behavior."
})

    Tabs.Combats:AddParagraph({
        Title = "Spinbot Settings",
        Content = ""
    })

    local Slider = Tabs.Combats:AddSlider("Slider", {
        Title = "Spinbot",
        Description = "Speed",
        Default = 0,
        Min = 0,
        Max = 50,
        Rounding = 2,
        Callback = function(Value)
            SpinSpeed = tonumber(Value) or 0

    if spinningConnection then
        spinningConnection:Disconnect()
        spinningConnection = nil
    end

    local function updateSpinning()
        if SpinSpeed > 0 then
            spinningConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                local radiansPerSecond = SpinSpeed * 1 * math.pi

                local rotation = CFrame.Angles(0, radiansPerSecond * deltaTime, 0)
                humanoidRootPart.CFrame = humanoidRootPart.CFrame * rotation
            end)
        end
    end

    updateSpinning()
        end
    })

local Players = game:GetService("Players")
local ESPObjects = {}
local espEnabled = false

local Toggle = Tabs.Visual:AddToggle("Player", {Title = "Player | ESP", Default = false })

local TColorpicker = Tabs.Visual:AddColorpicker("TransparencyColorpicker", {
    Title = "Player Color",
    Default = Color3.fromRGB(255, 255, 255)
})

local function getESPColor()
    return TColorpicker.Value
end

local function createESP(player)
    if player == Players.LocalPlayer then return end 

    if not ESPObjects[player] then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = getESPColor()
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.FillTransparency = 0.1 -- Делаем ESP более ярким
        highlight.OutlineTransparency = 0 -- Четкий контур
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
        highlight.Name = "ESP"
        highlight.Parent = player.Character or nil

        ESPObjects[player] = highlight
    end

    player.CharacterAdded:Connect(function(character)
        ESPObjects[player].Parent = character
    end)
end

local function removeAllESP()
    for _, highlight in pairs(ESPObjects) do
        if highlight then
            highlight:Destroy()
        end
    end
    ESPObjects = {}
end

Toggle:OnChanged(function(state)
    espEnabled = state

    if espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                createESP(player)
            end
        end
    else
        removeAllESP()
    end
end)

TColorpicker:OnChanged(function()
    for _, highlight in pairs(ESPObjects) do
        if highlight then
            highlight.FillColor = getESPColor()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    if espEnabled then
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        ESPObjects[player]:Destroy()
        ESPObjects[player] = nil
    end
end)

        
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local Toggle = Tabs.Visual:AddToggle("Line", {Title = "Line | Esp", Default = false })
local TColorpicker = Tabs.Visual:AddColorpicker("LineColorpicker", {
    Title = "Line Color",
    Default = Color3.fromRGB(255, 255, 255)
})

local Tracers = {}
local TracersEnabled = false
local Connection

local function createTracer()
    local tracer = Drawing.new("Line")
    tracer.Thickness = 2
    tracer.Transparency = 1
    tracer.Visible = false
    return tracer
end

local function removeTracer(player)
    if Tracers[player] then
        Tracers[player]:Remove()
        Tracers[player] = nil
    end
end

local function updateTracers()
    if not TracersEnabled then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

            if not Tracers[player] then
                Tracers[player] = createTracer()
            end

            local tracer = Tracers[player]
            tracer.Color = TColorpicker.Value

            if onScreen then
                tracer.Visible = true
                tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y) 
                tracer.To = Vector2.new(screenPos.X, screenPos.Y)
            else
                tracer.Visible = false
            end
        else
            removeTracer(player)
        end
    end
end

Toggle:OnChanged(function(state)
    TracersEnabled = state

    if state then
        Connection = RunService.RenderStepped:Connect(updateTracers)

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                Tracers[player] = createTracer()
            end
        end

        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function()
                if TracersEnabled then
                    Tracers[player] = createTracer()
                end
            end)
        end)

        Players.PlayerRemoving:Connect(removeTracer)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Died:Connect(function()
                        removeTracer(player)
                    end)
                end
            end
        end
    else
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end

        for _, tracer in pairs(Tracers) do
            tracer:Remove()
        end
        Tracers = {}
    end
end)

TColorpicker:OnChanged(function()
    for _, tracer in pairs(Tracers) do
        if tracer then
            tracer.Color = TColorpicker.Value
        end
    end
end)


            

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Toggle = Tabs.Visual:AddToggle("NameDistance", {Title = "Name/Distance | ESP", Default = false })
local ColorPicker = Tabs.Visual:AddColorpicker("TextColorPicker", {
    Title = "Name/Distance Color",
    Default = Color3.fromRGB(255, 255, 255)
})

local ESPColor = ColorPicker.Value
local NameTags = {}
local NameDistanceEnabled = false
local Connection

local function createNameTag(player)
    if player == Players.LocalPlayer or not player.Character then return end

    local head = player.Character:FindFirstChild("Head")
    if not head then return end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "NameTag"
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Adornee = head

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = ESPColor
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Text = player.Name
    textLabel.Parent = billboardGui

    billboardGui.Parent = head
    NameTags[player] = {Gui = billboardGui, Label = textLabel}
end

local function removeNameTag(player)
    if NameTags[player] then
        NameTags[player].Gui:Destroy()
        NameTags[player] = nil
    end
end

local function updateNameTags()
    if not NameDistanceEnabled then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and NameTags[player] then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local distance = (Players.LocalPlayer.Character.HumanoidRootPart.Position - head.Position).Magnitude
                NameTags[player].Label.Text = player.Name .. " | " .. math.floor(distance) .. "m"
            end
        end
    end
end

Toggle:OnChanged(function(state)
    NameDistanceEnabled = state

    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                createNameTag(player)
            end
        end

        Connection = RunService.RenderStepped:Connect(updateNameTags)

        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function()
                createNameTag(player)
            end)
        end)

        Players.PlayerRemoving:Connect(removeNameTag)
    else
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end

        for _, tag in pairs(NameTags) do
            tag.Gui:Destroy()
        end
        NameTags = {}
    end
end)

ColorPicker:OnChanged(function(color)
    ESPColor = color
    for _, tag in pairs(NameTags) do
        tag.Label.TextColor3 = color
    end
end)



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESPObjects = {}
local ESPEnabled = false
local BoxThickness = 1
local HPBarThickness = 2

local Toggle = Tabs.Visual:AddToggle("ESP_Toggle", {Title = "HP/Box | ESP", Default = false})

local function createESP(player)
    if player == LocalPlayer then return end 
    if ESPObjects[player] then return end  

    local Box = Drawing.new("Square")
    local BoxOutline = Drawing.new("Square")
    local HPBar = Drawing.new("Line")
    local HPBarOutline = Drawing.new("Line")

    BoxOutline.Color = Color3.new(0, 0, 0)
    BoxOutline.Thickness = 3
    BoxOutline.Filled = false

    Box.Color = Color3.new(1, 1, 1)
    Box.Thickness = BoxThickness
    Box.Filled = false

    HPBarOutline.Color = Color3.new(0, 0, 0)
    HPBarOutline.Thickness = 4

    HPBar.Thickness = HPBarThickness

    ESPObjects[player] = {Box, BoxOutline, HPBar, HPBarOutline}

    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        createESP(player)
    end)
end

local function removeESP(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            if obj then obj:Remove() end
        end
        ESPObjects[player] = nil
    end
end

local function updateESP()
    if not ESPEnabled then
        for _, objects in pairs(ESPObjects) do
            for _, obj in pairs(objects) do
                obj.Visible = false
            end
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end 

        local objects = ESPObjects[player]
        if not objects then continue end 

        local Box, BoxOutline, HPBar, HPBarOutline = unpack(objects)

        local character = player.Character
        if not character then continue end 

        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if not rootPart or not head or not humanoid or humanoid.Health <= 0 then
            Box.Visible = false
            BoxOutline.Visible = false
            HPBar.Visible = false
            HPBarOutline.Visible = false
            continue
        end

        local rootPos, onScreen1 = Camera:WorldToViewportPoint(rootPart.Position)
        local headPos, onScreen2 = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
        local legPos, onScreen3 = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

        if onScreen1 and onScreen2 and onScreen3 then
            local boxHeight = math.abs(headPos.Y - legPos.Y)
            local boxWidth = boxHeight / 2.2

            Box.Size = Vector2.new(boxWidth, boxHeight)
            Box.Position = Vector2.new(rootPos.X - boxWidth / 2, rootPos.Y - boxHeight / 2)
            Box.Visible = true

            BoxOutline.Size = Box.Size + Vector2.new(3, 3)
            BoxOutline.Position = Box.Position - Vector2.new(1.5, 1.5)
            BoxOutline.Visible = true

            local hpPercent = humanoid.Health / humanoid.MaxHealth
            local barHeight = boxHeight * hpPercent
            local barX = Box.Position.X - 6

            HPBarOutline.From = Vector2.new(barX, Box.Position.Y)
            HPBarOutline.To = Vector2.new(barX, Box.Position.Y + Box.Size.Y)
            HPBarOutline.Visible = true

            HPBar.From = Vector2.new(barX, Box.Position.Y + (Box.Size.Y - barHeight))
            HPBar.To = Vector2.new(barX, Box.Position.Y + Box.Size.Y)
            HPBar.Color = Color3.fromRGB(255 * (1 - hpPercent), 255 * hpPercent, 0)
            HPBar.Visible = true
        else
            Box.Visible = false
            BoxOutline.Visible = false
            HPBar.Visible = false
            HPBarOutline.Visible = false
        end
    end
end

Toggle:OnChanged(function(state)
    ESPEnabled = state
    if ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            createESP(player)
        end
    else
        for _, objects in pairs(ESPObjects) do
            for _, obj in pairs(objects) do
                obj.Visible = false
            end
        end
    end
end)

RunService.RenderStepped:Connect(updateESP)

Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ViewDirectionObjects = {}
local ViewDirectionEnabled = false
local ViewDirectionColor = Color3.fromRGB(255, 255, 255) 

local Toggle = Tabs.Visual:AddToggle("ViewDirectionESP", {Title = "View Direction | ESP", Default = false})
local ColorPicker = Tabs.Visual:AddColorpicker("ViewDirectionColor", {
    Title = "View Direction Color",
    Default = ViewDirectionColor
})

ColorPicker:OnChanged(function(color)
    ViewDirectionColor = color
    for _, line in pairs(ViewDirectionObjects) do
        line.Color = color
    end
end)

local function createViewDirectionESP(player)
    if player == LocalPlayer or ViewDirectionObjects[player] then return end 

    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Color = ViewDirectionColor
    line.Transparency = 1
    line.Visible = false
    ViewDirectionObjects[player] = line
end

local function removeViewDirectionESP(player)
    if ViewDirectionObjects[player] then
        ViewDirectionObjects[player]:Remove() -- Удаляем объект
        ViewDirectionObjects[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not ViewDirectionEnabled then return end

    for player, line in pairs(ViewDirectionObjects) do
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            local rootPart = character:FindFirstChild("HumanoidRootPart")

            if head and rootPart then
                local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                local lookVector = rootPart.CFrame.LookVector * 10
                local endPos, onScreen2 = Camera:WorldToViewportPoint(head.Position + lookVector)

                if onScreen and onScreen2 then
                    line.From = Vector2.new(headPos.X, headPos.Y)
                    line.To = Vector2.new(endPos.X, endPos.Y)
                    line.Visible = true
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        else
            removeViewDirectionESP(player) 
        end
    end
end)

Toggle:OnChanged(function(state)
    ViewDirectionEnabled = state

    if not state then
        for _, line in pairs(ViewDirectionObjects) do
            line.Visible = false
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            createViewDirectionESP(player)
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createViewDirectionESP(player)
    end)
end)

Players.PlayerRemoving:Connect(removeViewDirectionESP)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local SkeletonESPObjects = {}
local SkeletonESPEnabled = false
local SkeletonESPColor = Color3.fromRGB(255, 255, 255)

local Toggle = Tabs.Visual:AddToggle("SkeletonESP", {Title = "Skeleton | ESP", Default = false})
local ColorPicker = Tabs.Visual:AddColorpicker("SkeletonESPColor", {
    Title = "Skeleton ESP Color",
    Default = SkeletonESPColor
})

ColorPicker:OnChanged(function(color)
    SkeletonESPColor = color
    for _, bones in pairs(SkeletonESPObjects) do
        for _, line in pairs(bones) do
            line.Color = color
        end
    end
end)

local function createSkeletonESP(player)
    if player == LocalPlayer or SkeletonESPObjects[player] then return end 

    SkeletonESPObjects[player] = {}

    local bones = {
        "Head", "UpperTorso", "LowerTorso",
        "LeftUpperArm", "LeftLowerArm", "LeftHand",
        "RightUpperArm", "RightLowerArm", "RightHand",
        "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
        "RightUpperLeg", "RightLowerLeg", "RightFoot"
    }

    for _, bone in pairs(bones) do
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Color = SkeletonESPColor
        line.Transparency = 1
        line.Visible = false
        SkeletonESPObjects[player][bone] = line
    end
end

local function removeSkeletonESP(player)
    if SkeletonESPObjects[player] then
        for _, line in pairs(SkeletonESPObjects[player]) do
            line:Remove()
        end
        SkeletonESPObjects[player] = nil
    end
end

local function getBonePos(character, boneName)
    local part = character:FindFirstChild(boneName)
    if part then
        local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
        return Vector2.new(pos.X, pos.Y), onScreen
    end
    return nil, false
end

RunService.RenderStepped:Connect(function()
    if not SkeletonESPEnabled then return end

    for player, bones in pairs(SkeletonESPObjects) do
        local character = player.Character
        if character then
            local function drawBone(startBone, endBone)
                local startPos, onScreen1 = getBonePos(character, startBone)
                local endPos, onScreen2 = getBonePos(character, endBone)

                local line = bones[startBone]
                if startPos and endPos and onScreen1 and onScreen2 then
                    line.From = startPos
                    line.To = endPos
                    line.Color = SkeletonESPColor 
                    line.Visible = true
                else
                    line.Visible = false
                end
            end

            drawBone("Head", "UpperTorso")
            drawBone("UpperTorso", "LowerTorso")

            drawBone("UpperTorso", "LeftUpperArm")
            drawBone("LeftUpperArm", "LeftLowerArm")
            drawBone("LeftLowerArm", "LeftHand")

            drawBone("UpperTorso", "RightUpperArm")
            drawBone("RightUpperArm", "RightLowerArm")
            drawBone("RightLowerArm", "RightHand")

            drawBone("LowerTorso", "LeftUpperLeg")
            drawBone("LeftUpperLeg", "LeftLowerLeg")
            drawBone("LeftLowerLeg", "LeftFoot")

            drawBone("LowerTorso", "RightUpperLeg")
            drawBone("RightUpperLeg", "RightLowerLeg")
            drawBone("RightLowerLeg", "RightFoot")
        end
    end
end)

Toggle:OnChanged(function(state)
    SkeletonESPEnabled = state
    if not state then
        for _, bones in pairs(SkeletonESPObjects) do
            for _, line in pairs(bones) do
                line.Visible = false
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            createSkeletonESP(player)
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createSkeletonESP(player)
    end)
end)

Players.PlayerRemoving:Connect(removeSkeletonESP)

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        createSkeletonESP(player)
    end
    player.CharacterAdded:Connect(function()
        createSkeletonESP(player)
    end)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local WeaponESPObjects = {}
local WeaponESPEnabled = false
local WeaponESPColor = Color3.fromRGB(255, 255, 255)

local Toggle = Tabs.Visual:AddToggle("WeaponESP", {Title = "Weapon | ESP", Default = false})
local ColorPicker = Tabs.Visual:AddColorpicker("WeaponESPColor", {
    Title = "Weapon ESP Color",
    Default = WeaponESPColor
})

ColorPicker:OnChanged(function(color)
    WeaponESPColor = color
end)

local function createWeaponESP(player)
    if player == LocalPlayer then return end 

    local character = player.Character
    if not character then return end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then return end

    if not WeaponESPObjects[player] then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "WeaponESP"
        billboardGui.Adornee = rootPart
        billboardGui.AlwaysOnTop = true
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, -3, 0)

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.Parent = billboardGui

        WeaponESPObjects[player] = {
            gui = billboardGui,
            label = textLabel
        }

        billboardGui.Parent = rootPart
    end
end

local function updateWeaponESP()
    for player, esp in pairs(WeaponESPObjects) do
        if not WeaponESPEnabled then
            esp.gui.Enabled = false
        else
            local character = player.Character
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            local tool = character and character:FindFirstChildOfClass("Tool")

            if rootPart and tool then
                esp.gui.Adornee = rootPart
                esp.gui.StudsOffset = Vector3.new(0, -3, 0)
                esp.label.Text = "Weapon: " .. tool.Name
                esp.label.TextColor3 = WeaponESPColor
                esp.gui.Enabled = true
            else
                esp.gui.Enabled = false
            end
        end
    end
end

RunService.RenderStepped:Connect(updateWeaponESP)

local function removeWeaponESP(player)
    if WeaponESPObjects[player] then
        WeaponESPObjects[player].gui:Destroy()
        WeaponESPObjects[player] = nil
    end
end

Toggle:OnChanged(function(state)
    WeaponESPEnabled = state
    if not state then
        for _, esp in pairs(WeaponESPObjects) do
            esp.gui.Enabled = false
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            createWeaponESP(player)
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createWeaponESP(player)
    end)
end)

Players.PlayerRemoving:Connect(removeWeaponESP)

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        createWeaponESP(player)
    end
    player.CharacterAdded:Connect(function()
        createWeaponESP(player)
    end)
end

local Toggle = Tabs.Main:AddToggle("Fly", {Title = "Fly", Default = false})

local Slider = Tabs.Main:AddSlider("FlySpeed", {
    Title = "Fly Speed",
    Description = "Choose Fly Speed",
    Default = 0,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        _G.FlySpeed = Value * 5 
    end
})

_G.FlySpeed = 0 
_G.FlyEnabled = false 
local flyingUp = false
local flyingDown = false
local bodyVelocity
local bodyGyro

local function toggleFly(state)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")

    if state then
        _G.FlyEnabled = true
        humanoid.PlatformStand = true
        
        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = rootPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.CFrame = rootPart.CFrame
            bodyGyro.Parent = rootPart
        end

        if not _G.FlyLoop then
            _G.FlyLoop = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
                if not _G.FlyEnabled then
                    if _G.FlyLoop then
                        _G.FlyLoop:Disconnect()
                        _G.FlyLoop = nil
                    end
                    return
                end

                local moveDirection = humanoid.MoveDirection
                local verticalMovement = 0

                if flyingUp then
                    verticalMovement = _G.FlySpeed
                elseif flyingDown then
                    verticalMovement = -_G.FlySpeed
                end

                bodyVelocity.Velocity = moveDirection * _G.FlySpeed + Vector3.new(0, verticalMovement, 0)
                bodyGyro.CFrame = rootPart.CFrame  
            end)
        end
    else
        _G.FlyEnabled = false
        humanoid.PlatformStand = false
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end

        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end

        if _G.FlyLoop then
            _G.FlyLoop:Disconnect()
            _G.FlyLoop = nil
        end
    end
end

Toggle:OnChanged(function(value)
    toggleFly(value)
end)

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.E then
        flyingUp = true
    elseif input.KeyCode == Enum.KeyCode.Q then
        flyingDown = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        flyingUp = false
    elseif input.KeyCode == Enum.KeyCode.Q then
        flyingDown = false
    end
end)


local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

_G.CarFlySpeed = 100
_G.CarFlyEnabled = false
local flyingUp = false
local flyingDown = false
local alignOrientation
local bodyVelocity
local bodyGyro  

local Toggle = Tabs.Fly:AddToggle("CarFly", {Title = "Car Fly", Default = false})
local Slider = Tabs.Fly:AddSlider("CarFlySpeed", {
    Title = "Car Fly Speed",
    Description = "Choose Fly Speed",
    Default = 20,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(Value)
        _G.CarFlySpeed = Value * 5 
    end
})

local function getVehicle()
    if character and character:FindFirstChildOfClass("Humanoid") then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.SeatPart and humanoid.SeatPart:IsA("VehicleSeat") then
            return humanoid.SeatPart.Parent
        end
    end
    return nil
end

local function toggleCarFly(state)
    local vehicle = getVehicle()
    if not vehicle then return end

    local primaryPart = vehicle.PrimaryPart or vehicle:FindFirstChildWhichIsA("BasePart")
    if not primaryPart then return end

    if state then
        _G.CarFlyEnabled = true

        if not bodyVelocity then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = primaryPart
        end

        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.CFrame = primaryPart.CFrame
            bodyGyro.Parent = primaryPart
        end

        if not alignOrientation then
            alignOrientation = Instance.new("AlignOrientation")
            alignOrientation.MaxTorque = math.huge
            alignOrientation.RigidityEnabled = true
            alignOrientation.Attachment0 = primaryPart:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", primaryPart)
            alignOrientation.Parent = primaryPart
        end

        if not _G.CarFlyLoop then
            _G.CarFlyLoop = RunService.Heartbeat:Connect(function()
                if not _G.CarFlyEnabled then
                    if _G.CarFlyLoop then
                        _G.CarFlyLoop:Disconnect()
                        _G.CarFlyLoop = nil
                    end
                    return
                end

                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local moveDirection = humanoid.MoveDirection
                local verticalMovement = (flyingUp and _G.CarFlySpeed or 0) - (flyingDown and _G.CarFlySpeed or 0)

                bodyVelocity.Velocity = moveDirection * _G.CarFlySpeed + Vector3.new(0, verticalMovement, 0)

                vehicle:SetPrimaryPartCFrame(primaryPart.CFrame)
            end)
        end
    else
        _G.CarFlyEnabled = false

        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end

        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end

        if alignOrientation then
            alignOrientation:Destroy()
            alignOrientation = nil
        end

        if _G.CarFlyLoop then
            _G.CarFlyLoop:Disconnect()
            _G.CarFlyLoop = nil
        end
    end
end

Toggle:OnChanged(function(value)
    toggleCarFly(value)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        flyingUp = true
    elseif input.KeyCode == Enum.KeyCode.Q then
        flyingDown = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        flyingUp = false
    elseif input.KeyCode == Enum.KeyCode.Q then
        flyingDown = false
    end
end)






local Toggle = Tabs.ViewModels:AddToggle("Color Sky/Sea", {Title = "Color Sky/Sea", Default = false})

local TColorpicker = Tabs.ViewModels:AddColorpicker("SkySeaColorpicker", {
    Title = "Sky/Sea Color",
    Description = "Change the color of the sky and sea.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local skyObject = Lighting:FindFirstChildOfClass("Sky")

local function updateColors(color)
    if Terrain then Terrain.WaterColor = color end
    if skyObject then
        Lighting.ColorShift_Top = color
        Lighting.ColorShift_Bottom = color
    end
end

TColorpicker:OnChanged(function()
    if Toggle.Value then
        updateColors(TColorpicker.Value)
    end
end)

Toggle:OnChanged(function(state)
    if state then
        updateColors(TColorpicker.Value)
    else
        if Terrain then Terrain.WaterColor = Color3.fromRGB(38, 124, 180) end
        if skyObject then
            Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
            Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        end
    end
end)



local Toggle = Tabs.ViewModels:AddToggle("120 FOV", {Title = "120 FOV", Default = false})
local Camera = workspace.CurrentCamera

local TargetFOV = 120
local isZoomActive = false
local connection 

local function updateFOV()
    if isZoomActive then
        Camera.FieldOfView = TargetFOV
    end
end

Toggle:OnChanged(function(state)
    isZoomActive = state

    if isZoomActive then
        Camera.FieldOfView = TargetFOV
        connection = game:GetService("RunService").RenderStepped:Connect(updateFOV) 
    else
        if connection then
            connection:Disconnect() 
            connection = nil
        end
    end
end)


local Toggle = Tabs.Extra:AddToggle("Javelin Spam", {Title = "Javelin Spam", Default = false})
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local maxDistance = 3000  
local fireRate = 0.002  
local isFiring = false
local javelinSpamEnabled = false
local isHoldingG = false

local function getPlayersInRadius()
    local targets = {}

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude

            if distance <= maxDistance then
                table.insert(targets, rootPart.Position)
            end
        end
    end

    return targets
end

local function fireJavelin(targetPosition)
    if not targetPosition then return end

    local javelin = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Javelin")
    if not javelin then return end

    local direction = (targetPosition - Camera.CFrame.Position).unit

    local rocketData = {
        ["expShake"] = {["fadeInTime"] = 0.05, ["magnitude"] = 3, ["rotInfluence"] = {0.4, 0, 0.4}, ["fadeOutTime"] = 0.5, ["posInfluence"] = {1, 1, 0}, ["roughness"] = 3},
        ["gravity"] = Vector3.new(0, -20, 0),
        ["HelicopterDamage"] = 1000,
        ["FireRate"] = 15,
        ["VehicleDamage"] = 700,
        ["ExpName"] = "Javelin",
        ["RocketAmount"] = 1000,
        ["ExpRadius"] = 15,
        ["BoatDamage"] = 600,
        ["TankDamage"] = 600,
        ["Acceleration"] = 15,
        ["ShieldDamage"] = 15000,
        ["Distance"] = 400000,
        ["PlaneDamage"] = 800,
        ["GunshipDamage"] = 400,
        ["velocity"] = 300,
        ["ExplosionDamage"] = 2500
    }

    pcall(function()
        ReplicatedStorage.RocketSystem.Events.FireRocket:InvokeServer(direction, javelin, javelin, targetPosition)
        ReplicatedStorage.RocketSystem.Events.FireRocketClient:Fire(
            targetPosition, direction, rocketData,
            ReplicatedStorage.RocketSystem.Rockets["Javelin G-Rocket"], javelin, javelin,
            LocalPlayer, nil, { [1] = Camera:FindFirstChild("Javelin") }
        )
    end)
end

local function startFiring()
    if isFiring or not javelinSpamEnabled then return end
    isFiring = true

    task.spawn(function()
        while isFiring and javelinSpamEnabled and isHoldingG do
            local targets = getPlayersInRadius()
            if #targets > 0 then
                for i = 1, math.min(3, #targets) do  
                    task.spawn(fireJavelin, targets[i])
                end
            end
            task.wait(fireRate + math.random() * 0.002) 
        end
        isFiring = false
    end)
end

Toggle:OnChanged(function(state)
    javelinSpamEnabled = state
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        isHoldingG = true
        startFiring()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        isHoldingG = false
    end
end)



local Toggle = Tabs.Extra:AddToggle("RPG Spam", {Title = "RPG Spam", Default = false})

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local isFiring = false
local rpgSpamEnabled = false
local maxDistance = 400000
local fireRate = 0.002 

local function getPlayersInRadius()
    local targets = {}

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude

            if distance <= maxDistance then
                table.insert(targets, rootPart.Position)
            end
        end
    end

    return targets
end

local function fireRocket(targetPosition)
    if not targetPosition then return end

    local RPG = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("RPG")
    if not RPG then return end

    local direction = (targetPosition - Camera.CFrame.Position).unit

    local rocketData = {
        ["gravity"] = Vector3.new(0, 0, 0),
        ["HelicopterDamage"] = 1000,
        ["FireRate"] = 15,
        ["VehicleDamage"] = 700,
        ["ExpName"] = "RPG",
        ["RocketAmount"] = 1000,
        ["ExpRadius"] = 15,
        ["BoatDamage"] = 600,
        ["TankDamage"] = 600,
        ["Acceleration"] = 15,
        ["ShieldDamage"] = 15000,
        ["Distance"] = 400000,
        ["PlaneDamage"] = 800,
        ["GunshipDamage"] = 400,
        ["velocity"] = 99999,
        ["ExplosionDamage"] = 2500
    }

    pcall(function()
        ReplicatedStorage.RocketSystem.Events.FireRocket:InvokeServer(direction, RPG, RPG, targetPosition)
        ReplicatedStorage.RocketSystem.Events.FireRocketClient:Fire(
            targetPosition, direction, rocketData,
            ReplicatedStorage.RocketSystem.Rockets["RPG Rocket"], RPG, RPG,
            LocalPlayer, nil, { [1] = Camera:FindFirstChild("RPG") }
        )
    end)
end

local function startFiring()
    if isFiring or not rpgSpamEnabled then return end
    isFiring = true

    task.spawn(function()
        while isFiring and rpgSpamEnabled do
            local targets = getPlayersInRadius()
            if #targets > 0 then
                for i = 1, math.min(3, #targets) do  
                    task.spawn(fireRocket, targets[i])
                end
            end
            task.wait(fireRate + math.random() * 0.002) 
        end
    end)
end

local function stopFiring()
    isFiring = false
end

Toggle:OnChanged(function(value)
    rpgSpamEnabled = value
    if not value then
        stopFiring()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        startFiring()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
        stopFiring()
    end
end)



        Tabs.Extra:AddButton({
            Title = "NoCooldown RPG",
            Description = "Hold G",
            Callback = function()
            for i = 1, 50 do 
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        local camera = workspace.Camera
        local playerName = game:GetService("Players").LocalPlayer.Name
        local isFiring = false 

        
        local function fireQuickLagRocket()
            local fireRocketVector = camera.CFrame.LookVector
            local fireRocketPosition = camera.CFrame.Position

            
            game:GetService("ReplicatedStorage").RocketSystem.Events.FireRocket:InvokeServer(
                fireRocketVector, workspace[playerName].RPG, workspace[playerName].RPG, fireRocketPosition
            )

            
            local fireRocketClientTable = {
                ["expShake"] = {["fadeInTime"] = 0.05, ["magnitude"] = 3, ["rotInfluence"] = {0.4, 0, 0.4}, ["fadeOutTime"] = 0.5, ["posInfluence"] = {1, 1, 0}, ["roughness"] = 3},
                ["gravity"] = Vector3.new(0, -20, 0),
                ["HelicopterDamage"] = 450,
                ["FireRate"] = 15,
                ["VehicleDamage"] = 350,
                ["ExpName"] = "RPG",
                ["RocketAmount"] = 333,
                ["ExpRadius"] = 12,
                ["BoatDamage"] = 300,
                ["TankDamage"] = 300,
                ["Acceleration"] = 8,
                ["ShieldDamage"] = 11170,
                ["Distance"] = 400000,
                ["PlaneDamage"] = 500,
                ["GunshipDamage"] = 170,
                ["velocity"] = 99999,
                ["ExplosionDamage"] = 120
            }

            local fireRocketClientInstance1 = game:GetService("ReplicatedStorage").RocketSystem.Rockets["RPG Rocket"]
            local fireRocketClientInstance2 = workspace[playerName].RPG
            local fireRocketClientInstance3 = workspace[playerName].RPG


            game:GetService("ReplicatedStorage").RocketSystem.Events.FireRocketClient:Fire(
                camera.CFrame.Position,
                camera.CFrame.LookVector,
                fireRocketClientTable,
                fireRocketClientInstance1,
                fireRocketClientInstance2,
                fireRocketClientInstance3,
                game:GetService("Players").LocalPlayer,
                nil,
                { [1] = camera:FindFirstChild("RPG") }
            )
        end


        local function startFiring()
            isFiring = true
            task.spawn(function()
                while isFiring do
                    fireQuickLagRocket()
                    task.wait(1 / 999999)
                end
            end)
        end

        local function stopFiring()
            isFiring = false
        end

    
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.G and not gameProcessed then
                startFiring()
            end
        end)

        UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.G and not gameProcessed then
                stopFiring()
            end
        end)
    end



local function fireRocket()

    local Weapon = game:GetService("Players").LocalPlayer.Character:FindFirstChild(getgenv().Weapon) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(getgenv().Weapon)
    local Mouse = game.Players.LocalPlayer:GetMouse()


    if Weapon then
        local args = {
            [1] = Vector3.new(0, 0, 0),  
            [2] = Weapon,                 
            [3] = Weapon,                 
            [4] = Mouse.Hit.Position     
        }

        
        Weapon.Parent = game.Players.LocalPlayer.Character
        
        local RN = tostring(game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("Events"):WaitForChild("FireRocket"):InvokeServer(unpack(args)))
        
    
        Weapon.Parent = game.Players.LocalPlayer.Backpack

    
        if Mouse.Target then
            local args = {
                [1] = Mouse.Hit.Position,      
                [2] = Vector3.new(0, 0, 0),   
                [3] = Weapon,                
                [4] = Weapon,                
                [5] = Mouse.Target,           
                [7] = game.Players.LocalPlayer.Name.."Rocket"..RN  
            }

        
            game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("Events"):WaitForChild("RocketHit"):FireServer(unpack(args))
        end
    end
end
            end
        })


        Tabs.Extra:AddButton({
            Title = "NoCooldown Javelin",
            Description = "Hold G",
            Callback = function()
            for i = 1, 50 do 
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        local camera = workspace.Camera
        local playerName = game:GetService("Players").LocalPlayer.Name
        local isFiring = false 

        
        local function fireQuickLagRocket()
            local fireRocketVector = camera.CFrame.LookVector
            local fireRocketPosition = camera.CFrame.Position

            
            game:GetService("ReplicatedStorage").RocketSystem.Events.FireRocket:InvokeServer(
                fireRocketVector, workspace[playerName].Javelin, workspace[playerName].Javelin, fireRocketPosition
            )

            
            local fireRocketClientTable = {
                ["expShake"] = {["fadeInTime"] = 0.05, ["magnitude"] = 3, ["rotInfluence"] = {0.4, 0, 0.4}, ["fadeOutTime"] = 0.5, ["posInfluence"] = {1, 1, 0}, ["roughness"] = 3},
                ["gravity"] = Vector3.new(0, 0, 0),
                ["HelicopterDamage"] = 450,
                ["FireRate"] = 15,
                ["VehicleDamage"] = 350,
                ["ExpName"] = "Javelin",
                ["RocketAmount"] = 333,
                ["ExpRadius"] = 12,
                ["BoatDamage"] = 300,
                ["TankDamage"] = 300,
                ["Acceleration"] = 8,
                ["ShieldDamage"] = 11170,
                ["Distance"] = 400000,
                ["PlaneDamage"] = 500,
                ["GunshipDamage"] = 170,
                ["velocity"] = 99999,
                ["ExplosionDamage"] = 120
            }

            local fireRocketClientInstance1 = game:GetService("ReplicatedStorage").RocketSystem.Rockets["Javelin G-Rocket"]
            local fireRocketClientInstance2 = workspace[playerName].Javelin
            local fireRocketClientInstance3 = workspace[playerName].Javelin


            game:GetService("ReplicatedStorage").RocketSystem.Events.FireRocketClient:Fire(
                camera.CFrame.Position,
                camera.CFrame.LookVector,
                fireRocketClientTable,
                fireRocketClientInstance1,
                fireRocketClientInstance2,
                fireRocketClientInstance3,
                game:GetService("Players").LocalPlayer,
                nil,
                { [1] = camera:FindFirstChild("Javelin") }
            )
        end


        local function startFiring()
            isFiring = true
            task.spawn(function()
                while isFiring do
                    fireQuickLagRocket()
                    task.wait(1 / 999999)
                end
            end)
        end

        local function stopFiring()
            isFiring = false
        end

    
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.G and not gameProcessed then
                startFiring()
            end
        end)

        UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.G and not gameProcessed then
                stopFiring()
            end
        end)
    end



local function fireRocket()

    local Weapon = game:GetService("Players").LocalPlayer.Character:FindFirstChild(getgenv().Weapon) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(getgenv().Weapon)
    local Mouse = game.Players.LocalPlayer:GetMouse()


    if Weapon then
        local args = {
            [1] = Vector3.new(0, 0, 0),  
            [2] = Weapon,                 
            [3] = Weapon,                 
            [4] = Mouse.Hit.Position     
        }

        
        Weapon.Parent = game.Players.LocalPlayer.Character
        
        local RN = tostring(game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("Events"):WaitForChild("FireRocket"):InvokeServer(unpack(args)))
        
    
        Weapon.Parent = game.Players.LocalPlayer.Backpack

    
        if Mouse.Target then
            local args = {
                [1] = Mouse.Hit.Position,      
                [2] = Vector3.new(0, 0, 0),   
                [3] = Weapon,                
                [4] = Weapon,                
                [5] = Mouse.Target,           
                [7] = game.Players.LocalPlayer.Name.."Rocket"..RN  
            }

        
            game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("Events"):WaitForChild("RocketHit"):FireServer(unpack(args))
        end
    end
end
            end
        })


		Tabs.Extra:AddButton({
			Title = "Rejoin after kick",
			Description = "", 
			Callback = function()
				local TeleportService = game:GetService("TeleportService")
				local Players = game:GetService("Players")
				local LocalPlayer = Players.LocalPlayer

				local function Rejoin()
    			TeleportService:Teleport(game.PlaceId, LocalPlayer)
				end

				LocalPlayer.OnTeleport:Connect(function(State)
    			if State == Enum.TeleportState.Failed then
       			wait(3)
        		Rejoin()
   				end
				end)
				Rejoin()
				end
			})


        Tabs.Extra:AddParagraph({
            Title = "Weapons",
            Content = ""
        })


Tabs.Extra:AddButton({
    Title = "Inf Ammo | for all weapons",
    Description = "",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        task.wait(0.1)

        local Configurations = ReplicatedStorage:WaitForChild("Configurations")

        local function giveInfiniteAmmo(character)
            if not Configurations then return end
            for _, tool in pairs(Configurations.ACS_Guns:GetChildren()) do
                if tool:FindFirstChild("Ammo") then
                    tool.Ammo.Value = math.huge
                end
            end
        end

        local function onPlayerAdded(player)
            player.CharacterAdded:Connect(function(character)
                task.wait(0.5)
                giveInfiniteAmmo(character)
            end)
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then

                giveInfiniteAmmo(player.Character)
            end
            onPlayerAdded(player)
        end

        Players.PlayerAdded:Connect(onPlayerAdded)
    end
})



SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
local InterfaceSection = Tabs.Settings:AddSection("Interface")

    InterfaceSection:AddDropdown("InterfaceTheme", {
        Title = "Theme",
        Description = "Changes the interface theme.",
        Values = Main.Themes,
        Default = Main.Theme,
        Callback = function(Value)
            Main:SetTheme(Value)
        end
    })

    if Main.UseAcrylic then
        InterfaceSection:AddToggle("AcrylicToggle", {
            Title = "Acrylic",
            Description = "The blurred background requires graphic quality 8+",
            Default = Main.Acrylic,
            Callback = function(Value)
                Main:ToggleAcrylic(Value)
            end
        })
    end

    InterfaceSection:AddToggle("TransparentToggle", {
        Title = "Transparency",
        Description = "Makes the interface transparent.",
        Default = Main.Transparency,
        Callback = function(Value)
            Main:ToggleTransparency(Value)
        end
    })

    InterfaceSection:AddKeybind("MenuKeybind", { Title = "Minimize Bind", Default = "RightShift" })
    Main.MinimizeKeybind = Main.Options.MenuKeybind