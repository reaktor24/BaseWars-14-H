include('shared.lua')

SWEP.PrintName			= "Bomb Defuser"						// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 1							// Slot in the weapon selection menu
SWEP.SlotPos			= 9							// Position in the slot
SWEP.DrawAmmo			= false

function SWEP:DrawHUD()

	if (self.Weapon:GetDTBool(1)) or (LocalPlayer():InVehicle()) then return end

	local hitpos = util.TraceLine ({
		start = LocalPlayer():GetShootPos(),
		endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 100,
		filter = LocalPlayer(),
		mask = MASK_SHOT
	}).HitPos

	local screenpos = hitpos:ToScreen()
	
	local x = screenpos.x
	local y = screenpos.y

	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + 100 * self.Owner:GetAimVector()
	tr.filter = {self.Owner}
	local trace = util.TraceLine(tr)

	if not trace.Hit then return end
	if trace.Entity and trace.Entity:IsValid() then
		if trace.Entity:GetClass() == "ent_bw_c4" then
	surface.SetDrawColor(Color(255, 255, 255, 255))
	surface.SetFont( "Trebuchet30" )
	surface.SetTextColor( 255, 255, 255, 255 )
	surface.SetTextPos( x, y ) 
	surface.DrawText( "Click to Defuse" )
		end
	end
end