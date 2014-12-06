ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Cash"
ENT.Author			= "LegendofRobbo"
ENT.Contact			= "Don't"
ENT.Purpose			= "Make it rain baby"
ENT.Instructions	= "Use with care. Always handle with gloves."
ENT.worth			= 0

function ENT:SetupDataTables()
	self:NetworkVar("Float",0,"CashAmount")
end