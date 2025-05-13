report 50106 "sol Update Item Descriptions"
{
    ApplicationArea = All;
    Caption = 'Update Item Descriptions';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Item; "Item")
        {
            RequestFilterHeading = 'Item Selection';
            RequestFilterFields = "No.", "Description 2";

            trigger OnPreDataItem()
            begin
                Clear(ModifiedCount); //Sikre den altid starter på null 
            end;

            trigger OnAfterGetRecord()
            var
                ItemToUpdate: Record Item;
            begin
                if ItemToUpdate.Get(Item."No.") then begin  //Sikrer der ikke kommer overflow.
                    if ItemToUpdate."Description 2" = '' then begin
                        if Description2Text <> '' then
                            ItemToUpdate."Description 2" := CopyStr(Description2Text, 1, MaxStrLen(ItemToUpdate."Description 2"))   //Sikrer at texten aldrig bliver længerer end det tilladte.
                        else
                            ItemToUpdate."Description 2" := 'Updated by report';
                        ItemToUpdate.Modify();
                        ModifiedCount += 1;
                    end;
                    TotalCount += 1;
                end
            end;

            trigger OnPostDataItem()
            begin
                Message('%1 items out of %2, where updated', ModifiedCount, TotalCount);
            end;
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
                    field("Description 2 Text"; Description2Text)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var
        ModifiedCount: Integer;
        TotalCount: Integer;
        Description2Text: Text;
}
