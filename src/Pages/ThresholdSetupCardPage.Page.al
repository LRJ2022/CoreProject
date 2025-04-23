page 50107 "Threshold Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Threshold Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Threshold Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Threshold 1 Value"; Rec."Threshold 1 Value")
                {
                    ApplicationArea = All;
                }

                field("Threshold 1 Style"; Rec."Threshold 1 Style")
                {
                    ApplicationArea = All;
                }

                field("Threshold 2 Value"; Rec."Threshold 2 Value")
                {
                    ApplicationArea = All;
                }

                field("Threshold 2 Style"; Rec."Threshold 2 Style")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Threshold: Record "Threshold Setup";
    begin
        if not Threshold.Get() then begin
            Threshold.Init();
            Threshold.Insert();
        end
    end;
}