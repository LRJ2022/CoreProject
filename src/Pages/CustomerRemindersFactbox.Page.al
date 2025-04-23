page 50100 "sol Customer Reminder Factbox"
{
    caption = 'Customer Reminders Factbox';
    PageType = ListPart;
    //  ApplicationArea = All;  Not needed because, it is always a part of another page
    UsageCategory = Administration;
    SourceTable = "Reminder/Fin. Charge Entry";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }

                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }

                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}