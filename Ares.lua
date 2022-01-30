local script = game:GetObjects("rbxassetid://5813806760")[1].Ares
function AddAccessory(id)
local hat = game:GetObjects(id)[1]:Clone()
hat.Parent = game.Players.LocalPlayer.Character
local weld = Instance.new("Weld", hat.Handle)
weld.Name = "AccessoryWeld"
weld.Part0 = hat.Handle
weld.Part1 = hat.Parent:FindFirstChild(hat.Handle:FindFirstChildWhichIsA("Attachment").Name, true).Parent
weld.C0 = hat.Handle:FindFirstChildWhichIsA("Attachment").CFrame
weld.C1 = hat.Parent:FindFirstChild(hat.Handle:FindFirstChildWhichIsA("Attachment").Name, true).CFrame
return hat
end

	local AHB = Instance.new("BindableEvent")
	
	local FPS = 30
	
	local TimeFrame = 0
	
	local LastFrame = tick()
	local Frame = 1/FPS
	
	game:service'RunService'.Heartbeat:connect(function(s,p)
		TimeFrame = TimeFrame + s
		if(TimeFrame >= Frame)then
			for i = 1,math.floor(TimeFrame/Frame) do
				AHB:Fire()
			end
			LastFrame=tick()
			TimeFrame=TimeFrame-Frame*math.floor(TimeFrame/Frame)
		end
	end)


	function swait(dur)
		if(dur == 0 or typeof(dur) ~= 'number')then
			AHB.Event:wait()
		else
			for i = 1, dur*FPS do
				AHB.Event:wait()
			end
		end
	end
	
-- converter by Drahazar

--created by helkern
--some things might be taken from other scripts

wait(1/60)

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Torso)

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor


Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local neck2 = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
--ROBLOXIDLEANIMATION.Parent = Humanoid
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
ANIMATOR:Destroy()
local UNANCHOR = true
local HITPLAYERSOUNDS = {--[["199149137", "199149186", "199149221", "199149235", "199149269", "199149297"--]]"263032172", "263032182", "263032200", "263032221", "263032252", "263033191"}	
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)


function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function Clerp(a, b, t)
    return a:lerp(b,t)
end



function weld(parent, part0, part1, c0, c1)
	local w = IT("Weld")
	w.Part0 = part0
	w.Part1 = part1
	w.C0 = c0
	w.C1 = c1
	w.Parent = parent
	return w
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.EmitterSize = 5*VOLUME
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end


function SHAKECAM(POSITION,RANGE,INTENSITY,TIME)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						local CAMSHAKER = script.CamShake:Clone()
						CAMSHAKER.Shake.Value = INTENSITY
						CAMSHAKER.Timer.Value = TIME
						CAMSHAKER.Parent = CHILD
						CAMSHAKER.Disabled = false
					end
				end
			end
		end
	end
end



--weap
local SONG = 2982966292
d = CF(0,0,0)
local la = IT("Weld")
local ra = IT("Weld")
RightShoulder.Parent = nil
LeftShoulder.Parent = nil
RightHip.Parent = nil
LeftHip.Parent = nil
ra.Name = "ra"
ra.Part0 = Torso 
ra.C0 = CF(1.5, 0.5, 0)
ra.C1 = CF(0, 0.5, 0)
ra.Part1 = RightArm
ra.Parent = Torso  

la.Name = "la"
la.Part0 = Torso 
la.C0 = CF(-1.5, 0.5, 0)
la.C1 = CF(0, 0.5, 0) 
la.Part1 = LeftArm
la.Parent = Torso

local lh = weld(LeftLeg,Torso,LeftLeg,CF(-.5,-1,0),d)
lh.C1 = CF(0,1,0)
local rh = weld(RightLeg,Torso,RightLeg,CF(.5,-1,0),d)
rh.C1 = CF(0,1,0)

local larm = script.larm
for i,v in pairs(larm:GetDescendants()) do
	if v:IsA("BasePart") then v.Anchored = false end
end
local weld1 = weld(LeftArm,larm.Main,LeftArm,d,d)
local rarm = script.rarm
for i,v in pairs(rarm:GetDescendants()) do
	if v:IsA("BasePart") then v.Anchored = false end
end
local weld2 = weld(RightArm,rarm.Main,RightArm,d,d)
local lleg = script.lleg
for i,v in pairs(lleg:GetChildren()) do
	if v:IsA("BasePart") then v.Anchored = false end
end
local weld3 = weld(LeftLeg,lleg.Main,LeftLeg,d,d)
local rleg = script.rleg
for i,v in pairs(rleg:GetDescendants()) do
	if v:IsA("BasePart") then v.Anchored = false end
end
local weld4 = weld(RightLeg,rleg.Main,RightLeg,d,d)
local tors = script.tors
for i,v in pairs(tors:GetDescendants()) do
	if v:IsA("BasePart") then v.Anchored = false end
end
local weld5 = weld(Torso,tors.Main,Torso,d,d)
local ha = script.hair
local weld6 = weld(Head,ha,Head,CF(0.04,-.3,0),d)
ha.Anchored = false
--[[larm.Parent = Character
rarm.Parent = Character
tors.Parent = Character
rleg.Parent = Character
lleg.Parent = Character]]
--[[if Character:FindFirstChild("Shirt") then
	Character:FindFirstChild("Shirt"):Destroy()
end]]
--RightLeg.Transparency = 1
--LeftLeg.Transparency = 1
--Humanoid:RemoveAccessories()
if Head:FindFirstChild("face") then
	Head:FindFirstChild("face"):remove()
end
local sord = script.Acceleration
local sword = Character:FindFirstChild("MeshPartAccessory")
if not sword then
	sword = AddAccessory(4506945409)
	sword.Parent = nil
