local _FRAMEWORK = game:GetService"ReplicatedStorage":FindFirstChild("GameModules"):FindFirstChild("_FRAMEWORK")
local _CLASS = game:GetService"ReplicatedStorage":FindFirstChild("GameModules"):FindFirstChild("_CLASS")
return {
	GetClasses = function()
		return {
			["__PLAYER"] = require(_CLASS:FindFirstChild("__PLAYER"));
		}
	end;
	Get__FRAMEWORK = function()
		return {
			["__SERVICES"] = require(_FRAMEWORK:FindFirstChild("__SERVICES"))
		}
	end;
	GetOTS = function()
		return {
			["__AIM"] = require(_FRAMEWORK:FindFirstChild("OTS"):FindFirstChild("__AIM"));
			["__ROTATION"] = require(_FRAMEWORK:FindFirstChild("OTS"):FindFirstChild("__ROTATION"));
		}
	end
};
