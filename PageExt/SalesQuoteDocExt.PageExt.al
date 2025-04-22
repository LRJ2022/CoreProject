pageextension 50111 "sol SalesQuoteDocExt" extends "Sales Quote"
{
    layout
    {

        addlast(General)
        {

            field("Won/Lost Quote Status"; Rec."Won/Lost Quote Status")
            {
                ApplicationArea = All;
                Editable = false;
                Tooltip = 'Specifies status af the quote';
            }

            field("Won/Lost Date"; Rec."Won/Lost Date")
            {
                ApplicationArea = All;
                Editable = false;
                Tooltip = 'Specifies the date this quote was closed';
            }

            field("Won/Lost Reason Code"; Rec."Won/Lost Reason Code")
            {
                ApplicationArea = All;
                Editable = false;
                Tooltip = 'Specifies the reason for closing the quote';
            }
            field("Won/Lost Reason Desc"; Rec."Won/Lost Reason Desc")
            {
                ApplicationArea = All;
                Editable = false;
                Tooltip = 'Specifies the reason for closing the quote';
            }
            field("Won/Lost Remarks"; Rec."Won/Lost Remarks")
            {
                ApplicationArea = All;
                Editable = false;
                Tooltip = 'Specifies an extra remark on the quote status';
            }
        }
    }

    actions
    {
        addfirst(Create)
        {
            Action(CloseQuote)
            {
                Caption = '&Close Quote';
                ToolTip = 'Arvhives qutoe on closing';
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    closeQuoteCodeUnit: Codeunit "sol Quote Status Mgmt.";
                begin
                    if page.RunModal(page::"sol Close Quote", Rec) = Action::LookupOK then
                        closeQuoteCodeUnit.CloseQuote(Rec);

                end;

            }
        }
    }
}
