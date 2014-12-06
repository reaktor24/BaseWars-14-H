AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
end

function ENT:Initialize()
	self.Entity:SetModel("models/props_phx/construct/windows/window_curve360x2.mdl")
	self.Entity:SetColor(Color(255, 255, 255, 255))
	
	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_combine/combine_mortar01b.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()+self.Entity:GetAngles():Up()*1)
	self.Panel:SetAngles(self.Entity:GetAngles())
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(255,255,255,255))

	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_combine/breenconsole.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*50+self.Entity:GetAngles():Up()*1)
	self.Panel:SetAngles(self.Entity:GetAngles() + Angle(0,90,0))
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(255,255,255,255))

	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_phx/construct/metal_angle360.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Up()*95)
	self.Panel:SetAngles(self.Entity:GetAngles())
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(255,255,255,255))

	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_phx/construct/metal_angle360.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Up()*-3)
	self.Panel:SetAngles(self.Entity:GetAngles())
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(255,255,255,255))
	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	timer.Create(self:EntIndex().."paytimer", self.Delay, 0, function () self:Payday() end)
	self.Powered = false
	self:SetAmount(self.MaxHealth)
--	self.Entity:EmitSound("basewars/nuclearprinter.mp3", 0, 100)
end

function ENT:Payday()
	if self:GetPowered() then
		local pay = math.random(self.PayLow, self.PayHigh)
		local position = self.GetPos(self) + self:GetAngles():Up() * 35 + self.Entity:GetAngles():Forward() * 60
		DropMoney(position, pay)
	end
end

function ENT:Think(  )
	if self:GetPowered() then
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() + self:GetAngles():Up() * 52)
		effectdata:SetMagnitude(1)
		effectdata:SetScale(2)
		effectdata:SetRadius(4)
		util.Effect("inflator_magic", effectdata)
	end
end

function ENT:Use( activator, caller )
	--self:Payday()
	return
end

function ENT:OnRemove()
	timer.Destroy( self:EntIndex().."paytimer" )
	if self.sound then
		self.sound:Stop()
	end
end

function ENT:Power()
	self:SetPowered(true)
	self.sound = CreateSound(self, Sound("ambient/machines/electric_machine.wav"))
	self.sound:SetSoundLevel(62)
	self.sound:PlayEx(1, 100)
end

function ENT:UnPower()
	self:SetPowered(false)
	if self.sound then
		self.sound:Stop()
	end
end

function ENT:IsPowered()
	return self:GetPowered()
end