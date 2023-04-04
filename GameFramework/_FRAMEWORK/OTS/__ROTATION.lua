return {
    SET_UPDATE = function(RootPart1)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")

        local RootPart = RootPart1
        local LocalPlayer = Players.LocalPlayer
        local Camera do
            while not Workspace.CurrentCamera do
                Workspace.Changed:Wait()
            end

            Camera = Workspace.CurrentCamera
        end

        local function SyncHeights(p0, p1)
	        local Flat = Vector3.new(1, 0, 1)
	        return p0 * Flat, p1 * Flat
        end

        local function Update()
	        local TargetPosition = Camera.CFrame.Position + (Camera.CFrame.LookVector * LocalPlayer.CameraMaxZoomDistance * 2)
	        local LookerFrame = CFrame.lookAt(SyncHeights(RootPart.Position, TargetPosition))
	        local Frame = LookerFrame - LookerFrame.Position + RootPart.Position

        	RootPart.CFrame = Frame
        end
        
        Update()
    end
}
