local __TYPES = require(game:GetService"ReplicatedStorage":FindFirstChild("GameModules"):FindFirstChild("_CLASS"):FindFirstChild("__TYPES"))
local __COMMANDS = require(game:GetService"ReplicatedStorage":FindFirstChild("GameModules"):FindFirstChild("__COMMANDSYS"):FindFirstChild("__COMMANDS"))
local __SYSS = require(game:GetService"ReplicatedStorage":FindFirstChild("GameModules"):FindFirstChild("CommandSysConfigs"))
return {
    GetTable = function(self,Chat)
        local Subd = string.gsub(Chat,__SYSS.Prefix,"")
        local Split = string.split(Subd,"+")
        
        local Command = __COMMANDS[Split[1]]

        if Command then
            local Lenght = #Split
            local AmountOfParams = Lenght - 1
            local Args = {
            
            }
            for i = 1, Lenght do
                task.wait()
                local Arg = Command.Params[1]
                local Type = __TYPES[Arg]
                if typeof(Arg) ~= Type then
                   return 'Invalid Parameter: ' .. i     
                end
            end
        else
            return 'not found'
        end

    end
}
