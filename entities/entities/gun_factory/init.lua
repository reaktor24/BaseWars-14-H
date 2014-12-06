AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
end

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self:SetAmount(self.MaxHealth)
	--
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("gun_factory")
    ent:SetPos( tr.HitPos + tr.HitNormal * 45 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end

function ENT:Power()
	self:SetPowered(true)
end

function ENT:UnPower()
	self:SetPowered(false)
end

function ENT:IsPowered()
	return self:GetPowered()
end