end
sword.Handle.AccessoryWeld:Destroy()
local swordweld  = Instance.new("Weld", sword.Handle)
swordweld.Part0 = sord.Main
swordweld.Part1 = sword.Handle
swordweld.C0 = CFrame.Angles(0,0,math.rad(-45 - 90)) * CFrame.new(-1.9,-1.9,0)
game.RunService.Stepped:connect(function()
if sord.Parent == nil then
	sword.Handle.Position = Vector3.new()
	sword.Handle.Velocity = Vector3.new(0,3,0)
end
		end)
for i,v in pairs(sord:GetChildren()) do
	v.Anchored = false
	v.Transparency = 1
end
local sordw = weld(RightArm,sord.Main,RightArm,CF(-1.05,0,0)*ANGLES(RAD(90),RAD(0),RAD(90)),d)
sord.Parent = nil
local chain = script.chain
chain.Attachment0 = RightArm.RightGripAttachment





--dmg
function cor(MODEL)
	MODEL:BreakJoints()
	for index, CHILD in pairs(MODEL:GetChildren()) do
		coroutine.resume(coroutine.create(function()
		swait()
		if CHILD:IsA("BasePart") and CHILD.Name ~= "HumanoidRootPart" then
			if CHILD.Name == "Head" then
					WACKYEFFECT2({Time = 120, EffectType = "Box", Size = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z), Size2 = VT(0,0,0), Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(0,100)/10,0), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color = Color3.fromRGB(86, 20, MRANDOM(140,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, SizeBoomerang = 0, Boomerang = 35})
				elseif CHILD.Name ~= "HumanoidRootPart" then
					WACKYEFFECT2({Time = 120, EffectType = "Box", Size = CHILD.Size, Size2 = VT(0,0,0), Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(0,100)/10,0), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4) ,Material = "Neon", Color = Color3.fromRGB(86, 20, MRANDOM(140,255)), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, SizeBoomerang = 0, Boomerang = 35})
				end
			CHILD:remove()
		end
		end))
		end
	Debris:AddItem(MODEL,6)
end
function ApplyDamage(Humanoid,Damage)
	Damage = Damage
	if Humanoid.Health < 2000 then
		if Humanoid.Health - Damage > 0 then
			Humanoid.Health = Humanoid.Health - Damage
		else
			cor(Humanoid.Parent)
		end
	else
		cor(Humanoid.Parent)
	end
end

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
	--[[for index, CHILD in pairs(workspace:GetDescendants()) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							cor(CHILD)
						else
							local DMG = MRANDOM(MINDMG,MAXDMG)
							ApplyDamage(HUM,DMG)
						end
						if FLING > 0 then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity") 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = CF(POSITION,TORSO.Position).lookVector*FLING
									bv.Parent = c
									Debris:AddItem(bv,0.05)
								end
							end
						end
					end
				end
			end
		end
	end]]
end

