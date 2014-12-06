include('shared.lua')
function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
end

function ENT:Draw()
	self.Entity:DrawModel()
	self:DrawInfo()
end

function ENT:DrawInfo()
	Pos = self:GetPos()
	Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Up(), 90)
	if self.Flip then Ang:RotateAroundAxis(Ang:Forward(),90) end

	local Owner = self:GetBuyer()
	local Name = self.PrintName
	local Health = self:GetAmount()
	local MaxHP = self.MaxHealth

	local DamageColorScale = Color(0, 159, 20, 155)

		if Health < MaxHP / 2 then 
			DamageColorScale = Color(255, 205, 0, 155)
	end
			if Health < MaxHP / 4 then 
			DamageColorScale = Color(180, 0, 0, 100)

	end

	surface.SetFont( "DermaLarge" )
	local TextWidthOwner = surface.GetTextSize(Owner)
	local TextWidthName = surface.GetTextSize(Name)
	local TextWidthHealth = surface.GetTextSize(Health)

	self.FinishedPos = Vector(0,0,0)
	if self.Flip then self.FinishedPos = Pos + self:GetAngles():Up() * 30 + Ang:Up() * self.max.x
	else self.FinishedPos = Pos + self:GetAngles():Up() * 10 + Ang:Up() * self.max.z, Ang, 0.11 end

	cam.Start3D2D(self.FinishedPos, Ang, 0.15)
		draw.WordBox(2, 0 - TextWidthOwner * .5, -60, Owner, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.WordBox(2, 0 - TextWidthName * .5, -20, Name, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.RoundedBox(10, TextWidthName * -0.4, 30, math.Clamp(Health,0,MaxHP) / 2, 20, DamageColorScale)
	cam.End3D2D()
end