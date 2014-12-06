DeriveGamemode("sandbox")
GM.Name 	= "Basewars 14"
BuildNumber = "Havok BW14"

team.SetUp( 1, "Citizen", Color( 130, 130, 130, 255 ) )

/*----------------------------------------------------------------

WARNING: CRAPPY CODE AHEAD

Edit this file to create or remove items from the basewars shop, this works in a somewhat similar way to oldschool DarkRP

Basic Format:

WeaponTable = {}                                                                                                    -- the name of the table defines different categories, remember to add a button to select new categories in cl_buymenu.lua

WeaponTable["item_p226"] = {                                                                                        -- call this whatever you want, just keep the name related to your item to prevent headaches when editing later
    Name = "Sig Sauer P226",                                                                                        -- the name of your item as it will appear in the store
    Description = "A modest sideram to suit a modest budget, it can still be deadly in the right hands",            -- the description of your item as it will appear in the store
    Model = "models/weapons/w_pist_p228.mdl",                                                                       -- the model that will be used as the preview image of your item
    Entname = "fas2_p226",                                                                                          -- the lua name of the weapon/item to spawn, leave this blank if the item in question runs a special function rather than spawning something
    Price = 400,                                                                                                    -- how much this item costs
    BuyFunction =                                                                                                   -- what to do when somebody purchases this item
        function(ply,item)
        ply:GenericBuySwep()
        end,
}

-----------------------------------------------------------------*/


BuyRefTable = {}

/*-----------------------------------------
Buyable Guns
-----------------------------------------*/


WeaponTable = {}

