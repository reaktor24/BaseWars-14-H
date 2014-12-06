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
	self.CookMode = false    --false for random drugs, true for money..cos fuck you thats why
	end
	self:SetAmount(self.MaxHealth)
end

function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
	
    local ent = ents.Create("drug_refinery")
    ent:SetPos( tr.HitPos + tr.HitNormal * 45 ) 
    ent:Spawn()
    ent:Activate()
 
    return ent
end

function ENT:Think()
	if self.IsCooking == true then
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() + self:GetAngles():Up() * 83 + self:GetAngles():Forward() * 30)
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

function ENT:OnTakeDamage(dmg)
	local damage = dmg:GetDamage()
	local currenthealth = self:GetAmount()
	if currenthealth - damage < 0 then
		DropMoney(self:GetPos() + Vector(0,0,40), math.floor(self.Price / 2))
		self:Remove()
		self:Destruct()
	else
		self:SetAmount(currenthealth - damage)
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
	if hitEnt:GetClass() == "durgz_alcohol" and self.Moonshine < 50 then
	self.Moonshine = (self.Moonshine + 1)
	hitEnt:Remove()
	end
	if hitEnt:GetClass() == "durgz_weed" and self.Weed < 50 then
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
    Drug:SetPos(SpawnPos + self:GetAngles():Up() * 83 + self:GetAngles():Forward() * 30)
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

/*
util.AddNetworkString("makerandomdrug")
net.Receive('makerandomdrug', function( length, ply )
local Lab = net.ReadEntity()
Lab.CookMode = false
end)

util.AddNetworkString("makemoney")
net.Receive('makemoney', function( length, ply )
local Lab = net.ReadEntity()
Lab.CookMode = true
end)
*/


util.AddNetworkString("makerandomdrug")
net.Receive('makerandomdrug', function( length, ply )
local Lab = net.ReadEntity()
Lab:StartCook()
end)
