--{Vars}
local GameLua = require(game:GetService("ReplicatedStorage"):FindFirstChild("GameModules"):FindFirstChild("Game"))

local __CLASSES = GameLua:GetClasses()
local __FRAMEWORK = GameLua:Get__FRAMEWORK()
local __SERVICES = __FRAMEWORK.__SERVICES
local __PLAYER = __CLASSES.__PLAYER

--{On Join}

__SERVICES.Players.PlayerAdded:Connect(function(Player)
    __PLAYER:InitPlayerFolders(Player)
end)

--{}
