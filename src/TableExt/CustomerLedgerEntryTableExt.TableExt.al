tableextension 50131 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    procedure GetNumberOfDaysExpired(): Integer
    var
        today: date;

    begin
        today := DT2Date(System.CurrentDateTime);
        if "Due Date" < today then
            exit(Abs(today - "Due Date"));

        exit(0);
    end;
}