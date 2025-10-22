page 50147 "Blanket Purchase Header API"
{
    APIGroup = 'purchase';
    APIPublisher = 'ise';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'blanketPurchaseHeaderAPI';
    DelayedInsert = true;
    EntityName = 'purchaseheader';
    EntitySetName = 'purchaseheaders';
    PageType = API;
    SourceTable = "Purchase Header";

    // SourceTableView = WHERE(Status = CONST(Released), "Document Type" = CONST(Order));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                    Caption = 'Buy-from Vendor No.';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(payToName; Rec."Pay-to Name")
                {
                    Caption = 'Pay-to Name';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                part(Lines; "Blanket Purchase Line API")
                {
                    EntityName = 'purchaseline';
                    EntitySetName = 'purchaselines';
                    SubPageLink = "Document No." = field("No.");

                }
            }
        }
    }
}