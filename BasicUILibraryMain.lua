local AbsolutionExecutorandDebuggers = Instance.new("ScreenGui")
AbsolutionExecutorandDebuggers.Name = "BasicUILibrary"
AbsolutionExecutorandDebuggers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5043002, 0, 0.4345603, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.2885066, 0, 0.2822086, 0)
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Frame.Parent = AbsolutionExecutorandDebuggers

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 3
UIStroke.Parent = Frame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(0, 860, 0, 54)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Active = true
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
ScrollingFrame.CanvasSize = UDim2.new(2, 0, 2, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

local UICorner1 = Instance.new("UICorner")
UICorner1.Parent = ScrollingFrame

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Thickness = 3
UIStroke1.Parent = ScrollingFrame

local DoThing = Instance.new("ScrollingFrame")
DoThing.Name = "DoThing"
DoThing.Size = UDim2.new(0, 860, 0, 355)
DoThing.BorderColor3 = Color3.fromRGB(0, 0, 0)
DoThing.BackgroundTransparency = 1
DoThing.Position = UDim2.new(0, 0, 0.1508924, 0)
DoThing.Active = true
DoThing.BorderSizePixel = 0
DoThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DoThing.CanvasSize = UDim2.new(0, 0, 9, 0)
DoThing.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
DoThing.Parent = Frame

local UIListLayout1 = Instance.new("UIListLayout")
UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout1.Parent = DoThing

local UICorner2 = Instance.new("UICorner")
UICorner2.Parent = DoThing

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Thickness = 3
UIStroke2.Parent = DoThing

local HideOpen = Instance.new("TextButton")
HideOpen.Name = "Hide/Open"
HideOpen.Size = UDim2.new(0.1172791, 0, 0.0511247, 0)
HideOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
HideOpen.Position = UDim2.new(0.8743159, 0, 0.9355828, 0)
HideOpen.BorderSizePixel = 0
HideOpen.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
HideOpen.FontSize = Enum.FontSize.Size14
HideOpen.TextSize = 14
HideOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
HideOpen.Text = "Hide/Open"
HideOpen.TextWrapped = true
HideOpen.TextWrap = true
HideOpen.Font = Enum.Font.Sarpanch
HideOpen.TextScaled = true
HideOpen.Parent = AbsolutionExecutorandDebuggers

local UICorner3 = Instance.new("UICorner")
UICorner3.Parent = HideOpen

local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Thickness = 3
UIStroke3.Parent = HideOpen

local UIStroke4 = Instance.new("UIStroke")
UIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke4.Thickness = 3
UIStroke4.Parent = HideOpen

AbsolutionExecutorandDebuggers.Parent = game.Players.LocalPlayer.PlayerGui
--AbsolutionExecutorandDebuggers.Parent = game:GetService("CoreGui")

local gui = AbsolutionExecutorandDebuggers
HideOpen.MouseButton1Click:Connect(function()
	if gui:FindFirstChildOfClass("Frame").Visible == true then
		gui:FindFirstChildOfClass("Frame").Visible = false
	elseif gui:FindFirstChildOfClass("Frame").Visible == false then
		gui:FindFirstChildOfClass("Frame").Visible = true
	end
end)
local UIS = game:GetService('UserInputService')
local frame = gui:FindFirstChildOfClass("Frame")
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateInput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updateInput(input)
		end
	end
end)

local scrf = frame:FindFirstChild("ScrollingFrame")
function singlebutton(context:string, parent:Instance, thingtodo:thread, args:any)
	args = args or nil
	local Executor = Instance.new("TextButton")
	Executor.Name = context
	Executor.Size = UDim2.new(0, 860, 0, 54)
	Executor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Executor.Position = UDim2.new(0, 0, 0, 0)
	Executor.BorderSizePixel = 0
	Executor.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	Executor.FontSize = Enum.FontSize.Size14
	Executor.TextSize = 14
	Executor.TextColor3 = Color3.fromRGB(255, 255, 255)
	Executor.Text = context
	Executor.TextWrapped = true
	Executor.TextWrap = true
	Executor.Font = Enum.Font.Sarpanch
	Executor.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = Executor

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = Executor

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = Executor

	Executor.Parent = parent
	Executor.MouseButton1Click:Connect(function()
		thingtodo(args)
	end)
	return Executor
end

function singlebuttonwithtextbox(context:string, parent:Instance, thingtodo:thread, args:any)
	args = args or nil
	local a = singlebutton(context, parent)
	local TextBox = Instance.new("TextBox")
	TextBox.Name = context.." [Textbox]"
	TextBox.Size = UDim2.new(0, 860, 0, 54)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	TextBox.FontSize = Enum.FontSize.Size14
	TextBox.TextWrapped = true
	TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	TextBox.TextWrap = true
	TextBox.TextSize = 14
	TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.PlaceholderText = "Enter ".."("..context..")"
	TextBox.Text = ""
	TextBox.CursorPosition = -1
	TextBox.Font = Enum.Font.Sarpanch
	TextBox.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = TextBox

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = TextBox

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = TextBox

	TextBox.Parent = parent
	a.MouseButton1Click:Connect(function()
		thingtodo(args)
	end)
	return {["Button"] = a, ["Box"] = TextBox}
end

function createtab(context:string, thingtodo:thread, args:any)
	args = args or nil
	local Debuggers = Instance.new("TextButton")
	Debuggers.Name = context
	Debuggers.Size = UDim2.new(0, 200, 0, 50)
	Debuggers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Debuggers.BorderSizePixel = 0
	Debuggers.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	Debuggers.FontSize = Enum.FontSize.Size14
	Debuggers.TextSize = 14
	Debuggers.TextColor3 = Color3.fromRGB(255, 255, 255)
	Debuggers.Text = context
	Debuggers.TextWrapped = true
	Debuggers.TextWrap = true
	Debuggers.Font = Enum.Font.Sarpanch
	Debuggers.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = Debuggers

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = Debuggers

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = Debuggers

	Debuggers.Parent = scrf
	Debuggers.MouseButton1Click:Connect(function()
		for i,v in pairs(frame:FindFirstChild("DoThing"):GetChildren()) do
			if v:IsA("TextBox") then
				v:Destroy()
			end
			if v:IsA("TextButton") then
				v:Destroy()
			end
		end
		thingtodo(args)
	end)
	return Debuggers
end

_G.createtab = createtab
_G.singlebuttonwithtextbox = singlebuttonwithtextbox
_G.singlebutton = singlebutton
_G.options = DoThing
_G.frame = frame
_G.maingui = gui

warn("Documentation\nFunctions are stored in _G.\ncreatetab Function (name [string], function that will be excuted on click [thread or simply function], arguments of function [any]) returns the tab button.\nsinglebutton Function(name [string], function that will be excuted on click [thread or simply function, arguments of function [any]) returns the option button.\nsinglebuttonwithtextbox Function(name [string], function that will be excuted on click [thread or simply function, arguments of function [any]) returns button and textbox, it can be accessed with .Button and .Box.")
