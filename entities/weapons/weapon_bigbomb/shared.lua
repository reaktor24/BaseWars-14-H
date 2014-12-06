// Variables that are used on both client and server

SWEP.Base 				= "weapon_mad_base"

SWEP.ViewModelFlip		= false
SWEP.ViewModel			= "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel			= "models/weapons/w_c4.mdl"
SWEP.HoldType				= "slam"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.UseHands			= true
SWEP.ViewModelFOV		= 54
SWEP.Category			= "Basewars Weapons"

SWEP.Primary.Sound		= Sound("")
SWEP.Primary.Recoil		= 0
SWEP.Primary.Damage		= 0
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.075
SWEP.Primary.Delay 		= 5

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "Thumper"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "none"				// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0

SWEP.Pistol				= true
SWEP.Rifle				= false
SWEP.Shotgun			= false
SWEP.Sniper				= false

SWEP.Blacklist = {}
SWEP.Blacklist["ent_mad_c4"] 	= true

SWEP.RunArmOffset = Vector(0, 0, -4.646)
SWEP.RunArmAngle = Vector(0, 0, 0)

SWEP.Timer				= 30

/*---------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()

	util.PrecacheSound("weapons/c4/c4_disarm.wav")
	util.PrecacheSound("weapons/c4/c4_explode1.wav")
	util.PrecacheSound("weapons/c4/c4_click.wav")
	util.PrecacheSound("weapons/c4/c4_plant.wav")
	util.PrecacheSound("weapons/c4/c4_beep1.wav")
end

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: +attack1 has been pressed.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Holst/Deploy your fucking weapon
	if (not self.Owner:IsNPC() and self.Owner:KeyDown(IN_USE)) then
		bHolsted = !self.Weapon:GetDTBool(0)
		self:SetHolsted(bHolsted)

		self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)

		self:SetIronsights(false)

		return
	end

	if (not self:CanPrimaryAttack()) then return end

	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + 100 * self.Owner:GetAimVector()
	tr.filter = {self.Owner}
	local trace = util.TraceLine(tr)

	if not trace.Hit then return end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	timer.Simple(3, function()
		if (not self.Owner or not self.Owner:Alive() or self.Weapon:GetOwner():GetActiveWeapon():GetClass() ~= "weapon_bigbomb" or not IsFirstTimePredicted()) then return end

		self.Weapon:SendWeaponAnim(ACT_VM_SECONDARYATTACK)

		local tr = {}
		tr.start = self.Owner:GetShootPos()
		tr.endpos = self.Owner:GetShootPos() + 100 * self.Owner:GetAimVector()
		tr.filter = {self.Owner}
		local trace = util.TraceLine(tr)

		if not trace.Hit then
			timer.Simple(0.6, function()
				if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
					self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
				else
					self.Weapon:Remove()
					self.Owner:ConCommand("lastinv")
				end
			end)

			return 
		end

		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self:TakePrimaryAmmo(1)

		if (CLIENT) then return end
	
		C4 = ents.Create("ent_bigbomb")
		C4:SetPos(trace.HitPos + trace.HitNormal)

		trace.HitNormal.z = -trace.HitNormal.z

		C4:SetAngles(Angle(0, 0, 0))

		C4.Owner = self.Owner
		C4.Timer = 120
		C4:Spawn()

		if trace.Entity and trace.Entity:IsValid() then
			if not trace.Entity:IsNPC() and not trace.Entity:IsPlayer() and trace.Entity:GetPhysicsObject():IsValid() then
				constraint.Weld(C4, trace.Entity)
				C4:SetMoveType(MOVETYPE_NONE)
			end
		else
			C4:SetMoveType(MOVETYPE_NONE)
		end

		timer.Simple(0.6, function()
			if (not self.Owner:Alive() or self.Weapon:GetOwner():GetActiveWeapon():GetClass() ~= "weapon_bigbomb") or not IsFirstTimePredicted() then return end

			if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
				self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
			else
				self.Weapon:Remove()
				self.Owner:ConCommand("lastinv")
			end
		end)
	end)
end

function SWEP:SecondaryAttack()
return false
end

/*---------------------------------------------------------
   Name: SWEP:CanPrimaryAttack()
   Desc: Helper function for checking for no ammo.
---------------------------------------------------------*/
function SWEP:CanPrimaryAttack()

	if (self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) or (self.Owner:WaterLevel() > 2) then
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
		return false
	end

	if (not self.Owner:IsNPC()) and (self.Owner:KeyDown(IN_SPEED)) then
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
		return false
	end

	return true
end

/*---------------------------------------------------------
   Name: SWEP:Deploy()
   Desc: Whip it out.
---------------------------------------------------------*/
function SWEP:Deploy()

	if self.Weapon:GetNetworkedBool("Suppressor") then
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW_SILENCED)
	else
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.DeployDelay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.DeployDelay)
	self.ActionDelay = (CurTime() + self.DeployDelay)

//	self:SetIronsights(false)

	return true
end

/*---------------------------------------------------------
   Name: SWEP:Holster()
---------------------------------------------------------*/
function SWEP:Holster()

	if (CLIENT) and self.Ghost:IsValid() then
		self.Ghost:SetColor(Color(255, 255, 255, 0))
	end

	return true
end

/*---------------------------------------------------------
   Name: SWEP:OnRemove()
   Desc: Called just before entity is deleted.
---------------------------------------------------------*/
function SWEP:OnRemove()

	if (CLIENT) and self.Ghost:IsValid() then
		self.Ghost:SetColor(Color(255, 255, 255, 0))
	end

	return true
end