function hud()
	local client = LocalPlayer()
    if !client:Alive() then return end
    if(client:GetActiveWeapon() == NULL or client:GetActiveWeapon() == "Camera" or client:GetObserverMode() == true) then return end
    
    local mag_left = client:GetActiveWeapon():Clip1()
    local mag_extra = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType())
    local secondary_ammo = client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType())
    
    MaxAmmo={}
    MaxAmmo["weapon_crowbar"]=0
    MaxAmmo["weapon_physcannon"]=0
    MaxAmmo["weapon_physgun"]=0
    MaxAmmo["weapon_pistol"]=18
    MaxAmmo["weapon_357"]=6
    MaxAmmo["weapon_smg1"]=45
    MaxAmmo["weapon_ar2"]=30
    MaxAmmo["weapon_crossbow"]=1
    MaxAmmo["weapon_frag"]=-1
    MaxAmmo["weapon_rpg"]=-1

    /*-----------------------------------
    Draw Health and Armor
    -----------------------------------*/
    
    draw.RoundedBox(0, 25, ScrH()-105, 200, 85, Color(25,  25, 50, 150))
    draw.SimpleText("Health: "..client:Health() .. "%", "Trebuchet18", 35, ScrH()-100, Color(255, 0, 0, 200), 0, 0)
    draw.SimpleText("Armor: "..client:Armor().."%","Trebuchet18",35,ScrH()-65,Color(5,150,255,255),0,0)
    draw.RoundedBox(0, 35, ScrH()-80, math.Clamp(client:Health(),0,100)*1.8,15, Color(150,0,0,150))
    draw.RoundedBox(0, 35, ScrH()-79, math.Clamp(client:Health(),0,100)*1.8,5, Color(255,0,0,50))
    draw.RoundedBox(0, 35, ScrH()-45, math.Clamp(client:Armor(),0,100)*1.8,15, Color(0,120,255,150))
    draw.RoundedBox(0, 35, ScrH()-44, math.Clamp(client:Armor(),0,100)*1.8,5, Color(0,190,255,50))
    draw.RoundedBox(0, 25, ScrH()-135, 200, 22, Color(25, 25, 50, 150))
    draw.RoundedBox(0, ScrW()-215, ScrH()-60, 200, 40, Color(50,  50, 25, 150))
    draw.SimpleText("Clock: "..tostring(os.date()),"Trebuchet18",ScrW()-200,ScrH()-50,Color(220,220,220,255),0,0)
    draw.SimpleText(BuildNumber,"Default",ScrW()-200,ScrH()-18,Color(220,220,220,255),0,0)
