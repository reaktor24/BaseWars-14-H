include("shared.lua")
include("HUD.lua")
include("cl_msg.lua")
include( "vgui/vgui_includes.lua" )

// Clientside faction shit
Tribes = Tribes or {}

usermessage.Hook( "gms_invite", function( data )
	local tn = data:ReadString()
	local p = data:ReadString()
	Derma_Query( "You are being invited to " .. tn .. ".\nChoose action below.", "Invitation",
		"Join", function() RunConsoleCommand( "gms_join", tn, p ) end,
		"Decline", function() RunConsoleCommand( "say", "I don't want to join " .. tn .. "." ) end
	)
end )

usermessage.Hook( "sendTribe", function( data )

	local id = data:ReadShort()
	local name = data:ReadString()
	local color = data:ReadVector()
	local hazpass = data:ReadBool()

	team.SetUp( id, name, Color( color.r, color.g, color.b ) )

	table.insert( Tribes, { name = name, pass = hazpass, id = id, color = Color( color.r, color.g, color.b ) } )

end )

hook.Add("PostDrawOpaqueRenderables", "Money_Draw", function()
for _, ent in pairs (ents.FindByClass("cash")) do
	if ent:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
		
		local direction = ent:GetPos() - LocalPlayer():GetPos()
		x_d = direction.x
		y_d = direction.y
		
		Ang = Angle(0, math.deg(math.atan(y_d/x_d))+90/(x_d/-math.abs(x_d)), 90)
		cam.IgnoreZ( true )
		cam.Start3D2D(ent:GetPos()+ent:GetUp()*5, Ang, 0.35)
		draw.SimpleTextOutlined( "$"..tonumber(ent:GetCashAmount()), "Default", 0, 0, Color( 0, 255, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))
		cam.End3D2D()
	end
end
cam.IgnoreZ( false )
end)

hook.Add("HUDPaint", "Nukeprinter_Draw", function()
for _, ent in pairs (ents.FindByClass("printer_nuclear")) do
	if ent:GetPos():Distance(LocalPlayer():GetPos()) < 2500 then
		local pos = ent:GetPos()+ent:GetAngles():Up()*40
		pos.z = pos.z + 14
		pos = pos:ToScreen()
		draw.DrawText( "Nuclear Money Printer\n", "Trebuchet20", pos.x, pos.y, Color(255,0,0,255), 1 )
	end
end
end)

hook.Add("HUDPaint", "BHprinter_Draw", function()
for _, ent in pairs (ents.FindByClass("printer_blackhole")) do
	if ent:GetPos():Distance(LocalPlayer():GetPos()) < 2500 then
		local pos = ent:GetPos()+ent:GetAngles():Up()*40
		pos.z = pos.z + 14
		pos = pos:ToScreen()
		draw.DrawText( "Black Hole Money Printer\n", "Trebuchet20", pos.x, pos.y, Color(255,120,0,255), 1 )
	end
end
end)

function GM.FindTribeByID( Tid )
	for id, tabl in pairs( Tribes ) do
		if ( tabl.id == Tid ) then return tabl end
	end
	return false
end

function GM.OpenTribeMenu()
         local GM = GAMEMODE

         if !GM.TribeMenu then GM.TribeMenu = vgui.Create("GMS_TribeMenu") end

         GM.TribeMenu:SetVisible(!GM.TribeMenu:IsVisible())
end

concommand.Add("bw_factionmenu",GM.OpenTribeMenu)

function GM.OpenBuyMenu()
         local GM = GAMEMODE

         if !GM.BuyMenu then GM.BuyMenu = vgui.Create("BW_Buymenu") end

         GM.BuyMenu:SetVisible(!GM.BuyMenu:IsVisible())
end

concommand.Add("bw_buymenu",GM.OpenBuyMenu)

