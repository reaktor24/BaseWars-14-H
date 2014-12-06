AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

 function ENT:SetupDataTables()
 	self:NetworkVar( "Float", 0, "Amount" );
 	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar("Entity",1,"owning_ent")
 end

function ENT:Initialize()
	self:SetAmount(self.MaxHealth)
	self:SetBuyer(self.Buyer)
end

function ENT:OnTakeDamage(dmg)
	local damage = dmg:GetDamage()
	local currenthealth = self:GetAmount()
	if currenthealth - damage < 0 then
		DropMoney(self:GetPos(), math.floor(self.Price / 2))
		self:Remove()
		self:Destruct()
	else
		self:SetAmount(currenthealth - damage)
	end	
end

function ENT:Destruct()
	local vPoint = self:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)
end