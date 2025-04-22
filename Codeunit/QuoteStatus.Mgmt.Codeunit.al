codeunit 50141 "sol Quote Status Mgmt."
{
    trigger OnRun()
    begin

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        SalesOrderHeader: Record "Sales Header";

    procedure CloseQuote(var SalesHeader: Record "Sales Header")
    begin
        ArchiveSalesQuote(SalesHeader);
    end;

    local procedure ArchiveSalesQuote(var SalesHeader: Record "Sales Header")
    var
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        case SalesSetup."Archive Quotes" of
            SalesSetup."Archive Quotes"::Always:
                ArchiveManagement.ArchSalesDocumentNoConfirm(SalesHeader);
            SalesSetup."Archive Quotes"::Question:
                ArchiveManagement.ArchiveSalesDocument(SalesHeader);
        end;
    end;

    local procedure CheckQuoteStatus(var salesHeader: record "Sales Header"; NotCompletedErr: Text)
    var
        salesQuoteStatus: Enum "sol Won or Lost Status";
    begin
        if not (SalesOrderHeader."Won/Lost Quote Status" in [salesQuoteStatus::Won, salesQuoteStatus::Lost]) then
            if page.RunModal(page::"sol Close Quote", SalesOrderHeader) = Action::LookupOK then
                Error(NotCompletedErr);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Quote", OnBeforeActionEvent, "Archive Document", true, true)]
    local procedure OnBeforeArchiveDocument(var rec: Record "Sales Header")
    var
        ArchiveCanNotBeCompletedErr: label 'Document archive can not be completed';
    begin
        CheckQuoteStatus(rec, ArchiveCanNotBeCompletedErr);
    end;

    [EventSubscriber(ObjectType::page, Page::"Sales Quote", OnBeforeActionEvent, MakeOrder, true, true)]
    local procedure OnBeforeMakeOrder(var rec: Record "Sales Header")
    var
        OrderCreationCanNotBeCompletedErr: label 'Order creation can not be completed.';
    begin
        CheckQuoteStatus(rec, OrderCreationCanNotBeCompletedErr);
    end;

    [EventSubscriber(ObjectType::page, Page::"Sales Quotes", OnAfterActionEvent, MakeOrder, true, true)]
    local procedure OnBeforeMakeOrderQuotes(var rec: Record "Sales Header")
    var
        OrderCreationCanNotBeCompletedErr: label 'Order creation can not be completed.';
    begin
        CheckQuoteStatus(rec, OrderCreationCanNotBeCompletedErr);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, OnBeforeSalesHeaderArchiveInsert, '', true, true)]
    local procedure OnBeforeSalesHeaderArchiveInsert(var salesHeaderArchive: Record "Sales Header Archive"; salesHeader: Record "Sales Header")
    begin
        if salesHeader."Document Type" <> salesHeader."Document Type"::Quote then
            exit;
        salesHeaderArchive."Won/Lost Quote Status" := salesHeader."Won/Lost Quote Status";
        salesHeaderArchive."Won/Lost Date" := salesHeader."Won/Lost Date";
        salesHeaderArchive."Won/Lost Reason Code" := salesHeader."Won/Lost Reason Code";
        salesHeaderArchive."Won/Lost Reason Desc" := salesHeader."Won/Lost Reason Desc";
        salesHeaderArchive."Won/Lost Remarks" := salesHeader."Won/Lost Remarks";
        /* salesHeaderArchive.Validate("Won/Lost Quote Status", SalesOrderHeader."Won/Lost Quote Status");
        salesHeaderArchive.Validate("Won/Lost Date", SalesOrderHeader."Won/Lost Date");
        salesHeaderArchive.Validate("Won/Lost Reason Code", SalesOrderHeader."Won/Lost Reason Code");
        salesHeaderArchive.Validate("Won/Lost Reason Desc", SalesOrderHeader."Won/Lost Reason Desc");
        salesHeaderArchive.Validate("Won/Lost Remarks", SalesOrderHeader."Won/Lost Remarks"); */
    end;
}