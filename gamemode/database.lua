if not sql.TableExists( "basewars" ) then
	sql.Query( "CREATE TABLE IF NOT EXISTS basewars (SteamID TEXT, Money REAL);" )
end

function PlayerExists( SteamID )
	local SqlString = "SELECT 1 FROM basewars WHERE SteamID=%s"
	if sql.Query(string.format(SqlString, sql.SQLStr(SteamID))) == nil then
		return false
	else
		return true
	end
end

function CreatePlayer( SteamID )
	local SqlString = "INSERT INTO basewars (SteamID, Money) VALUES (%s, 0);"
	sql.Query(string.format(SqlString, sql.SQLStr(SteamID)))
end

function UpdatePlayer( SteamID, Money )
	local SqlString = "UPDATE basewars SET Money=%s WHERE SteamID=%s;"
	sql.Query(string.format(SqlString, Money, sql.SQLStr(SteamID)))
end

function GetPlayer( SteamID )
	local SqlString = "SELECT Money FROM basewars WHERE SteamID=%s;"
	return sql.Query(string.format(SqlString, sql.SQLStr(SteamID)))[1]['Money']
end