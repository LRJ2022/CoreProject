tableextension 50101 CustomerTableExt extends Customer
{
    fields
    {
        field(50145; "Grade No."; Code[20])
        {
            Caption = 'Grade No.';
            ToolTip = 'Grade No.';
            NotBlank = true;
            TableRelation = "sol Grades";

            trigger OnValidate()
            begin
                CalcFields("Grade Description");
            end;
        }

        field(50146; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
            FieldClass = FlowField;
            CalcFormula = lookup("sol Grades".Decsription where("No." = field("Grade No.")));
        }
    }
}
