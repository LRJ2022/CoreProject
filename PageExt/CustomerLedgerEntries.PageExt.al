pageextension 50101 "sol Customer Ldg. Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        addfirst(factboxes)
        {
            part(CustomerReminderFactbox; "sol Customer Reminder Factbox")
            {
                SubPageLink = "Customer Entry No." = field("Entry No.");
                ApplicationArea = All;
            }
        }
    }
}