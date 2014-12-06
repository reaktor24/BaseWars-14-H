include('shared.lua')

function ENT:Initialize()
	self.min,self.max = self:GetCollisionBounds()
end
