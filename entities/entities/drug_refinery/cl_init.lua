include('shared.lua')
function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Amount" );
	self:NetworkVar( "String", 1, "Buyer");
	self:NetworkVar( "Bool", 2, "Powered" );
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
	local PoweredColor = Color(0,0,0,255)

	if self.PowerUsage > 0 then
		local Powered = self:GetPowered() --It's nil if it's a power plant

		if Powered then
			PoweredColor = Color(147,204,26,255)
		else
			PoweredColor = Color(176,28,46,255)
		end
	end

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
	local TextWidthPowered = surface.GetTextSize("Powered")
	local TextWidthHealth = surface.GetTextSize(Health)

	self.FinishedPos = Vector(0,0,0)
	if self.Flip then self.FinishedPos = Pos + self:GetAngles():Up() * 55 + Ang:Up() * self.max.x
	else self.FinishedPos = Pos + self:GetAngles():Up() * 10 + Ang:Up() * self.max.z, Ang, 0.11 end

	cam.Start3D2D(self.FinishedPos, Ang, 0.15)
		draw.WordBox(2, 0 - TextWidthOwner * .5, -60, Owner, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.WordBox(2, 0 - TextWidthName * .5, -20, Name, "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255))
		draw.RoundedBox(10, TextWidthName * -0.61, 60, math.Clamp(Health,0,MaxHP) / 3, 20, DamageColorScale)
		if self.PowerUsage > 0 then draw.WordBox(2, 0 - TextWidthPowered * .5, 20, "Powered", "DermaLarge", Color(0, 0, 0, 100), PoweredColor)
		else  draw.WordBox(2, 0 - surface.GetTextSize(tostring(self:GetSlots()).." slots used of "..tostring(self.PowerSlots).." max") * .5, 20, tostring(self:GetSlots()).." slots used of "..tostring(self.PowerSlots).." max", "DermaLarge", Color(0, 0, 0, 100), Color(255,255,255,255)) end
	cam.End3D2D()
end

function DrugLabMenu( msg )
    local DrugMenu = vgui.Create( "DFrame" )
    local Moonshine = msg:ReadShort()
    local Weed = msg:ReadShort()
    local Lab = msg:ReadEntity()
    DrugMenu:SetSize( 200, 210 ) 
    DrugMenu:Center() 
    DrugMenu:SetTitle( "Drug Refinery")  
    DrugMenu:SetVisible( true )
    DrugMenu:SetDraggable( true ) 
    DrugMenu:ShowCloseButton( true )
    DrugMenu:MakePopup()
    DrugMenu:SizeToContents()
    DrugMenu.Paint = function(CHPaint)
        -- Draw the menu background color.      
        draw.RoundedBox( 6, 0, 0, CHPaint:GetWide(), CHPaint:GetTall(), Color( 0, 0, 0, 200 ) )
    end

	local drugpanel = vgui.Create("DPanel", DrugMenu)
	drugpanel:SetSize(180, 110)
	drugpanel:SetPos(10, 25)
	drugpanel.Paint = function()
	surface.SetDrawColor( 0, 0, 0, 200 )
    surface.DrawRect( 0, 0, drugpanel:GetWide(), drugpanel:GetTall() )
	end

    local weed = vgui.Create("SpawnIcon", DrugMenu)
	weed:SetModel("models/nater/weedplant_pot_growing7.mdl")
	weed:SetPos(20, 40)
	weed:SetToolTip( false )

	local weed2 = vgui.Create("DLabel", DrugMenu)
	weed2:SetText(""..Weed.."/50")
	weed2:SetColor( Color(0,255,0,255) )
	weed2:SetSize(65, 20)
	weed2:SetPos(25, 110)
	weed2:SetFont( "Trebuchet30" )

    local alco = vgui.Create("SpawnIcon", DrugMenu)
	alco:SetModel("models/props_junk/garbage_glassbottle001a.mdl")
	alco:SetPos(115, 40)
	alco:SetToolTip( false )

	local alco2 = vgui.Create("DLabel", DrugMenu)
	alco2:SetText(""..Moonshine.."/50")
	alco2:SetColor( Color(0,255,255,255) )
	alco2:SetSize(65, 20)
	alco2:SetPos(120, 110)
	alco2:SetFont( "Trebuchet30" )

	local moneybutton = vgui.Create( "DButton", DrugMenu )
	moneybutton:SetPos( 10, 140 )
	moneybutton:SetText( "Refine Into Money" )
	moneybutton:SetTextColor( Color(255, 255, 255, 255) )
	moneybutton:SetSize( 180, 25 )
	moneybutton.Paint = function()
	surface.SetDrawColor( 0, 60, 0, 200 )
    surface.DrawRect( 0, 0, moneybutton:GetWide(), moneybutton:GetTall() )
	end
	moneybutton.DoClick = function()
	surface.PlaySound("buttons/blip1.wav")
	LocalPlayer():PrintMessage(3, "I haven't set this up yet, deal with it" )
	end

	local drugbutton = vgui.Create( "DButton", DrugMenu )
	drugbutton:SetPos( 10, 170 )
	drugbutton:SetText( "Refine Into Random Drugs" )
	drugbutton:SetTextColor( Color(255, 255, 255, 255) )
	drugbutton:SetSize( 180, 25 )
	drugbutton.Paint = function()
	surface.SetDrawColor( 60, 60, 0, 200 )
    surface.DrawRect( 0, 0, drugbutton:GetWide(), drugbutton:GetTall() )
	end
	drugbutton.DoClick = function()
	surface.PlaySound("buttons/blip1.wav")
	if Moonshine > 9 and Weed > 9 then
        net.Start("makerandomdrug")
        net.WriteEntity( Lab )
        net.SendToServer()
        DrugMenu:Remove()
	else
	LocalPlayer():PrintMessage(3, "Not enough base drugs! You need at least 10 of each type!" )
	end
	end

end
usermessage.Hook("DrugLabMenu", DrugLabMenu)