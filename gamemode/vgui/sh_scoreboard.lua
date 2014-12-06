surface.CreateFont( "TitleFont", {
	font = "Capture it",
	size = 100,
	weight = 500,
	antialias = true,
	additive = false,
} )


local Menu = {}

local ShowAllTeams = false

local ScoreboardM
local option1

local meta = FindMetaTable("Player")

function meta:GetUsergroup()

	if self:GetNWBool("FactionLeader") == true then
		return "[Faction Leader]"
--	if self:IsSuperAdmin() then
--		return "[Superadmin]"
--	elseif self:IsAdmin() then
--		return "[Admin]"
	else return ""
	end
	
end

function Menu.InfoPlayer(ply)
operator = LocalPlayer()
	
	InfoPlayerMenu = vgui.Create("DFrame")
	InfoPlayerMenu:SetSize(600, 400)
	InfoPlayerMenu:Center()
	InfoPlayerMenu:SetTitle(ply:Name())
	InfoPlayerMenu:ShowCloseButton(false)
	InfoPlayerMenu:MakePopup()
	InfoPlayerMenu.Paint = function()
	surface.SetDrawColor( 0, 0, 0, 200 )
    surface.DrawRect( 0, 0, InfoPlayerMenu:GetWide(), InfoPlayerMenu:GetTall() )
	end

	local model = vgui.Create("SpawnIcon", InfoPlayerMenu)
	model:SetModel(ply:GetModel())
	model:SetPos(20, 40)

	local score = vgui.Create("DLabel", InfoPlayerMenu)
	score:SetText("Kills: "..ply:Frags() + ply:Deaths())
	score:SizeToContents()
	score:SetPos(120, 40)

	local deaths = vgui.Create("DLabel", InfoPlayerMenu)
	deaths:SetText("Deaths: "..ply:Deaths())
	deaths:SizeToContents()
	deaths:SetPos(120, 55)

	local ping = vgui.Create("DLabel", InfoPlayerMenu)
	ping:SetText("Ping: "..ply:Ping())
	ping:SizeToContents()
	ping:SetPos(120, 70)

	local id = vgui.Create("DLabel", InfoPlayerMenu)
	id:SetText("SteamID: "..ply:SteamID())
	id:SizeToContents()
	id:SetPos(120, 85)

    local mutebutton = vgui.Create( "DButton" )
	mutebutton:SetParent( InfoPlayerMenu )  
	mutebutton:SetPos( 140, 120 )
	mutebutton:SetTextColor( Color(255, 255, 255, 255) )
	mutebutton:SetSize( 110, 25 )
	mutebutton.Paint = function()
	if ply:IsMuted() then 
	surface.SetDrawColor( 200, 0, 0, 200 )
	mutebutton:SetText( "Unmute This Player" )
	else
	surface.SetDrawColor( 50, 0, 0, 200 )
	mutebutton:SetText( "Mute This Player" )
	end
    surface.DrawRect( 0, 0, mutebutton:GetWide(), mutebutton:GetTall() )
	end
	Muted = ply:IsMuted()
	mutebutton.DoClick = function() ply:SetMuted( !Muted ) end

    local joinbutton = vgui.Create( "DButton" )
	joinbutton:SetParent( InfoPlayerMenu )  
	joinbutton:SetPos( 260, 120 )
	joinbutton:SetText( "Join This Player's Faction" )
	joinbutton:SetTextColor( Color(255, 255, 255, 255) )
	joinbutton:SetSize( 150, 25 )
	joinbutton.Paint = function()
	surface.SetDrawColor( 0, 60, 0, 200 )
    surface.DrawRect( 0, 0, joinbutton:GetWide(), joinbutton:GetTall() )
	end
	joinbutton.DoClick = function()
	name = team.GetName( ply:Team() )
		Derma_StringRequest( "Please enter password", "Please enter this factions password (if it's a public faction then just type anything)", "", function( text ) RunConsoleCommand( "bw_join", name, text ) end )
	end

	local transleader = vgui.Create( "DButton" )
	transleader:SetParent( InfoPlayerMenu )  
	transleader:SetPos( 260, 155 )
	transleader:SetText( "Give Leadership to This Player" )
	transleader:SetTextColor( Color(255, 255, 255, 255) )
	transleader:SetSize( 150, 25 )
	transleader.Paint = function()
	surface.SetDrawColor( 60, 60, 0, 200 )
    surface.DrawRect( 0, 0, transleader:GetWide(), transleader:GetTall() )
	end
	transleader.DoClick = function()
	ply:PrintMessage(3, "Only the faction leader can do this!" )
	end

	local kickbutton = vgui.Create( "DButton" )
	kickbutton:SetParent( InfoPlayerMenu )  
	kickbutton:SetPos( 140, 155 )
	kickbutton:SetText( "Kick This Player" )
	kickbutton:SetTextColor( Color(255, 255, 255, 255) )
	kickbutton:SetSize( 110, 25 )
	kickbutton.Paint = function()
	surface.SetDrawColor( 60, 0, 60, 200 )
    surface.DrawRect( 0, 0, kickbutton:GetWide(), kickbutton:GetTall() )
	end
	kickbutton.DoClick = function()
	ply:PrintMessage(3, "Only the faction leader can do this!" )
	end

	local invbutton = vgui.Create( "DButton" )
	invbutton:SetParent( InfoPlayerMenu )  
	invbutton:SetPos( 20, 155 )
	invbutton:SetText( "Invite This Player" )
	invbutton:SetTextColor( Color(255, 255, 255, 255) )
	invbutton:SetSize( 110, 25 )
	invbutton.Paint = function()
	surface.SetDrawColor( 0, 60, 60, 200 )
    surface.DrawRect( 0, 0, invbutton:GetWide(), invbutton:GetTall() )
	end
	invbutton.DoClick = function()
	ply:PrintMessage(3, "Only the faction leader can do this!" )
	end

	local stuph = vgui.Create( "DButton" )
	stuph:SetParent( InfoPlayerMenu )  
	stuph:SetPos( 20, 120 )
	stuph:SetText( "View Steam Profile" )
	stuph:SetTextColor( Color(255, 255, 255, 255) )
	stuph:SetSize( 110, 25 )
	stuph.Paint = function()
	surface.SetDrawColor( 40, 40, 40, 200 )
    surface.DrawRect( 0, 0, stuph:GetWide(), stuph:GetTall() )
	end
	stuph.DoClick = function()
     ply:ShowProfile()

