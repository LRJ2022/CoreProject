table 50101 "sol Grade History"
{
    Caption = 'sol Grade History';
    DataClassification = ToBeClassified;
    LookupPageId = "sol Grade History";
    DrillDownPageId = "sol Grade History";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }

        field(2; "Document type"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }

        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Customer No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No';
            TableRelation = Customer;
        }

        field(6; "Customer Name"; Text[50])
        {
            FieldClass = FlowField;
            Caption = 'Customer Name';
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = False;
        }

        field(7; "DateTimer"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'DateTime';
        }

        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }

        field(9; "Grade No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Grade No.';
        }

        field(10; "Grade Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("sol Grades".Decsription where("No." = field("Grade No.")));
            Caption = 'Grade Description';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure InsertIntoGradeHistory(CustomerNo: Code[20]; Date: Date; DocType: Text[100]; DocNo: Code[20]; GradeNo: Code[20])
    var
        //"Rec": Record "sol Grade History";
        entryNo_loc: Integer;
        Customer: Record Customer;
        UserID_loc: Text;

    begin
        entryNo_loc := 1;
        Customer.Get(CustomerNo);
        if Rec.FindLast() then
            entryNo_loc := "Rec"."Entry No." + 1;
        Rec.Init();
        Rec.Validate("Entry No.", entryNo_loc);
        Rec.Validate("Grade No.", GradeNo);
        Rec.Validate("Customer No.", CustomerNo);
        Rec.Validate("Document No.", DocNo);
        Rec.Validate("Document type", DocType);
        Rec.validate("Document Date", Date);
        Rec.Validate(DateTimer, CurrentDateTime);
        UserID_loc := CopyStr(UserId(), 1, MaxStrLen(Rec."User ID"));
        Rec.Validate("User ID", UserID_loc);


        Rec.Insert();

    end;
}
