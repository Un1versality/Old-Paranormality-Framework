return {
    CreateEffect = function(Position,Type)
        if typeof(Position) ~= "Vector3" then
            return error([[
                >>>>>>>>>>>>>>>>>>>
                UNEXPECTED ARGUMENT
                >>>>>>>>>>>>>>>>>>>
            ]] .. [[


            ]] .. script.Parent:GetFullName() .. [[

            >>>>>>>>>>>>>>>>>>>>>>>>
            
            ]] .. [[
            
            --
            ]] .. "Expected Vector3 value, got " .. typeof(Position) .. ".")
        end

        local function CreateSmoke()
            local NewInst = Instance.new("Smoke")
            local NewInst2 = Instance.new("Part")
            NewInst.Enabled = true
            NewInst2.Position = Position
            NewInst2.Size = Vector3.new(2,0.2,2)
            NewInst.Size = 0.6
            NewInst.Parent = NewInst2
            NewInst2.Anchored = true
        end

        local function CreateLight()
            local NewInst = Instance.new("SurfaceLight")
            local NewInst2 = Instance.new("Part")
            NewInst.Enabled = true
            NewInst2.Position = Position
            NewInst2.Size = Vector3.new(2,0.2,2)
            NewInst.Brightness = 3
            NewInst.Parent = NewInst2
            NewInst2.Anchored = true
            NewInst.Shadows = true
            NewInst.Face = Enum.NormalId.Front
            NewInst.Range = 12
            NewInst.Angle = 45
        end

        local function CreateFire()
            local NewInst = Instance.new("Fire")
            local NewInst2 = Instance.new("Part")
            NewInst.Enabled = true
            NewInst2.Position = Position
            NewInst2.Size = Vector3.new(2,0.2,2)
            NewInst.Size = 1
            NewInst.Heat = 7
            NewInst.Parent = NewInst2
            NewInst2.Anchored = true
        end

        if Type == "Smoke" then
            CreateSmoke();
        elseif Type == "Light" then
            CreateLight();
        elseif Type == "Fire" then
            CreateFire()
        end

    end;
}
