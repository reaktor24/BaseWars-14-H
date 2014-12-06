ENT.Type = "anim"
ENT.Base = "base_structure"
 
ENT.PrintName		= "Gun Factory"
ENT.Author			= "LegendofRobbo"
ENT.Contact			= "sod off"
ENT.Purpose			= "Builds advanced weapons"
ENT.Instructions	= "derp"
ENT.Price 			= "1000"
ENT.Model 			= "models/props/de_prodigy/transformer.mdl"
ENT.Ent_Name 		= "gun_factory"
ENT.Spawnable 		= true
ENT.MaxHealth 		= 600
ENT.Flip 			= true
ENT.PowerUsage		= 2
ENT.Category 		= "Production Structures"


function ENT:OnUse( ply )
	ply:OpenCombiMenu( "gms_stoneworkbench" )
end