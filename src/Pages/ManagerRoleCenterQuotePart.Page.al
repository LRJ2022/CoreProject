page 50108 "sol Quotes on Mngt.RoleCenter"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Sales Header";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Quotes Status';
    SourceTableView = where("Document Type" = const(Quote));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'specifies the no. of this quote';
                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Sales Quote", Rec);
                    end;
                }

                field(SellToCustomerName; rec."Sell-To Customer name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the customer name linked to this quote';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the total amount of the quote';
                }

                field("Won/Lost Date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'specifies the date this quote was closed';
                }

                field("Won/Lost Reason Desc"; Rec."Won/Lost Reason Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'specifies the reason closing the quote';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    /* trigger OnOpenPage()
    var
        manageQuote: Codeunit "sol Quote Status Mgmt.";
    begin
        user := manageQuote.GetSalesPersonForLoggedInUser();
        if user."E-Mail" <> '' then
            Rec.SetFilter("Salesperson Code", user.Code);
    end; */
    //løsning
    trigger OnOpenPage()
    var
        manageQuote: Codeunit "sol Quote Status Mgmt.";
        salesPersonCode: Code[20];
    begin
        salesPersonCode := manageQuote.GetSalesPersonForLoggedInUser2();
        Rec.FilterGroup(2);
        Rec.SetFilter("Salesperson Code", salesPersonCode);
        rec.FilterGroup(0);

    end;


    var
        user: Record "Salesperson/Purchaser";
}