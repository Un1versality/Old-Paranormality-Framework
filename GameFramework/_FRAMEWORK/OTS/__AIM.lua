return {
    TweenAimOn = function()
        local TweenService = game:GetService"TweenService"
        local Camera = workspace.CurrentCamera
        TweenService:Create(Camera,TweenInfo.new(0.69),{FieldOfView = 50}):Play()
    end;
    TweenAimOff = function()
        local TweenService = game:GetService"TweenService"
        local Camera = workspace.CurrentCamera
        TweenService:Create(Camera,TweenInfo.new(0.69),{FieldOfView = 70}):Play()
    end;
}
