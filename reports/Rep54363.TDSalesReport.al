report 54363 "TD Sales Report"
{
    ApplicationArea = All;
    Caption = 'TD Sales Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\TDsalesreport.rdl';
    dataset
    {
        dataitem(OutboundProjectARBuffer; OutboundProjectARBuffer)
        {
            RequestFilterFields = TDKeyMapKey;
            PrintOnlyIfDetail = true;
            column(TDKeyMapKey; TDKeyMapKey)
            {
            }
            dataitem("Sales Header"; "Sales Header")
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
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLink = "KP TDS Map Key" = field(TDKeyMapKey);
                column(No; "No.")
                {
                }
                column(amnt; Amount)
                {
                }

            }
            dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
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
