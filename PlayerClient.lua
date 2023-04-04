local ReplicatedStorage = game:GetService"ReplicatedStorage"
local GameLua = require(ReplicatedStorage:FindFirstChild"GameModules":FindFirstChild"Game")

local RunService = game:GetService("RunService")

local __CLASSES = GameLua:GetClasses()
local __FRAMEWORK = GameLua:Get__FRAMEWORK()
local __OTS = GameLua:GetOTS()

local Players = __FRAMEWORK.__SERVICES.Players
local Player = Players.LocalPlayer
local Character = __CLASSES.__PLAYER:GetCharacter(Player)
local Connection

local ToolGun = nil

local MB2Down = false
local Aim = __OTS.__AIM

Character.ChildAdded:Connect(function(child)
    if not child:IsA"Tool" then return end
    if child:GetAttribute"IsGun" ~= true then return end
    if not Character:FindFirstChild"HumanoidRootPart" then return end

    local Rotation = __OTS.__ROTATION

    Connection = RunService:BindToRenderStep("GunCharRotation_" .. Player.Name,200,function()
        Rotation.SET_UPDATE(Character:FindFirstChild("HumanoidRootPart"))
    end)

    __FRAMEWORK.__SERVICES.UserInputService.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            if MB2Down == false then
                MB2Down = true
                Aim.TweenAimOn()
            elseif MB2Down == true then
                MB2Down = false
                Aim.TweenAimOff()
            end
        end
    end)

end)

Character.ChildRemoved:Connect(function(child)
    if not child:IsA"Tool" then return end
    if child:GetAttribute"IsGun" ~= true then return end

    Aim.TweenAimOff()

    MB2Down = false

    RunService:UnbindFromRenderStep("GunCharRotation_" .. Player.Name)
end)
