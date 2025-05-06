report 50100 "sol CustomerList"
{
    ApplicationArea = All;
    Caption = 'Customer List Report';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; "Customer")
        {
            column(No_Customer; "No.")
            {
            }
            column(Name_Customer; Name)
            {
            }
            column(City_Customer; City)
            {
            }
            column(BalanceLCY_Customer; "Balance (LCY)")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
