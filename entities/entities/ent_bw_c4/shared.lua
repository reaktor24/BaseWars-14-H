ENT.Type 		= "anim"
ENT.PrintName	= "Explosive C4"
ENT.Author		= "LegendofRobbo"
ENT.Contact		= ""
ENT.Purpose		= ""
ENT.Instructions	= ""
ENT.MaxHealth 		= 1200

/*---------------------------------------------------------
   Name: ENT:SetupDataTables()
   Desc: Setup the data tables.
---------------------------------------------------------*/
function ENT:SetupDataTables()  
 	self:NetworkVar( "Float", 0, "Amount" )
 	self:NetworkVar( "Int", 0, "Timer" )
end 

/*---------------------------------------------------------
   Name: ENT:Initialize()
---------------------------------------------------------*/
function ENT:Initialize()

	self.C4CountDown = self:GetTimer()
	self:CountDown()
	self.Entity:EmitSound("C4.Plant")
end

/*---------------------------------------------------------
   Name: ENT:CountDown()
---------------------------------------------------------*/
function ENT:CountDown()

	if self.C4CountDown > 1 then
		self.Entity:EmitSound("C4.PlantSound")

		self.C4CountDown = self.C4CountDown - 1

		timer.Create("C4Time"..self:EntIndex(), 1, 0, function()
			self:CountDown()
		end)
	else
		self.C4CountDown = 0
		timer.Destroy("C4Time"..self:EntIndex())
	end
end

/*---------------------------------------------------------
   Name: ENT:OnRemove()
---------------------------------------------------------*/
function ENT:OnRemove()

	timer.Destroy("C4Time"..self:EntIndex())
end