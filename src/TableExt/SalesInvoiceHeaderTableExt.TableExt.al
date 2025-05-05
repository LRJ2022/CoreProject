tableextension 50102 "sol Sales Invoice HeaderExt" extends "Sales Invoice Header"
{
    fields
    {
        field(50145; "Grade No."; Code[20])
        {
            Caption = 'Grade no.';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Grade No." where("No." = field("Sell-to Customer No.")));
        }

        field(50146; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
            FieldClass = FlowField;
            CalcFormula = lookup("sol Grades".Decsription where("No." = field("Grade No.")));
        }
    }
}