--  draw.SimpleText("Ping: "..client:Ping(),"Trebuchet18",35,ScrH()-128,Color(250,250,250,255),0,0)
    surface.SetDrawColor(0,0,0,200)
    surface.DrawOutlinedRect( 25, ScrH()-135,200,22)
    surface.DrawOutlinedRect( 25, ScrH()-105,200,85)
    surface.DrawOutlinedRect( 35, ScrH()-80,180,15)
    surface.DrawOutlinedRect( ScrW()-215, ScrH()-60,200,40)
    surface.DrawOutlinedRect( 35, ScrH()-80,math.Clamp(client:Health(),0,100)*1.8,15)
    surface.DrawOutlinedRect( 35, ScrH()-45,math.Clamp(client:Armor(),0,100)*1.8,15)
    surface.DrawOutlinedRect( 35, ScrH()-45,180,15)
    
    /*-----------------------------------
    Draw Drug Status
    -----------------------------------*/

    if (LocalPlayer():GetNWBool("Djumped")==true) then
        draw.DrawText( "g", "CSDFont", 25 , ScrH() - 180, Color(50, 255, 175, 200), 0)
        draw.DrawText( "Double Jump", "Trebuchet18", 50 , ScrH() - 172, Color(50, 255, 175, 200), 0)
    end

    if (LocalPlayer():GetNWBool("Adrenaline")==true) then
        draw.DrawText( "e", "CSDFont", 25 , ScrH() - 210, Color(90, 120, 255, 200), 0)
        draw.DrawText( "Adrenaline", "Trebuchet18", 50 , ScrH() - 200, Color(90, 120, 255, 200), 0)
    end

    if (LocalPlayer():GetNWBool("Regened")==true) then
        draw.DrawText( "b", "CSDFont", 25 , ScrH() - 240, Color(50, 255, 75, 200), 0)
        draw.DrawText( "Regeneration", "Trebuchet18", 50 , ScrH() - 230, Color(50, 255, 75, 200), 0)
    end

    if (LocalPlayer():GetNWBool("Leeched")==true) then
        draw.DrawText( "z", "DrugFont2", 25 , ScrH() - 275, Color(220, 60, 60, 200), 0)
        draw.DrawText( "Life Leech", "Trebuchet18", 50 , ScrH() - 260, Color(220, 60, 60, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "C", "DrugFont", 12 , ScrH() - 290, Color(20, 170, 20, 200), 0)
        draw.DrawText( "Spider Bite", "Trebuchet18", 50 , ScrH() - 290, Color(20, 170, 20, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "D", "DrugFont", 14 , ScrH() - 320, Color(255, 120, 0, 200), 0)
        draw.DrawText( "Focus", "Trebuchet18", 50 , ScrH() - 320, Color(255, 120, 0, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "m", "CSDFont", 25 , ScrH() - 360, Color(220, 220, 60, 200), 0)
        draw.DrawText( "Armor Pierce", "Trebuchet18", 50 , ScrH() - 350, Color(220, 220, 60, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "S", "DrugFont2", 25 , ScrH() - 405, Color(170, 0, 200, 200), 0)
        draw.DrawText( "Knockback", "Trebuchet18", 50 , ScrH() - 380, Color(170, 0, 200, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "C", "DrugFont", 130 , ScrH() - 170, Color(0, 255, 0, 200), 0)
        draw.DrawText( "Poisoned", "Trebuchet18", 170 , ScrH() - 170, Color(0, 255, 0, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "P", "DrugFont2", 148 , ScrH() - 225, Color(200, 200, 200, 200), 0)
        draw.DrawText( "Stunned", "Trebuchet18", 170 , ScrH() - 198, Color(200, 200, 200, 200), 0)
    end

    if (LocalPlayer():GetNWBool("derped")==true) then
        draw.DrawText( "D", "DrugFont2", 148 , ScrH() - 255, Color(100, 100, 100, 200), 0)
        draw.DrawText( "Cloaked", "Trebuchet18", 170 , ScrH() - 230, Color(100, 100, 100, 200), 0)
    end

    /*-----------------------------------
    Draw Remaining Ammo
    -----------------------------------*/

    if mag_left <= 0 && mag_extra <= 0 then
        hasprim=0
    else 
        hasprim=1
    end
    
    if secondary_ammo <= 0 then
        hassec=0
    else 
        hassec=1
    end
    
    if(client:GetActiveWeapon().Primary)then
        ammobar=mag_left/client:GetActiveWeapon().Primary.ClipSize*180
    else
        ammobar=mag_left/MaxAmmo[client:GetActiveWeapon():GetClass()]*180
    end
    draw.RoundedBox(0, 230, ScrH()-105, 200, 40, Color(50,  25, 25, 150*hasprim))
    draw.RoundedBox(0, 230, ScrH()-60, 200, 40, Color(50,  25, 25, 150*hassec))
    
    draw.SimpleText("Mag: "..mag_left , "Trebuchet18", 240, ScrH()-102, Color(220, 220, 0, 255*hasprim), 0, 0)
    draw.SimpleText(mag_extra , "DermaDefaultBold", 380, ScrH()-100, Color(220, 220, 0, 255*hasprim), 0, 0)
    draw.RoundedBox(0, 240, ScrH()-80, ammobar, 10, Color(140,140,0,255*hasprim), 0, 0)
    draw.RoundedBox(0, 240, ScrH()-80, ammobar, 4, Color(140,140,120,175*hasprim), 0, 0)
    draw.SimpleText("Sec: "..secondary_ammo , "Trebuchet18", 240, ScrH()-55, Color(5, 110, 255, 255*hassec), 0, 0)
    draw.RoundedBox(0, 240, ScrH()-35, math.Clamp(secondary_ammo,0,18)*10,10, Color(5,110,255,255*hassec))
    draw.RoundedBox(0, 240, ScrH()-35, math.Clamp(secondary_ammo,0,18)*10,4, Color(5,110,255,100*hassec))
    surface.SetDrawColor(0,0,0,200*hasprim)
    surface.DrawOutlinedRect( 230, ScrH()-105,200,40 )
    surface.DrawOutlinedRect( 240, ScrH()-80,ammobar,10)
    surface.DrawOutlinedRect( 240, ScrH()-80,180,10)
    surface.SetDrawColor(0,0,0,200*hassec)
    surface.DrawOutlinedRect( 230, ScrH()-60,200,40)
    surface.DrawOutlinedRect( 240, ScrH()-35,math.Clamp(secondary_ammo,0,18)*10,10)
    surface.DrawOutlinedRect( 240, ScrH()-35,180,10)

    /*-----------------------------------
    Draw Money
    -----------------------------------*/


    local function AddComma(n)
        local sn = tostring(n)
        sn = string.ToTable(sn)
        
        local tab = {}
        for i=0,#sn-1 do
            
            if i%3 == #sn%3 and !(i==0) then
                table.insert(tab, ",")
            end
            table.insert(tab, sn[i+1])
        
        end
        
        return string.Implode("",tab)
    end

    local money = LocalPlayer():GetNWInt("Money", 0)
    draw.SimpleText("Money: $"..AddComma(money),"Trebuchet18",35,ScrH()-133,Color(40,240,40,255),0,0)
end 
hook.Add("HUDPaint", "MyHudName", hud) -- I'll explain hooks and functions in a second
 
function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)