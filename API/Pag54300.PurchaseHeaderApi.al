page 54300 "Purchase Header Api"
{
    APIGroup = 'purchase';
    APIPublisher = 'ise';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'purchaseHeaderApi';
    DelayedInsert = true;
    EntityName = 'purchaseHeader';
    EntitySetName = 'purchaseHeaders';
    PageType = API;
    SourceTable = "Purchase Header";
    ODataKeyFields = "Document Type";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(potype; Rec."Document Type")
                {

                }
                field(ponumber; Rec."Vendor Invoice No.")
                {

                }

                field(vendorId; Rec."No.")
                {

                }

                field(documentdate; Rec."Document Date")
                {

                }
                field(buyerid; BuyerId)
                {

                }

                field(contact; Contact)
                {

                }
                field(confirmby; ConfirmBy)
                {

                }
                field(taxscduleid; TaxScduleId)
                {

                }
                field(currencyid; CurrencyId)
                {


                }

                field(notes; Notes)
                {

                }
                field(userdefind; UserDefind)
                {

                }


            }
        }
    }
    var
        DocumentDate: Date;
        BuyerId: Text[50];
        Contact: Text[50];
        ConfirmBy: Text[50];
        TaxScduleId: Code[20];
        CurrencyId: Code[10];
        Notes: Text[100];
        UserDefind: Text[50];

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        InsertIntoStagingTable();
    end;

    local procedure InsertIntoStagingTable()
    var
        Stagingordertable: Record "Staging OrderTable";
        LastEntryNo: Integer;
    begin
        if Stagingordertable.FindLast() then
            LastEntryNo := Stagingordertable."Entry No."
        else
            LastEntryNo := 0;
        Stagingordertable.Init();
        Stagingordertable."Entry No." := LastEntryNo + 1;
        Stagingordertable."Document No." := Rec."Vendor Invoice No.";
        Stagingordertable."Document Date" := Rec."Document Date";
        Stagingordertable."Customer/Vendor No." := Rec."No.";
        StagingOrderTable."Buyer Name" := BuyerId;
        StagingOrderTable."Contact Person" := Contact;
        StagingOrderTable."Confirmed By" := ConfirmBy;
        StagingOrderTable."Tax Schedule" := TaxScduleId;
        StagingOrderTable."Currency Id" := CurrencyId;
        StagingOrderTable."Notes" := Notes;
        Stagingordertable."user Defind" := UserDefind;
    end;
}
