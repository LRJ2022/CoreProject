report 50104 "Join Dataset"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    RDLCLayout = './src/Layout/JoinDataset.rdl';
    Caption = 'Join Data';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            //PrintOnlyIfDetail = true;
            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }

            dataitem("Vendor Led"; "Vendor Ledger Entry")
            {
                DataItemLinkReference = Vendor;
                DataItemLink = "Vendor No." = field("No."); //Denne property fortæller, hvordan dde to tabeller er ralterede.
                                                            //PrintOnlyIfDetail = true;   //denne property betyder, at Vendor ikke bliver printet, med mindre der er data i Vendor lEDGER Entry 



                column(VendorNo_VendorLedgerEntry; "Vendor No.")
                {
                }
                column(PostingDate_VendorLedgerEntry; "Posting Date")
                {
                }
                column(Amount_VendorLedgerEntry; Amount)
                {
                }
            }
        }
    }
}
