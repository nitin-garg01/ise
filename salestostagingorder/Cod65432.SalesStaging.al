codeunit 65432 "Sales-Staging"
{
    Subtype = Normal;
    procedure SalestoStaging()
    var
        SalesHead: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TempTable: Record "Middle Table";
    begin
        if SalesHead.FindSet() then
            repeat

                SalesLine.SetRange("Document Type", SalesHead."Document Type");
                SalesLine.SetRange("Document No.", SalesHead."No.");

                if SalesLine.FindSet() then
                    repeat
                        TempTable.Init();
                        // sales header
                        TempTable."Document Type" := Format(SalesHead."Document Type");
                        TempTable."Document No." := SalesHead."No.";
                        TempTable."Customer Name" := SalesHead."Sell-to Customer Name";
                        TempTable."Document date" := SalesHead."Order Date";
                        // sales line
                        TempTable."Item No." := SalesLine."Item Reference No.";
                        TempTable.Quantity := SalesLine.Quantity;
                        TempTable."Unit Of Measure" := SalesLine."Unit of Measure Code";
                        TempTable."Unit Price" := SalesLine."Unit Price";
                        TempTable."Line No" := SalesLine."Line No.";
                        TempTable."vendor Item Description" := SalesLine.Description;
                        TempTable.Insert();
                    until SalesLine.Next() = 0;
            Until SalesHead.Next() = 0;
    end;

}
