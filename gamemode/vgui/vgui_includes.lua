if SERVER then
AddCSLuaFile( "cl_teammenu.lua" )
AddCSLuaFile( "cl_buymenu.lua" )
AddCSLuaFile( "sh_scoreboard.lua" )
AddCSLuaFile( "cl_hitmarker.lua" )
elseif CLIENT then
include( "cl_teammenu.lua" )
include( "cl_buymenu.lua" )
include( "cl_hitmarker.lua" )
include( "sh_scoreboard.lua" )
end