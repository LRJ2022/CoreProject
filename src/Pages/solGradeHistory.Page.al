page 50103 "sol Grade History"
{
    ApplicationArea = All;
    Caption = 'Grade History';
    PageType = List;
    SourceTable = "sol Grade History";
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
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
                field("Grade No."; Rec."Grade No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade No. field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
        }

        area(FactBoxes)
        {
            part("Grade History Factbox"; "sol Grade History Factbox")
            {
                SubPageLink = "Entry No." = field("Entry No.");
                ApplicationArea = All;

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Test)
            {
                Caption = 'Test';
                Image = Action;
                trigger OnAction()
                begin

                end;
            }
            action(Test2)
            {
                Caption = 'Test2';
                Image = Action;
                trigger OnAction()
                begin

                end;
            }
            action(Test3)
            {
                Caption = 'Test3';
                Image = Action;
                trigger OnAction()
                begin

                end;
            }
        }
    }
}
