report 61011 "Vendor report"
{
    ApplicationArea = All;
    Caption = 'Vendor report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\Vendorreport.rdl';
    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Picture; Picture)
            {

            }

            column(Name; Name)
            {

            }

        }
        dataitem(Vendor; Vendor)
        {
            column(VendorID; "No.")
            {

            }
            column(VendorName; Name)
            {

            }
            column(PaymentTerms; "Payment Terms Code")
            {

            }
            column(EmailId; "E-Mail")
            {

            }

            column(RemmitContactNumber; Contact)
            {

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
