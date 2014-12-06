include("shared.lua")

language.Add("ent_bw_c4", "Explosive C4")

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" )
 	self:NetworkVar( "Int", 0, "Timer" )
end

/*---------------------------------------------------------
   Name: ENT:Draw()
---------------------------------------------------------*/
function ENT:Draw()
	self.Entity:DrawInfo()
	self.Entity:DrawModel()

	local FixAngles = self.Entity:GetAngles()
	local FixRotation = Vector(0, 270, 0)

	FixAngles:RotateAroundAxis(FixAngles:Right(), FixRotation.x)
	FixAngles:RotateAroundAxis(FixAngles:Up(), FixRotation.y)
	FixAngles:RotateAroundAxis(FixAngles:Forward(), FixRotation.z)

 	local TargetPos = self.Entity:GetPos() + (self.Entity:GetUp() * 9)

	local m, s = self:FormatTime(self.C4CountDown)

	self.Text = string.format("%02d", m) .. ":" .. string.format("%02d", s)

	cam.Start3D2D(TargetPos, FixAngles, 0.15)
		draw.SimpleText(self.Text, "Default", 31, -22, Color(255, 0, 0, 255), 1, 1)
	cam.End3D2D() 
end

function ENT:DrawInfo()
	Pos = self:GetPos()
	Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Up(), 90)

	local Health = self:GetAmount()
	local MaxHP = self.MaxHealth

	local DamageColorScale = Color(0, 159, 20, 155)

		if Health < MaxHP / 2 then 
			DamageColorScale = Color(255, 205, 0, 155)
end
			if Health < MaxHP / 4 then 
			DamageColorScale = Color(180, 0, 0, 100)

end
    self.FinishedPos = Pos + self:GetAngles():Up()* 15 + self:GetAngles():Forward() * 5 + Ang:Up() * -5, Ang, 0.11

	cam.Start3D2D(self.FinishedPos, Ang, 0.15)
		draw.RoundedBox(10, -70, 20, math.Clamp(Health,0,MaxHP) / 10, 20, DamageColorScale)
	cam.End3D2D()
end

/*---------------------------------------------------------
   Name: ENT:FormatTime()
---------------------------------------------------------*/
function ENT:FormatTime(seconds)

	local m = seconds % 604800 % 86400 % 3600 / 60
	local s = seconds % 604800 % 86400 % 3600 % 60

	return math.floor(m), math.floor(s)
end