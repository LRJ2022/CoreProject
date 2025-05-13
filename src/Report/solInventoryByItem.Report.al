report 50101 "sol InventoryByItem"
{
    ApplicationArea = All;
    Caption = 'Inventory By Item2';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/Layout/InventoryByItem.rdl';
    WordLayout = './src/Layout/InventoryByItem.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
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
