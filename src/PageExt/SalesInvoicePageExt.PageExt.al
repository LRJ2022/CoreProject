pageextension 50101 SalesInvoicePageExt extends "Sales Invoice"
{
    layout
    {

        addBefore("Sell-to")
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
