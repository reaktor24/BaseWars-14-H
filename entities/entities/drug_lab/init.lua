AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
end

RandomDrug = {
	"durgz_djump",
	"durgz_lifeleech",
	"durgz_regen",
	"durgz_adrenaline",
}

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetUseType( 3 )
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	self.Moonshine = 0
	self.Weed = 0
	self.Position = self.Entity:GetPos()
	self.IsCooking = false
	end
self.Drug1 = ents.Create("prop_dynamic_override")
	self.Drug1:SetModel( "models/props_lab/crematorcase.mdl" )
	self.Drug1:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*2+self.Entity:GetAngles():Right()*20+self.Entity:GetAngles():Up()*30)
	self.Drug1:SetParent(self.Entity)
	self.Drug1:SetSolid(SOLID_NONE)
	self.Drug1:SetMoveType(MOVETYPE_NONE)

self.Drug2 = ents.Create("prop_dynamic_override")
	self.Drug2:SetModel( "models/props_lab/reciever01b.mdl" )
	self.Drug2:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-12+self.Entity:GetAngles():Right()*-22+self.Entity:GetAngles():Up()*34)
	self.Drug2:SetParent(self.Entity)
	self.Drug2:SetSolid(SOLID_NONE)
	self.Drug2:SetMoveType(MOVETYPE_NONE)

self.Drug3 = ents.Create("prop_dynamic_override")
	self.Drug3:SetModel( "models/props_lab/jar01a.mdl" )
	self.Drug3:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-12+self.Entity:GetAngles():Right()*-22+self.Entity:GetAngles():Up()*44)
	self.Drug3:SetParent(self.Entity)
	self.Drug3:SetSolid(SOLID_NONE)
	self.Drug3:SetMoveType(MOVETYPE_NONE)

self.Drug4 = ents.Create("prop_dynamic_override")
	self.Drug4:SetModel( "models/props_lab/desklamp01.mdl" )
	self.Drug4:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*-12+self.Entity:GetAngles():Right()*-1+self.Entity:GetAngles():Up()*38)
	self.Drug4:SetParent(self.Entity)
	self.Drug4:SetSolid(SOLID_NONE)
	self.Drug4:SetMoveType(MOVETYPE_NONE)

self.Drug5 = ents.Create("prop_dynamic_override")
	self.Drug5:SetModel( "models/props_lab/jar01b.mdl" )
	self.Drug5:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*12+self.Entity:GetAngles():Right()*-6+self.Entity:GetAngles():Up()*34)
	self.Drug5:SetParent(self.Entity)
	self.Drug5:SetSolid(SOLID_NONE)
	self.Drug5:SetMoveType(MOVETYPE_NONE)

self.Drug6 = ents.Create("prop_dynamic_override")
	self.Drug6:SetModel( "models/props_c17/tools_pliers01a.mdl" )
	self.Drug6:SetPos(self.Entity:GetPos()+self.Entity:GetAngles():Forward()*12+self.Entity:GetAngles():Right()*-22+self.Entity:GetAngles():Up()*30)
	self.Drug6:SetParent(self.Entity)
	self.Drug6:SetSolid(SOLID_NONE)
	self.Drug6:SetMoveType(MOVETYPE_NONE)

	self:SetAmount(self.MaxHealth)
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("drug_lab")
    ent:SetPos( tr.HitPos + tr.HitNormal * 45 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end

function ENT:Think()
	if self.IsCooking == true then
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() + self:GetAngles():Up() * 40 + self:GetAngles():Right() * 22)
		effectdata:SetMagnitude(1)
		effectdata:SetScale(2)
		effectdata:SetRadius(4)
		util.Effect("inflator_magic", effectdata)
		self.sound = CreateSound(self, Sound("ambient/gas/steam2.wav") )
		self.sound:SetSoundLevel(60)
		self.sound:PlayEx(1, 100)
	end
end

function ENT:Use(activator,caller)
	if caller:IsValid() and self.IsCooking == false and self:GetPowered() == true then
	umsg.Start("DrugLabMenu", caller)
	umsg.Short( self.Moonshine )
	umsg.Short( self.Weed )
	umsg.Entity( self.Entity )
	umsg.End()
	end
end

function ENT:OnRemove()
timer.Destroy("Cooktimer"..tostring(self.Entity))
	if self.sound then
		self.sound:Stop()
	end
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

function ENT:StartTouch(hitEnt)
	if hitEnt:GetClass() == "durgz_alcohol" and self.Moonshine < 30 then
	self.Moonshine = (self.Moonshine + 1)
	hitEnt:Remove()
	end
	if hitEnt:GetClass() == "durgz_weed" and self.Weed < 30 then
	self.Weed = (self.Weed + 1)
	hitEnt:Remove()
	end
end

function ENT:StartCook()
	if self.IsCooking == true then return end
	self.IsCooking = true
	timer.Create("Cooktimer"..tostring(self.Entity), 60, 1, function() self:MakeRandomDrug() end)
end

function ENT:MakeRandomDrug()
	local SpawnPos = self:GetPos()
    local Drug = ents.Create(table.Random(RandomDrug))
    Drug:SetPos(SpawnPos + Vector(0,0,50))
    Drug:Spawn()
    Drug:Activate()
	self.Moonshine = (self.Moonshine - 10)
	self.Weed = (self.Weed - 10)
	timer.Destroy("Cooktimer"..tostring(self.Entity))
	self.IsCooking = false
	if self.sound then
		self.sound:Stop()
	end
end

util.AddNetworkString("makerandomdrug")
net.Receive('makerandomdrug', function( length, ply )
local Lab = net.ReadEntity()
Lab:StartCook()
end)