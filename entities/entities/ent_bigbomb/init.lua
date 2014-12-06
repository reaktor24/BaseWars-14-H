AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

/*---------------------------------------------------------
   Name: ENT:Initialize()
---------------------------------------------------------*/
function ENT:Initialize()

	self.Owner = self.Entity.Owner

	if !IsValid(self.Owner) then
		self:Remove()
		return
	end

	self.Entity:SetModel("models/props_c17/oildrum001.mdl")
	self.Entity:SetSkin(1)
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	self.BombPanel = ents.Create("prop_dynamic_override")
	self.BombPanel:SetModel( "models/weapons/w_c4_planted.mdl" )
	self.BombPanel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*10+self.Entity:GetAngles():Up()*25)
	self.BombPanel:SetAngles(Angle(0,90,90))
	self.BombPanel:SetParent(self.Entity)
	self.BombPanel:SetSolid(SOLID_NONE)
	//self.BombPanel:PhysicsInit(SOLID_NONE)
	self.BombPanel:SetMoveType(MOVETYPE_NONE)
	
	self.BombPanel2 = ents.Create("prop_dynamic_override")
	self.BombPanel2:SetModel( "models/dav0r/tnt/tnt.mdl" )
	self.BombPanel2:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-6+self.Entity:GetAngles():Right()*-12+self.Entity:GetAngles():Up()*15)
	self.BombPanel2:SetAngles(Angle(0,45,0))
	self.BombPanel2:SetParent(self.Entity)
	self.BombPanel2:SetSolid(SOLID_NONE)
	//self.BombPanel2:PhysicsInit(SOLID_NONE)
	self.BombPanel2:SetMoveType(MOVETYPE_NONE)
	
	self.BombPanel3 = ents.Create("prop_dynamic_override")
	self.BombPanel3:SetModel( "models/dav0r/tnt/tnt.mdl" )
	self.BombPanel3:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-6+self.Entity:GetAngles():Right()*12+self.Entity:GetAngles():Up()*15)
	self.BombPanel3:SetAngles(Angle(0,-45,0))
	self.BombPanel3:SetParent(self.Entity)
	self.BombPanel3:SetSolid(SOLID_NONE)
	//self.BombPanel3:PhysicsInit(SOLID_NONE)
	self.BombPanel3:SetMoveType(MOVETYPE_NONE)




	
	local phys = self.Entity:GetPhysicsObject()

	if phys:IsValid() then
		phys:Wake()
	end

	self.Used = false
	self.Defuse	= 0
	self.DefuseDelay = CurTime()

	self:SetDTInt(0, self.Timer)
	self.ThinkTimer = CurTime() + self:GetDTInt(0)
	self.Entity:SetNWFloat("goofytiem",self.ThinkTimer)
end

/*---------------------------------------------------------
   Name: ENT:Use()
---------------------------------------------------------*/
function ENT:Use(activator, caller)
return false
/*
	self.Used = true
	self.Defuser = activator
*/
end

/*---------------------------------------------------------
   Name: ENT:Think()
---------------------------------------------------------*/
function ENT:Think()
	if self.ThinkTimer < CurTime() then
		self:Explosion()
	end

	self.Used = false
	self.Defuser = nil
end

function ENT:OnTakeDamage(dmg)
return false
end

/*---------------------------------------------------------
   Name: ENT:Explosion()
---------------------------------------------------------*/
function ENT:Explosion()

	local trace = {}
	trace.start = self.Entity:GetPos() + Vector(0, 0, 32)
	trace.endpos = self.Entity:GetPos() - Vector(0, 0, 128)
	trace.Entity = self.Entity
	trace.mask  = 16395
	local Normal = util.TraceLine(trace).HitNormal

	self.Scale = 6
--	self.EffectScale = self.Scale ^ 0.65

	local effectdata = EffectData()
		effectdata:SetStart(Vector(0,0,90))
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(3)
	util.Effect("cinematicexplosion", effectdata)

	local explo = ents.Create("env_explosion")
		explo:SetOwner(self.Owner)
		explo:SetPos(self.Entity:GetPos())
		explo:SetKeyValue("iMagnitude", "50")
		explo:Spawn()
		explo:Activate()
		explo:Fire("Explode", "", 0)
	
	local shake = ents.Create("env_shake")
		shake:SetOwner(self.Owner)
		shake:SetPos(self.Entity:GetPos())
		shake:SetKeyValue("amplitude", "2000")	// Power of the shake
		shake:SetKeyValue("radius", "1250")		// Radius of the shake
		shake:SetKeyValue("duration", "2.5")	// Time of shake
		shake:SetKeyValue("frequency", "255")	// How har should the screenshake be
		shake:SetKeyValue("spawnflags", "4")	// Spawnflags(In Air)
		shake:Spawn()
		shake:Activate()
		shake:Fire("StartShake", "", 0)

	local ar2Explo = ents.Create("env_ar2explosion")
		ar2Explo:SetOwner(self.Owner)
		ar2Explo:SetPos(self.Entity:GetPos())
		ar2Explo:Spawn()
		ar2Explo:Activate()
		ar2Explo:Fire("Explode", "", 0)

	self.Entity:EmitSound(Sound("C4.Explode"))

	self.Entity:Remove()

	local en = ents.FindInSphere(self.Entity:GetPos(), 100)

	for k, v in pairs(en) do
		if (v:GetPhysicsObject():IsValid()) then
			// Unweld and unfreeze props
			if (math.random(1, 100) < 95) then
				v:Fire("enablemotion", "", 0)
				local exp = ents.Create("env_physexplosion")
			exp:SetKeyValue("magnitude", 100)
			exp:SetKeyValue("radius", 400)
			exp:SetPos(self.Entity:GetPos())
			exp:Spawn()
			exp:SetOwner(self.Owner)
			exp:Fire("explode","",0)
			end
		end
	end
end


