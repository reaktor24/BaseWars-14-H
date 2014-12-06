//General Variables\\
SWEP.AdminSpawnable = true
SWEP.ViewModelFOV = 64

SWEP.VElements = {
	["sotck"] = { type = "Model", model = "models/Items/item_item_crate_chunk07.mdl", bone = "ValveBiped.base", rel = "back body", pos = Vector(-0.456, 0.1, 5.5), angle = Angle(0, 90, -90), size = Vector(0.151, 0.151, 0.151), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/pushcart01a", skin = 0, bodygroup = {} },
	["sight top"] = { type = "Model", model = "models/props_wasteland/laundry_cart001.mdl", bone = "ValveBiped.base", rel = "back body", pos = Vector(-2, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.059, 0.037, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["back body"] = { type = "Model", model = "models/props_c17/FurnitureWashingmachine001a.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, -0.29, -4.6), angle = Angle(-180, 90, 0), size = Vector(0.119, 0.064, 0.209), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/tracksigns01a", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.base", rel = "sight top", pos = Vector(-1.035, 0, -0.7), angle = Angle(0, 180, -180), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/trafficcone001a", skin = 0, bodygroup = {} },
	["sight+"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.base", rel = "sight top", pos = Vector(0.455, 0, -0.7), angle = Angle(0, 180, -180), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/trafficcone001a", skin = 0, bodygroup = {} },
	["underbarrel"] = { type = "Model", model = "models/props_c17/Lockers001a.mdl", bone = "ValveBiped.base", rel = "barrel", pos = Vector(1.363, 0, 1.363), angle = Angle(0, 0, 180), size = Vector(0.094, 0.037, 0.151), color = Color(98, 104, 101, 255), surpresslightning = false, material = "models/props_lab/chess_sheet", skin = 0, bodygroup = {} },
	["railcover"] = { type = "Model", model = "", bone = "ValveBiped.Bip01", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drumm"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.base", rel = "back body", pos = Vector(0.99, 0, -5), angle = Angle(0, 0, 0), size = Vector(0.321, 0.321, 0.321), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/lobby_fixtures002a", skin = 0, bodygroup = {} },
	["sightview"] = { type = "Model", model = "models/props_c17/clock01.mdl", bone = "ValveBiped.base", rel = "sight", pos = Vector(0.8, 0, 0.4), angle = Angle(-90, 0, 0), size = Vector(0.109, 0.109, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/screenspace", skin = 0, bodygroup = {} },
	["grenade"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.base", rel = "drumm", pos = Vector(0, 1.363, -1.201), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.base", rel = "back body", pos = Vector(-0.456, 0, -11.365), angle = Angle(0, 0, 0), size = Vector(0.289, 0.289, 0.549), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_post001", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/props_junk/TrashDumpster01a.mdl", bone = "ValveBiped.base", rel = "barrel", pos = Vector(-0.65, 0, 2.273), angle = Angle(0, 90, -90), size = Vector(0.029, 0.151, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["main"] = { type = "Model", model = "", bone = "ValveBiped.Bip01", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["grenade++"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.base", rel = "drumm", pos = Vector(0, 1, 1.363), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["back detail"] = { type = "Model", model = "models/props_c17/TrapPropeller_Engine.mdl", bone = "ValveBiped.base", rel = "back body", pos = Vector(0.455, -0.341, 1.363), angle = Angle(0, 0, 0), size = Vector(0.151, 0.151, 0.151), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_lab/hevcharger_faceplate", skin = 0, bodygroup = {} },
	["grenade+"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.base", rel = "drumm", pos = Vector(0, 1.7, 0.455), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["back body"] = { type = "Model", model = "models/props_c17/FurnitureWashingmachine001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.273, 1.399, -4.5), angle = Angle(76.705, 0, 0), size = Vector(0.119, 0.064, 0.209), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/tracksigns01a", skin = 0, bodygroup = {} },
	["grenade++++"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, -1.701, 0.455), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["grenade+++++"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, -1, 1.363), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["main"] = { type = "Model", model = "", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(60, 0, -10), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["grenade++"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, 1, 1.363), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["back detail"] = { type = "Model", model = "models/props_c17/TrapPropeller_Engine.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "back body", pos = Vector(0.455, -0.341, 1.363), angle = Angle(0, 0, 0), size = Vector(0.151, 0.151, 0.151), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_lab/hevcharger_faceplate", skin = 0, bodygroup = {} },
	["grenade+++"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, -1.364, -1.201), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sight top", pos = Vector(-1.035, 0, -0.7), angle = Angle(0, 180, -180), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/trafficcone001a", skin = 0, bodygroup = {} },
	["sight+"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sight top", pos = Vector(0.455, 0, -0.7), angle = Angle(0, 180, -180), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/trafficcone001a", skin = 0, bodygroup = {} },
	["grenade+"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, 1.7, 0.455), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sight top"] = { type = "Model", model = "models/props_wasteland/laundry_cart001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "back body", pos = Vector(-2, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.059, 0.037, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drumm"] = { type = "Model", model = "models/props_c17/pulleywheels_small01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "back body", pos = Vector(0.99, 0, -5), angle = Angle(0, 0, 0), size = Vector(0.321, 0.321, 0.321), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/lobby_fixtures002a", skin = 0, bodygroup = {} },
	["grenade"] = { type = "Model", model = "models/Items/grenadeAmmo.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drumm", pos = Vector(0, 1.363, -1.201), angle = Angle(-90, 0, 0), size = Vector(0.492, 0.492, 0.492), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "back body", pos = Vector(-0.456, 0, -11.365), angle = Angle(0, 0, 0), size = Vector(0.289, 0.289, 0.549), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_post001", skin = 0, bodygroup = {} },
	["underbarrel"] = { type = "Model", model = "models/props_c17/Lockers001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(1.363, 0, 1.363), angle = Angle(0, 0, 180), size = Vector(0.094, 0.037, 0.151), color = Color(98, 104, 101, 255), surpresslightning = false, material = "models/props_lab/chess_sheet", skin = 0, bodygroup = {} },
	["sightview"] = { type = "Model", model = "models/props_c17/clock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sight", pos = Vector(0.8, 0, 0.4), angle = Angle(-90, 0, 0), size = Vector(0.109, 0.109, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/screenspace", skin = 0, bodygroup = {} },
	["sotck"] = { type = "Model", model = "models/Items/item_item_crate_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "back body", pos = Vector(-0.456, 0.1, 7.727), angle = Angle(0, 90, -90), size = Vector(1.003, 0.321, 0.209), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/pushcart01a", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/props_junk/TrashDumpster01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-0.65, 0, 2.273), angle = Angle(0, 90, -90), size = Vector(0.029, 0.151, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["railcover"] = { type = "Model", model = "", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(30, 0, -10), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.AutoSwitchTo = false
SWEP.Slot = 0
SWEP.PrintName = "Bombardier"
SWEP.Author = "Spastik & LegendofRobbo"
SWEP.Spawnable = true
SWEP.AutoSwitchFrom = false
SWEP.FiresUnderwater = false
SWEP.Weight = 5
SWEP.DrawCrosshair = true
SWEP.Category = "Basewars Weapons"
SWEP.SlotPos = 3
SWEP.DrawAmmo = true
SWEP.ReloadSound = "weapons/smg1/smg1_reload.wav"
SWEP.Instructions = "Saturate enemy defenses with grenades"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.base = "weapon_base"
SWEP.HoldType = "smg"
SWEP.ViewModelFOV = 75.984251968504
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01"] = { scale = Vector(1, 1, 1), pos = Vector(-4.127, 0.317, 0), angle = Angle(0, 0, 0) }
}
//General Variables\\

//Primary Fire Variables\\
SWEP.Primary.Round 			= ("shot_nade_8sec")	--NAME OF ENTITY GOES HERE
SWEP.Primary.Damage = 25
SWEP.Primary.TakeAmmo = 1
SWEP.Primary.ClipSize = 6
SWEP.Primary.Ammo = "SMG1_Grenade"
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Spread = 1.2
SWEP.Primary.NumberofShots = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Recoil = 1
SWEP.Primary.Delay = 0.4
SWEP.Primary.Force = 40
//Primary Fire Variables\\

//Secondary Fire Variables\\
SWEP.Secondary.Round 			= ("shot_nade_8sec")
SWEP.Secondary.TakeAmmo = 1
SWEP.Secondary.ClipSize = 0
SWEP.Secondary.Ammo = ""
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Spread = 1.2
SWEP.Secondary.NumberofShots = 1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Recoil = 1
SWEP.Secondary.Delay = 0.2
SWEP.Secondary.Force = 40

Zoom=0
//Secondary Fire Variables\\
//SWEP:Initialize()\\
	function SWEP:Initialize()
    self:SetWeaponHoldType("smg1")
end
//SWEP:Initialize()\\

function SWEP:PrimaryAttack()
	if self:Clip1() <= 0 then return end
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:FireRocket()
	self:SetClip1( self:Clip1() -1 )
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:EmitSound("weapons/grenade_launcher1.wav", 500, 80)
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * 10 + up * 0

	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
	if !rocket:IsValid() then return false end
	rocket:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	rocket.Owner = self.Owner
	rocket:Activate()
	eyes = self.Owner:EyeAngles()
		local phys = rocket:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 1500)
	end
		if SERVER and !self.Owner:IsNPC() then
		local anglo = Angle(-3, 0, 0)		
		self.Owner:ViewPunch(anglo)
		end

end

function SWEP:CheckWeaponsAndAmmo()
	if SERVER and self.Weapon != nil then 
		timer.Simple(.01, function() if not IsValid(self) then return end 
			if not IsValid(self.Owner) then return end
			self.Owner:StripWeapon(self.Gun)
		end)	
	end
end

//SWEP:SecondaryFire()\\
function SWEP:SecondaryAttack()
return false
end

function SWEP:FireFrag()
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * 10 + up * 0


	if SERVER then
	local Frag = ents.Create(self.Secondary.Round)
	if !Frag:IsValid() then return false end
	Frag:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	Frag:SetPos(pos)
	Frag:SetOwner(self.Owner)
	Frag:Spawn()
	Frag.Owner = self.Owner
	Frag:Activate()
	eyes = self.Owner:EyeAngles()
		local phys = Frag:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 1500)
	end
		if SERVER and !self.Owner:IsNPC() then
		local anglo = Angle(-3, 0, 0)		
		self.Owner:ViewPunch(anglo)
		end

end


/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here

	if CLIENT then

		self:SetWeaponHoldType( self.HoldType )	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
	end
end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end

