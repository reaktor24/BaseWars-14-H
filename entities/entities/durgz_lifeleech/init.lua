AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL = "models/props_lab/jar01b.mdl"


ENT.LASTINGEFFECT = 180; --how long the high lasts in seconds

function ENT:Initialize()	

	self:SetModel( self.MODEL )
	self:SetColor( Color( 2555, 25, 25, 255) )
	
	self:PhysicsInit( SOLID_VPHYSICS )
    self:SetUseType( 3 )

	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then  		
		phys:Wake()  	
	end
	
	self.LACED = {};
	
	if( self.MASS )then
		self.Entity:GetPhysicsObject():SetMass( self.MASS );
	end
	
end

--called when you use it (after it sets the high visual values and removes itself already)
function ENT:High(activator,caller)
activator:SetNWBool("Leeched", true)
end

function ENT:AfterHigh(activator, caller)
end

local function Resetleech()

	for id,pl in pairs( player.GetAll() )do

		if( pl:GetNetworkedFloat("durgz_leech_high_end") - 0.5 < CurTime() && pl:GetNetworkedFloat("durgz_leech_high_end") > CurTime() )then
			pl:SetNWBool("Leeched", false)
		end
		
	end
	
end
hook.Add("Think", "durgz_leech_resetleech", Resetleech)