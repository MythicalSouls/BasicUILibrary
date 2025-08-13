--The main library loadstring goes here
local function aaa()
	singlebutton("Developer Console", options, function()
		game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
	end, nil)
	singlebutton("RemoteEvent Inspection (Dev Console)", options, function()
		warn("activating RemoteEvent Inspection (Dev Console)")
		local a
		a = hookmetamethod(game, "__namecall", function(self, ...)
			local b = getnamecallmethod()
			local arglist = {...}
			if b == "FireServer" then
				print("calling script: "..tostring(getcallingscript(b):GetFullName()))
				print("args: "..tostring(unpack(arglist)))
				print("remote name: "..tostring(self:GetFullName()))
				for i,v in pairs(arglist) do
					print("type of argument #"..tostring(i)..": "..tostring(type(v)))
				end
			end
			return a(self, ...)
		end)
		warn("activated RemoteEvent Inspection (Dev Console)")
	end, nil)
end
local function executortabfunctions()
	local aa = singlebuttonwithtextbox("Execute", options, function() end, nil)
	aa.Button.MouseButton1Click:Connect(function()
		loadstring(aa.Box.Text)();
	end)
end
createtab("Debuggers", aaa, nil)
createtab("Executor", executortabfunctions, nil)
