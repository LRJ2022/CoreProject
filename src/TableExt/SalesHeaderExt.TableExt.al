tableextension 50132 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50140; "Won/Lost Quote Status"; Enum "sol Won or Lost Status")
        {
            Caption = 'Quote Status';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Won/Lost Date" = 0D then
                    "Won/Lost Date" := DT2Date(System.CurrentDateTime);
            end;
        }

        field(50141; "Won/Lost Date"; Date)
        {
            Caption = 'Quote Status Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50142; "Won/Lost Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
            TableRelation = if ("Won/Lost Quote Status" =
                                    const("Won/Lost Quote Status"::Won)) "Close Opportunity Code" where(Type = const(0))
            else
            if ("Won/Lost Quote Status" = const("Won/Lost Quote Status"::Lost)) "Close Opportunity Code" where(Type = const(1));

            trigger OnValidate()
            begin
                CalcFields("Won/Lost Reason Desc");
            end;

        }
        field(50143; "Won/Lost Reason Desc"; Text[100])
        {
            Caption = 'Reason Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Close Opportunity Code".Description where(Code = field("Won/Lost Reason Code")));
        }

        field(50144; "Won/Lost Remarks"; Text[2048])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(50145; "Grade No."; Code[20])
        {
            Caption = 'Grade No.';
            ToolTip = 'Grade No.';
            TableRelation = "sol Grades";

        }

        field(50146; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
            FieldClass = FlowField;
            CalcFormula = lookup("sol Grades".Decsription where("No." = field("Grade No.")));
        }
    }

    /* 
        procedure LookUpDescriptionBasedOnStatus()
        var
            closeOpportunityCode_loc: Record "Close Opportunity Code";
        begin
            If "Won/Lost Quote Status" = "Won/Lost Quote Status"::Won then begin
                closeOpportunityCode_loc.SetFilter(Type, Format("Won/Lost Quote Status"::Won));
            end;

            if "Won/Lost Quote Status" = "Won/Lost Quote Status"::Lost then begin
                closeOpportunityCode_loc.SetFilter(Type, Format("Won/Lost Quote Status"::Won));
            end;

        end; */
}