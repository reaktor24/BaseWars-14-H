AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
end

function ENT:Initialize()
	self.Entity:SetModel("models/props/de_train/Barrel.mdl")
	self.Entity:SetColor(Color(255, 255, 255, 255))
	
	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_lab/crematorcase.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()+self.Entity:GetAngles():Up()*54)
	self.Panel:SetAngles(self.Entity:GetAngles())
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(200,255,200,255))

	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props/de_train/biohazardtank_dm_10.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward() * -62 + self.Entity:GetAngles():Right()* -49 + self.Entity:GetAngles():Up()*40)
	self.Panel:SetAngles(self.Entity:GetAngles() + Angle(90,0,0))
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(200,255,255,255))

	self.Panel = ents.Create("prop_dynamic_override")
	self.Panel:SetModel( "models/props_lab/plotter.mdl" )
	self.Panel:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward() * -2 + self.Entity:GetAngles():Up()*14)
	self.Panel:SetAngles(self.Entity:GetAngles())
	self.Panel:SetParent(self.Entity)
	self.Panel:SetSolid(SOLID_NONE)
	self.Panel:SetMoveType(MOVETYPE_NONE)
	self.Panel:SetColor(Color(200,255,255,255))
	
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
	self.Entity:EmitSound("basewars/nuclearprinter.mp3", 0, 100)
end

function ENT:Payday()
	if self:GetPowered() then
		local pay = math.random(self.PayLow, self.PayHigh)
		local position = self.GetPos(self) + self:GetAngles():Up() * 35 + self.Entity:GetAngles():Forward() * -20
		DropMoney(position, pay)
	end
end

function ENT:Think(  )
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
	self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"))
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