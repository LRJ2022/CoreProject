pageextension 50105 "sol Item List Page Ext" extends "Item List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(SalesPriceFactbox; "sol Sales Price Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No.");

            }
        }
    }

}