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
            TableRelation = if ("Won/Lost Quote Status" = const("Won/Lost Quote Status"::Won)) "Close Opportunity Code" where(type = const("sol Won or Lost Status"::Won))
            else
            if ("Won/Lost Quote Status" = const("Won/Lost Quote Status"::Lost)) "Close Opportunity Code" where(type = const("sol Won or Lost Status"::Lost));
            ValidateTableRelation = false;
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
            DataClassification =CustomerContent;
        }
    }
}
    
   