include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	if self:GetModel() == "models/nater/weedplant_pot_growing7.mdl" then
		self:SetColor( Color( 0, 255, 0, 255) )
	else
		self:SetColor( Color( 255, 255, 255, 255) )
	end
end