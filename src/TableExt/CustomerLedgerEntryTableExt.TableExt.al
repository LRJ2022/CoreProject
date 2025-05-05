tableextension 50131 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
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
    procedure GetNumberOfDaysExpired(): Integer
    var
        today: date;

    begin
        today := DT2Date(System.CurrentDateTime);
        if "Due Date" < today then
            exit(1);
        //exit(Abs(today - "Due Date"));

        exit(0);
    end;
}