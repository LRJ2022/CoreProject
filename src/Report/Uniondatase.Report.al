report 50103 "Union Dataset"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/Layout/Uniondataset.rdl';
    ExcelLayout = './src/Layout/Uniondataset.xlsx';

    dataset // dette dataset vil resulterer i to datasæt, først den ene derefter den anden
    {
        dataitem(Vendor; Vendor)
        {
            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }
        }
        dataitem(Customer; Customer) // her ligger det andet datasæt
        {

            column(No_Customer; "No.")
            {
            }
            column(Name_Customer; Name)
            {
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
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
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}