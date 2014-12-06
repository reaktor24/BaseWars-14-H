ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "wat"
ENT.Author			= "LegendofRobbo"
ENT.Contact			= "sod off"
ENT.Purpose			= "All other structures are based off this code"
ENT.Instructions	= "herp derp how i duz lua"
ENT.Buyer 			= "ERROR"

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
end