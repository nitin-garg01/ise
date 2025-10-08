
codeunit 60111 "Order Staging Processor"
{
    procedure CreateOrder(var StagingOrder: Record "Staging OrderTable")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        lastlineno: Integer;
    begin
        case StagingOrder."Entry Type" of
            StagingOrder."Entry Type"::SalesOrder:
                begin
                    if StagingOrder."Document No." = '' then begin
                        SalesHeader.Init();
                        SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Order);
                        if StagingOrder."Customer/Vendor No." = '' then
                            Error('Customer No. is required for Sales Order.');
                        SalesHeader.Validate("Sell-to Customer No.", StagingOrder."Customer/Vendor No.");
                        SalesHeader.Validate("Document Date", StagingOrder."Document Date");
                        SalesHeader.Validate("Salesperson Code", StagingOrder."Buyer Name");
                        SalesHeader.Insert(true);
                        StagingOrder."Document No." := SalesHeader."No.";
                        StagingOrder.Modify(true);
                        LastLineNo := 0;
                    end else begin
                        SalesHeader.Get(SalesHeader."Document Type"::Order, StagingOrder."Document No.");
                        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                        SalesLine.SetRange("Document No.", SalesHeader."No.");
                        if SalesLine.FindLast() then
                            LastLineNo := SalesLine."Line No."
                        else
                            LastLineNo := 0;
                    end;
                    LastLineNo += 10000;

                    SalesLine.Init();
                    SalesLine.Validate("Document Type", SalesHeader."Document Type");
                    SalesLine.Validate("Document No.", SalesHeader."No.");
                    SalesLine.Validate("Unit of Measure", SalesLine."Unit of Measure");
                    SalesLine."Line No." := LastLineNo;
                    SalesLine.Validate(Type, SalesLine.Type::Item);
                    SalesLine.Validate("No.", StagingOrder."Item No.");

                    SalesLine.Validate(Quantity, StagingOrder.Quantity);
                    SalesLine.Validate("Unit Price", StagingOrder."Unit Price");
                    SalesLine.Insert(true);
                    StagingOrder."Line No." := LastLineNo;
                    if StagingOrder.Status = StagingOrder.Status::Ready then begin
                        StagingOrder.Status := StagingOrder.Status::Processed;

                        StagingOrder.Modify(true);
                    end;
                    Message('Sales Order %1 created successfully.', SalesHeader."No.");
                end;
            StagingOrder."Entry Type"::PurchaseOrder:
                begin
                    if StagingOrder."Document No." = '' then begin
                        PurchHeader.Init();
                        PurchHeader.Validate("Document Type", PurchHeader."Document Type"::Order);
                        if StagingOrder."Customer/Vendor No." = '' then
                            Error('Vendor No. is required for Purchase Order.');
                        PurchHeader.Validate("Buy-from Vendor No.", StagingOrder."Customer/Vendor No.");
                        PurchHeader.Validate("Document Date", StagingOrder."Document Date");
                        PurchHeader.Insert(true);
                        StagingOrder."Document No." := PurchHeader."No.";
                        StagingOrder.Modify(true);
                        LastLineNo := 0;
                    end else begin
                        PurchHeader.Get(PurchHeader."Document Type"::Order, StagingOrder."Document No.");
                        PurchLine.SetRange("Document No.", PurchHeader."No.");
                        if PurchLine.FindLast() then
                            LastLineNo := PurchLine."Line No."
                        else
                            LastLineNo := 0;
                    end;
                    PurchLine.Init();
                    PurchLine.Validate("Document Type", PurchHeader."Document Type");
                    PurchLine.Validate("Document No.", PurchHeader."No.");
                    LastLineNo += 10000;
                    PurchLine."Line No." := lastlineno;
                    PurchLine.Validate(Type, PurchLine.Type::Item);
                    PurchLine.Validate("No.", StagingOrder."Item No.");
                    PurchLine.Validate("Currency Code", StagingOrder."Currency Id");
                    PurchLine.Validate(Quantity, StagingOrder.Quantity);
                    PurchLine.Validate("Direct Unit Cost", StagingOrder."Unit Price");
                    PurchLine.Insert(true);
                    StagingOrder."Line No." := lastlineno;
                    if StagingOrder.Status = StagingOrder.Status::Ready then begin
                        StagingOrder.Status := StagingOrder.Status::Processed;

                        StagingOrder.Modify(true);
                    end;
                    Message('Purchase Order %1 created successfully.', PurchHeader."No.");
                end;
            else
                Error('Only Sales Order or Purchase Order can be created from staging.');
        end;
    end;

    local procedure LogError(Context: Text; Msg: Text; DocNo: Code[20])
    var
        ErrorLog: Record "Error Message";
    begin
        ErrorLog.Init();
        ErrorLog."Message" := Msg;
        ErrorLog.Insert(true);
    end;

}