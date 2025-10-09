page 63552 "Order List Page"
{
    ApplicationArea = All;
    Caption = 'Order List Page';
    PageType = List;
    SourceTable = "Temp Staging Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // field("Entry No."; Rec."Entry No.")
                // {
                //     ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                // }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Customer/Vendor No."; Rec."Customer/Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Customer / Vendor No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit Of Measure field.', Comment = '%';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field.', Comment = '%';
                }
                field("Buyer Name"; Rec."Buyer Name")
                {
                    ToolTip = 'Specifies the value of the Buyer Name field.', Comment = '%';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ToolTip = 'Specifies the value of the Contact Person field.', Comment = '%';
                }
                field("Confirmed By"; Rec."Confirmed By")
                {
                    ToolTip = 'Specifies the value of the Confirmed By field.', Comment = '%';
                }
                field("Tax Schedule"; Rec."Tax Schedule")
                {
                    ToolTip = 'Specifies the value of the Tax Schedule field.', Comment = '%';
                }
                field("Currency Header"; Rec."Currency Header")
                {
                    ToolTip = 'Specifies the value of the Currency Header field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field("Module Header"; Rec."Module Header")
                {
                    ToolTip = 'Specifies the value of the Module Header field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Non-Inventory"; Rec."Non-Inventory")
                {
                    ToolTip = 'Specifies the value of the Non-Inventory field.', Comment = '%';
                }
                field("Vendor Item Description"; Rec."Vendor Item Description")
                {
                    ToolTip = 'Specifies the value of the Vendor Item Description field.', Comment = '%';
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ToolTip = 'Specifies the value of the Currency id field.', Comment = '%';
                }
                field("Module Line"; Rec."Module Line")
                {
                    ToolTip = 'Specifies the value of the Module Line field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load Sales Orders")
            {
                Caption = 'Load Sales Orders';
                // Image = Import;
                trigger OnAction()
                var
                    TempStagingMgt: Codeunit "Sales Order to Staging table";
                begin

                    TempStagingMgt.LoadNextSalesOrder();


                    CurrPage.Update();
                end;
            }
        }
    }
}
