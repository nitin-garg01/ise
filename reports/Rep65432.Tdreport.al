report 65432 "Td report"
{
    ApplicationArea = All;
    Caption = 'TD report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\TDreport.rdl';
    dataset
    {
        dataitem("KP Project AP Outbound Buffer"; "KP Project AP Outbound Buffer")
        {
            RequestFilterFields = TDKeyMapKey;
            PrintOnlyIfDetail = true;
            column(TDKeyMapKey; TDKeyMapKey)
            {

            }
            dataitem("Purchase Header"; "Purchase Header")
            {
                DataItemLink = "KP TDS Map Key" = field(TDKeyMapKey);
                column(Document_Type; "Document Type")
                {

                }
                column(DocNo; "No.")
                {

                }
                column(Amount; Amount)
                {

                }
            }

            dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
            {
                DataItemLink = "KP TDS Map Key" = field(TDKeyMapKey);
                column(No; "No.")
                {

                }
                column(amnt; Amount)
                {

                }

            }
            dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
            {
                DataItemLink = "KP TDS Map Key" = field(TDKeyMapKey);
                column(No_; "No.")
                {

                }
                column(amt; Amount)
                {

                }
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
