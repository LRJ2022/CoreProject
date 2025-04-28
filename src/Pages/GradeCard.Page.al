page 50111 "sol Grade Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "sol Grades";
    Caption = 'Customer Grade card';

    layout
    {
        area(Content)
        {
            group(Generel)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'The no. of the grade';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
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