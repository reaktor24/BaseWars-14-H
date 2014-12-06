local function formatNumber(n)
    n = tonumber(n)
    if (!n) then
        return 0
    end
    if n >= 1e14 then return tostring(n) end
    n = tostring(n)
    sep = sep or ","
    local dp = string.find(n, "%.") or #n+1
    for i=dp-4, 1, -3 do
        n = n:sub(1, i) .. sep .. n:sub(i+1)
    end
    return n
end

/*----------------------------------------------------------------

Clientside tables used for the shops tabs system.
If you change anything in here remember to copy your changes to SharedTable in shared.lua

-----------------------------------------------------------------*/


local MasterTable = {} 

timer.Simple(1, function()

surface.CreateFont("UiBold", {
    font = "Tahoma", 
    size = 13, 
    weight = 700
})

surface.CreateFont("Trebuchet24", {
    font = "Trebuchet MS", 
    size = 24, 
    weight = 900
})
    
surface.CreateFont("Trebuchet22", {
    font = "Trebuchet MS", 
    size = 22, 
    weight = 900
})

surface.CreateFont("Trebuchet20", {
    font = "Trebuchet MS", 
    size = 20, 
    weight = 900
})
end)

function BuyMenu()
    local ShopMenu = vgui.Create( "DFrame" )
    ShopMenu:SetSize( 1000, 780 ) 
    ShopMenu:Center() 
    ShopMenu:SetTitle( "Basewars Shop" )  
    ShopMenu:SetVisible( true )
    ShopMenu:SetDraggable( true ) 
    ShopMenu:ShowCloseButton( true )
    ShopMenu:MakePopup()
    ShopMenu:SizeToContents()
    ShopMenu.Paint = function(CHPaint)
        -- Draw the menu background color.      
        draw.RoundedBox( 6, 0, 0, CHPaint:GetWide(), CHPaint:GetTall(), Color( 0, 0, 0, 200 ) )
    end



/*-------------------------------------------

Categorial Tabs

-------------------------------------------*/


    local itemstab = vgui.Create( "DButton" )
    itemstab:SetParent( ShopMenu )  
    itemstab:SetPos( 5, 35 )
    itemstab:SetText( "Items Store" )
    itemstab:SetTextColor( Color(255, 255, 255, 255) )
    itemstab:SetSize( 110, 30 )
    itemstab.Paint = function()
    surface.SetDrawColor( 75, 15, 15, 175 )
    surface.DrawRect( 0, 0, itemstab:GetWide(), itemstab:GetTall() )
    end
    itemstab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,ItemsTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end	

    local weptab = vgui.Create( "DButton" )
    weptab:SetParent( ShopMenu )  
    weptab:SetPos( 120, 35 )
    weptab:SetText( "Weapons" )
    weptab:SetTextColor( Color(255, 255, 255, 255) )
    weptab:SetSize( 110, 30 )
    weptab.Paint = function()
    surface.SetDrawColor( 60, 0, 0, 200 )
    surface.DrawRect( 0, 0, weptab:GetWide(), weptab:GetTall() )
    end
    weptab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,WeaponTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end

    local drugtab = vgui.Create( "DButton" )
    drugtab:SetParent( ShopMenu )  
    drugtab:SetPos( 235, 35 )
    drugtab:SetText( "Drugs" )
    drugtab:SetTextColor( Color(255, 255, 255, 255) )
    drugtab:SetSize( 110, 30 )
    drugtab.Paint = function()
    surface.SetDrawColor( 60, 0, 60, 200 )
    surface.DrawRect( 0, 0, drugtab:GetWide(), drugtab:GetTall() )
    end
    drugtab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,DrugTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end

    local structab = vgui.Create( "DButton" )
    structab:SetParent( ShopMenu )  
    structab:SetPos( 350, 35 )
    structab:SetText( "Structures" )
    structab:SetTextColor( Color(255, 255, 255, 255) )
    structab:SetSize( 110, 30 )
    structab.Paint = function()
    surface.SetDrawColor( 60, 60, 0, 200 )
    surface.DrawRect( 0, 0, structab:GetWide(), structab:GetTall() )
    end
    structab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,StrucTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end

    local mptab = vgui.Create( "DButton" )
    mptab:SetParent( ShopMenu )  
    mptab:SetPos( 465, 35 )
    mptab:SetText( "Money Printers" )
    mptab:SetTextColor( Color(255, 255, 255, 255) )
    mptab:SetSize( 110, 30 )
    mptab.Paint = function()
    surface.SetDrawColor( 0, 60, 0, 200 )
    surface.DrawRect( 0, 0, mptab:GetWide(), mptab:GetTall() )
    end
    mptab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,PrinterTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end
	
    local utiltab = vgui.Create( "DButton" )
    utiltab:SetParent( ShopMenu )  
    utiltab:SetPos( 580, 35 )
    utiltab:SetText( "Utilities" )
    utiltab:SetTextColor( Color(255, 255, 255, 255) )
    utiltab:SetSize( 110, 30 )
    utiltab.Paint = function()
    surface.SetDrawColor( 0, 0, 60, 200 )
    surface.DrawRect( 0, 0, utiltab:GetWide(), utiltab:GetTall() )
    end
    utiltab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,UtilTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end
	
    local vehicletab = vgui.Create( "DButton" )
    vehicletab:SetParent( ShopMenu )  
    vehicletab:SetPos( 695, 35 )
    vehicletab:SetText( "Vehicles" )
    vehicletab:SetTextColor( Color(255, 255, 255, 255) )
    vehicletab:SetSize( 110, 30 )
    vehicletab.Paint = function()
    surface.SetDrawColor( 60, 60, 60, 200 )
    surface.DrawRect( 0, 0, vehicletab:GetWide(), vehicletab:GetTall() )
    end
    vehicletab.DoClick = function()
        table.Empty(MasterTable)
        table.Merge(MasterTable,VehicleTable)
        ShopMenu:Remove()
        net.Start("bw_closeshopmenu")
        net.SendToServer()
        timer.Simple(0.01, function()
        LocalPlayer():ConCommand("bw_shop")
        end)
    end
  
 



