pageextension 50103 "sol Customer Card Ext" extends "Customer Card"
{
    layout
    {
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
        addfirst(factboxes)
        {
            part(CustomerReminderFactbox; "sol Customer Reminder Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}