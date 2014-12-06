AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
end

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()

	self.pots = ents.Create("weed_plant")
	self.pots:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Right()*-30+self.Entity:GetAngles():Forward()*-15+self.Entity:GetAngles():Up()*47)
	self.pots:Spawn()
	constraint.Weld(self.pots, self.Entity, 0, 0, 0, true, true)
--	self.pots:SetSolid(SOLID_VPHYSICS)

	self.pots = ents.Create("weed_plant")
	self.pots:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Right()*-5+self.Entity:GetAngles():Forward()*-15+self.Entity:GetAngles():Up()*47)
	self.pots:Spawn()
	constraint.Weld(self.pots, self.Entity, 0, 0, 0, true, true)
--	self.pots:SetSolid(SOLID_VPHYSICS)

	self.pots = ents.Create("weed_plant")
	self.pots:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Right()*20+self.Entity:GetAngles():Forward()*-15+self.Entity:GetAngles():Up()*47)
	self.pots:Spawn()
	constraint.Weld(self.pots, self.Entity, 0, 0, 0, true, true)
--	self.pots:SetSolid(SOLID_VPHYSICS)

	self.pots = ents.Create("weed_plant")
	self.pots:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Right()*45+self.Entity:GetAngles():Forward()*-15+self.Entity:GetAngles():Up()*47)
	self.pots:Spawn()
	constraint.Weld(self.pots, self.Entity, 0, 0, 0, true, true)
--	self.pots:SetSolid(SOLID_VPHYSICS)

	end

	self:SetAmount(self.MaxHealth)
	--
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("hydroponics")
    ent:SetPos( tr.HitPos + tr.HitNormal * 45 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end


function ENT:Use()
return false
end

function ENT:OnRemove()
	if self.sound then
		self.sound:Stop()
	end
end
