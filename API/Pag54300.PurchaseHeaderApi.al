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
                    Caption = 'POType';
                }
                field(ponumber; Rec."Vendor Invoice No.")
                {
                    Caption = 'PONumber';
                }
                field(vendorId; Rec."No.")
                {
                    Caption = 'Vendor ID';
                }
                field(documentdate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(buyerid; BuyerId)
                {
                    Caption = 'Buyer ID';
                }
                field(contact; Contact)
                {
                    Caption = 'Contact';
                }
                field(confirmby; ConfirmBy)
                {
                    Caption = 'Confirm By';
                }
                field(taxschedule; TaxSchedule)
                {
                    Caption = 'Tax Schedule';
                }
                field(currencyid; CurrencyId)
                {
                    Caption = 'Currency ID';
                }
                field(notes; Notes)
                {
                    Caption = 'Notes';
                }
                field(userdefind; UserDefind)
                {
                    Caption = 'User Defind';
                }
            }
        }
    }
    var
        DocumentDate: Date;
        BuyerId: Text[50];
        Contact: Text[50];
        ConfirmBy: Text[50];
        taxSchedule: Code[20];
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
        StagingOrderTable."Tax Schedule" := taxSchedule;
        StagingOrderTable."Currency Id" := CurrencyId;
        StagingOrderTable."Notes" := Notes;
        Stagingordertable."user Defind" := UserDefind;
    end;
}