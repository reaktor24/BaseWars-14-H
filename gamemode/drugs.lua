function doublejump(ply, key)
if ply:GetNWBool("Djumped") == true then
	if key == IN_JUMP then
		if !ply:IsOnGround() then
			if ply.FirstJump == 1 then
				ply:SetVelocity(Vector(0,0,300) + Vector(0,0,-1*ply:GetVelocity().z))
				ply.FirstJump = 0
			end
		else
			ply.FirstJump = 1
		end
	end
end
end
hook.Add("KeyPress", "doublejump", doublejump)

hook.Add( "PlayerHurt", "LeechHook", function (victim, attacker, damageTaken)
local attacker = attacker
if attacker:GetNWBool("Leeched") == true then
if target:IsValid() and attacker:IsPlayer() then

local healamount = ((damageTaken/5))
    
    if healamount > 15 then 
    healamount = 15
    end 
    
    if healamount > victim:Health() then
    healamount = victim:Health()
    end 
attacker:SetHealth(attacker:Health() + healamount)

    if attacker:Health() > 100 then
    attacker:SetHealth(100)
    end
end
end
end)
