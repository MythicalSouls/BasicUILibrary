local BasicUILibrary = Instance.new("ScreenGui")
BasicUILibrary.Name = "BasicUILibrary"
BasicUILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5043002, 0, 0.4345603, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.2885066, 0, 0.2822086, 0)
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Frame.Parent = BasicUILibrary

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 3
UIStroke.Parent = Frame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1.0000001, 0, 0.1270588, 0)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Active = true
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
ScrollingFrame.CanvasSize = UDim2.new(2, 0, 2, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.ScrollBarThickness = 5
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
DoThing.Size = UDim2.new(1.0000001, 0, 0.8352942, 0)
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
HideOpen.Parent = BasicUILibrary

local UICorner3 = Instance.new("UICorner")
UICorner3.Parent = HideOpen

local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Thickness = 3
UIStroke3.Parent = HideOpen

local UIStroke4 = Instance.new("UIStroke")
UIStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke4.Thickness = 3
UIStroke4.Parent = HideOpen

BasicUILibrary.Parent = game:GetService("CoreGui")

local gui = BasicUILibrary
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
	local executor = Instance.new("TextButton")
	executor.Name = context
	executor.Size = UDim2.new(0, 860, 0, 54)
	executor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	executor.BorderSizePixel = 0
	executor.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	executor.FontSize = Enum.FontSize.Size14
	executor.TextSize = 14
	executor.TextColor3 = Color3.fromRGB(255, 255, 255)
	executor.Text = context
	executor.TextWrapped = true
	executor.TextWrap = true
	executor.Font = Enum.Font.Sarpanch
	executor.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = executor

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = executor

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = executor

	executor.Parent = parent
	executor.MouseButton1Click:Connect(function()
		thingtodo(args)
	end)
	return executor
end

function singlebuttonwithtextbox(context:string, parent:Instance, thingtodo:thread, args:any)
	args = args or nil
	local a = singlebutton(context, parent) or _G.singlebutton(context, parent)
	local aaaaadsdsadTextbox = Instance.new("TextBox")
	aaaaadsdsadTextbox.Name = context.." [Textbox]"
	aaaaadsdsadTextbox.Size = UDim2.new(0, 860, 0, 54)
	aaaaadsdsadTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	aaaaadsdsadTextbox.BorderSizePixel = 0
	aaaaadsdsadTextbox.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	aaaaadsdsadTextbox.FontSize = Enum.FontSize.Size14
	aaaaadsdsadTextbox.TextWrapped = true
	aaaaadsdsadTextbox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	aaaaadsdsadTextbox.TextWrap = true
	aaaaadsdsadTextbox.TextSize = 14
	aaaaadsdsadTextbox.TextColor3 = Color3.fromRGB(0, 0, 0)
	aaaaadsdsadTextbox.PlaceholderText = "Enter ("..context..")"
	aaaaadsdsadTextbox.Text = ""
	aaaaadsdsadTextbox.CursorPosition = -1
	aaaaadsdsadTextbox.Font = Enum.Font.Sarpanch
	aaaaadsdsadTextbox.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = aaaaadsdsadTextbox

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = aaaaadsdsadTextbox

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = aaaaadsdsadTextbox

	aaaaadsdsadTextbox.Parent = parent
	a.MouseButton1Click:Connect(function()
		thingtodo(args)
	end)
	return {["Button"] = a, ["Box"] = aaaaadsdsadTextbox}
end

function createtab(context:string, thingtodo:thread, args:any)
	args = args or nil
	local contextt = Instance.new("TextButton")
	contextt.Name = context
	contextt.Size = UDim2.new(0, 200, 0, 50)
	contextt.BorderColor3 = Color3.fromRGB(0, 0, 0)
	contextt.BorderSizePixel = 0
	contextt.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	contextt.FontSize = Enum.FontSize.Size14
	contextt.TextSize = 14
	contextt.TextColor3 = Color3.fromRGB(255, 255, 255)
	contextt.Text = context
	contextt.TextWrapped = true
	contextt.TextWrap = true
	contextt.Font = Enum.Font.Sarpanch
	contextt.TextScaled = true

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = contextt

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 3
	UIStroke.Parent = contextt

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke1.Thickness = 3
	UIStroke1.Parent = contextt

	contextt.Parent = scrf
	contextt.MouseButton1Click:Connect(function()
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
	return contextt
end

_G.createtab = createtab
_G.singlebuttonwithtextbox = singlebuttonwithtextbox
_G.singlebutton = singlebutton
_G.options = DoThing
_G.frame = frame
_G.maingui = gui

warn("Documentation\nFunctions are stored in _G.\ncreatetab Function (name [string], function that will be excuted on click [thread or simply function], arguments of function [any]) returns the tab button.\nsinglebutton Function(name [string], function that will be excuted on click [thread or simply function, arguments of function [any]) returns the option button.\nsinglebuttonwithtextbox Function(name [string], function that will be excuted on click [thread or simply function, arguments of function [any]) returns button and textbox, it can be accessed with .Button and .Box.")
