report 50105 "sol Item Inventory and Availab"
{
    Caption = 'assigment - Item Inventory and Availab';
    DefaultRenderingLayout = ExcelLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("category"; "Item Category")
        {
            column(Code_category; "Code")
            {
                IncludeCaption = true;
            }
            column(Description_category; Description)
            {
                IncludeCaption = true;
            }
            dataitem(Item; "Item")
            {
                DataItemLink = "Item Category Code" = field(Code);
                CalcFields = Inventory, "Qty. on Purch. Order", "Qty. on Sales Order";
                column(Inventory_Item; Inventory)
                {
                    IncludeCaption = true;
                }
                column(No_Item; "No.")
                {
                    IncludeCaption = True;
                }
                column(Description_Item; Description)
                {
                    IncludeCaption = true;
                }
                column(Availability; Inventory - "Qty. on Purch. Order" - "Qty. on Sales Order")
                { }

            }
        }
    }
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Layout/ItemAvailabilyty.rdl';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './src/Layout/ItemAvailabilyty.docx';
        }
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './src/Layout/ItemAvailabilyty.xlsx';
        }

    }

    labels
    {
        LabelName1lbl = 'Items by Category, Inventory and Availability', Comment = 'Foo', MaxLength = 999;
        ItemCategoryCodelbl = 'Item Category Code', Comment = 'Label on colomn';
        Availabilitylbl = 'Availability';
        label2lbl = 'Test';
    }


    var
        Availability: decimal;
}

