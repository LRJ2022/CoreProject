pageextension 50113 "sol Business Manager RoleC Ext" extends "Business Manager Role Center"
{
    layout
    {
        addafter("Favorite Accounts")
        {
            part(QuoteStatusWon; "sol Quotes on Mngt.RoleCenter")
            {
                ApplicationArea = All;
                Caption = 'Quote Status: Won';
                SubPageLink = "Won/Lost Quote Status" = const(QuoteStatus::Won);
            }
            part(QuoteStatusLost; "sol Quotes on Mngt.RoleCenter")
            {
                ApplicationArea = All;
                Caption = 'Quote Status: Lost';
                SubPageLink = "Won/Lost Quote Status" = const(QuoteStatus::Lost);

            }
        }
    }

    var
        QuoteStatus: Enum "sol Won or Lost Status";
}