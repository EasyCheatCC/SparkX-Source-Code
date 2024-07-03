
HttpService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1097670054277021807/-m5vk7dNLPyvhTxrAsK7vGwftzODe81uUaq3tb9hDWGnLEJ__RbLbS4U2QM9iOKIZHjR"
local Valid = false
local ValidKey = false
local BLsted = false
local selectedKeyList = loadstring(game:HttpGet('https://pastebin.com/raw/QTqLpcWs'))()
local Whitelist = loadstring(game:HttpGet('https://pastebin.com/raw/mhQjHQad'))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Blacklist = loadstring(game:HttpGet('https://pastebin.com/raw/DsnLx6Ge'))()
local premiumKey = nil
local plr = game.Players.LocalPlayer
for i, v in pairs(selectedKeyList) do
    if v == _G.Key then
        print(plr.Name.."'s Key is active!")
        ValidKey = true
        break
    end
end
for i,v in pairs(Whitelist) do
    if v ==  HWID then
        print("OnWhitelist")
        Valid = true
        break
    end
end
for i,v in pairs(Blacklist) do
    if v == HWID then
        local response = request(
            {
                Url = Webhook_URL,
                Method = "POST",
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = HttpService:JSONEncode({
                    ["content"] = "",
                    ["embeds"] = {{
                        ["title"] = "**Spark X has been executed!**",
                        ["description"] = "A player with a blacklisted HWID has executed the script!",
                        ["type"] = "Developer",
                        ["color"] = tonumber(0xffffff),
                        ["fields"] = {
                            {
                                ["name"] = "Display Name:",
                                ["value"] = plr.DisplayName,
                                ["inline"] = true,
                            },
                            {
                                ["name"] = "Username:",
                                ["value"] = plr.Name,
                                
                                ["inline"] = true,
                            },
                            {
                                ["name"] = "Key Used:",
                                ["value"] = _G.Key,
                                ["inline"] = true,
                            },
                            {
                                ["name"] = "blacklisted Hardware ID:",
                                ["value"] = HWID,
                                ["inline"] = true,
                            }
                        }
                    }}
                })
            }
            )
            --ayfield:Destroy()
        plr:Kick("This HWID: "..HWID.." is on the Blacklist!")
    end
end
if ValidKey == false then
    --Rayfield:Destroy()
    plr:Kick("It looks like this key is invalid please buy one from the discord!")
    local response = request(
        {
            Url = Webhook_URL,
            Method = "POST",
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "**Spark X has been executed!**",
                    ["description"] = "A player has executed the script with a invalid key!",
                    ["type"] = "Developer",
                    ["color"] = tonumber(0xffffff),
                    ["fields"] = {
                        {
                            ["name"] = "Display Name:",
                            ["value"] = plr.DisplayName,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Username:",
                            ["value"] = plr.Name,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Key Used:",
                            ["value"] = _G.Key,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Hardware ID:",
                            ["value"] = HWID,
                            ["inline"] = true,
                        }
                    }
                }}
            })
        }
        )
    elseif ValidKey == true and Valid == false then
    Rayfield:Destroy()
    local response = request(
        {
            Url = Webhook_URL,
            Method = "POST",
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "**Spark X has been executed!**",
                    ["description"] = "A player has executed the script with a valid key but invalid Hardware ID!",
                    ["type"] = "Developer",
                    ["color"] = tonumber(0xffffff),
                    ["fields"] = {
                        {
                            ["name"] = "Display Name:",
                            ["value"] = plr.DisplayName,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Username:",
                            ["value"] = plr.Name,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Key Used:",
                            ["value"] = _G.Key,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Hardware ID:",
                            ["value"] = HWID,
                            ["inline"] = true,
                        }
                    }
                }}
            })
        }
        )
    plr:Kick("It looks like this key is valid but it has not been activated! To activate go to the discord server and DM the owner with this kick message and ID: "..HWID)
end
if Valid == false and ValidKey ==  true then
    print("Ignore")
elseif Valid == false then
    Rayfield:Destroy() 
    plr:Kick("Invalid Hardware ID!")
