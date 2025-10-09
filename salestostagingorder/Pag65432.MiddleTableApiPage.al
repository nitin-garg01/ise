page 65432 "Middle Table Api Page"
{
    APIGroup = 'StagingOrder';
    APIPublisher = 'MiddleTable';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'middleTableApiPage';
    DelayedInsert = true;
    EntityName = 'StagingOrder';
    EntitySetName = 'StagingOrders';
    PageType = API;
    SourceTable = "Middle Table";

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
                field(documentDate; Rec."Document date")
                {
                    Caption = 'Document date';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(unitOfMeasure; Rec."Unit Of Measure")
                {
                    Caption = 'Unit Of Measure';
                }
                field(buyerName; Rec."Buyer Name")
                {
                    Caption = 'Buyer Name';
                }
                field(moduleHeader; Rec."Module header")
                {
                    Caption = 'Module header';
                }
                field(moduleLine; Rec."Module Line")
                {
                    Caption = 'Module Line';
                }
                field(vendorItemDescription; Rec."vendor Item Description")
                {
                    Caption = 'vendor Item Description';
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                }
                field(lineNo; Rec."Line No")
                {
                    Caption = 'Line No';
                }
                field(nonInventory; Rec."Non-Inventory")
                {
                    Caption = 'Non-Inventory';
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
            }
        }
    }
}