WeaponTable["cw_deagle"] = { 
    Name = "IMI Desert Eagle",
    Description = "A .50 caliber handgun optimized to deliver the maximum amount of freedom and democracy per shot",
    Model = "models/weapons/w_pist_deagle.mdl",
    Entname = "fas2_deagle",
    Price = 850,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

WeaponTable["cw_mp5"] = { 
    Name = "HK MP5",
    Description = "A widely used 9mm SMG produced by Heckler and Koch",
    Model = "models/weapons/w_mp5.mdl",
    Entname = "fas2_mp5a5",
    Price = 1500,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

WeaponTable["cw_ak74"] = { 
    Name = "AK 74",
    Description = "A powerful russian assault rifle used by terrorists and private militias worldwide",
    Model = "models/weapons/w_rif_ak47.mdl",
    Entname = "fas2_ak74",
    Price = 2800,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

WeaponTable["cw_g3a3"] = { 
    Name = "HK G3A3",
    Description = "A large bore battle rifle produced by Heckler and Koch",
    Model = "models/weapons/w_g3a3.mdl",
    Entname = "fas2_g3",
    Price = 3200,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

WeaponTable["cw_ar15"] = { 
    Name = "MR-96",
    Description = "A gun",
    Model = "models/weapons/w_g3a3.mdl",
    Entname = "fas2_g3",
    Price = 3200,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

WeaponTable["cw_mr96"] = { 
    Name = "AR-15",
    Description = "A gun",
    Model = "models/weapons/w_g3a3.mdl",
    Entname = "fas2_g3",
    Price = 3200,
    BuyFunction = 
        function(ply,item)
        local wep = WeaponTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

/*-----------------------------------------
Buyable Drugs
-----------------------------------------*/

DrugTable = {}

DrugTable["item_djump"] = { 
    Name = "Double Jump",
    Description = "Allows you to perform a second jump in midair",
    Model = "models/props_lab/jar01b.mdl",
    Price = 10000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Drug = ents.Create("durgz_djump")
            Drug:SetPos(tr.HitPos + upvector)
            Drug:Spawn()
            Drug:Activate()
        end,
}

DrugTable["item_adrenaline"] = { 
    Name = "Adrenaline",
    Description = "Increases your sprint speed",
    Model = "models/props_lab/jar01b.mdl",
    Price = 10000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Drug = ents.Create("durgz_adrenaline")
            Drug:SetPos(tr.HitPos + upvector)
            Drug:Spawn()
            Drug:Activate()
        end,
}

DrugTable["item_regen"] = { 
    Name = "Regeneration",
    Description = "You steadily regenerate health while under the effect of this drug",
    Model = "models/props_lab/jar01b.mdl",
    Price = 10000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Drug = ents.Create("durgz_regen")
            Drug:SetPos(tr.HitPos + upvector)
            Drug:Spawn()
            Drug:Activate()
        end,
}

DrugTable["item_leech"] = { 
    Name = "Life Leech",
    Description = "Gives you the power to absorb 20% of all damage dealt as life force",
    Model = "models/props_lab/jar01b.mdl",
    Price = 10000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Drug = ents.Create("durgz_lifeleech")
            Drug:SetPos(tr.HitPos + upvector)
            Drug:Spawn()
            Drug:Activate()
        end,
}


/*-----------------------------------------
Buyable Structures
-----------------------------------------*/


StrucTable = {} 

StrucTable["item_smallgen"] = { 
    Name = "Small Generator",
    Description = "A cheap, compact generator with a relatively low power output",
    Model = "models/props/de_train/acunit2.mdl",
    Price = 5000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("small_generator")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_turbgen"] = { 
    Name = "Turbine Generator",
    Description = "A gas turbine generator that generates a decent amount of juice",
    Model = "models/props_wasteland/laundry_washer003.mdl",
    Price = 12000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("turbine_generator")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_indusgen"] = { 
    Name = "Industrial Generator",
    Description = "A powerful 3-phase industrial generator, perfect for powering your experimental death machines",
    Model = "models/props/de_train/de_train_signalbox_01.mdl",
    Price = 25000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("industrial_generator")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_dispenser"] = { 
    Name = "Ammo Dispenser",
    Description = "A portable fabricator that can create ammo for almost any gun",
    Model = "models/props_lab/reciever_cart.mdl",
    Price = 1600,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,40)

            local Struc = ents.Create("dispenser")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_spawn"] = { 
    Name = "Spawn Point",
    Description = "A special platform that turns death from a finality into a minor annoyance",
    Model = "models/props_trainstation/trainstation_clock001.mdl",
    Price = 800,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,1)

            local Struc = ents.Create("spawn_point")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_hydroponics"] = { 
    Name = "Hydroponics Rack",
    Description = "A self contained hydroponic farm that grows special weed used to produce combat drugs.  Remember to buy weed seeds from the utilities menu to keep that green stuff growing",
    Model = "models/props/de_nuke/equipment2.mdl",
    Price = 1000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("hydroponics")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_still"] = { 
    Name = "Moonshine Still",
    Description = "A moonshine still just like uncle jimbob used to make.  Produces moonshine which is used to create combat drugs",
    Model = "models/props/de_inferno/wine_barrel.mdl",
    Price = 1000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("moonshine_still")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_gunfactory"] = { 
    Name = "Gun Factory",
    Description = "An industrial grade robotic assembly suite intended for building unique weapons that aren't available on the black market",
    Model = "models/props/de_prodigy/transformer.mdl",
    Price = 5000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("gun_factory")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_drugrefinery"] = { 
    Name = "Drug Refinery",
    Description = "A fully featured chemical refining plant that can turn regular ingredients into powerful combat drugs or purify street drugs to turn a profit",
    Model = "models/props/de_train/processor.mdl",
    Price = 3000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("drug_refinery")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["item_druglab"] = { 
    Name = "Drug Lab",
    Description = "A specialized workbench that is geared towards producing experimental super drugs",
    Model = "models/props/cs_italy/it_mkt_table3.mdl",
    Price = 5000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("drug_lab")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

StrucTable["emplacement_20mm"] = { 
    Name = "20mm Heavy Cannon",
    Description = "20mm Heavy Cannon",
    Model = "models/turret/mg_turret.mdl",
    Price = 20000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("emplacement_20mm")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
        end,
}

StrucTable["emplacement_mg"] = { 
    Name = "7.62x39mm Turret",
    Description = "7.62x39mm Turret",
    Model = "models/reach/weapons/turret/hmg_fix.mdl",
    Price = 15000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("emplacement_mg")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
        end,
}

UtilTable = {}

UtilTable["item_armor"] = { 
    Name = "Kevlar Plate",
    Description = "Protects your squishy bits from incoming bullets",
    Model = "models/weapons/w_defuser.mdl",
    Price = 500,
    BuyFunction = 
        function(ply,item)
            local ArmorToGive = 50
            local MaxArmor = 100
            
            if ply:Armor() + ArmorToGive < MaxArmor then 
                ply:SetArmor(ply:Armor() + ArmorToGive)
            else
                ply:SetArmor(MaxArmor)
            end  
        end,
}

UtilTable["item_snipeshield"] = { 
    Name = "Anti-Snipe Shield",
    Description = "A one use item that will protect you from taking lethal damage but will be consumed in the process",
    Model = "models/props/cs_office/snowman_hat.mdl",
    Price = 750,
    BuyFunction = 
        function(ply,item)
            local ArmorToGive = 75
            local MaxArmor = 100
            
            if ply:Armor() + ArmorToGive < MaxArmor then 
                ply:SetArmor(ply:Armor() + ArmorToGive)
            else
                ply:SetArmor(MaxArmor)
            end  
        end,
}

UtilTable["item_defuser"] = { 
    Name = "Bomb Defuser",
    Description = "A tool that is used to quickly and efficiently defuse breaching charges and bigbombs",
    Model = "models/props_c17/tools_pliers01a.mdl",
    Entname = "weapon_defuser",
    Price = 750,
    BuyFunction = 
        function(ply,item)
        local wep = UtilTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

UtilTable["item_blowtorch"] = { 
    Name = "Blowtorch",
    Description = "A dual purpose cutting torch, it can be used to patch up holes in your base defenses or create new holes in other peoples bases",
    Model = "models/weapons/w_pistol.mdl",
    Entname = "weapon_blowtorch",
    Price = 1000,
    BuyFunction = 
        function(ply,item)
        local wep = UtilTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

UtilTable["item_bcharge"] = { 
    Name = "Breaching Charge",
    Description = "A shaped charge designed for opening doorways where there was none before",
    Model = "models/weapons/w_c4_planted.mdl",
    Entname = "weapon_bcharge",
    Price = 4000,
    BuyFunction = 
        function(ply,item)
        local wep = UtilTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

UtilTable["item_bigbomb"] = { 
    Name = "Big Bomb",
    Description = "The name ain't lying, this is a really freakin big bomb",
    Model = "models/props_c17/oildrum001.mdl",
    Entname = "weapon_bigbomb",
    Price = 100000,
    BuyFunction = 
        function(ply,item)
        local wep = UtilTable[item].Entname
        ply:Give( wep )
        ply:SelectWeapon( wep )
        end,
}

PrinterTable = {}

PrinterTable["item_printer_crappy"] = { 
    Name = "Crappy Money Printer",
    Description = "A money printer that you cobbled together out of some old rubbish you found in your garage",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 200,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_crappy")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_basic"] = { 
    Name = "Basic Money Printer",
    Description = "A bargain bin no-frills money printer",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 500,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_basic")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_improved"] = { 
    Name = "Improved Money Printer",
    Description = "A newer version of the basic printer with multiple design tweaks to make it print higher volumes of money",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 1500,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_improved")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_overclocked"] = { 
    Name = "Overclocked Money Printer",
    Description = "A money printer that has been tweaked to all fuck by some dodgy street scientists",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 5000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_overclocked")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_supercharged"] = { 
    Name = "Supercharged Money Printer",
    Description = "If you hooked wheels up to the motor on this thing you could probably win the gmod grand prix",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 20000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_supercharged")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_laser"] = { 
    Name = "Laser Money Printer",
    Description = "Ink is so last century! this printer uses high powered lasers to create cash more quickly and efficiently than a traditional printer ever could",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 100000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_laser")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_darkmatter"] = { 
    Name = "Dark Matter Money Printer",
    Description = "It doesnt bear thinking what the government would do if they knew we had our hands on this kind of technology",
    Model = "models/props_c17/consolebox01a.mdl",
    Price = 1000000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_darkmatter")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}

PrinterTable["item_printer_nuclear"] = { 
    Name = "Nuclear Money Printer",
    Description = "Buyer beware: poorly shielded nuclear reactors are extremely easy to detect, everybody will know you have this printer if you buy it!",
    Model = "models/props/de_train/barrel.mdl",
    Price = 10000000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )

            local upvector = Vector(0,0,10)

            local Struc = ents.Create("printer_nuclear")
            Struc:SetPos(tr.HitPos + upvector)
            Struc:Spawn()
            Struc:Activate()
            Struc.Owner = ply
            Struc:SetBuyer(ply:Nick())
            Struc:SetAmount(Struc.MaxHealth)
        end,
}


--------------------------------------------vehicles

VehicleTable = {}

VehicleTable["wac_hc_littlebird_ah6h"] = { 
    Name = "Little Bird AH-6",
    Description = "Little Bird AH-6",
    Model = "models/flyboi/littlebird/littlebirda_fb.mdl",
    Price = 2000000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 150)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,-40)

            local Ent = ents.Create("wac_hc_littlebird_ah6h")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_jennyh"] = { 
    Name = "JN-4",
    Description = "JN-4",
    Model = "models/curtiss/jenny_jn4.mdl",
    Price = 5500,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 300)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,80)

            local Ent = ents.Create("wac_pl_jennyh")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_bf109E3h"] = { 
    Name = "Bf 109-E3",
    Description = "Bf 109-E3",
    Model = "models/sentry/bf109.mdl",
    Price = 380000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 350)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,50)

            local Ent = ents.Create("wac_pl_bf109E3h")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_bf109E1"] = { 
    Name = "Bf 109-E1",
    Description = "Bf 109-E1",
    Model = "models/sentry/bf109.mdl",
    Price = 320000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 350)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,50)

            local Ent = ents.Create("wac_pl_bf109E1")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_p51h"] = { 
    Name = "P-51D",
    Description = "P-51D",
    Model = "models/sentry/p51.mdl",
    Price = 670000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 350)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,50)

            local Ent = ents.Create("wac_pl_p51h")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_spitfire5b"] = { 
    Name = "Spitfire Mk Vb",
    Description = "Spitfire Mk Vb",
    Model = "models/sentry/spitfire.mdl",
    Price = 340000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 350)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,50)

            local Ent = ents.Create("wac_pl_spitfire5b")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

