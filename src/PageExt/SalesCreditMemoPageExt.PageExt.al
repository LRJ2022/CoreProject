pageextension 50107 SalesCreditMemoPageExt extends "Sales Credit Memo"
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
