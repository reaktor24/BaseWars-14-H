ENT.Type = "anim"
ENT.Base = "durgz_base_combat"
ENT.PrintName = "Adrenaline"
ENT.Nicknames = {
    "Adrenaline"
}
ENT.OverdosePhrase = {"took too much"}
ENT.Author = "LegendofRobbo"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Information	 = "Makes you run like a kenyan" 
ENT.Category = "Drugs"

ENT.TRANSITION_TIME = 6

--function for high visuals

if(CLIENT)then
	
	
	local TRANSITION_TIME = ENT.TRANSITION_TIME; --transition effect from sober to high, high to sober, in seconds how long it will take etc.
	local HIGH_INTENSITY = 0.60; --1 is max, 0 is nothing at all
	
	
	local function DoAdrenaline()
		if(!DURGZ_LOST_VIRGINITY)then return; end
		--self:SetNetworkedFloat( "SprintSpeed"
		local pl = LocalPlayer()
		
		if( pl:GetNetworkedFloat("durgz_adrenaline_high_start") && pl:GetNetworkedFloat("durgz_adrenaline_high_end") > CurTime() )then
		
			if( pl:GetNetworkedFloat("durgz_adrenaline_high_start") + TRANSITION_TIME > CurTime() )then
			
				local s = pl:GetNetworkedFloat("durgz_adrenaline_high_start");
				local e = s + TRANSITION_TIME;
				local c = CurTime();
				local pf = (c-s) / (e-s);
				
			elseif( pl:GetNetworkedFloat("durgz_adrenaline_high_end") - TRANSITION_TIME < CurTime() )then
			
				local e = pl:GetNetworkedFloat("durgz_adrenaline_high_end");
				local s = e - TRANSITION_TIME;
				local c = CurTime();
				local pf = 1 - (c-s) / (e-s);
			end
		end
	end
	hook.Add("RenderScreenspaceEffects", "durgz_adrenaline_high", DoAdrenaline)
end