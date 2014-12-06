include('shared.lua')

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "CashAmount" );
end