--attacks
function cs()
if SONG == 2982966292 then
SONG = 4368860146
elseif SONG == 4368860146 then
SONG = 4361463193
elseif SONG == 4361463193 then
SONG = 1009935294
elseif SONG == 1009935294 then
SONG = 212377035
elseif SONG == 212377035 then
SONG = 2410763377
elseif SONG == 2410763377 then
SONG = 2982966292			
end	
end
function equip()
	ATTACK = true
	local done = false
	sord.Parent = Character
	coroutine.resume(coroutine.create(function()
	for i,v in pairs(sord:GetChildren()) do
		v.Transparency = 1
	end
	for i = 0,100 do
		Swait()
		for i,v in pairs(sord:GetChildren()) do
		v.Transparency = 1
		end
	end
	end))
	for i = 0,5 do
	Swait()
  	local Alpha = .07
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.1+ 0.07*COS(SINE/37),0.3)*ANGLES(RAD(10.9+ 3.2*COS(SINE/37)),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1- 0.07*COS(SINE/37),-0.1)*ANGLES(RAD(-10.9- 3.2*COS(SINE/37)),RAD(7),RAD(0)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1- 0.07*COS(SINE/37),-0.2)*ANGLES(RAD(-10.9- 3.2*COS(SINE/37)),RAD(-10.8),RAD(0)),Alpha)
  	la.C0 = la.C0:lerp(CF(-0.7,0.2,-0.9)*ANGLES(RAD(0),RAD(0),RAD(87.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.3,0.3,0)*ANGLES(RAD(0),RAD(0),RAD(45)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0.06)*ANGLES(RAD(-5),RAD(0),RAD(0)),Alpha)
	end
	for i = 0,80 do
		Swait()
		  	local Alpha = .07
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0+ 0.07*COS(SINE/37),0.1)*ANGLES(RAD(-0.4+ 3.2*COS(SINE/37)),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1- 0.07*COS(SINE/37),-0.1)*ANGLES(RAD(0.4- 3.2*COS(SINE/37)),RAD(7),RAD(0)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1- 0.07*COS(SINE/37),-0.2)*ANGLES(RAD(0.4- 3.2*COS(SINE/37)),RAD(-10.8),RAD(0)),Alpha)
  	la.C0 = la.C0:lerp(CF(-0.7,0.2,-0.9)*ANGLES(RAD(0),RAD(0),RAD(87.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.3,0.1)*ANGLES(RAD(0),RAD(0),RAD(90)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0.06)*ANGLES(RAD(-5),RAD(0),RAD(0)),Alpha)
	end
	CreateSound(200633780,RightArm,6,1,false)
	for i,v in pairs(sord:GetChildren()) do
		WACKYEFFECT2({Time = 60, EffectType = "Box", Size = v.Size*.9, Size2 = v.Size*1.1, Transparency = 0, Transparency2 = 1, CFrame = v.CFrame, MoveToPos = v.Position + VT(MRANDOM(-6,6),MRANDOM(-6,6),MRANDOM(-6,6)), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	end
	swait(.9)
	done = true
	EQUIPPED = true
	ATTACK = false
end

function unequip()
	ATTACK = true
	for i = 0,50 do
		Swait()
		  	local Alpha = .07
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0 + 0.07*COS(SINE/37),0.1)*ANGLES(RAD(-0.4 + 3.2*COS(SINE/37)),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1- 0.07*COS(SINE/37),-0.1)*ANGLES(RAD(0.4- 3.2*COS(SINE/37)),RAD(7),RAD(0)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1- 0.07*COS(SINE/37),-0.2)*ANGLES(RAD(0.4- 3.2*COS(SINE/37)),RAD(-10.8),RAD(0)),Alpha)
  	la.C0 = la.C0:lerp(CF(-0.7,0.2,-0.9)*ANGLES(RAD(0),RAD(0),RAD(87.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.3,0.1)*ANGLES(RAD(0),RAD(0),RAD(90)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0.06)*ANGLES(RAD(-5),RAD(0),RAD(0)),Alpha)
	end
	for i,v in pairs(sord:GetChildren()) do
		if v.Name == "eff" then
		WACKYEFFECT2({Time = 60, EffectType = "Box", Size = v.Size*1.1, Size2 = v.Size, Transparency = 0, Transparency2 = 1, CFrame = v.CFrame*CF(MRANDOM(-6,6),MRANDOM(-6,6),MRANDOM(-6,6)), MoveToPos = v.Position, RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color=Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
		end
	end
	CreateSound(233091136,RightArm,6,1.5,false)
		for i = 0,50 do
		Swait()
		for i,v in pairs(sord:GetChildren()) do
		v.Transparency = v.Transparency + .02
		end
		end
		sord.Parent = nil
	EQUIPPED = false
	ATTACK = false
end

function chained()
	ATTACK = true
	pcall(function()
	if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil and Mouse.Target ~= nil then
	local hum = Mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
	local targtors = hum.Parent:FindFirstChild("Torso") or hum.Parent:FindFirstChild("UpperTorso")
	for i = 0,25 do
		Swait()
		  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(-0.1,-0.1,0.4)*ANGLES(RAD(18.7),RAD(53.7),RAD(-15.2))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.1)*ANGLES(RAD(-10.9),RAD(7),RAD(-11.7)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.6,-0.9,-0.1)*ANGLES(RAD(-10.9),RAD(-45.5),RAD(10.2)),Alpha)
  	la.C0 = la.C0:lerp(CF(-0.7,0.2,-0.9)*ANGLES(RAD(0),RAD(0),RAD(87.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.5,0.1)*ANGLES(RAD(-26.8),RAD(-10.3),RAD(19.5)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(-0.7),RAD(0),RAD(-28.4)),Alpha)
	end
	for i = 0,19 do
		Swait()
		  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(-0.1,-0.1,0.8)*ANGLES(RAD(32.6),RAD(53.7),RAD(-15.2))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.4,-0.9,-0.2)*ANGLES(RAD(-17.4),RAD(7.6),RAD(-23.1)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.7,-1.1,-0.1)*ANGLES(RAD(-30),RAD(-43.6),RAD(-5.5)),Alpha)
  	la.C0 = la.C0:lerp(CF(-0.7,0.2,-0.9)*ANGLES(RAD(0),RAD(0),RAD(87.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.2,0)*ANGLES(RAD(77.3),RAD(-4.1),RAD(55)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(10),RAD(0),RAD(-27.2)),Alpha)
	end
	coroutine.resume(coroutine.create(function()
	chp = CreatePart(3,Effects,"Neon",0,1,"White","Eliza",VT(1,1,1),true)
	chp.CFrame = Torso.CFrame
	chainc = chain:Clone()
	local at = IT("Attachment",chp)
	for i = 0,1,.1 do
	Swait()
	local opos = (RightArm.CFrame*CF(0,-1,0)).p
	chainc.Parent = RightArm
	chainc.Attachment1 = at
	chp.CFrame = chp.CFrame:lerp(targtors.CFrame,.3)
	chp.CFrame = CF(chp.Position,chp.Position+(targtors.Position-chp.Position).unit)
	--ApplyDamage(hum,50)
	end
		WACKYEFFECT2({Time = 80, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(10,10,10), Transparency = 0, Transparency2 = 1, CFrame = targtors.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = 200633837, SoundPitch = 2, SoundVolume = 5, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	for i = 1,10 do
		WACKYEFFECT2({Time = 80, EffectType = "Sphere", Size = VT(1.8,1.8,1.8), Size2 = VT(0,2.8,0), Transparency = 0, Transparency2 = 1, CFrame = targtors.CFrame, MoveToPos = targtors.Position + VT(MRANDOM(-8,8),MRANDOM(-8,8),MRANDOM(-8,8)), RotationX = MRANDOM(-3,3), RotationY = MRANDOM(-3,3), RotationZ = MRANDOM(-3,3), Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	end
	for i = 0,3,.1 do
	Swait()
	targtors.CFrame = targtors.CFrame:lerp(Torso.CFrame * CF(0,0,-2),.1)
	chp.CFrame = targtors.CFrame
	end
	targtors.CFrame = Torso.CFrame*CF(0,0,-2)
	end))
	swait(.1)
		for i = 0,19 do
		Swait()
		  	local Alpha = .15
  	RootJoint.C0 = RootJoint.C0:lerp(CF(-0.1,-0.2,0.2)*ANGLES(RAD(4),RAD(53.7),RAD(-15.2))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.1)*ANGLES(RAD(-4.1),RAD(7.7),RAD(0.5)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.6,-0.7,-0.1)*ANGLES(RAD(9.2),RAD(-43.4),RAD(26.9)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.6,0.7,0.2)*ANGLES(RAD(2.5),RAD(9.1),RAD(-28.8)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.1,0.2,-0.7)*ANGLES(RAD(64.1),RAD(33.3),RAD(-74.5)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(10),RAD(0),RAD(-27.2)),Alpha)
	end
	Debris:AddItem(chp,.5)
	Debris:AddItem(chainc,.5)
	end
	end)
	ATTACK = false
end

function thespin()
ATTACK = true
for i = 0,20 do
	Swait()
	if NullwareAPI then
		NullwareFling(sord.Handle2, 0.5)
	end
		local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0)*ANGLES(RAD(-6),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.2)*ANGLES(RAD(6.4),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(6.5),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.4,0.5,0.2)*ANGLES(RAD(2.8),RAD(11.4),RAD(-13.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.2,0)*ANGLES(RAD(0),RAD(0),RAD(71)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0.1,0,0.1)*ANGLES(RAD(-9.1),RAD(0),RAD(-6.4)),Alpha)
end
CreateSound(233856097,RightArm,5,1,false)
for i = 0,40 do
	Swait()
	if NullwareAPI then
		NullwareFling(sord.Handle2, 1)
	end
	local Alpha = .15
	sordw.C1 = sordw.C1:lerp(CF(0,-1.7,-1)*ANGLES(RAD(-90),RAD(0),RAD(0)),.3)
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0.1,0,0.1)*ANGLES(RAD(-6.6),RAD(24.5),RAD(2.8))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.5)*ANGLES(RAD(6.4),RAD(-17.7),RAD(-3.1)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(6.6),RAD(-32.2),RAD(4)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.4,0.5,0.2)*ANGLES(RAD(2.8),RAD(11.4),RAD(-13.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(0.8,0.3,-0.8)*ANGLES(RAD(172.5),RAD(20.7),RAD(-88.7)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0.1,0,0.1)*ANGLES(RAD(-2.8),RAD(0),RAD(-24.5)),Alpha)
end
local spin = 0
local spval = nil
local bladepart
for q,z in pairs(sord:GetChildren()) do
	if z:FindFirstChild("blade") then
		bladepart = z
	end
end
CreateSound(228343252,RightArm,6,.7,false)
for i = 0,69 do
	Swait()
	spin = spin + 23
	if spin  >= 360 then
		spin = 0
	end
	local Alpha = .25
	WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = bladepart.Size, Size2 = bladepart.Size*2.7, Transparency = 0, Transparency2 = 1, CFrame = bladepart.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 28})
	if MRANDOM(1,2) == 1 then
	WACKYEFFECT2({Time = 60, EffectType = "Wave", Size = VT(7,.5,7), Size2 = VT(10,1,10), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-2,0), MoveToPos = RootPart.Position+VT(MRANDOM(-65,65)/10,0,MRANDOM(-65,65)/10), RotationX = 0, RotationY = MRANDOM(-5,5), RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	end
	ApplyAoE(bladepart.Position,6,10,20,30,false)
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0.1,0,-0.1)*ANGLES(RAD(-6),RAD(-spin),RAD(-0.2))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.6,-1,-0.1)*ANGLES(RAD(6.4),RAD(8.4),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.4,-1,-0.1)*ANGLES(RAD(6.5),RAD(-6.1),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.4,0.5,0.2)*ANGLES(RAD(2.8),RAD(11.4),RAD(-13.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.4,0.1)*ANGLES(RAD(-7),RAD(0.4),RAD(88.8)),Alpha)
	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0.1,0,0.1)*ANGLES(RAD(-2.8),RAD(0),RAD(-24.5)),Alpha)
