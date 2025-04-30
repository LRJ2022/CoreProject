pageextension 50102 "sol Customer List Ext" extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part(CustomerReminderFactbox; "sol Customer Reminder Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
        addafter(Name)
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