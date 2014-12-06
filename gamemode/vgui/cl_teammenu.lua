/*--------------------------------------------------
Create Faction Window
--------------------------------------------------*/

local PANEL = {}

function PANEL:Init()
         self:SetTitle("Faction Menu")
		 self:SetDeleteOnClose(false)
         self:SetKeyboardInputEnabled(true)
         self:SetMouseInputEnabled(true)
         self:MakePopup()
         self:SetSize(500, 400)
         self:SetPos(ScrW() / 2 - (self:GetWide() / 2), 150)
		 self:Center()
		 self.Paint = function()
		 surface.SetDrawColor( 0, 0, 0, 200 ) -- Set our rect color below us; we do this so you can see items added to this panel
    	 surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() ) -- Draw the rect
		 end
         
         local line = 30
         local tab = 0         
        
	local tnamelabel = vgui.Create("DLabel", self)
		tnamelabel:SetPos(5,30)
		tnamelabel:SetText("Name")
		
	local tname = vgui.Create("DTextEntry",self)
		tname:SetSize(self:GetWide()-10, 30)
        tname:SetPos(5, 50)
		
	local tpwlabel = vgui.Create("DLabel", self)
		tpwlabel:SetPos(5,85)
		tpwlabel:SetText("Password")

	local hint = vgui.Create("DLabel", self)
		hint:SetPos(5,355)
		hint:SetSize(350,30)
		hint:SetText("Tip: This menu is for creating factions only! \n if you wish to join a faction use the scoreboard [Default TAB]")
		
	local tpw = vgui.Create("DTextEntry",self)
		tpw:SetSize(self:GetWide()-10, 30)
        tpw:SetPos(5, 105)
		
	local tcollabel = vgui.Create("DLabel", self)
		tcollabel:SetPos(5,140)
		tcollabel:SetText("Colour")
		
	local tcolor = vgui.Create("DColorMixer",self)
		tcolor:SetSize(self:GetWide()-10, 150)
        tcolor:SetPos(5, 160)
		
	local button = vgui.Create("DButton",self)
         button:SetSize(self:GetWide()-10, 30)
         button:SetPos(5, 315)
         button:SetText("Create Your Faction!")
		 button.DoClick = function()
			RunConsoleCommand("bw_createfaction", tname:GetValue(), tcolor:GetColor().r, tcolor:GetColor().g, tcolor:GetColor().b, tpw:GetValue())
			self:SetVisible(false)
		 end

	local button = vgui.Create("DButton",self)
         button:SetSize(self:GetWide()-10, 30)
         button:SetPos(5, 355)
         button:SetText("Join an Existing Faction")
		 button.DoClick = function()
			RunConsoleCommand("bw_joinmenu")
			self:SetVisible(false)
		 end


end

vgui.Register("GMS_TribeMenu",PANEL,"DFrame")

/*--------------------------------------------------
Join Faction Window (disabled cos shitcode)
--------------------------------------------------
*/

local PANEL = {}

function PANEL:Init()
	self:SetTitle( "Join an Existing Faction" )
	self:MakePopup()

	local width = ScrW() / 4

	for id, tabl in pairs( Tribes ) do
		if #team.GetPlayers(id) != 0 then
		surface.SetFont( "DermaDefault" )
		local w = surface.GetTextSize( tabl.name )
		width = math.max( width, w + 16 + 10 + 20 )
		end
	end

	for id, tabl in pairs( Tribes ) do
		if #team.GetPlayers(id) != 0 then
		local button = vgui.Create( "GMS_TribeButton", self )
		button:SetSize( width - 16, 16 )
		button:SetPos( 8, 10 + id * 21 )
		button:SetInfo( tabl )
		end

	end

	self:SetSize( width, #Tribes * 21 + 35 )
	self:Center()
	self.Paint = function()
	surface.SetDrawColor( 50, 50, 50, 200 ) -- Set our rect color below us; we do this so you can see items added to this panel
    surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() ) -- Draw the rect
	end
end

vgui.Register( "GMS_TribesList", PANEL, "DFrame" )

local PANEL = {}

function PANEL:Init()
	self:SetText( "" )
	self.Tribe = {}
end

function PANEL:Paint()

	surface.SetDrawColor( self.Tribe.color )
	surface.DrawRect( 0, 0, self:GetTall(), self:GetTall() )

	surface.SetDrawColor( 0, 0, 0, 200 )
	if ( self.Hovered ) then surface.SetDrawColor( 255, 255, 255, 64 ) end
	surface.DrawRect( self:GetTall(), 0, self:GetWide() - self:GetTall(), self:GetTall() )

	surface.SetFont( "Trebuchet18" )
	local w = surface.GetTextSize( self.Tribe.name )
	draw.SimpleText( self.Tribe.name, "DermaDefault", ( self:GetWide() - 16 ) / 2 + 16, 0, color_white , 1 )

end

function PANEL:DoClick()
	if ( self.Tribe.pass ) then
		local name = self.Tribe.name
		Derma_StringRequest( "Please enter password", "Please enter this factions password.", "", function( text ) RunConsoleCommand( "bw_join", name, text ) end )
	else
		RunConsoleCommand( "bw_join", self.Tribe.name )
	end
	self:GetParent():Close()
end

function PANEL:SetInfo( tbl )
	self.Tribe = tbl
end

vgui.Register( "GMS_TribeButton", PANEL, "DButton" )



