/*--------------------------------------------------

This is deprecated in favour of the f3 buymenu

function buy_entity( ply, cmd, args )
	local entity = ents.Create(args[1])
	local tr = ply:GetEyeTrace()
	if CanAfford(ply, entity.Price) then
		RemoveMoney(ply, entity.Price)
		entity:SetPos(tr.HitPos + tr.HitNormal)
		entity:Spawn()
		entity.Owner = ply
		entity:SetBuyer(ply:Nick())
		entity:SetAmount(entity.MaxHealth)
	else
		entity:Remove()
	end
end
concommand.Add("buy_entity", buy_entity)
*/--------------------------------------------------

function drop_money( ply, cmd, args )
if tonumber((args[1])) < 5 then
	ply:PrintMessage(3, "You can't drop less than 5 dollars!")
	return false
end

    local vStart = ply:GetShootPos()
    local vForward = ply:GetAimVector()
    local trace = {}
    trace.start = vStart
    trace.endpos = vStart + (vForward * 100)
    trace.filter = ply
    local tr = util.TraceLine( trace )
    local upvector = Vector(0,0,10)
	if CanAfford(ply, args[1]) then
		RemoveMoney(ply, args[1])
		local cash = ents.Create( "cash" )
		cash:SetWorth(args[1])
		cash:SetCashAmount(args[1])
		cash:SetPos(tr.HitPos + upvector)
		cash:Spawn()
		ply:PrintMessage(3, "You dropped $" .. (args[1]))
	else
		ply:PrintMessage(3, "You don't have that much money!")
	end
end
concommand.Add("drop_money", drop_money)

function Collision_bounds( ply, cmd, args )
	local tr = ply:GetEyeTrace()
	if tr.Entity != nil then
		print(tr.Entity:GetCollisionBounds())
	end
end
concommand.Add("collison", Collision_bounds)

function cheat_money( ply, cmd, args )
	if ply:IsSuperAdmin() or ply:IsUserGroup("Owner")
		then
		local tr = ply:GetEyeTrace()
			local cash = ents.Create( "cash" )
			cash:SetWorth(args[1])
			cash:SetCashAmount(args[1])
			cash:SetPos(tr.HitPos)
			cash:Spawn()
		else
			ply:ChatPrint( "You need to be superadmin to use this command!" )
		end	
	end
concommand.Add("cheat_money", cheat_money)