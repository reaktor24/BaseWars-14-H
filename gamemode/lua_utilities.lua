function Notify( ply, msgtype, len, msg )
	ply:PrintMessage( 2, msg );
	umsg.Start("RPDMNotify", ply)
		umsg.String(msg)
		umsg.Short(msgtype)
		umsg.Short(len)
	umsg.End()
end

function NotifyAll( msgtype, len, msg )

	for k, v in pairs( player.GetAll() ) do
		
		Notify( v, msgtype, len, msg );
		
	end

end

function PrintMessageAll( msgtype, msg )

	for k, v in pairs( player.GetAll() ) do
	
		v:PrintMessage( msgtype, msg );
	
	end

end

function FindPlayer( info )

	for k, v in pairs( player.GetAll() ) do
		
		if( tonumber( info ) == v:EntIndex() ) then
			return v;
		end
		
		if( info == v:SteamID() ) then
			return v;
		end
		
		if( string.find( string.lower(v:Nick()), string.lower(info) ) != nil ) then
			return v;
		end
		
	end
	
	return nil;

end