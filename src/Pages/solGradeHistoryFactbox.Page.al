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
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field(DateTimer; Rec.DateTimer)
                {
                    ToolTip = 'Specifies the value of the DateTime field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document type"; Rec."Document type")
                {
                    ToolTip = 'Specifies the value of the Document type field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
                }
                field("Grade No."; Rec."Grade No.")
                {
                    ToolTip = 'Specifies the value of the Grade No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
        }
    }
}
