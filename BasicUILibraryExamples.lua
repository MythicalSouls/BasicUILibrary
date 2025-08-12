--The main library loadstring goes here
local function aaa()
	_G.singlebutton("Developer Console", DoThing, function()
		game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
	end, nil)
	_G.singlebutton("RemoteEvent Inspection (Dev Console)", DoThing, function()
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
	local aa = _G.singlebuttonwithtextbox("Execute", DoThing, function() end, nil)
	aa.Button.MouseButton1Click:Connect(function()
		loadstring(aa.Box.Text)();
	end)
end
_G.createtab("Debuggers", aaa, nil)
_G.createtab("Executor", executortabfunctions, nil)
