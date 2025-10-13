page 54301 "Purchase Line Api"
{
    APIGroup = 'purhase';
    APIPublisher = 'ise';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Purchase Line api';
    DelayedInsert = true;
    EntityName = 'purchaseline';
    EntitySetName = 'purchaselines';
    PageType = API;
    SourceTable = "Purchase Line";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(potype; Rec."Document Type")
                {

                }
                field(poNumber; Rec."No.")
                {

                }
                field(vendorid; rec."No.")
                {

                }

                field(itemNumber; Rec."Item Reference Type No.")
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

                field(VendorItemDescription; VendorItemDescription)
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Insertintostaging();
    end;

    local procedure Insertintostaging()
    var
        Stagingtable: Record "Staging OrderTable";
    begin
        Stagingtable.Init();
        stagingtable."Document No." := Rec."Document No.";
        StagingTable."Document No." := Rec."No.";
        StagingTable."Customer/Vendor No." := Rec."No.";
        StagingTable."Item No." := Rec."Item Reference Type No.";
        StagingTable."Quantity" := Rec.Quantity;
        StagingTable."Requested By" := RequestedBy;
        StagingTable."Non-Inventory" := NonInventory;
        StagingTable."Unit Cost" := Rec."Unit Cost";
        StagingTable."Vendor Item Description" := VendorItemDescription;
        StagingTable."Unit of Measure" := UnitOfMeasure;
        StagingTable."Currency Id" := CurrencyId;
        StagingTable."user Defind" := UserDefind;
    end;
}