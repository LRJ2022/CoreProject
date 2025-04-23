pageextension 50103 "sol Customer Card Ext" extends "Customer Card"
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
    }
}