end



end

function Menu.Open()
	
	ScoreboardM = vgui.Create("DPanelList")
	ScoreboardM:SetPos(ScrW() / 2 - 450 / 2, ScrH() / 8)
	ScoreboardM:SetSize(450, ScrH() - ScrH() / 4)
	ScoreboardM:EnableVerticalScrollbar(true)

	gmtitle = vgui.Create("DPanel")
	gmtitle:SetPos(ScrW() / 2 - 287, ScrH() / 50)
	gmtitle:SetSize(575, 90)
	gmtitle.Paint = function()
	surface.SetTextColor( 255, 255, 255, 255 )
	surface.SetFont("TitleFont")
	surface.SetTextPos(0, 0)
	surface.DrawText( "Basewars 14" )
	end

	//ScoreboardM:SetSpacing(5)
	
	local scoreboard = vgui.Create("DPanelList", ScoreboardM)
	scoreboard:SetSize(450, ScrH() - ScrH() / 4 - 15)
	scoreboard:EnableVerticalScrollbar(true)
	
	local function Update()

		scoreboard:Clear(true)
		for a, b in pairs(team.GetAllTeams()) do
				if #team.GetPlayers(a) != 0 then
					local cat = vgui.Create("DCollapsibleCategory")
					cat:SetSize(450, 0)
					cat:SetExpanded(1)
					cat:SetLabel(team.GetName(a).. " (".. #team.GetPlayers(a) ..")")
					teamColor = team.GetColor( a )
					cat.Paint = function()
					surface.SetDrawColor( 0, 0, 0, 150 )
    				surface.DrawRect( 0, 0, cat:GetWide(), cat:GetTall() )
					end
					
					local list = vgui.Create("DPanelList")
					list:SetSpacing(5)
					list:SetAutoSize(true)
					
					for k, v in pairs(team.GetPlayers(a)) do
						
						local panel = vgui.Create("DPanel")
						panel:SetSize(450, 40)
						panel.Paint = function()
						surface.SetDrawColor( 0, 0, 0, 200 )
    					surface.DrawRect( 0, 0, panel:GetWide(), panel:GetTall() )
						end

						local model = vgui.Create("SpawnIcon", panel);
						model:SetModel(v:GetModel())
						model:SetPos( 10, 5)
						model:SetSize( 32, 32)
						model:SetToolTip(v:Name().."\nClick here for more information!")
						model.OnMousePressed = function()
							Menu.InfoPlayer(v)
							ScoreboardM:Remove()
						end
						
						local name = vgui.Create("DLabel", panel)
						name:SetText("Name: "..v:Name() .."\n".. v:GetUsergroup())
						name:SizeToContents()
						name:SetPos(100, 5)
						
						local ping = vgui.Create("DLabel", panel)
						ping:SetText("Ping: "..v:Ping())
						ping:SizeToContents()
						ping:SetPos(380, 5)

						local muted = vgui.Create("DLabel", panel)
						muted:SetSize(300, 20)
						muted:SetTextColor( Color(255, 0, 0, 255) )
						muted:SetPos(390, 17)
						muted.Paint = function()
						if v:IsMuted() then 
						muted:SetText("[Muted] ")
						else
						muted:SetText("")
						end
						end
						
						local score = vgui.Create("DLabel", panel)
						score:SetText("Kills: "..v:Frags() + v:Deaths())
						score:SizeToContents()
						score:SetPos(250, 5)
						
						local death = vgui.Create("DLabel", panel)
						death:SetText("Deaths: "..v:Deaths())
						death:SizeToContents()
						death:SetPos(310, 5)

						local tcpanel = vgui.Create("DPanel")
						tcpanel:SetSize(15, 40)
						tcpanel:SetPos(435, 0)
						tcpanel:SetParent( panel )
						local PTeam = (v:Team())
						local TeamCol = team.GetColor( PTeam )
						tcpanel.Paint = function()
						surface.SetDrawColor( TeamCol.r, TeamCol.g, TeamCol.b, 255 )
    					surface.DrawRect( 0, 0, tcpanel:GetWide(), tcpanel:GetTall() )
						end

						list:AddItem(panel)
					end
				
				cat:SetContents(list)
				scoreboard:AddItem(cat)
				end
		end
	end
	Update()
	/*
	local option1 = vgui.Create("DCheckBoxLabel", ScoreboardM)
	option1:SetPos(0, ScrH() - ScrH() / 4 - 15)
	option1:SetText("Show All Teams")
	if ShowAllTeams then
		option1:SetValue(1)
	else
		option1:SetValue(0)
	end
	option1:SizeToContents()
	//option1:SetTextColor(Color(0, 0, 0, 255))
	option1.OnChange = function()
		ShowAllTeams = not ShowAllTeams
		Update()
	end
	*/
end

function Menu.Close()

	if ScoreboardM and ScoreboardM:IsValid() then
		ScoreboardM:Remove()
		gmtitle:Remove()
		gui.EnableScreenClicker(false)
	end
	if InfoPlayerMenu and InfoPlayerMenu:IsValid() then
		InfoPlayerMenu:Close()
		gmtitle:Remove()
		gui.EnableScreenClicker(false)
	end
end

timer.Simple(1.5, function()
	
	function GAMEMODE.ScoreboardShow()

		Menu.Open()
		gui.EnableScreenClicker(true)
		gui.SetMousePos( ScrW()/2, ScrH()/2 )
	end

	function GAMEMODE.ScoreboardHide()

		Menu.Close()
	end
end)





















/*
surface.CreateFont( "ScoreboardText", {
	font = "Tahoma",
	size = 16,
	weight = 1000,
	antialias = true,
	additive = false,
} )

surface.CreateFont( "ScoreboardSub", {
	font = "coolvetica",
	size = 24,
	weight = 500,
	antialias = true,
	additive = false,
} )

surface.CreateFont( "ScoreboardHead", {
	font = "coolvetica",
	size = 48,
	weight = 500,
	antialias = true,
	additive = false,
} )

surface.CreateFont( "TitleFont", {
	font = "Capture it",
	size = 100,
	weight = 500,
	antialias = true,
	additive = false,
} )

function GM:ScoreboardShow()
	GAMEMODE.ShowScoreboard = true
	gui.EnableScreenClicker( true )
end

function GM:ScoreboardHide()
	GAMEMODE.ShowScoreboard = false
	gui.EnableScreenClicker( false )
end

function GM:GetTeamScoreInfo()
	local TeamInfo = {}

	for id, pl in pairs(player.GetAll()) do
		local _team = pl:Team()
		local _frags = pl:Frags()
		local _deaths = pl:Deaths()
		local _ping = pl:Ping()

		if (!TeamInfo[_team]) then
			TeamInfo[_team] = {}
			TeamInfo[_team].TeamName = team.GetName(_team)
			TeamInfo[_team].Color = team.GetColor(_team)
			TeamInfo[_team].Players = {}
		end

		local PlayerInfo = {}
		PlayerInfo.Frags = _frags
		PlayerInfo.Deaths = _deaths
		PlayerInfo.Score = _frags
		PlayerInfo.Ping = _ping
		PlayerInfo.Name = pl:Nick()
		PlayerInfo.PlayerObj = pl

--		if ( pl:IsAdmin() ) then PlayerInfo.Name = "[ADMIN] " .. PlayerInfo.Name end
--		if ( pl:IsDeveloper() ) then PlayerInfo.Name = "[DEVELOPER] " .. pl:Nick() end
--		if ( pl:GetNWBool( "AFK" ) ) then PlayerInfo.Name = PlayerInfo.Name  .. " [AFK]" end

		local insertPos = #TeamInfo[_team].Players + 1
		for idx, info in pairs(TeamInfo[_team].Players) do
			if (PlayerInfo.Frags > info.Frags) then
				insertPos = idx
				break
			elseif (PlayerInfo.Frags == info.Frags) then
				if (PlayerInfo.Deaths < info.Deaths) then
					insertPos = idx
					break
				elseif (PlayerInfo.Deaths == info.Deaths) then
					if (PlayerInfo.Name < info.Name) then
						insertPos = idx
						break
					end
				end
			end
		end
	
		table.insert( TeamInfo[ _team ].Players, insertPos, PlayerInfo )
	end

	return TeamInfo
end

function GM:HUDDrawScoreBoard()
	if ( !GAMEMODE.ShowScoreboard ) then return end

	if ( !GAMEMODE.ScoreDesign ) then
		GAMEMODE.ScoreDesign = {}
		GAMEMODE.ScoreDesign.HeaderY = 0
		GAMEMODE.ScoreDesign.Height = ScrH() / 2
	end

	local alpha = 255
	local ScoreboardInfo = self:GetTeamScoreInfo()
	local xOffset = ScrW() / 8
	local yOffset = 32
	local scrWidth = ScrW()
	local scrHeight = ScrH() - 64
	local boardWidth = scrWidth - ( 2 * xOffset )
	local boardHeight = scrHeight
	local colWidth = 75

	boardWidth = math.Clamp( boardWidth, 400, 800 )
	boardHeight = GAMEMODE.ScoreDesign.Height

	xOffset = (ScrW() - boardWidth) / 2.0
	yOffset = (ScrH() - boardHeight) / 2.0
	yOffset = yOffset - ScrH() / 4.0
	yOffset = math.Clamp( yOffset, 32, ScrH() )

	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawRect( xOffset, yOffset, boardWidth, boardHeight )

	surface.SetDrawColor( 50, 50, 50, 150 )
	surface.DrawOutlinedRect( xOffset, yOffset, boardWidth, boardHeight )

	surface.SetDrawColor( 0, 0, 0, 50 )
	//surface.DrawOutlinedRect( xOffset - 1, yOffset - 1, boardWidth + 2, boardHeight + 2 )

	local hostname = GetGlobalString( "ServerName" )
	local gamemodeName = GAMEMODE.Name .. " - " .. GAMEMODE.Author

	if ( string.len( hostname ) > 32 ) then
		surface.SetFont("ScoreboardSub")
	else
		surface.SetFont("ScoreboardHead")
	end

	surface.SetTextColor(255, 255, 255, 255)
	local txWidth, txHeight = surface.GetTextSize( hostname )
	local y = yOffset + 5
	surface.SetTextPos(xOffset + (boardWidth / 2) - (txWidth / 2), y)
	surface.DrawText(hostname)


	surface.SetTextColor( 255, 255, 255, 255 )
	surface.SetFont("TitleFont")
	local y2 = yOffset - 100
	surface.SetTextPos(xOffset + (boardWidth / 2) - (txWidth / 2) - 175, y2)
	surface.DrawText( "Basewars 13" )

	y = y + txHeight + 4
	GAMEMODE.ScoreDesign.HeaderY = y - yOffset

	surface.SetDrawColor(0, 0, 0, 100)
	surface.DrawRect(xOffset, y - 1, boardWidth, 1)

	surface.SetFont("ScoreboardText")
	local txWidth, txHeight = surface.GetTextSize("W")

	surface.SetDrawColor(0, 0, 0, 100)
	surface.DrawRect(xOffset, y, boardWidth, txHeight + 6)

	y = y + 2

	surface.SetTextPos(xOffset + 16, y)
	surface.DrawText("#Name")
	surface.SetTextPos(xOffset + boardWidth - (colWidth * 3) + 8, y)
	surface.DrawText("Kills")
	surface.SetTextPos(xOffset + boardWidth - (colWidth * 2) + 8, y)
	surface.DrawText("Deaths")
	surface.SetTextPos(xOffset + boardWidth - (colWidth * 1) + 8, y)
	surface.DrawText("#Ping")

	y = y + txHeight + 4

	local yPosition = y
	for team, info in pairs(ScoreboardInfo) do
		local teamText = info.TeamName .. "  (" .. #info.Players .. " Players)"
		
		surface.SetFont("ScoreboardText")
		if (info.Color.r < 50 and info.Color.g < 50 and info.Color.b < 50) then surface.SetTextColor(255, 255, 255, 255) else surface.SetTextColor(0, 0, 0, 255) end

		txWidth, txHeight = surface.GetTextSize(teamText)
		surface.SetDrawColor(info.Color.r, info.Color.g, info.Color.b, 255)
		surface.DrawRect(xOffset + 1, yPosition, boardWidth - 2, txHeight + 4)
		yPosition = yPosition + 2
		surface.SetTextPos(xOffset + boardWidth / 2 - txWidth / 2, yPosition)

		surface.DrawText(teamText)
		yPosition = yPosition + txHeight + 4

		for index, plinfo in pairs(info.Players) do
			surface.SetFont("ScoreboardText")
			surface.SetTextColor(info.Color.r, info.Color.g, info.Color.b, 200)
			surface.SetTextPos(xOffset + 16, yPosition)
			txWidth, txHeight = surface.GetTextSize(plinfo.Name)

			if (plinfo.PlayerObj == LocalPlayer()) then
				surface.SetDrawColor(info.Color.r, info.Color.g, info.Color.b, 64)
				surface.DrawRect(xOffset + 1, yPosition, boardWidth - 2, txHeight + 2)
				surface.SetTextColor(info.Color.r, info.Color.g, info.Color.b, 255)
			end

			local px, py = xOffset + 16, yPosition
			local textcolor = Color(255, 255, 255, alpha)
			local shadowcolor = Color(0, 0, 0, alpha * 0.8)

			draw.SimpleText(plinfo.Name, "ScoreboardText", px + 1, py + 1, shadowcolor)
			draw.SimpleText(plinfo.Name, "ScoreboardText", px, py, textcolor)

			px = xOffset + boardWidth - (colWidth * 3) + 8
			draw.SimpleText(plinfo.Frags, "ScoreboardText", px + 1, py + 1, shadowcolor)
			draw.SimpleText(plinfo.Frags, "ScoreboardText", px, py, textcolor)

			px = xOffset + boardWidth - (colWidth * 2) + 8
			draw.SimpleText(plinfo.Deaths, "ScoreboardText", px + 1, py + 1, shadowcolor)
			draw.SimpleText(plinfo.Deaths, "ScoreboardText", px, py, textcolor)

			px = xOffset + boardWidth - (colWidth * 1) + 8
			draw.SimpleText(plinfo.Ping, "ScoreboardText", px + 1, py + 1, shadowcolor)
			draw.SimpleText(plinfo.Ping, "ScoreboardText", px, py, textcolor)

			yPosition = yPosition + txHeight + 3
		end
	end

	yPosition = yPosition + 1

	GAMEMODE.ScoreDesign.Height = (GAMEMODE.ScoreDesign.Height * 2) + (yPosition - yOffset)
	GAMEMODE.ScoreDesign.Height = GAMEMODE.ScoreDesign.Height / 3
end
*/