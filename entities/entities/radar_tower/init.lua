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

self.Dish = ents.Create("prop_dynamic_override")
	self.Dish:SetModel( "models/props_rooftop/roof_dish001.mdl" )
	self.Dish:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-5+self.Entity:GetAngles():Up()*25)
	//self.Dish:SetAngles(Angle(0,90,90))
	self.Dish:SetParent(self.Entity)
	self.Dish:SetSolid(SOLID_NONE)
	//self.Dish:PhysicsInit(SOLID_NONE)
	self.Dish:SetMoveType(MOVETYPE_NONE)
	end

	self:SetAmount(self.MaxHealth)
	--
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("radar_tower")
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

function ENT:Power()
	self:SetPowered(true)
	self.sound = CreateSound(self, Sound("ambient/machines/combine_terminal_loop1.wav"))
	self.sound:SetSoundLevel(60)
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
