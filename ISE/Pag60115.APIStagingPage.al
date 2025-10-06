page 60115 "API Staging Page"
{
    APIGroup = 'staging';
    APIPublisher = 'ise';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiStagingPage';
    DelayedInsert = true;
    EntityName = 'stagingorder';
    EntitySetName = 'stagingorders';
    PageType = API;
    SourceTable = "Staging OrderTable";

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
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(customerVendorNo; Rec."Customer/Vendor No.")
                {
                    Caption = 'Customer / Vendor No.';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Order Date';
                }
                field(buyerName; Rec."Buyer Name")
                {
                    Caption = 'Buyer Name';
                }
                field(contactPerson; Rec."Contact Person")
                {
                    Caption = 'Contact Person';
                }
                field(confirmedBy; Rec."Confirmed By")
                {
                    Caption = 'Confirmed By';
                }
                field(taxSchedule; Rec."Tax Schedule")
                {
                    Caption = 'Tax Schedule';
                }
                field(currencyHeader; Rec."Currency Header")
                {
                    Caption = 'Currency Header';
                }
                field(notes; Rec.Notes)
                {
                    Caption = 'Notes';
                }
                field(moduleHeader; Rec."Module Header")
                {
                    Caption = 'Module Header';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Product Code';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }

                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(vendorItemDescription; Rec."Vendor Item Description")
                {
                    Caption = 'Product Description';
                }
                field(unitOfMeasure; Rec."Unit Of Measure")
                {
                    Caption = 'Unit Of Measure';
                }

                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Line';
                }
                field(moduleLine; Rec."Module Line")
                {
                    Caption = 'Module Line';
                }
                field(requestedBy; Rec."Requested By")
                {
                    Caption = 'Requested By';
                }
                field(nonInventory; Rec."Non-Inventory")
                {
                    Caption = 'Non-Inventory';
                }
                field(LineNo; Rec."Line No.")
                {

                }

            }
        }
    }
}
