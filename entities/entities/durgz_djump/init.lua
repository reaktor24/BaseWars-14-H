AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL = "models/props_lab/jar01b.mdl"


ENT.LASTINGEFFECT = 180; --how long the high lasts in seconds

function ENT:Initialize()	

	self:SetModel( self.MODEL )
	self:SetColor( Color( 55, 255, 175, 255) )
	
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
end

function ENT:AfterHigh(activator, caller)
activator:SetNWBool("Djumped", true)
end

local function ResetJumps()

	for id,pl in pairs( player.GetAll() )do

		if( pl:GetNetworkedFloat("durgz_djump_high_end") - 0.5 < CurTime() && pl:GetNetworkedFloat("durgz_djump_high_end") > CurTime() )then
			pl:SetNWBool("Djumped", false)
		end
		
	end
	
end
hook.Add("Think", "durgz_djump_resetjumps", ResetJumps)