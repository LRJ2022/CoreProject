pageextension 50106 "sol Item Card Ext" extends "Item Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(SalesPricesFactbox; "sol Sales Price Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No.");

            }
        }
    }

}