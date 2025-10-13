page 65473 "Sales Header API"
{
    APIGroup = 'sales';
    APIPublisher = 'ise';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'salesHeaderAPI';
    DelayedInsert = true;
    EntityName = 'salesHeader';
    EntitySetName = 'salesHeaders';
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(poType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(poNumber; Rec."External Document No.")
                {
                    Caption = 'Document No.';
                }
                field(documentDate; Rec."Document Date")
                {

                }
                field(customerNumber; Rec."Sell-to Customer No.")
                {

                }
                field(buyerId; BuyerId)
                {

                }
                field(contact; Contact)
                {

                }
                field(confirmby; ConfirmBy)
                {

                }
                field(texscduleid; TexScduleId)
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
        BuyerId: Code[20];
        Contact: Text[50];
        ConfirmBy: Text[50];
        TexScduleId: Code[20];
        CurrencyId: Code[10];
        Notes: Text[50];
        UserDefind: Text[50];

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        InsertIntoStagingTable();
    end;

    local procedure InsertIntoStagingTable()
    var
        StagingOrder: Record "Staging OrderTable";

    begin
        StagingOrder.Init();
        StagingOrder."Document No." := Rec."No.";
        StagingOrder."Document Date" := Rec."Document Date";
        StagingOrder."Customer/Vendor No." := Rec."Sell-to Customer No.";
        StagingOrder."Buyer Name" := BuyerId;
        StagingOrder."Contact Person" := Contact;
        StagingOrder."Confirmed By" := ConfirmBy;
        StagingOrder."Tax Schedule" := TexScduleId;
        StagingOrder."Currency Id" := CurrencyId;
        StagingOrder."Notes" := Notes;
        StagingOrder."user Defind" := UserDefind;
        StagingOrder.Insert();

        StagingOrder.Insert()


    end;
}
