pageextension 50743 "genernal Journal page ext" extends "General Journal"
{
    actions
    {
        addlast(processing)
        {
            action("Import from excel")
            {
                Caption = 'Import from excel';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import General Journal lines from an Excel file.';

                trigger OnAction()
                var
                    GenjLine: Record "Gen. Journal Line";
                    CurrentTemplate: Code[10];
                    CurrentBatch: Code[10];
                begin

                    CurrentBatch := Rec."Journal Batch Name";
                    CurrentTemplate := Rec."Journal Template Name";

                    if CurrentBatch = '' then
                        Error('Please select a Journal Batch before import.');


                    ReadExcelSheet();


                    ImportExcelData(CurrentTemplate, CurrentBatch);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        FileName: Text[100];
        SheetName: Text[100];

        UploadExcelMsg: Label 'Please choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        ExcelImportSuccess: Label 'Excel imported successfully!';

    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile = '' then
            Error(NoFileFoundMsg);

        FileName := FileMgt.GetFileName(FromFile);
        SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);

        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData(CurrentTemplate: Code[10]; CurrentBatch: Code[10])
    var
        GenJLine: Record "Gen. Journal Line";
        RowNo: Integer;
        MaxRowNo: Integer;
        LineNo: Integer;
        importcount: Integer;
        postingDate: Date;

        DocumentNo: Code[20];
        AccountNo: Code[20];

        AmountText: Text;
        Description: Text[100];
        BalAccountNo: Code[20];
        documenttype: Enum "Gen. Journal Document Type";

    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRowNo := TempExcelBuffer."Row No."
        else
            exit;
        LineNo := 0;
        GenJLine.Reset();
        GenJLine.SetRange("Journal Template Name", CurrentTemplate);
        GenJLine.SetRange("Journal Batch Name", CurrentBatch);
        if GenJLine.FindLast() then
            LineNo := GenJLine."Line No.";
        for RowNo := 2 to MaxRowNo do begin

            postingDate := EvaluateDate(GetValueAtCell(RowNo, 1));
            DocumentNo := GetValueAtCell(RowNo, 2);
            AccountNo := GetValueAtCell(RowNo, 3);
            AmountText := GetValueAtCell(RowNo, 4);
            Description := GetValueAtCell(RowNo, 5);
            BalAccountNo := GetValueAtCell(RowNo, 6);


            LineNo += 10000;
            GenJLine.Init();
            GenJLine.Validate("Journal Template Name", CurrentTemplate);
            GenJLine.Validate("Journal Batch Name", CurrentBatch);
            GenJLine."Line No." := LineNo;
            GenJLine.Validate("Posting Date", postingDate);
            GenJLine.Validate("Document No.", DocumentNo);
            GenJLine.Validate("Account No.", AccountNo);
            GenJLine.Validate(Amount, EvaluateDecimal(AmountText));
            GenJLine.Validate(Description, Description);
            GenJLine.Validate("Bal. Account No.", BalAccountNo);

            GenJLine.Insert();
            importcount += 1;
        end;
        CurrPage.Update(true);
        Message('%1 rows imported successfully!', importcount);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure EvaluateDecimal(Value: Text): Decimal
    var
        Result: Decimal;
    begin
        if not Evaluate(Result, Value) then
            Result := 0;
        exit(Result);
    end;

    local procedure EvaluateDate(Value: Text): Date
    var
        Result: Date;
    begin
        if not Evaluate(Result, Value) then
            Result := 0D;
        exit(Result);
    end;

    // procedure EvaluateDocumentType(DocTypeText: Text): Enum "Gen. Journal Document Type"
    // var
    //     DocTypeEnum: Enum "Gen. Journal Document Type";
    // begin
    //     case UpperCase(DocTypeText) of
    //         'PAYMENT':
    //             DocTypeEnum := DocTypeEnum::Payment;
    //         'INVOICE':
    //             DocTypeEnum := DocTypeEnum::Invoice;
    //         'CREDIT MEMO':
    //             DocTypeEnum := DocTypeEnum::"Credit Memo";
    //         'FINANCE CHARGE MEMO':
    //             DocTypeEnum := DocTypeEnum::"Finance Charge Memo";
    //         'REMINDER':
    //             DocTypeEnum := DocTypeEnum::Reminder;
    //         'REFUND':
    //             DocTypeEnum := DocTypeEnum::Refund;
    //         else
    //             Error('Invalid Document Type in Excel: %1', DocTypeText);
    //     end;
    //     exit(DocTypeEnum);
    // end;

}
