table 50130 "Threshold Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(2; "Threshold 1 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Theshold 1 Value';
        }
        field(3; "Threshold 2 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Theshold 2 Value';
        }

        field(4; "Threshold 1 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 Style';
        }

        field(5; "Threshold 2 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 Style';
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}