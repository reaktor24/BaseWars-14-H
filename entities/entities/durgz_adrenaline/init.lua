AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL = "models/props_lab/jar01b.mdl"


ENT.LASTINGEFFECT = 180; --how long the high lasts in seconds

function ENT:Initialize()	

	self:SetModel( self.MODEL )
	self:SetColor( Color( 50, 70, 200, 255) )
	
	self:PhysicsInit( SOLID_VPHYSICS )
    self:SetUseType( 3 )

	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then  		
		phys:Wake()  	
	end
	
end


--called when you use it (after it sets the high visual values and removes itself already)
function ENT:High(activator,caller)
activator:SetNWBool("Adrenaline", true)
activator:SetRunSpeed(500)
self.MakeHigh = false;
    if activator:GetNetworkedFloat("durgz_adrenaline_high_end") < CurTime() then
        self.MakeHigh = true;
    end
end

function ENT:AfterHigh(activator, caller)
end

local function ResetAdrenaline()

	for id,pl in pairs( player.GetAll() )do

		if( pl:GetNetworkedFloat("durgz_adrenaline_high_end") - 0.5 < CurTime() && pl:GetNetworkedFloat("durgz_adrenaline_high_end") > CurTime() )then
			pl:SetNWBool("Adrenaline", false)
			pl:SetRunSpeed(350)
		end
		
	end
	
end
hook.Add("Think", "durgz_adrenaline_resetspeed", ResetAdrenaline)