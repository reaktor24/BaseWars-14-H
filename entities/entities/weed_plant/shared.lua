ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Weed Plant"
ENT.Author = "LegendofRobbo"
ENT.Spawnable = false
ENT.AdminOnly = false

function ENT:SetupDataTables()
	self:NetworkVar("Int",1,"Stage")
end