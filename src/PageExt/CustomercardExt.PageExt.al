pageextension 50103 "sol Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Grade No."; Rec."Grade No.")
            {
                ApplicationArea = All;
                Editable = true;
            }

            field("Grade Description"; Rec."Grade Description")
            {
                ApplicationArea = All;
            }
        }
        addfirst(factboxes)
        {
            part(CustomerReminderFactbox; "sol Customer Reminder Factbox")
            {

                SubPageLink = "Customer No." = field("No.");
                //SubPageView = 
                ApplicationArea = All;
            }
            part("sol Grade FactBox"; "sol Grade History Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }

    /*    trigger OnAfterGetRecord()
       var
           HistoryData_loc: Record "sol Grade History";
       begin
           HistoryData_loc.SetRange("Customer No.", Rec."No.");
           HistoryData_loc.FindSet();
       end;*/
}