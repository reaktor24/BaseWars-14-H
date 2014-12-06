include('shared.lua')

function ENT:Initialize()
	self.min,self.max = self:GetCollisionBounds()
end

function ENT:DrawInfo()
	Pos = self:GetPos()
	Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Up(), 90)
	if self.Flip then Ang:RotateAroundAxis(Ang:Forward(),90) end

	local owner = self.dt.owning_ent
	owner = (IsValid(owner) and owner:Nick()) or "Disconnected"
	local Name = self.PrintName
	local Health = self:GetAmount()
	local PoweredColor = Color(0,0,0,255)


	if self.PowerUsage > 0 then
		local Powered = self:GetPowered() --It's nil if it's a power plant

		if Powered then
			PoweredColor = Color(147,204,26,255)
		else
			PoweredColor = Color(176,28,46,255)
		end
	end

	surface.SetFont( "DermaLarge" )
	local TextWidthowner = surface.GetTextSize(owner)
	local TextWidthName = surface.GetTextSize(Name)
	local TextWidthPowered = surface.GetTextSize("Powered")
	local TextWidthHealth = surface.GetTextSize(Health)

	self.FinishedPos = Vector(0,0,0)
	if self.Flip then self.FinishedPos = Pos + Ang:Up() * self.max.x
	else self.FinishedPos = Pos + Ang:Up() * self.max.z, Ang, 0.11 end

	cam.Start3D2D(self.FinishedPos, Ang, 0.2)
		draw.WordBox(2, 0 - TextWidthowner * .5, -60, owner, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.WordBox(2, 0 - TextWidthName * .5, -20, Name, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.WordBox(2, 0 - TextWidthName * .5, 30, Health, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.RoundedBox( 6, -24-95, -22, 60, 42, Color( 0, 255, 0, opacity1 - 0))
		if self.PowerUsage > 0 then draw.WordBox(2, 0 - TextWidthPowered * .5, 20, "Powered", "DermaLarge", Color(0, 0, 0, 100), PoweredColor)
		else  draw.WordBox(2, 0 - surface.GetTextSize(tostring(self:GetSlots()).." slots used of "..tostring(self.PowerSlots).." max") * .5, 20, tostring(self:GetSlots()).." slots used of "..tostring(self.PowerSlots).." max", "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255)) end
	cam.End3D2D()
end