concommand.Add( "bw_joinmenu", function()
	if ( #Tribes <= 0 ) then chat.AddText( Color( 255, 255, 255 ), "No factions currently exist." ) return end
	local TribesMenu = vgui.Create( "GMS_TribesList" )
end )

/*
fuck this bullshit right off


function DrawBombInfo( ent )
	if LocalPlayer():GetPos():Distance(ent:GetPos())<2048 then
		local pos = ent:GetPos()+ent:GetAngles():Up()*30;
		
		pos.z = pos.z + 14;
		pos = pos:ToScreen();
		local time = math.ceil(ent:GetNWFloat("goofytiem")-CurTime())
		if time<=2 then
			time = "YOU JUST LOST\nTHE GAME"
		end
		draw.DrawText( "BOMB\n" .. tostring(time), "TargetID", pos.x + 1, pos.y + 1, Color( 0, 0, 0, 255 ), 1 );
		draw.DrawText( "BOMB\n" .. tostring(time), "TargetID", pos.x, pos.y, Color(255,0,0,255), 1 );
	end
end

function DrawDisplay()		
	local tr = LocalPlayer():GetEyeTrace();
	for k, v in pairs( ents.FindByClass("bigbomb") ) do
		
		DrawBombInfo( v );
		
	end
end
*/

/*-------------------------------------
Custom Fonts
-------------------------------------*/

local tblFonts = { }
tblFonts["DebugFixed"] = {
	font = "Courier New",
	size = 10,
	weight = 500,
	antialias = true,
}

tblFonts["DebugFixedSmall"] = {
	font = "Courier New",
	size = 7,
	weight = 500,
	antialias = true,
}

tblFonts["DefaultFixedOutline"] = {
	font = "Lucida Console",
	size = 10,
	weight = 0,
	outline = true,
}

tblFonts["MenuItem"] = {
	font = "Tahoma",
	size = 12,
	weight = 500,
}

tblFonts["Default"] = {
	font = "Tahoma",
	size = 13,
	weight = 500,
}

tblFonts["TabLarge"] = {
	font = "Tahoma",
	size = 13,
	weight = 700,
	shadow = true,
}

tblFonts["DefaultBold"] = {
	font = "Tahoma",
	size = 13,
	weight = 1000,
}

tblFonts["DefaultUnderline"] = {
	font = "Tahoma",
	size = 13,
	weight = 500,
	underline = true,
}

tblFonts["DefaultSmall"] = {
	font = "Tahoma",
	size = 1,
	weight = 0,
}

tblFonts["DefaultSmallDropShadow"] = {
	font = "Tahoma",
	size = 11,
	weight = 0,
	shadow = true,
}

tblFonts["DefaultVerySmall"] = {
	font = "Tahoma",
	size = 10,
	weight = 0,
}

tblFonts["DefaultLarge"] = {
	font = "Tahoma",
	size = 16,
	weight = 0,
}

tblFonts["UiBold"] = {
	font = "Tahoma",
	size = 12,
	weight = 1000,
}

tblFonts["MenuLarge"] = {
	font = "Verdana",
	size = 15,
	weight = 600,
	antialias = true,
}

tblFonts["ConsoleText"] = {
	font = "Lucida Console",
	size = 10,
	weight = 500,
}

tblFonts["Marlett"] = {
	font = "Marlett",
	size = 13,
	weight = 0,
	symbol = true,
}

tblFonts["Trebuchet24"] = {
	font = "Trebuchet MS",
	size = 24,
	weight = 900,
}

tblFonts["Trebuchet22"] = {
	font = "Trebuchet MS",
	size = 22,
	weight = 900,
}

tblFonts["Trebuchet20"] = {
	font = "Trebuchet MS",
	size = 20,
	weight = 900,
}

tblFonts["Trebuchet19"] = {
	font = "Trebuchet MS",
	size = 19,
	weight = 900,
}

tblFonts["Trebuchet18"] = {
	font = "Trebuchet MS",
	size = 18,
	weight = 900,
}

tblFonts["Trebuchet80"] = {
	font = "Trebuchet MS",
	size = 80,
	weight = 900,
}

tblFonts["Trebuchet60"] = {
	font = "Trebuchet MS",
	size = 60,
	weight = 900,
}

tblFonts["Trebuchet30"] = {
	font = "Trebuchet MS",
	size = 30,
	weight = 900,
}

tblFonts["Trebuchet40"] = {
	font = "Trebuchet MS",
	size = 40,
	weight = 900,
}

tblFonts["HUDNumber"] = {
	font = "Trebuchet MS",
	size = 40,
	weight = 900,
}

tblFonts["HUDNumber1"] = {
	font = "Trebuchet MS",
	size = 41,
	weight = 900,
}

tblFonts["HUDNumber2"] = {
	font = "Trebuchet MS",
	size = 42,
	weight = 900,
}

tblFonts["HUDNumber3"] = {
	font = "Trebuchet MS",
	size = 43,
	weight = 900,
}

tblFonts["HUDNumber4"] = {
	font = "Trebuchet MS",
	size = 44,
	weight = 900,
}

tblFonts["HUDNumber5"] = {
	font = "Trebuchet MS",
	size = 45,
	weight = 900,
}

tblFonts["HudHintTextLarge"] = {
	font = "Verdana",
	size = 14,
	weight = 1000,
	antialias = true,
	additive = true,
}

tblFonts["HudHintTextSmall"] = {
	font = "Verdana",
	size = 11,
	weight = 0,
	antialias = true,
	additive = true,
}

tblFonts["CenterPrintText"] = {
	font = "Trebuchet MS",
	size = 18,
	weight = 900,
	antialias = true,
	additive = true,
}

tblFonts["DefaultFixed"] = {
	font = "Lucida Console",
	size = 10,
	weight = 0,
}

tblFonts["DefaultFixedDropShadow"] = {
	font = "Lucida Console",
	size = 10,
	weight = 0,
	shadow = true,
}

tblFonts["CloseCaption_Normal"] = {
	font = "Tahoma",
	size = 16,
	weight = 500,
}

tblFonts["CloseCaption_Italic"] = {
	font = "Tahoma",
	size = 16,
	weight = 500,
	italic = true,
}

tblFonts["CloseCaption_Bold"] = {
	font = "Tahoma",
	size = 16,
	weight = 900,
}

tblFonts["CloseCaption_BoldItalic"] = {
	font = "Tahoma",
	size = 16,
	weight = 900,
	italic = true,
}

tblFonts["TargetID"] = {
	font = "Trebuchet MS",
	size = 22,
	weight = 900,
	antialias = true,
}

tblFonts["TargetIDSmall"] = {
	font = "Trebuchet MS",
	size = 18,
	weight = 900,
	antialias = true,
}

tblFonts["BudgetLabel"] = {
	font = "Courier New",
	size = 14,
	weight = 400,
	outline = true,
}


for k,v in SortedPairs( tblFonts ) do
	surface.CreateFont( k, tblFonts[k] );
end


surface.CreateFont( "CSDFont", 
                    {
                    font    = "Counter-Strike",
                    size    = 32,
                    weight  = 400,
                    antialias = true,
                    shadow = false
            });

surface.CreateFont( "DrugFont", 
                    {
                    font    = "csd",
                    size    = 36,
                    weight  = 400,
                    antialias = true,
                    shadow = false
            });

surface.CreateFont( "DrugFont2", 
                    {
                    font    = "HalfLife2",
                    size    = 50,
                    weight  = 400,
                    antialias = true,
                    shadow = false
            });