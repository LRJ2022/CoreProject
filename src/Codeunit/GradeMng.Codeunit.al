codeunit 50101 "sol Grade Management"
{
    Permissions =
    tabledata "Sales Invoice Header" = rm,
    tabledata "Sales Cr.Memo Header" = rm,
    tabledata "Cust. Ledger Entry" = rm;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, "Grade No.", false, false)]
    local procedure AssignGradeToCustomer_OnAfterValidate_GradeNo(var xRec: Record Customer; var Rec: Record Customer; CurrFieldNo: Integer)
    var
        GradesHistory_loc: Record "sol Grade History";
    begin
        GradesHistory_loc.InsertIntoGradeHistory(Rec."No.", Today(), 'Customer', Rec."No.", Rec."Grade No.");
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Header", OnAfterInsertEvent, '', false, false)]
    local procedure AssignGradeToSalesHeader_OnAfterInsertEvenet_SellToCustomerNo(var Rec: Record "Sales Header")
    var
        GradesHistory_loc: Record "sol Grade History";
        Customer_loc: Record Customer;
    begin
        if not Customer_loc.Get(Rec."Bill-to Customer No.") then
            exit;
        if Customer_loc."Grade No." <> '' then
            exit;
        Rec."Grade No." := Customer_loc."Grade No.";
        GradesHistory_loc.InsertIntoGradeHistory(Rec."Bill-to Customer No.", rec."Posting Date", 'Sales' + Format(Rec."Document Type"), Rec."No.", Rec."Grade No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", OnAfterInsertEvent, '', false, false)]
    local procedure AssignGradeToCustomerLedgerEntry_OnAfterSalesPost(var Rec: Record "Cust. Ledger Entry")
    var
        GradesHistory_loc: Record "sol Grade History";
        Customer_loc: Record Customer;
    begin
        if Rec."Document No." = '' then
            exit;
        Clear(Customer_loc);
        if not Customer_loc.Get(Rec."Customer No.") then
            exit;
        if Customer_loc."Grade No." <> '' then
            exit;
        Rec."Grade No." := Customer_loc."Grade No.";
        if Rec.Modify() then
            GradesHistory_loc.InsertIntoGradeHistory(Customer_loc."No.", rec."Posting Date", 'Customer Ledger Entry', Format(Rec."Entry No."), Rec."Grade No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
    local procedure AssignGradeDuringSalesPost_OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; SalesCrMemoHdrNo: Code[20]; SalesInvHdrNo: Code[20])
    var
        GradesHistory_loc: Record "sol Grade History";
        Customer_loc: Record Customer;
        SalesInvoiceHeader_loc: Record "Sales Invoice Header";
        SalesCrMemoHeader_loc: Record "Sales Cr.Memo Header";
    begin
        if SalesHeader."Bill-to Customer No." = '' then
            exit;
        Clear(Customer_loc);
        if not Customer_loc.Get(SalesHeader."Bill-to Customer No.") then
            exit;

        if Customer_loc."Grade No." <> '' then
            exit;

        if SalesInvHdrNo <> '' then begin
            Clear(SalesInvoiceHeader_loc);
            SalesInvoiceHeader_loc.Get(SalesInvHdrNo);
            SalesInvoiceHeader_loc."Grade No." := Customer_loc."Grade No.";
            SalesInvoiceHeader_loc.modify();
            GradesHistory_loc.InsertIntoGradeHistory(Customer_loc."No.", SalesInvoiceHeader_loc."Posting Date", 'Posted Sales invoice', SalesInvoiceHeader_loc."No.", SalesInvoiceHeader_loc."Grade No.");
        end;
        if SalesCrMemoHdrNo <> '' then begin
            Clear(SalesCrMemoHeader_loc);
            SalesCrMemoHeader_loc.Get(SalesCrMemoHdrNo);
            SalesCrMemoHeader_loc."Grade No." := Customer_loc."Grade No.";
            SalesCrMemoHeader_loc.Modify();
            GradesHistory_loc.InsertIntoGradeHistory(Customer_loc."No.", SalesCrMemoHeader_loc."Posting Date", 'Posted Sales Cr. Memo', SalesCrMemoHeader_loc."No.", SalesCrMemoHeader_loc."Grade No.");
        end;
    end;

}
