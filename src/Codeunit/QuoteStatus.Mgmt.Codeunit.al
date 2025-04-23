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
        if not (SalesHeader."Won/Lost Quote Status" in [salesQuoteStatus::Won, salesQuoteStatus::Lost]) then
            if page.RunModal(page::"sol Close Quote", SalesHeader) = Action::LookupOK then
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", OnRoleCenterOpen, '', true, true)]
    local procedure OnRoleCenterOpen()
    var
        SalespersonCode: Code[20];
        quoteStatus: Enum "sol Won or Lost Status";
    begin
        SalespersonCode := GetSalesPersonForLoggedInUser2();
        GetQuoteRecords('LB', quoteStatus::Won);
        GetQuoteRecords('LB', quoteStatus::Lost);
    end;

    procedure GetSalesPersonForLoggedInUser(): Record "Salesperson/Purchaser"

    var
        currentUser: Record "User";
        currentUserId: Guid;
        SalesPerson: Record "Salesperson/Purchaser";
    begin
        currentUserId := UserSecurityId();
        currentUser.Get(currentUserId);
        SalesPerson."E-Mail" := currentUser."Contact Email";
        SalesPerson.FindFirst();
        exit(SalesPerson)
    end;

    //løsning

    procedure GetSalesPersonForLoggedInUser2(): code[20]
    var
        salesPerson: Record "Salesperson/Purchaser";
        User: record User;
    begin
        user.Reset();
        if not User.Get(UserSecurityId()) then
            exit('');

        if User."Contact Email".Trim() = '' then
            exit('');
        salesPerson.Reset();
        salesPerson.SetRange("E-Mail", user."Contact Email");
        if salesPerson.FindFirst() then
            exit(salesPerson.Code);
    end;

    local procedure GetQuoteRecords(SalesPersonCode: Code[20]; status: Enum "sol Won or Lost Status")
    var
        NoOfQuotes: integer;
        quotesList: Record "Sales Header";

    begin
        FilterQuotes(quotesList, status, SalesPersonCode);
        NoOfQuotes := quotesList.count;
        if NoOfQuotes <> 0 then
            ShowNoOfQuoteNotification(NoOfQuotes, status, SalesPersonCode);
    end;

    local procedure ShowNoOfQuoteNotification(noOfRecords: integer; status: Enum "sol Won or Lost Status"; SalesPersonCode: Code[20])
    var
        WonOrLostAmountNotification: Notification;
        wonLostForFiveDays: label 'You %1 %2 quote(s) the last 5 days.', Comment = '%1 specifies amount of won quotes';
    begin
        WonOrLostAmountNotification.Message := StrSubstNo(wonLostForFiveDays, Format(status), noOfRecords);
        WonOrLostAmountNotification.SetData('SalesPersonCode', SalesPersonCode);
        WonOrLostAmountNotification.SetData('DateRange', Format(CalcDate('-5D', Today())) + '..' + Format(Today()));
        WonOrLostAmountNotification.SetData('Status', Format(status.AsInteger()));
        WonOrLostAmountNotification.AddAction('View Quotes', Codeunit::"sol Quote Status Mgmt.", 'ShowQuotes');
        WonOrLostAmountNotification.Send();
    end;

    procedure ShowQuotes(WonOrLost: Notification)
    var
        quotesList: Record "Sales Header";
        WonOrLostStatus: Enum "sol Won or Lost Status";
        EnumIndex: Integer;
        SalesPersonCode: Code[20];

    begin
        SalesPersonCode := WonOrLost.GetData('SalesPersonCode');
        if Evaluate(EnumIndex, WonOrLost.GetData('Status')) then
            WonOrLostStatus := enum::"sol Won or Lost Status".FromInteger(EnumIndex);
        FilterQuotes(quotesList, WonOrLostStatus, SalesPersonCode);
        if quotesList.FindSet() then
            page.Run(Page::"Sales Quotes", quotesList);
    end;

    local procedure FilterQuotes(var salesHeader: Record "Sales Header"; status: Enum "sol Won or Lost Status"; SalesPersonCode: Code[20])
    begin
        salesHeader.SetRange("Salesperson Code", SalesPersonCode);
        salesHeader.SetFilter("Won/Lost Date", (Format(CalcDate('-5D', Today())) + '..' + Format(Today())));
        salesHeader.SetRange("Won/Lost Quote Status", status);
    end;

}