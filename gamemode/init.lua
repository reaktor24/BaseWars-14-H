AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "HUD.lua" )
AddCSLuaFile( "cl_msg.lua" )

include( "shared.lua" )
include( "drugs.lua" )
include( "money.lua" )
include( "concommand.lua" )
include( "database.lua" )
include( "chat.lua" )
include( "lua_utilities.lua" )

include( "vgui/vgui_includes.lua" )
AddCSLuaFile( "vgui/vgui_includes.lua" )

util.AddNetworkString("bw_closeshopmenu")
net.Receive("bw_closeshopmenu", function(length, ply)
	ply.MenuOpen = false
end)

--[[
/- NPC Shop Code -\
--]]

 function GM:ShowSpare2( ply )
  ply:ConCommand( "bw_shop" )
 end

function GM:ShowSpare1( ply )
	local w, h = unpack( ply:GetInventoryDimensions() )
	itemstore.containers.Open( ply, ply:GetInventory(), "Inventory", w, h, true )
	end

 function GM:ShowTeam( ply )
  ply:ConCommand( "bw_factionmenu" )

  
 end

  function GM:ShowHelp( ply )
  ply:ConCommand( "ulx motd" )
 end

/*--------------------------------------
Faction Related Functions
--------------------------------------*/

if ( !GM.Tribes ) then
	GM.Tribes = GM.Tribes or {}
	table.insert( GM.Tribes, { name = "Citizen", color = Color( 130, 130, 130 ), password = false } )
end

function IJustJoined( ply )
	ply:SetTeam( 1 )

	local time = 2

	local rp = RecipientFilter()
	rp:AddPlayer( ply )

	for id, t in pairs( GAMEMODE.Tribes ) do
		timer.Simple( time, function()
			umsg.Start( "sendTribe", rp )
				umsg.Short( id )
				umsg.String( t.name )
				umsg.Vector( Vector( t.color.r, t.color.g, t.color.b ) )
				if ( t.password == false ) then 
					umsg.Bool( false )
				else
					umsg.Bool( true )
				end
			umsg.End()

		end )
		time = time + 0.1
	end
end
hook.Add( "PlayerInitialSpawn", "IJustJoinedHook", IJustJoined )

function GM.FindTribeByID( id )
	for tid, tabl in pairs( GAMEMODE.Tribes ) do
		if ( tid == id ) then return tabl end
	end
	return false
end

function CreateTribe( ply, name, red, green, blue, password )

	name = string.Trim( name )
	if ( name == "" ) then ply:PrintMessage(3,"You can't create a faction with no name!") return end
	for id, tribe in pairs( GAMEMODE.Tribes ) do
		if ( tribe.name == name ) then ply:PrintMessage(3, "A faction with this name already exists!" ) return end
	end

	local id = table.insert( GAMEMODE.Tribes, {
		name = name,
		color = Color( red, green, blue ),
		password = password or false
	} )

	local rp = RecipientFilter()
	rp:AddAllPlayers()

	umsg.Start( "sendTribe", rp )
		umsg.Short( id )
		umsg.String( name )
		umsg.Vector( Vector( red, green, blue ) )
		if ( Password == false ) then
			umsg.Bool( false )
		else
			umsg.Bool( true )
		end
	umsg.End()

	team.SetUp( id, name, Color( red, green, blue ) )
	ply:SetTeam( id )
--	ply:UpdatePlayerColor()
	ply:PrintMessage(3, "Successfully created " .. name .. "." )
	ply:SetNetworkedBool("FactionLeader", true)
	
end

function GM.CreateTribeCmd( ply, cmd, args, argv )
	if ( !args[4] or args[4] == "" ) then ply:ChatPrint( "Syntax is: bw_createfaction \"factionname\" red green blue [password( optional )]" ) return end
	if ( args[5] and args[5] != "" ) then
		CreateTribe( ply, args[1], args[2], args[3], args[4], args[5] )
	else
		CreateTribe( ply, args[1], args[2], args[3], args[4], "" )
	end
end
concommand.Add( "bw_createfaction", GM.CreateTribeCmd )

function GM.JoinTribeCmd( ply, cmd, args )
	if ( !args[ 1 ] || args[ 1 ] == "" ) then ply:PrintMessage(3, "Syntax is: bw_join \"factionname\" [password( if needed )]" ) return end
	for id, v in pairs( GAMEMODE.Tribes ) do
		if ( string.lower( v.name ) != string.lower( args[1] ) ) then continue end

		if ( v.password && v.password != args[ 2 ] ) then ply:PrintMessage(3,"Incorrect password!") return end
		
		ply:SetTeam( id )
		ply:SetNetworkedBool("FactionLeader", false)
		ply:PrintMessage(3, "You joined " .. v.name .. "." )
		for id, pl in pairs( player.GetAll() ) do
			if ( pl:Team() == ply:Team() && pl != ply ) then pl:PrintMessage(3, ply:Name() .. " joined your faction." ) end
		end
	end
end
concommand.Add( "bw_join", GM.JoinTribeCmd )

function GM.LeaveTribeCmd( ply, cmd, args )
	ply:SetTeam( 1 )
	ply:PrintMessage(3, "You left your faction." )
	ply:SetNetworkedBool("FactionLeader", false)

	for id, pl in pairs( player.GetAll() ) do
		if ( pl:Team() == ply:Team() && pl != ply ) then pl:PrintMessage(3, ply:Name() .. " left your faction." ) end
	end
end
concommand.Add( "bw_leave", GM.LeaveTribeCmd )

function GM.KickFromTribeCmd( ply, cmd, args )
	ply:SetTeam( 1 )
	ply:PrintMessage(3, "You were kicked from your faction." )

	for id, pl in pairs( player.GetAll() ) do
		if ( pl:Team() == ply:Team() && pl != ply ) then pl:PrintMessage(3, ply:Name() .. " was kicked out of your faction." ) end
	end
end
concommand.Add( "bw_kicked", GM.KickFromTribeCmd )

function GM:PlayerSpawn( ply )
    self.BaseClass:PlayerSpawn( ply )   
 	ply:Give( "weapon_physgun")
 	ply:Give( "weapon_physcannon")
  	ply:Give( "weapon_scarkeys")
  	ply:Give( "weapon_fists")
    ply:SetWalkSpeed( 250 )  
    ply:SetRunSpeed ( 370 ) 
end

util.AddNetworkString("BW_Buy")
net.Receive('BW_Buy', function(length, ply)
	local item = net.ReadString()
	local money = ply:GetNWInt("Money", 0)
	local Price = BuyRefTable[item].Price
	
	if ply:InVehicle() or !ply:Alive() then return false end
	
	if Price <= tonumber(money) then
		BuyRefTable[item].BuyFunction(ply,item)
		RemoveMoney(ply, Price)
		ply:PrintMessage(3, "You've purchased a ".. BuyRefTable[item].Name .." for $".. Price)
	else
		ply:PrintMessage(3, "You can't afford this item!" )
	end
end)