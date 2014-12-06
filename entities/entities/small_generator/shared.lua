ENT.Type = "anim"
ENT.Base = "base_structure"
 
ENT.PrintName		= "Small Generator"
ENT.Author			= "LegendofRobbo"
ENT.Contact			= "sod off"
ENT.Purpose			= "Gives you electricity for your structures."
ENT.Instructions	= "Keep the wires away from your mouth."
ENT.Category 		= "Power Plants"
ENT.PowerSlots		= 5
ENT.PowerUsage 		= 0
ENT.Price 			= 800
ENT.PowerDist       = 1024
ENT.Delay 			= 60
ENT.UseCost 		= 50
ENT.Player 			= nil
ENT.Spawnable 		= true
ENT.MaxHealth 		= 300
ENT.Fliped 			= false
ENT.Model 			= "models/props/de_train/acunit2.mdl"

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
end