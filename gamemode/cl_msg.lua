/*-----------------------------------------------------

Copypasta from Lmaollama basewars cos im a lazy fuck

-----------------------------------------------------*/

local HUDNote_c = 0
local HUDNote_i = 1
local ply = LocalPlayer()

HUDNotesm = {}

function GM:AddMessage( str, type, time, icon )

	local tab = {}
	tab.text 	= str .. "\n\n"
	tab.recv 	= SysTime()
	tab.time 	= time
	tab.velx	= 0
	tab.vely	= 0
	tab.x		= 50
	tab.y		= 50
	tab.a		= 255
	tab.type	= type
    tab.icon    = icon
    
    timer.Create( "TimeRemove", time, 10, function()
    table.remove( HUDNotesm, 1 )
    end, self)
	
	table.insert( HUDNotesm, tab )
	
	HUDNote_c = HUDNote_c + 1
	HUDNote_i = HUDNote_i + 1
    
end


local function DrawMessagem( self, k, v, i )

	local H = ScrH() / 1024
	local x = v.x
	local y = v.y
	
	if ( !v.w ) then
	
		surface.SetFont( "MessageFont" )
		v.w, v.h = surface.GetTextSize( v.text )
	
	end
	
	local w = v.w
	local h = v.h
	
	w = w + 16
	h = h+((i-1)*v.h)
	y=y+h
	draw.RoundedBox( 2, x-40, y-12, w+60, 40, Color( 0, 0, 0, 150 ) )
    surface.DrawOutlinedRect( x-40, y-12, w+60, 40 )
	
	-- Draw Icon
	
	surface.SetDrawColor( 255, 255, 255, v.a )
	-- surface.SetTexture( NoticeMaterial[ v.type ] )
	-- surface.DrawTexturedRect( x - w - h + 16, y - 4, h - 8, h - 8 ) 
	/*
	0	logs
	1	warning
	2	income
	3	info
	4	error
	*/
    if v.icon == 1 then
        surface.SetMaterial(Material("icon16/exclamation.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 2 then
        surface.SetMaterial(Material("icon16/accept.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 3 then
        surface.SetMaterial(Material("icon16/time.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 4 then
        surface.SetMaterial(Material("icon16/delete.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 5 then
        surface.SetMaterial(Material("icon16/money.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 6 then
        surface.SetMaterial(Material("icon16/basket_go.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 7 then
        surface.SetMaterial(Material("icon16/add.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    elseif v.icon == 8 then
        surface.SetMaterial(Material("icon16/lightning.png"))
        surface.DrawTexturedRect(x-30,y,16,16)
    end
	local textcolor = Color(0,250,0,255)
    -- Bright Red
	if v.type==1 then
		textcolor = Color(250,0,0,255)
	elseif v.type==2 then
		textcolor = Color(0,255,0,255)
    -- Yellow
	elseif v.type==3 then
		textcolor = Color(255,255,0,255)
    -- Dark Red
	elseif v.type==4 then
		textcolor = Color(150,0,0,255)
    -- White
    elseif v.type==5 then
		textcolor = Color(255,255,255,255)
    -- Cyan
    elseif v.type==6 then
		textcolor = Color(0,255,255,255)
    -- Orange
    elseif v.type==7 then
		textcolor = Color(255,150,0,255)
	end
	if LocalPlayer():GetInfoNum("bw_showmessages", 1) then
		draw.SimpleText( v.text, "MessageFont", x, y, textcolor, TEXT_ALIGN_LEFT )
		draw.SimpleText( v.text, "MessageFont", x+1, y+1, Color(10,10,10,100), TEXT_ALIGN_LEFT )

	end
end

function GM:PaintMessages()
	if LocalPlayer():GetInfoNum("bw_showmessages", 1) then
		--if ScrW()>1000 then
		--	draw.RoundedBox( 10, 10, 10, 570, 170, Color( 30, 30, 30, 100 ) )
		--else
		--	draw.RoundedBox( 10, 10, 10, 450, 130, Color( 30, 30, 30, 100 ) )
		--end
	end
	if ( !HUDNotesm ) then return end
	
	while #HUDNotesm>10 do
		table.remove(HUDNotesm, 1)
	end
	local i = 0
	for k, v in pairs( HUDNotesm ) do
	
		if ( k != 0 ) then
		
			i = i + 1
			DrawMessagem( self, k, v, i)	         
		
		end
		
	end
end
// lol redundant

function MsgManageMessages(msg)
	local text = msg:ReadString()
	local type = msg:ReadShort()
	local time = msg:ReadShort()
	local icon = msg:ReadShort()

		CreateClientConVar("bw_showmessages", 1, true, false)
		CreateClientConVar("bw_shownotify", 0, true, false)
		CreateClientConVar("bw_messages_warningnotify", 1, true, false)
		CreateClientConVar("bw_messages_dontshowincome", 0, true, false)

	local mode = LocalPlayer():GetInfoNum("bw_showmessages", 1)
	local both = LocalPlayer():GetInfoNum("bw_shownotify", 0)
	local warn = LocalPlayer():GetInfoNum("bw_messages_warningnotify", 1)
	local inc = LocalPlayer():GetInfoNum("bw_messages_dontshowincome", 0)
	
	if mode==0 then
		GAMEMODE:AddNotify(text,type,time)
	elseif mode==1 then
		if inc==0 || type!=2 then
			GAMEMODE:AddMessage(text,type,time,icon)
		end
	end
	if both==1 && mode==1 then
		GAMEMODE:AddNotify(text,type,time)
	end
	-- if 'both' is set already, we dont need to put the message twice.
	if warn==1 && mode==1 && both==0 && type==1 then
		GAMEMODE:AddNotify(text,type,time)
	end
end
usermessage.Hook("RPDMNotify", MsgManageMessages)