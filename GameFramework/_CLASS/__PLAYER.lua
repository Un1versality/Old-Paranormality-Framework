local RunService = game:GetService("RunService")
return {
    GetCharacter = function(self,Player)
        if RunService:IsClient() then
            
            local PlayerC = game.Players.LocalPlayer
            local Character = PlayerC.Character
            if not Character then
                repeat
                    task.wait()
                until PlayerC.Character
            end
            Character = PlayerC.Character

            return Character

        elseif RunService:IsServer() then

            if typeof(Player) ~= "Instance" then
                return error([[
                    >>>>>>>>>>>>>>>>>>>
                    UNEXPECTED ARGUMENT
                    >>>>>>>>>>>>>>>>>>>
                ]] .. [[


                ]] .. script.Parent:GetFullName() .. [[

                >>>>>>>>>>>>>>>>>>>>>>>>
                
                ]] .. [[
                
                --
                ]] .. "RunService detects Server but no Player Argument has been passed.")
            end

            local Character = Player.Character
            if not Character then
                repeat
                    task.wait()
                until Character
            end
            Character = Player.Character

            return Character

        end
        return error([[
                    >>>>>>>>>>>>>>>>>>>
                    NO VALUE RETURNED UNEXPECTEDLY
                    >>>>>>>>>>>>>>>>>>>
                ]] .. [[


                ]] .. script.Parent:GetFullName() .. [[

                >>>>>>>>>>>>>>>>>>>>>>>>
                
                ]] .. [[
                
                --
                ]] .. "RunService isn't neither Server or Client, or an error occured.")
    end;

    GetAccountInfo = function(self,Player)
        local New = {
            ["AccountAge"] = Player.AccountAge;
            ["UserId"] = Player.UserId;
            ["Username"] = Player.Name;
            ["DisplayName"] = Player.DisplayName;
        };

        return New
    end;

    InitPlayerFolders = function(self,Player)
        local NewFolder = Instance.new("Folder")
        NewFolder.Name = "PlayerStats"
        NewFolder.Parent = Player
        
        local NewIntValue = Instance.new("IntValue")
        NewIntValue.Name = "Credits"
        NewIntValue.Parent = NewFolder
        NewIntValue.Value = 500

        return 'CREATED'
    end
}
