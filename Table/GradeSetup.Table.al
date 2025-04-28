table 50111 "sol Grade Setup"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key';

        }
        field(2; "Grades No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Grades No.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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

}