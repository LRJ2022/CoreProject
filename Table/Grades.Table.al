table 50110 "sol Grades"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "sol Grade List";
    LookupPageId = "sol Grade List";

    fields
    {

        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GradesSetup.Get();
                    GradesSetup.TestField("Grades No.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; Decsription; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Decsription)
        {

        }
        fieldgroup(Brick; "No.", Decsription)
        {

        }
    }

    var
        NoSerieMgt: Codeunit NoSeriesManagement;
        GradesSetup: Record "sol Grade Setup";

    trigger OnInsert()
    var
        grades_loc: Record "sol Grades";
    begin
        if "No." = '' then begin
            GradesSetup.Get();
            GradesSetup.TestField("Grades No.");
            NoSerieMgt.InitSeries(GradesSetup."Grades No.", xRec."No. Series", 0D, "No.", "No. Series");

        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure AssistEdit(OldGrade: Record "sol Grades"): Boolean
    var
        Grade: record "sol Grades";
    begin
        with Grade do begin
            Grade := Rec;
            GradesSetup.Get();
            GradesSetup.TestField("Grades No.");
            if NoSerieMgt.SelectSeries(GradesSetup."Grades No.", OldGrade."No. Series", "No. Series") then begin
                NoSerieMgt.SetSeries("No.");
                Rec := Grade;
                exit(true);
            end;
        end;
    end;

}