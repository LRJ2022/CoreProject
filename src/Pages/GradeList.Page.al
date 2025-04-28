page 50112 "sol Grade List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "sol Grades";
    Caption = 'Customer Grades List';
    Editable = false;
    CardPageId = "sol Grade Card";

    layout
    {
        area(Content)
        {
            repeater(Generel)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'The no. of the grade';
                }

                field(Decsription; Rec.Decsription)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the grade';
                }
            }
        }

        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}