AddCSLuaFile("shared.lua")
include("shared.lua")


ENT.MODEL = "models/props_junk/garbage_glassbottle001a.mdl"


ENT.LASTINGEFFECT = 15; --how long the high lasts in seconds


local function shouldnt_do_that_shit(pl)
    return pl == NULL or not pl or pl == nil or not pl:GetActiveWeapon() or pl:GetNetworkedFloat("durgz_alcohol_high_end") < CurTime()
end

function ENT:High(activator,caller)
	local TRANSITION_TIME = self.TRANSITION_TIME;
	local armor = activator:Armor()
	if( armor < 100 )then
	activator:SetArmor( armor + 5 )
	end
end
