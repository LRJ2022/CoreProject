reportextension 50100 "sol Sales invoice Report Ext" extends "Standard Sales - Invoice"
{
    RDLCLayout = './src/Layout/StandardSalesInvoiceExt.rdl';

    dataset
    {
        add(Line)
        {
            column(Order_No_lbl; Line.FieldCaption("Order No.")) { }
            column(Order_No_; Line."Order No.")
            {
            }

            column(DisplayOrderNoInfo; HideOrderNo) { }

        }
    }
    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field(DisplayOrderNoInfo; HideOrderNo)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show or hide OrderNo. on Line';
                }
            }
        }
    }

    var
        HideOrderNo: Boolean;
}