end
spval = spin
for i = 0,39 do
Swait()
	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0.2,-0.5,0.3)*ANGLES(RAD(-6.7),RAD(26.8),RAD(3.1))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1.3,-0.8)*ANGLES(RAD(-56.5),RAD(-6.5),RAD(-19.2)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.7,-0.4,-0.6)*ANGLES(RAD(6.6),RAD(-34.5),RAD(4.1)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.4,0.5,0.2)*ANGLES(RAD(2.8),RAD(11.4),RAD(-13.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.3,0.4,0.4)*ANGLES(RAD(-15.9),RAD(-56),RAD(79.4)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0.1,0,0.1)*ANGLES(RAD(-7.1),RAD(0),RAD(-26.8)),Alpha)	
end
ATTACK = false
end

local bp
for d,a in pairs(sord:GetChildren()) do
	if a:FindFirstChild("blade") then
		bp = a
	end
end

function voidtime()
	ATTACK = true
	Rooted = true
	local isgrab = false
	local wel = nil
	local ttors = nil
	local ogpos = RootPart.CFrame
	local hb = CreatePart(3,Effects,"Plastic",0,1,"White","hitbox",VT(2, 2, 2),false)
	local hbw = weld(RightArm,hb,RightArm,CF(0,2,0),d)
	local hitt = hb.Touched:Connect(function(h)
	if h.Parent:FindFirstChildOfClass("Humanoid") then
		if h.Parent:FindFirstChildOfClass("Humanoid").Health ~= 0 then
			ttors = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
			ttors.CFrame = RightArm.CFrame * CF(0,-1,0) * ANGLES(RAD(90), RAD(0), RAD(0))
			wel = weldBetween(hb,ttors)
			for x,p in pairs(ttors.Parent:GetChildren()) do
				if p:IsA("BasePart") then
				p.Massless = true
				end
			end
			isgrab = true
		end
	end
	end)
	for i = 0,23 do
	Swait()
	if isgrab == true then break end
	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0.2)*ANGLES(RAD(9.6),RAD(40.1),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.1)*ANGLES(RAD(-6.2),RAD(7.3),RAD(-9.4)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(-7.6),RAD(-7.2),RAD(-2.4)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.5,0.2)*ANGLES(RAD(7.1),RAD(14.3),RAD(-26.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.4,0)*ANGLES(RAD(87.3),RAD(-3.4),RAD(45.5)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(-9.9),RAD(0),RAD(-40.1)),Alpha)	
	end
	hitt:Disconnect()
	if isgrab == true then
	for i = 0,20 do
		Swait()
		  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.8,-0.6)*ANGLES(RAD(-26.5),RAD(40.1),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.3)*ANGLES(RAD(-32.5),RAD(12.8),RAD(-8.1)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.3,0,-0.4)*ANGLES(RAD(24.3),RAD(-6.3),RAD(17.6)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.5,0.2)*ANGLES(RAD(7.1),RAD(14.3),RAD(-26.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.3,0.6,0.4)*ANGLES(RAD(-48.6),RAD(-64.6),RAD(14.8)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(-9.9),RAD(0),RAD(-40.1)),Alpha)
	end
	portspin = false
	coroutine.resume(coroutine.create(function()
	port = CreatePart(3,Effects,"Neon",0,1,"Black","theportal",VT(1,0,1),true)
	local dc1 = IT("Decal",port)
	dc1.Texture = "rbxassetid://920995744"
	dc1.Face = "Top"
	local dc2 = dc1:Clone()
	dc2.Parent = port
	dc2.Face = "Bottom"
	port.CFrame = RootPart.CFrame * CF(0,20,-10)
	port.Orientation = VT(0,0,0)
	CreateSound(2767090,port,6,1,false)
	for i = 1,35,2.5 do
		Swait()
		port.Size = VT(1+i,0,1+i)
	end
	end))
	toch = false
		for i = 0,5 do
		 	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.3,-0.2)*ANGLES(RAD(29.7),RAD(40.1),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.3)*ANGLES(RAD(-45),RAD(6.6),RAD(-26.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.6,-1,-0.1)*ANGLES(RAD(-24.2),RAD(-6.3),RAD(-18)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.5,0.2)*ANGLES(RAD(7.1),RAD(14.3),RAD(-26.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.3,0.1)*ANGLES(RAD(31.1),RAD(-1.3),RAD(4.6)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(-9.9),RAD(0),RAD(-40.1)),Alpha)
	end
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			port.CFrame = port.CFrame*ANGLES(RAD(0),RAD(SINE*2),0)
		until portspin == true
	end))
	port.Touched:Connect(function(tt)
		if tt.Parent:FindFirstChildOfClass("Humanoid") ~= nil and tt.Parent ~= Character then
			cor(tt.Parent)
			toch = true
		end
	end)
	--coroutine.resume(coroutine.create(function()
	--end))
	local thum = ttors.Parent:FindFirstChildOfClass("Humanoid")
	thum.PlatformStand = true
	Debris:AddItem(hb,0)
	Debris:AddItem(hbw,0)
	coroutine.resume(coroutine.create(function()
		CreateSound(206083325,ttors,5,1.5,false)
	for i = 0,5,.1 do
		Swait()
		ttors.CFrame = ttors.CFrame:lerp(port.CFrame,.3)
	end
	end))
	for i = 0,25 do
		Swait()
			local Alpha = .26
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.3,-0.2)*ANGLES(RAD(29.7),RAD(40.1),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.9,-0.3)*ANGLES(RAD(-45),RAD(6.6),RAD(-26.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.6,-1,-0.1)*ANGLES(RAD(-24.2),RAD(-6.3),RAD(-18)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.5,0.2)*ANGLES(RAD(7.1),RAD(14.3),RAD(-26.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.4,0)*ANGLES(RAD(140.2),RAD(4.8),RAD(9.8)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,0)*ANGLES(RAD(-9.9),RAD(0),RAD(-40.1)),Alpha)
	end
	end
	--swait(.9)
	Rooted = false
	coroutine.resume(coroutine.create(function()
	if isgrab == true then
	for i = 1,35,.5 do
		Swait()
		port.Size = VT(35-i,0,35-i)
	end
	port:Destroy()
	portspin = true	
	end
	end))
	ATTACK = false
	if isgrab == false then
	hb:Destroy()
	end
end

local mcol = Color3.fromRGB(86, 20, 255)

function combo1()
	ATTACK = true
	local spin = 0
	if NullwareAPI then
		NullwareFling(Character.Torso, 0.5)
	end
	if COMBO == 1 then
		COMBO = 2
		for j = 0,5 do
			Swait()
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0)*ANGLES(RAD(0),RAD(59.3),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(0.4),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(3.5),RAD(-42.9),RAD(5.1)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.1,0.3)*ANGLES(RAD(119.5),RAD(0),RAD(0)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.5,0.3)*ANGLES(RAD(11.3),RAD(-21.9),RAD(28.2)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(-59.3)),Alpha)
		end
		CreateSound(138097048,LeftArm,5,MRANDOM(8,12)/10,false)
		for q = 0,7 do
			Swait()
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0)*ANGLES(RAD(0),RAD(-65.8),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(2.2),RAD(34.8),RAD(-3.9)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(0.3),RAD(-4.9),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1,0.6,-1.1)*ANGLES(RAD(119.5),RAD(0),RAD(68.4)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.5,0.3)*ANGLES(RAD(11.3),RAD(-21.9),RAD(15.3)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(65.8)),Alpha)
		end
		ApplyAoE(LeftArm.Position,5,10,20,25,false)
	elseif COMBO == 2 then
		COMBO = 3
		for e = 0,5 do
			Swait()
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0.1,0,0)*ANGLES(RAD(0),RAD(-52.1),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(3.1),RAD(43.4),RAD(-4.5)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(0.5),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.3,0.4,0.3)*ANGLES(RAD(7.6),RAD(20),RAD(-21.4)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.6,0.2,-0.1)*ANGLES(RAD(123.2),RAD(-27.4),RAD(-3.6)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(52.1)),Alpha)
		end
		CreateSound(138097048,RightArm,5,MRANDOM(8,12)/10,false)
		for r = 0,7 do
			Swait()
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0)*ANGLES(RAD(0),RAD(61.4),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(0.2),RAD(2.7),RAD(-3.2)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(3.6),RAD(-43.8),RAD(5.2)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.3,0.4,0.3)*ANGLES(RAD(7.6),RAD(20),RAD(-21.4)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1,0.3,-0.9)*ANGLES(RAD(-1.1),RAD(-12.9),RAD(-54.9)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(-61.4)),Alpha)
		end
			ApplyAoE(RightArm.Position,5,10,20,25,false)
	elseif COMBO == 3 then
		COMBO = 4
		for t = 0,5 do
			Swait()
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(-0.2,-0.3,-0.3)*ANGLES(RAD(-25.3),RAD(-22.7),RAD(-10.4))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.6,-0.4,-0.8)*ANGLES(RAD(23.9),RAD(6.9),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.6,-0.9,-0.8)*ANGLES(RAD(-27.6),RAD(-7.7),RAD(-3.5)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.4,0.1)*ANGLES(RAD(-0.3),RAD(6.6),RAD(-5.1)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.3,0.2)*ANGLES(RAD(52.5),RAD(-25.6),RAD(65.8)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0.1,0,-0)*ANGLES(RAD(7.7),RAD(1.3),RAD(22.7)),Alpha)
		end	
		CreateSound(138097048,RightArm,5,MRANDOM(8,12)/10,false)
		for y = 0,7 do
			Swait()
			  	local Alpha = .3
  	RootJoint.C0 = RootJoint.C0:lerp(CF(-0.2,-0.2,0.1)*ANGLES(RAD(7.5),RAD(-22.7),RAD(-10.4))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.7,-1,-0.3)*ANGLES(RAD(-7.3),RAD(3.4),RAD(9.9)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.4,-0.9,-0.3)*ANGLES(RAD(-2.5),RAD(-10.2),RAD(29.2)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.4,0.1)*ANGLES(RAD(-0.3),RAD(6.6),RAD(-5.1)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(0.2,0.8,-1.3)*ANGLES(RAD(132.5),RAD(-34.3),RAD(-45.1)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0.1,0,-0)*ANGLES(RAD(7.7),RAD(1.3),RAD(22.7)),Alpha)
		end	
		ApplyAoE(RightArm.Position,5,10,20,25,false)
	elseif COMBO == 4 then
		COMBO = 5
			CreateSound(206083252,Torso,2,1.2,false)
		for u = 0,15 do
			Swait()
			  	local Alpha = .3
				spin = spin + 20
	if spin  >= 360 then
		spin = 0
	end
	local siz = VT(0.2, 4.223, 0.816)
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0)*ANGLES(RAD(0),RAD(spin),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(0.4),RAD(10.2),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(0.5),RAD(-4.3),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.4,0.5,0.1)*ANGLES(RAD(0),RAD(12.5),RAD(-90)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.3,0)*ANGLES(RAD(0),RAD(4.9),RAD(90)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0.1,0,0.1)*ANGLES(RAD(-5.3),RAD(0),RAD(24.8)),Alpha)
	WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = siz*.9, Size2 = siz*1.3, Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 20})
	WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = siz*.9, Size2 = siz*1.3, Transparency = 0, Transparency2 = 1, CFrame = LeftArm.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 20})
		end	
		ApplyAoE(Torso.Position,5,10,25,30,false)
	elseif COMBO == 5 then
		COMBO = 1
		for a = 0,2 do
			  	local Alpha = .2
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0.2)*ANGLES(RAD(7.7),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.1)*ANGLES(RAD(-7.3),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(-7.2),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.4,0)*ANGLES(RAD(0),RAD(0),RAD(-91.9)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(0),RAD(0),RAD(88.4)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0)),Alpha)
		end
		for o = 0,7 do
			Swait()
			  	local Alpha = .3
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,0.4)*ANGLES(RAD(25.6),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,0.1)*ANGLES(RAD(-25.2),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1.1,0.1)*ANGLES(RAD(-25.1),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.3,0.4,0.3)*ANGLES(RAD(97.7),RAD(-3.1),RAD(-111.8)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.4,0.3)*ANGLES(RAD(88.3),RAD(-1),RAD(121.9)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0.1,-0)*ANGLES(RAD(20.1),RAD(0),RAD(0)),Alpha)
		end	
		WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(3,3,3), Size2 = VT(12,12,12), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = 197161452, SoundPitch = 1.5, SoundVolume = 2, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
		for p = 1,10 do
		WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(1,2,1), Size2 = VT(0,2,0), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame, MoveToPos = RootPart.Position + VT(MRANDOM(-11,11),MRANDOM(-11,11),MRANDOM(-11,11)), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
		end
		WACKYEFFECT2({Time = 60, EffectType = "Wave", Size = VT(4,.1,4), Size2 = VT(12,.15,12), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(0,-3,0), MoveToPos = nil, RotationX = 0, RotationY = -5, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(86, 20, 255),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
		ApplyAoE(Torso.Position,5,10,25,30,false)
	end
	ATTACK = false
end

function swordexplosionthing()
	ATTACK = true
	for i = 0,20 do
		Swait()
		  	local Alpha = .07
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.5,0.3)*ANGLES(RAD(-31.1),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.2,-0.6)*ANGLES(RAD(31.5),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-0.2,-0.6)*ANGLES(RAD(31.6),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.5,0.5,0.1)*ANGLES(RAD(0),RAD(18.1),RAD(-10.6)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.3,0.4,0.2)*ANGLES(RAD(13.2),RAD(-14.9),RAD(59.7)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0.1,-0)*ANGLES(RAD(21.4),RAD(0),RAD(0)),Alpha)
	end
	local bv = IT("BodyVelocity",RootPart)
	bv.Velocity = CF(RootPart.Position,RootPart.CFrame*CF(0,10,0).p).lookVector*100
	bv.MaxForce = bv.MaxForce * 0
	local fl,po = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	for i = 1,10 do
	WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(4,3,3), Size2 = VT(4,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(po), MoveToPos = po+VT(MRANDOM(-35,35),0,MRANDOM(-35,35)), RotationX = 0, RotationY = MRANDOM(-4,4), RotationZ = 0, Material = "Neon", Color = mcol,SoundID = 199145534, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 35})
	end
	WACKYEFFECT2({Time = 60, EffectType = "Sphere", Size = VT(1,.2,1), Size2 = VT(24,.2,24), Transparency = 0, Transparency2 = 1, CFrame = CF(po), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = mcol,SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 35, SizeBoomerang = 0})

	for i = 0,20 do
		Swait()
		  	local Alpha = .15
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,0.1)*ANGLES(RAD(14),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.3,-0.8)*ANGLES(RAD(-13.7),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-1.1,0)*ANGLES(RAD(-13.6),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1,0.6,0.8)*ANGLES(RAD(-124.1),RAD(0),RAD(36.3)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.4,0.6,0.9)*ANGLES(RAD(-124.1),RAD(0),RAD(-46.1)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0.1,-0)*ANGLES(RAD(23.9),RAD(0),RAD(0)),Alpha)
	  RootPart.Velocity = Vector3.new(0,225,0)
	if NullwareAPI then
		NullwareFling(sord.Handle2, 1)
	end
	end
	swait(.75)
	bv:Destroy()
	swait(.7)
	for i = 1,4 do
	WACKYEFFECT2({Time = 55, EffectType = "Sphere", Size = VT(.5,15,.5), Size2 = VT(.7,20,.7), Transparency = 0, Transparency2 = 1, CFrame = bp.CFrame, MoveToPos = nil, RotationX = MRANDOM(-5,5), RotationY = MRANDOM(-5,5), RotationZ = MRANDOM(-5,5), Material = "Neon", Color = mcol,SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	end
	local tch = false
	local tvv = RootPart.Velocity.y
	local hp = CreatePart(3,Effects,"Neon",0,1,"White","hp",VT(20,1,20),true)
	hp.Position = po
	hp.CanCollide = false
	hp.Massless = true
	hp.Touched:Connect(function(h)
		if tch == false and h.Parent == Character then
		--swait(.3)
		tch = true
		end
	end)
	--coroutine.resume(coroutine.create(function()
	repeat
	---for i = 0,70 do
	if NullwareAPI then
		NullwareFling(sord.Handle2.Position, 1)
	end
		Swait()
	hp.Position = RootPart.Position-VT(0,RootPart.Position.Y,0)
		  	local Alpha = .1
	sordw.C1 = sordw.C1:lerp(CF(0,-1.7,-1)*ANGLES(RAD(-90),RAD(-25),RAD(0)),.3)
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.2)*ANGLES(RAD(-26.6),RAD(0),RAD(0))*ROOTC0,Alpha)
  	lh.C0 = lh.C0:lerp(CF(-0.5,-0.5,-0.5)*ANGLES(RAD(27),RAD(7),RAD(-3.3)),Alpha)
  	rh.C0 = rh.C0:lerp(CF(0.5,-0.9,-0.3)*ANGLES(RAD(27.1),RAD(-7.5),RAD(3.8)),Alpha)
  	la.C0 = la.C0:lerp(CF(-1.1,0.3,-0.5)*ANGLES(RAD(80.9),RAD(0),RAD(27.8)),Alpha)
  	ra.C0 = ra.C0:lerp(CF(1.1,0.3,-0.5)*ANGLES(RAD(81),RAD(0),RAD(-30.6)),Alpha)
  	Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,-0.1)*ANGLES(RAD(3.6),RAD(0),RAD(0)),Alpha)
	--end
	until tch == true
	local pos = hp.Position
	hp:Destroy()
	ApplyAoE(pos,25,0,0,0,true)
	WACKYEFFECT2({Time = 90, EffectType = "Sphere", Size = VT(10,10,10), Size2 = VT(50,80,50), Transparency = 0, Transparency2 = 1, CFrame = CF(pos), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = mcol,SoundID = 763717897, SoundPitch = 1, SoundVolume = 8, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	WACKYEFFECT2({Time = 90, EffectType = "Sphere", Size = VT(10,10,10), Size2 = VT(40,70,40), Transparency = 0, Transparency2 = 1, CFrame = CF(pos), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(0,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	for i = 1,6 do
	local nt = {2,5}
	WACKYEFFECT2({Time = 90, EffectType = "Round Slash", Size = VT(.07,.01,.07), Size2 = VT(.4,.01,.4), Transparency = 0, Transparency2 = 1, CFrame = CF(pos)*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = pos+VT(0,3,0), RotationX = 0, RotationY = nt[MRANDOM(1,2)], RotationZ = 0, Material = "Neon", Color = mcol,SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
	end
	for i = 1,20 do
		WACKYEFFECT2({Time = 90, EffectType = "Sphere", Size = VT(3,6,3), Size2 = VT(0,6,0), Transparency = 0, Transparency2 = 1, CFrame = CF(pos), MoveToPos = pos+VT(MRANDOM(-50,50),MRANDOM(0,75),MRANDOM(-50,50)), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color = mcol,SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})

	end
	ATTACK = false
end

--keys
function MouseDown(Mouse)
	if ATTACK == false then
		if EQUIPPED == false then
			combo1()
		else	
		end
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
		if EQUIPPED == false then
			chained()
		else
			thespin()	
		end
	end
	if Key == "x" and ATTACK == false then
		if EQUIPPED == false then
			voidtime()
		else	
			swordexplosionthing()
		end
	end

	if Key == "c" and ATTACK == false then
		
	end

	if Key == "v" and ATTACK == false then
		
	end

	if Key == "b" and ATTACK == false then
		
	end
	
	if Key == "m" and ATTACK == false then
	cs()	
	end
	
	if Key == "q" and ATTACK == false then
		if EQUIPPED == false then
		equip()
		else
		unequip()
		end
	end

	if Key == "]" and ATTACK == false then
		if sick.Parent ~= Character then
			sick = IT("Sound",Torso)
			sick.SoundId = "rbxassetid://"..SONG
		end
	end
end

function KeyUp(Key)
	KEYHOLD = false
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end

--loop stuff

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

while true do
	Swait()
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	SINE = SINE + CHANGE*2
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight, Character)
	local TiltVelocity = CF(RootPart.CFrame:vectorToObjectSpace(RootPart.Velocity/1.6))
	local WALKSPEEDVALUE = 12 / (Humanoid.WalkSpeed / 16)
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			ra.C0 = Clerp(ra.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(25 + 10 * COS(SINE / 12))), 1 / Animation_Speed)
			la.C0 = Clerp(la.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(-25 - 10 * COS(SINE / 12))), 1 / Animation_Speed)
			rh.C0 = Clerp(rh.C0, CF(.5, -0.4, -0.6) * ANGLES(RAD(1), RAD(0), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			lh.C0 = Clerp(lh.C0, CF(-.5, -1, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			ra.C0 = Clerp(ra.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(45 + 10 * COS(SINE / 12))), 1 / Animation_Speed)
			la.C0 = Clerp(la.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(-45 - 10 * COS(SINE / 12))), 1 / Animation_Speed)
			rh.C0 = Clerp(rh.C0, CF(.5, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(0), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			lh.C0 = Clerp(lh.C0, CF(-.5, -0.8, -0.3) * ANGLES(RAD(-10), RAD(10), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		local Alpha = .1
		ANIM = "Idle"
		if ATTACK == false then
  		local Alpha = .1
  		RootJoint.C0 = RootJoint.C0:lerp(CF(0,-0.1 + 0.09*COS(SINE/37),0.3)*ANGLES(RAD(10.9 + 3.2*COS(SINE/37)),RAD(0),RAD(0))*ROOTC0,Alpha)
  		lh.C0 = lh.C0:lerp(CF(-0.5,-1- 0.09*COS(SINE/37),-0.1)*ANGLES(RAD(-10.9- 3.2*COS(SINE/37)),RAD(7),RAD(-3.3)),Alpha)
  		rh.C0 = rh.C0:lerp(CF(0.5,-1- 0.09*COS(SINE/37),-0.1)*ANGLES(RAD(-10.9- 3.2*COS(SINE/37)),RAD(-7.5),RAD(3.8)),Alpha)
  		la.C0 = la.C0:lerp(CF(-0.7,0.2+.05*SIN(SINE/37),-0.9)*ANGLES(RAD(0+1.3*COS(SINE/57)),RAD(0-1.1*SIN(SINE/54)),RAD(87.3+.5*COS(SINE/47))),Alpha)
  		if EQUIPPED == true then  ra.C0 = ra.C0:lerp(CF(1.4,0.4+.05*SIN(SINE/37),0.1)*ANGLES(RAD(0+2.3*COS(SINE/66)),RAD(0+1*SIN(SINE/77)),RAD(30.5+3.7*SIN(SINE/48))),Alpha) else ra.C0 = ra.C0:lerp(CF(0.8,0.2+.05*SIN(SINE/37),-0.7)*ANGLES(RAD(0-1.8*COS(SINE/60)),RAD(0+2.2*SIN(SINE/69)),RAD(-92.7+2*COS(SINE/50))),Alpha) end
  		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,.06)*ANGLES(RAD(5 - 4 * SIN(SINE/37)),RAD(1*COS(SINE/74)),RAD(0)),Alpha)
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
		local Alpha = .1
  		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0+0.08*SIN(SINE/WALKSPEEDVALUE*2),0-.10*COS(SINE/(WALKSPEEDVALUE/2)))*ANGLES(RAD(-2+3*SIN(SINE/(WALKSPEEDVALUE/2)))+RAD(TiltVelocity.Z)*1,RAD(10*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ROOTC0,Alpha)
  		lh.C0 = lh.C0:lerp(CF(-0.5,-.9+0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1-.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(-5+15*COS(SINE/WALKSPEEDVALUE))+RootPart.RotVelocity.Y/-75+SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-5*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ANGLES(RAD(0-2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*RAD(TiltVelocity.X)*5.5)),Alpha)
  		rh.C0 = rh.C0:lerp(CF(0.5,-.9-0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1+.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(-5-15*COS(SINE/WALKSPEEDVALUE))-RootPart.RotVelocity.Y/75+-SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-5*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ANGLES(RAD(0+2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*-RAD(TiltVelocity.X)*5.5)),Alpha)
  		la.C0 = la.C0:lerp(CF(-1.5,0.5,0)*ANGLES(RAD(-28*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha)
  		if EQUIPPED == true then ra.C0 = ra.C0:lerp(CF(1.5,0.5,0)*ANGLES(RAD(2*COS(SINE/WALKSPEEDVALUE)),RAD(-10),RAD(33)),Alpha) else ra.C0 = ra.C0:lerp(CF(1.5,0.5,0)*ANGLES(RAD(28*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha) end
  		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0)*ANGLES(RAD(0+3.5*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(-10*COS(SINE/WALKSPEEDVALUE))-RAD(TiltVelocity.X)*3),Alpha)
		end
	end
	if ATTACK == false then
		sordw.C1 = sordw.C1:lerp(CF(0,0,0)*ANGLES(0,0,0),.1)
	end
	unanchor()
	Humanoid.MaxHealth = 1e4
	Humanoid.Health = 1e4
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	sick.SoundId = "rbxassetid://"..SONG
	sick.Looped = true
	sick.Pitch = 1
	sick.Volume = 3
	sick.Playing = true
end