VehicleTable["wac_pl_a6m2h"] = { 
    Name = "A6M2",
    Description = "A6M2",
    Model = "models/sentry/a6m2.mdl",
    Price = 324000,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 350)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,50)

            local Ent = ents.Create("wac_pl_a6m2h")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}
----------------------------------------------items

ItemsTable = {}

ItemsTable["fas2_att_compm4"] = { 
    Name = "CompM4",
    Description = "CompM4",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_compm4")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_acog"] = { 
    Name = "ACOG 4X",
    Description = "ACOG 4X",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_acog")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_c79"] = { 
    Name = "ELCAN C79",
    Description = "ELCAN C79",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_c79")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_eotech"] = { 
    Name = "EoTech 553",
    Description = "EoTech 553",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_eotech")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_foregrip"] = { 
    Name = "Foregrip",
    Description = "Foregrip",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_foregrip")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_harrisbipod"] = { 
    Name = "Harris Bipod",
    Description = "Harris Bipod",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_harrisbipod")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_leupold"] = { 
    Name = "Leupold MK4",
    Description = "Leupold MK4",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_leupold")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_m2120mag"] = { 
    Name = "M21 20RND Mag",
    Description = "M21 20RND Mag",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_m2120mag")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_mp5k30mag"] = { 
    Name = "MP5K 30RND Mag",
    Description = "MP5K 30RND Mag",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_mp5k30mag")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_pso1"] = { 
    Name = "PSO-1",
    Description = "PSO-1",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_pso1")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_sg55x30mag"] = { 
    Name = "SG55X 30RND Mag",
    Description = "SG55X 30RND Mag",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_sg55x30mag")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_sks20mag"] = { 
    Name = "SKS 20RND Mag",
    Description = "SKS 20RND Mag",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_sks20mag")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_sks30mag"] = { 
    Name = "SKS 30RND Mag",
    Description = "SKS 30RND Mag",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_sks30mag")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_suppressor"] = { 
    Name = "Suppressor",
    Description = "Suppressor",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_suppressor")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_tritiumsights"] = { 
    Name = "Tritium Sights",
    Description = "Tritium Sights",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_tritiumsights")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

ItemsTable["fas2_att_uziwoodenstock"] = { 
    Name = "UZI Wooden Stock",
    Description = "UZI Wooden Stock",
    Model = "models/props_junk/cardboard_box004a.mdl",
    Price = 100,
    BuyFunction = 
        function(ply,item)
            local vStart = ply:GetShootPos()
            local vForward = ply:GetAimVector()
            local trace = {}
            trace.start = vStart
            trace.endpos = vStart + (vForward * 100)
            trace.filter = ply
            local tr = util.TraceLine( trace )
            local upvector = Vector(0,0,10)

            local Ent = ents.Create("fas2_att_uziwoodenstock")
            Ent:SetPos(tr.HitPos + upvector)
            Ent:Spawn()
            Ent:Activate()
        end,
}

function GM:PlayerFootstep(ply, pos, foot, sound, volume, rf)
   if IsValid(ply) and (ply:Crouching() or ply:GetMaxSpeed() < 150) then
      -- do not play anything, just prevent normal sounds from playing
      return true
   end
end
function MakeBuyReference()
table.Merge(BuyRefTable,WeaponTable)
table.Merge(BuyRefTable,DrugTable)
table.Merge(BuyRefTable,StrucTable)
table.Merge(BuyRefTable,UtilTable)
table.Merge(BuyRefTable,PrinterTable)
table.Merge(BuyRefTable,ItemsTable)
table.Merge(BuyRefTable,VehicleTable)
end
hook.Add( "Initialize", "buyref_hook", MakeBuyReference )
concommand.Add("buymenu_refresh", MakeBuyReference)