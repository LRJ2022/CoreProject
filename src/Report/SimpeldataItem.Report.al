report 50102 "Simpel DataSet"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Simpel Dataset';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }
            column(City_Vendor; City)
            {
            }
        }
    }

}