AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.MODEL = "models/striker/bong.mdl"


ENT.LASTINGEFFECT = 15; --how long the high lasts in seconds

--called when you use it (after it sets the high visual values and removes itself already)
function ENT:High(activator,caller)
	local smoke = EffectData();
	smoke:SetOrigin(activator:EyePos());
	util.Effect("durgz_weed_smoke", smoke);
	--enhance sound (not really like it but close enough as far as computers go)
	activator:SetDSP(6);
	--increase health
		local health = activator:Health()
		if( health < 100 )then
			activator:SetHealth( health + 10 )
		end
		
end

function ENT:AfterHigh(activator, caller)
end

/*
local function ResetGrav()

	for id,pl in pairs( player.GetAll() )do

		if( pl:GetNetworkedFloat("durgz_weed_high_end") - 0.5 < CurTime() && pl:GetNetworkedFloat("durgz_weed_high_end") > CurTime() )then
			pl:SetGravity(1)
		end
		
	end
	
end
hook.Add("Think", "durgz_weed_resetgrav", ResetGrav)
*/

