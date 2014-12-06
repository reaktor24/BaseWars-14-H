AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

local activeColor 		= Color( 0, 255, 0, 255 )
local inactiveColor 		= Color( 255, 0, 0, 255 )	

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
end

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self:SetUseType( SIMPLE_USE )
 	self.Entity:SetAngles(Angle(-90, 0, 0))
	local phys = self:GetPhysicsObject()
	phys:EnableMotion(false)
	if (phys:IsValid()) then
		phys:Wake()
	end
	self:SetAmount(self.MaxHealth)
	--
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("spawn_point")
    ent:SetPos( tr.HitPos + tr.HitNormal ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end

function ENT:Use(activator, caller)
if activator.SpawnPoint and activator.SpawnPoint == self.Entity then
activator.SpawnPoint = nil
activator:PrintMessage(4, "Spawn point deactivated.")
self:SetColor( inactiveColor )
else
activator.SpawnPoint = self.Entity
activator:PrintMessage(4, "Spawn point activated.")
self:SetColor( activeColor )
end
end 

local function SpawnerHook(pl)
if pl.SpawnPoint and pl.SpawnPoint:IsValid() then pl:SetPos(pl.SpawnPoint:GetPos() + Vector(0,0,16)) end
end
hook.Add("PlayerSpawn", "SpawnerHook", SpawnerHook) 
