tableextension 59113 "Staging order ext" extends "Staging OrderTable"
{
    trigger OnAfterInsert()
    var
        StagingProcessor: Codeunit "Order Staging Processor";
    begin

        if ("Item No." <> '') and (Quantity > 0) and ("Unit Price" > 0) then
            StagingProcessor.CreateOrder(Rec);
    end;
}
