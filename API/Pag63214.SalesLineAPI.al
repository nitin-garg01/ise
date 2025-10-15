page 63214 "Sales Line API"
{
    APIGroup = 'Sales';
    APIPublisher = 'ise';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'salesLineAPI';
    EntityName = 'SalesLine';
    EntitySetName = 'SalesLines';
    PageType = API;
    DelayedInsert = true;
    SourceTable = "Sales Line";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(potype; Rec."Document Type")
                {
                }
                field(ponumber; Rec."No.")
                {
                }
                field(vendorid; rec."No.")
                {
                }
                field(quantity; Rec.Quantity)
                {
                }
                field(RequestedBy; RequestedBy)
                {
                }
                field(noninventory; NonInventory)
                {
                }
                field(unitcost; Rec."Unit Cost")
                {
                }
                field(vendorItemDescription; VendorItemDescription)
                {
                }
                field(unitofmeasure; UnitOfMeasure)
                {
                }
                field(currencyid; CurrencyId)
                {
                }
                field(userDefind; UserDefind)
                {
                }
            }
        }
    }
    var
        RequestedBy: Text[50];
        NonInventory: Boolean;
        VendorItemDescription: Text[100];
        CurrencyId: Code[10];
        UnitOfMeasure: Code[10];
        UserDefind: Text[50];
    local procedure insertintostaging()
    var
        stagingtable: Record "Staging OrderTable";
    begin
        StagingTable.Init();
        StagingTable."Document No." := Rec."No.";
        StagingTable."Item No." := Rec."Item Reference Type No.";
        StagingTable."Quantity" := Rec.Quantity;
        StagingTable."Unit Cost" := Rec."Unit Cost";
        StagingTable."Non-Inventory" := NonInventory;
        StagingTable."Requested By" := RequestedBy;
        StagingTable."Vendor Item Description" := VendorItemDescription;
        StagingTable."Unit of Measure" := UnitOfMeasure;
        StagingTable."Currency Id" := CurrencyId;
        StagingTable."user Defind" := UserDefind;
        StagingTable.Insert();
    end;
}