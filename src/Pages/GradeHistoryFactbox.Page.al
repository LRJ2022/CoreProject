page 50105 "sol Grade History Factbox"
{
    Caption = 'Grade History Factbox';
    PageType = ListPart;
    SourceTable = "sol Grade history";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field(DateTimer; Rec.DateTimer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DateTime field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document type"; Rec."Document type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document type field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
                }
                field("Grade No."; Rec."Grade No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
        }
    }

}
