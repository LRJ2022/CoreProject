pageextension 50104 "sol Sales Order Price Factbox" extends "Sales Order"
{
    layout
    {
        addafter(Control1906127307)
        {
            part(salesPriceFactbox; "sol Sales Price Factbox")
            {
                ApplicationArea = All;
                Provider = SalesLines;
                SubPageLink = "Item No." = field("No.");
            }
        }
        addbefore("Sell-to")
        {
            field("Grade No."; Rec."Grade No.")
            {
                ApplicationArea = All;
            }

            field("Grade Description"; Rec."Grade Description")
            {
                ApplicationArea = All;
            }
        }
    }
}