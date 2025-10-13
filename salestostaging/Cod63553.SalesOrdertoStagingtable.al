codeunit 63553 "Sales Order to Staging table"
{
    Subtype = Normal;


    procedure LoadNextSalesOrder()
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TempStaging: Record "Temp Staging Table";
        LastProcessedNo: Code[20];
        SetupRec: Record "Setup table";
    begin

        if SetupRec.FindFirst() then
            LastProcessedNo := SetupRec."Las Document No."
        else
            LastProcessedNo := '';


        if SalesHead.FindSet() then
            repeat

                if (LastProcessedNo = '') or (SalesHead."No." > LastProcessedNo) then begin


                    SalesLine.SetRange("Document No.", SalesHead."No.");
                    if SalesLine.FindSet() then
                        repeat
                            TempStaging.Reset();
                            TempStaging.Init();


                            TempStaging."Document Type" := TempStaging."Document Type"::Order;
                            TempStaging."Document No." := SalesHead."No.";
                            TempStaging."Entry Type" := TempStaging."Entry Type"::SalesOrder;
                            TempStaging."Customer/Vendor No." := SalesHead."Sell-to Customer No.";
                            TempStaging."Document Date" := SalesHead."Order Date";
                            TempStaging."Buyer Name" := SalesHead."Salesperson Code";


                            TempStaging."Item No." := SalesLine."No.";
                            TempStaging."Quantity" := SalesLine.Quantity;
                            TempStaging."Unit Price" := SalesLine."Unit Price";
                            TempStaging."Unit Of Measure" := SalesLine."Unit of Measure";
                            TempStaging."Line No." := SalesLine."Line No.";
                            TempStaging.Status := TempStaging.Status::Ready;


                            TempStaging.Insert(true);

                        until SalesLine.Next() = 0;

                    if SetupRec.FindFirst() then begin
                        SetupRec."Las Document No." := SalesHead."No.";
                        SetupRec.Modify();
                    end else begin
                        SetupRec.Init();
                        SetupRec."Las Document No." := SalesHead."No.";
                        SetupRec.Insert();
                    end;

                    exit;
                end;
            until SalesHead.Next() = 0;
    end;
}
