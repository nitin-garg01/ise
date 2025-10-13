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
                    Caption = 'PO type';

                }
                field(poNumber; Rec."No.")
                {
                    Caption = 'PO Number';

                }
                field(vendorid; rec."No.")
                {
                    Caption = 'Vendor Id';

                }

                field(itemNumber; Rec."Item Reference Type No.")
                {
                    Caption = 'Item Number';

                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';

                }
                field(RequestedBy; RequestedBy)
                {
                    Caption = 'Requested By';

                }
                field(noninventory; NonInventory)
                {
                    Caption = 'Non Inventory';
                }
                field(unitcost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }

                field(VendorItemDescription; VendorItemDescription)
                {
                    Caption = 'Vendor Item Description';
                }
                field(unitofmeasure; UnitOfMeasure)
                {
                    Caption = 'Unit Of Measure';

                }
                field(currencyid; CurrencyId)
                {
                    Caption = 'Currency Id';

                }
                field(userDefind; UserDefind)
                {
                    Caption = 'User Defind';
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