page 60534 "Sales Order List page"
{
    ApplicationArea = All;
    Caption = 'Sales Order List page';
    PageType = List;
    SourceTable = "Middle Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document date"; Rec."Document date")
                {
                    ToolTip = 'Specifies the value of the Document date field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit Of Measure field.', Comment = '%';
                }
                field("Buyer Name"; Rec."Buyer Name")
                {
                    ToolTip = 'Specifies the value of the Buyer Name field.', Comment = '%';
                }
                field("Module header"; Rec."Module header")
                {
                    ToolTip = 'Specifies the value of the Module header field.', Comment = '%';
                }
                field("Module Line"; Rec."Module Line")
                {
                    ToolTip = 'Specifies the value of the Module Line field.', Comment = '%';
                }
                field("vendor Item Description"; Rec."vendor Item Description")
                {
                    ToolTip = 'Specifies the value of the vendor Item Description field.', Comment = '%';
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ToolTip = 'Specifies the value of the Currency Id field.', Comment = '%';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field("Non-Inventory"; Rec."Non-Inventory")
                {
                    ToolTip = 'Specifies the value of the Non-Inventory field.', Comment = '%';
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
                    TempStagingMgt: Codeunit "Sales-Staging";
                begin

                    TempStagingMgt.SalestoStaging();


                    CurrPage.Update();
                end;
            }
        }
    }
}