end
local Window = Rayfield:CreateWindow({
    Name = "SparkX Loader",
    LoadingTitle = "Loading Spark X External Scripts",
    LoadingSubtitle = "By Clxcks",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "KeySaves"
    },
    Discord = {
        Enabled = true,
        Invite = "cEQgmMue7j", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
        RememberJoins = false -- Set this to false to make them join the discord every time they load it up
     },
     KeySystem = false, -- Set this to true to use our key system
     KeySettings = {
        Title = "SparkX(Free Version)",
        Subtitle = "Key System",
        Note = "Join the discord for the key: https://discord.gg/cEQgmMue7j",
        FileName = "SparkXkey",
        SaveKey = false,
        GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "https://php-get-randomkey-assign-user.000webhostapp.com"
     }
  })
 if Rayfield then
    local response = request(
        {
            Url = Webhook_URL,
            Method = "POST",
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = HttpService:JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "**Spark X has been executed!**",
                    ["description"] = "A player with a valid HWID and with a valid and activated key has executed the script!",
                    ["type"] = "Developer",
                    ["color"] = tonumber(0xffffff),
                    ["fields"] = {
                        {
                            ["name"] = "Display Name:",
                            ["value"] = plr.DisplayName,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Username:",
                            ["value"] = plr.Name,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Key Used:",
                            ["value"] = _G.Key,
                            ["inline"] = true,
                        },
                        {
                            ["name"] = "Hardware ID:",
                            ["value"] = HWID,
                            ["inline"] = true,
                        }
                    }
                }}
            })
        }
        )
        elseif Rayfield == nil then

 end
  Rayfield:Notify({
    Title = "Key Accepted",
    Content = "Thanks for using SparkX",
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })
  local Tab2 = Window:CreateTab("Script", 4483362458) -- Title, Image
  local Section2 = Tab2:CreateSection("Injector")
  local Input = Tab2:CreateButton({
    Name = "Inject",
    Callback = function()
            --variables
local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local target = nil
local dist = math.huge
local camera = game.Workspace.CurrentCamera
_G.aimbot = false
_G.Chams = false
local key = "kp23k4pk2opkgopk2opk2opk4gokopkgwepokop2k3opko4p2k2opk4op2kopekfgop2kopk2"
local keyActivated = false
--IMGUI Loader

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()

local window = engine.new({
    text = "SparkX Universal Script 0.01a Alpha Developer Build",
    size = UDim2.new(300, 200),
})


--Key Check
if key == "kp23k4pk2opkgopk2opk2opk4gokopkgwepokop2k3opko4p2k2opk4op2kopekfgop2kopk2" then
    keyActivated = true
else
    plr:Kick("Error 0x340013459 - Key Check 1 Failed")
end
--Key Check 2
if keyActivated == true then
    print("IMGUI has been injected and loaded into roblox!")
    wait(3)
    print("Unique Session ID has been given to: "..plr.Name)
    window.open()
else
    plr:Kick("Error 0x340013542 - Key Check 2 Failed")
end
--Main Tab Loader
local tab2 = window.new({
    text = "Main",
})
local aaimbot = tab2.new("switch", {
    text = "Aimbot",
})
local chams = tab2.new("button", {
    text = "Chams"
})
local us = tab2.new("label", {
    text = "User logged in as: "..plr.Name,
})
--Player Tab Loader
local tab1 = window.new({
    text = "Player",
})
local godMode = tab1.new("switch", {
    text = "God Mode",

})
local speed = tab1.new("slider", {
    text = "Player speed",
    min = 16,
    max = 1000,
    value = 16,
    rounding = 1,
})
local jump = tab1.new("slider", {
    text = "Player JumpPower",
    min = 50,
    max = 1000,
    value = 50,
    rounding = 1,
})
local usernameLabel = tab1.new("label", {
    text = "User logged in as: "..plr.Name
})
local tab4 = window.new({
    text = "Misc"
})
local chatflooder = tab4.new("switch", {
    text = "Chat Flooder"
})

local tab3 = window.new({
    text = "Credits"
})
local credit1 = tab3.new("label", {
    text = "Scripted by: Spark"
})
local usernameLabe2 = tab3.new("label", {
    text = "User logged in as: "..plr.Name
})
--Player Tab Functions
speed.event:Connect(function(x)
    print(plr.Name.."'s speed has been changed to: "..x)
    plr.Character.Humanoid.WalkSpeed = x
end)
jump.event:Connect(function(x)
    print(plr.Name.."'s JumpPower has been changed to: "..x)
    plr.Character.Humanoid.JumpPower = x
end)
godMode.event:Connect(function(bool)
    if bool == true then
        print(plr.Name.." has activated god mode")
        plr.Character.Humanoid.Health = math.huge
    elseif bool == false then
        print(plr.Name.." has deactivated god mode")
        plr.Character.Humanoid.Health = 100
    end
end)

--Main Tab Functions
aaimbot.event:Connect(function(bool)
    if bool == true then
        _G.aimbot = true
        print("On")
        function closetplayer()
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= plr then
                    if v.Character and v.Character:FindFirstChild("Head") and v.TeamColor ~= plr.TeamColor and _G.aimbot then
                        local magnitude = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
                        if magnitude < dist then
                            target = v
                            dist = magnitude
                        end
                    end
                end
            end
            return target
        end
    local settings = {
        keybind = Enum.UserInputType.MouseButton2
    }
    local aiming = false
    UIS.InputBegan:Connect(function(inp)
        print("1")
        if _G.aimbot == true then
            if inp.UserInputType == settings.keybind then
                aiming = true
            end
        else
            print("penis")
        end
    end)
    UIS.InputEnded:Connect(function(inp)
        print("2")
        if inp.UserInputType == settings.keybind then
            aiming = false
        end
    end)
    game:GetService("RunService").RenderStepped:Connect(function()
        if aiming then
            if _G.aimbot == true then
                print("3")
                camera.CFrame = CFrame.new(camera.CFrame.Position,closetplayer().Character.Head.Position)
                else
                    print("balls")
            end
        end
    end)
    elseif bool == false then
        _G.aimbot = false
        print("Off")
    end
end)
chams.event:Connect(function()
    while true do
    wait(1)
    _G.Chams = true
        if _G.Chams == true then
            function CreateGui(name,parent,face) -- function that creates the Chams
                local SurfaceGui = Instance.new("SurfaceGui",parent) --- Creates a SurfaceGui in the game
                SurfaceGui.Parent = parent
                SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                SurfaceGui.Face = Enum.NormalId[face]
                 SurfaceGui.LightInfluence = 0
                SurfaceGui.ResetOnSpawn = false
                SurfaceGui.Name = name
                SurfaceGui.AlwaysOnTop = true
                local Frame = Instance.new("Frame",SurfaceGui)
                Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255) -- colour for the surfacgui
                Frame.Size = UDim2.new(1,0,1,0)
            end
        
            while wait(1) do
                for i,v in pairs (game.Players:GetPlayers()) do --- gets all the players in the game and loops through them
                    if v ~= plr and v.Character ~= nil and v.Character:FindFirstChild("Head") and _G.Chams and v.Character.Head:FindFirstChild("cham") == nil then--and v.TeamColor ~= plr.TeamColor then --- Checks to check if the player is appropiate to make a cham
                        for i,v in pairs (v.Character:GetChildren()) do -- looping through every child in the character of the player
                            if v:IsA("MeshPart") or v.Name == "Head" then -- checking if the child is a body part
                                CreateGui("cham",v,"Back")
                                CreateGui("cham",v,"Front")
                                CreateGui("cham",v,"Top")
                                CreateGui("cham",v,"Bottom")
                                CreateGui("cham",v,"Right")
                                CreateGui("cham",v,"Left")
                            end
                        end
                    
                    end
                end
            end
        end
    end
end)
local chaton = false
    chatflooder.event:Connect(function(bool)
        if bool == true then
            chaton = true
            if chaton == true then
                while true do
                    wait()
                    warn("Not In Use Right Now")
                    if chaton == false then
                        break
                    end
                end
            end
        end
        if bool == false then
            chaton = false
        end
    end)
    Rayfield:Destroy()
    end,
 })
