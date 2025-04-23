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
    }
}