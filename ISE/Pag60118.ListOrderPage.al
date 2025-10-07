page 60118 "List Order Page"
{
    ApplicationArea = All;
    Caption = 'List Order Page';
    PageType = List;
    SourceTable = "Staging OrderTable";
    UsageCategory = Lists;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Entry Type"; Rec."Entry Type")
                {

                }
                field("Customer/Vendor No."; Rec."Customer/Vendor No.")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer / Vendor No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {

                }
                field("Item No."; Rec."Item No.")
                {
                    TableRelation = Item."No.";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Code field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Vendor Item Description"; Rec."Vendor Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Description field.', Comment = '%';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.', Comment = '%';
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Line field.', Comment = '%';
                }
                field("Module Line"; Rec."Module Line")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Module Line field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }

                field("Buyer Name"; Rec."Buyer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buyer Name field.', Comment = '%';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Person field.', Comment = '%';
                }
                field("Confirmed By"; Rec."Confirmed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confirmed By field.', Comment = '%';
                }
                field("Tax Schedule"; Rec."Tax Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Schedule field.', Comment = '%';
                }
                field("Currency Header"; Rec."Currency Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Header field.', Comment = '%';
                }
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Notes field.', Comment = '%';
                }
                field("Module Header"; Rec."Module Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Module Header field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Non-Inventory"; Rec."Non-Inventory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Non-Inventory field.', Comment = '%';
                }
            }
        }
    }
}
