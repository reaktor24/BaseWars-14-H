AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 3, "InUse" );
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
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("moonshine_still")
    ent:SetPos( tr.HitPos + tr.HitNormal * 45 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end


function ENT:Use()
if self:GetInUse() != true then
	self.Entity:SetNWBool("InUse", true)
	timer.Create( tostring(self.Entity) .. "drug", 50, 1, function() self:MakeBooze() end)
	self.Entity:SetColor(Color(255,200,200,255))
	self.sound = CreateSound(self, Sound("ambient/water/water_in_boat1.wav"))
	self.sound:SetSoundLevel(60)
	self.sound:PlayEx(1, 100)
	end
end

function ENT:OnRemove()
timer.Destroy(tostring(self.Entity) .. "drug")
	if self.sound then
		self.sound:Stop()
	end
end

function ENT:MakeBooze()
	local SpawnPos = self:GetPos()
		local Booze = ents.Create("durgz_alcohol")
		Booze:SetPos(SpawnPos + Vector(0,0,50))
		Booze:Spawn()
		self.Entity:SetNWBool("InUse",false)
		self.Entity:SetColor(Color(255,255,255,255))
		if self.sound then
		self.sound:Stop()
	end
end
