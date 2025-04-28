page 50102 "sol Grades Setup Card"
{
    ApplicationArea = All;
    Caption = 'Grades Setup Card';
    PageType = Card;
    SourceTable = "sol Grade Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                    Editable = false;
                }

            }

            group("Number Serie")
            {
                field("Grades No."; Rec."Grades No.")
                {
                    ToolTip = 'Specifies the value of the Grades No. field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
