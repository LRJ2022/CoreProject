report 50100 "sol CustomerList"
{
    ApplicationArea = All;
    Caption = 'Customer List Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/Layout/CustomerList.rdl';
    WordLayout = './src/Layout/CustomerList.docx';
    //DefaultLayout = Word;

    dataset
    {
        dataitem(Customer; "Customer")
        {
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Name)
            {
                IncludeCaption = true;
            }
            column(City_Customer; City)
            {
                IncludeCaption = true;
            }
            column(BalanceLCY_Customer; "Balance (LCY)")
            {
                IncludeCaption = true;
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