/*-------------------------------------------

Item List

-------------------------------------------*/

    local TheListPanel = vgui.Create( "DPanelList", ShopMenu )
    TheListPanel:SetTall( 700 )
    TheListPanel:SetWide( 980 )
    TheListPanel:SetPos( 5, 65 )
    TheListPanel:EnableVerticalScrollbar( true )
    TheListPanel:EnableHorizontal( true )
    for k, v in SortedPairsByMemberValue( MasterTable, "Price", false ) do
        if v.Name then

            local ItemList = vgui.Create("DPanelList")
            ItemList:SetTall( 100 )
            ItemList:SetWide( 960 )
            ItemList:SetPos( 10, 30 )
            ItemList:SetSpacing( 5 )
            ItemList.Paint = function()
                draw.RoundedBox(8,0,2,ItemList:GetWide(),ItemList:GetTall(),Color( 20, 20, 20, 180 ))
            end
                
            local ItemBackground = vgui.Create( "DPanel", ItemList )
            ItemBackground:SetPos( 5, 5 )
            ItemBackground:SetSize( 950, 90 )
            ItemBackground.Paint = function() -- Paint function
                draw.RoundedBoxEx(8,1,1,ItemBackground:GetWide()-2,ItemBackground:GetTall()-2,Color(0, 0, 0, 50), false, false, false, false)
            end
                
            local ItemDisplay = vgui.Create( "SpawnIcon", ItemBackground )
            ItemDisplay:SetPos( 5, 5 )
            ItemDisplay:SetModel( v.Model )
            ItemDisplay:SetToolTip(false)
            ItemDisplay:SetSize(80,80)
            ItemDisplay.PaintOver = function()
                return
            end
            ItemDisplay.OnMousePressed = function()
                return false
            end
            
            local ItemName = vgui.Create( "DLabel", ItemBackground )
            ItemName:SetPos( 125, 10 )
            ItemName:SetFont( "Trebuchet24" )
            ItemName:SetColor( Color(255,255,255,255) )
            ItemName:SetText( v.Name )
            ItemName:SizeToContents()
            
            local ItemPrice = vgui.Create( "DLabel", ItemBackground )
            ItemPrice:SetPos( 125, 30 )
            ItemPrice:SetFont( "Trebuchet20" )
            local money = tonumber(LocalPlayer():GetNWInt("Money", 0))
            if money >= v.Price then
                ItemPrice:SetColor( Color(0,150,0,255) )
            else
                ItemPrice:SetColor( Color(150,0,0,255) )
            end
            ItemPrice:SetText( "Price: $"..formatNumber(v.Price) )
            ItemPrice:SizeToContents()
                
            local ItemDescription = vgui.Create( "DLabel", ItemBackground )
            ItemDescription:SetPos( 125, 50 )
            ItemDescription:SetFont( "UiBold" )
            ItemDescription:SetColor( Color(255,255,100,255) )
            ItemDescription:SetText( v.Description )
            ItemDescription:SetSize(600, 30)
            ItemDescription:SetWrap(true)
            
            local BuyItem = vgui.Create("DButton", ItemBackground)
            BuyItem:SetSize( 200, 80 )
            BuyItem:SetPos( 740, 5 )
            BuyItem:SetText("")
            if money < v.Price then
                BuyItem:SetDisabled( true )
                BuyItem:SetToolTip("You cannot afford this item!")
            end
            BuyItem.Paint = function(panel)
                draw.RoundedBoxEx(8,1,1,BuyItem:GetWide()-2,BuyItem:GetTall()-2,Color(0, 0, 0, 130), true, false, true, false)
                    
                local struc = {}
                struc.pos = {}
                struc.pos[1] = 100
                struc.pos[2] = 40
                if money >= v.Price then
                    struc.color = Color(255,255,255,255)
                else
                    struc.color = Color(150,150,150,255)
                end
                struc.text = "Purchase" 
                struc.font = "Trebuchet22" 
                struc.xalign = TEXT_ALIGN_CENTER
                struc.yalign = TEXT_ALIGN_CENTER
                draw.Text( struc )
            end
            BuyItem.DoClick = function()
                ShopMenu:Remove()
                net.Start("bw_closeshopmenu")
                net.SendToServer()
                
                net.Start("BW_Buy")
                    net.WriteString(k)
                net.SendToServer()

            end
                
            TheListPanel:AddItem( ItemList )
        end
    end
end
concommand.Add("bw_shop", BuyMenu)