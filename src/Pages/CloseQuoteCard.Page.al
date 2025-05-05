page 50101 "sol Close Quote"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sales Header";
    Caption = 'Close Quote';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("Won/Lost Quote Status"; Rec."Won/Lost Quote Status")
                {
                    ApplicationArea = All;
                    Editable = AllowChangeStatus;
                    ToolTip = 'Specifies status of the quote';
                }

                field("Won/Lost Date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specified the dat this quote was closed';
                }
                field("Won/Lost Reason Code"; Rec."Won/Lost Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason for closing the quote';
                }
                field("Won/Lost Reason Desc"; Rec."Won/Lost Reason Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason for closing the quote';

                }
                field("Won/Lost Remarks"; Rec."Won/Lost Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an extra remark on the quote status';
                    MultiLine = true;
                    Editable = AllowChangeStatus;
                    Caption = 'Remarks';
                }

                field(Test; TestDate)
                {
                    ApplicationArea = All;
                    Caption = 'Test Date';
                    Editable = false;

                }
                field(Test2; TestTime)
                {
                    ApplicationArea = All;
                    Caption = 'Test time';
                    Editable = false;
                }
            }
        }
    }

    var
        AllowChangeStatus: Boolean;

    trigger OnOpenPage()
    var
        quotesStatus: Enum "sol Won or Lost Status";
    begin
        if rec."Won/Lost Quote Status" = quotesStatus::Won then
            CurrPage.Editable := false;
        AllowChangeStatus := Rec."Won/Lost Quote Status" <> quotesStatus::Won;

        TestDate := DT2Date(CurrentDateTime);
        Testtime := CurrentDateTime;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then
            FinishWizard()
    end;

    procedure FinishWizard()
    var
        errorlbl: Label '%1 is empty', Comment = 'specifies witch field is missing a parameter';
        salesQuote_loc: Record "Sales Header";
        salesQuoteStatus_loc: Enum "sol Won or Lost Status";
    begin
        if not (Rec."Won/Lost Quote Status" in [salesQuoteStatus_loc::Won, salesQuoteStatus_loc::Lost]) then
            //if not ((rec."Won/Lost Quote Status" = salesQuoteStatus_loc::Lost) or (Rec."Won/Lost Quote Status" = salesQuoteStatus_loc::Lost)) then
            Error(StrSubstNo(errorlbl, rec.FieldCaption("Won/Lost Quote Status")));
        if rec."Won/Lost Reason Code" = '' then
            Error(StrSubstNo(errorlbl, rec.FieldCaption("Won/Lost Reason Code")));

    end;

    var
        TestDate: date;
        TestTime: DateTime;
}