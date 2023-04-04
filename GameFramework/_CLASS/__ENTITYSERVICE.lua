return {
    GetAllEntities = function(self)
        local Folder = game.Workspace:WaitForChild("Entities")
        local Entities = {}
        for i,v in ipairs(Folder:GetChildren()) do
            if v:IsA"Model" then
                if v:GetAttribute"IsEntity" == true then
                    table.insert(Entities,v)
                end
            end
        end
        return Entities
    end;

    GetBreachPointForEntityId = function(self,ID)
        if typeof(ID) ~= "number" then
            return error([[
                >>>>>>>>>>>>>>>>>>>
                UNEXPECTED ARGUMENT
                >>>>>>>>>>>>>>>>>>>
            ]] .. [[


            ]] .. script.Parent:GetFullName() .. [[

            >>>>>>>>>>>>>>>>>>>>>>>>
            
            ]] .. [[
            
            --
            ]] .. "Expected number value, got " .. typeof(ID) .. ".")
        end
        
        local BreachPoints = game.Workspace:FindFirstChild("BreachPoints")

        for i,v in ipairs(BreachPoints:GetChildren()) do
            if v.Name == "BP_" .. ID then
                return v
            end
        end

        return warn([[
            >>>>>>>>>>>>>>>>>>>
            REQUEST INSTANCE NOT FOUND
            >>>>>>>>>>>>>>>>>>>
        ]] .. [[


        ]] .. script.Parent:GetFullName() .. [[

        >>>>>>>>>>>>>>>>>>>>>>>>
        
        ]] .. [[
        
        --
        ]] .. "Entity ID of " .. "'" .. ID .. "'" .. " does not have a breach point in BreachPoints.")
    end;

    BreachAllEntities = function(self)
        local Folder = game.Workspace:WaitForChild("Entities")
        local Entities = {}
        for i,v in ipairs(Folder:GetChildren()) do
            if v:IsA"Model" then
                if v:GetAttribute"IsEntity" == true then
                    table.insert(Entities,v)
                end
            end
        end

        local BreachPoints = game.Workspace:FindFirstChild("BreachPoints")

        for i,v in ipairs(BreachPoints:GetChildren()) do
            local a,b = pcall(function()
                local StrSep = string.split(v.Name)
                for x,y in ipairs(Entities) do
                    if StrSep[2] == y:GetAttribute("EntityId") then
                        y:SetPrimaryPartCFrame(v.CFrame)
                    end
                end
            end)
        end
    end;
}
