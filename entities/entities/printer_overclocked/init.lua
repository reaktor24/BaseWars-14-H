AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
end

function ENT:Initialize()
	-- Boiler plate
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetColor(Color(255, 180, 180, 255))
--	self.Entity:SetMaterial( "models/props_pipes/GutterMetal01a" )
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	timer.Create(self:EntIndex().."paytimer", self.Delay, 0, function () self:Payday() end)
	self.Powered = false
	self:SetAmount(self.MaxHealth)
end

function ENT:Payday()
	if self:GetPowered() then
		local pay = math.random(self.PayLow, self.PayHigh)
		local position = self.GetPos(self) + self:GetAngles():Up() * 15
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
	self.sound:SetSoundLevel(52)
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