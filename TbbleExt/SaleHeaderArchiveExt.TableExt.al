tableextension 50133 "Sales Header Archive Ext" extends "Sales Header Archive"
{
       fields
    {
        field(50140; "Won/Lost Quote Status"; Enum "sol Won or Lost Status")
        {
            Caption = 'Quote Status';
            DataClassification = CustomerContent;
        }

        field(50141; "Won/Lost Date"; Date)
        {
            Caption = 'Quote Status Date';
            DataClassification = CustomerContent;
        }

        field(50142; "Won/Lost Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(50143; "Won/Lost Reason Desc"; Text[100])
        {
            Caption = 'Reason Description';
            DataClassification = CustomerContent;
        }

        field(50144; "Won/Lost Remarks"; Text[2048])
        {
            Caption = 'Remarks';
            DataClassification =CustomerContent;
        }
    }
}
    
   