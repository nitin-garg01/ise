pageextension 65531 "BPO Sub ext" extends "Blanket Purchase Order Subform"
{
    ModifyAllowed = true;
    layout
    {
        modify(Quantity)
        {
            Visible = ShowQuantity;
        }
        modify("Quantity Received")
        {
            Visible = ShowQuantityReceived;

        }
        modify("Qty. to Receive")
        {
            Visible = ShowQtytoreceive;
        }
        modify("Total Amount Excl. VAT")
        {
            Visible = ShowTotalExclvatamount;
        }
        modify("Quantity Invoiced")
        {
            Visible = ShowQuantityinvoiced;
        }
        modify("Line Amount")
        {
            Visible = ShowLineAmount;
        }
        modify("Total Amount Incl. VAT")
        {
            Visible = showAmountinclvat;
        }
        modify("Line Discount Amount")
        {
            Visible = ShowLineDisCountAmount;
        }
        modify("Total VAT Amount")
        {
            Visible = ShowtotalVatamount;
        }

    }
    var
        purchheader: Record "Purchase Header";
        ShowQuantity: Boolean;

        ShowQtytoreceive: Boolean;
        ShowQuantityReceived: Boolean;

        ShowTotalExclvatamount: Boolean;
        ShowLineAmount: Boolean;
        showAmountinclvat: Boolean;
        ShowQuantityinvoiced: Boolean;
        ShowLineDisCountAmount: Boolean;
        ShowtotalVatamount: Boolean;




    trigger OnAfterGetCurrRecord()
    begin
        UpdateVisibility();
        CurrPage.Update();
    end;



    local procedure UpdateVisibility()
    var
        PurchHeader: Record "Purchase Header";
    begin
        if PurchHeader.Get(Rec.Type) then begin
            SetVisibility(PurchHeader.Type);

        end;
    end;



    local procedure SetVisibility(v: Enum "Type ")
    begin
        ShowQuantity := true;
        ShowQtyToReceive := true;
        ShowQuantityReceived := true;
        ShowTotalExclvatamount := true;
        ShowLineAmount := true;
        ShowAmountInclVat := true;
        ShowQuantityInvoiced := true;
        ShowLineDiscountAmount := true;
        ShowtotalVatamount := true;

        case v of
            v::blank:
                begin
                    Error('select quantity wise or value wise');
                end;
            v::QunatityWise:
                begin
                    ShowQuantity := true;
                    ShowQtyToReceive := true;
                    ShowQuantityReceived := true;
                    ShowQuantityInvoiced := true;
                    ShowLineAmount := false;
                    showAmountinclvat := false;
                    ShowTotalExclvatamount := false;
                    ShowtotalVatamount := false;

                end;

            v::ValueWise:
                begin
                    ShowLineAmount := true;
                    ShowTotalExclvatamount := true;
                    ShowAmountInclVat := true;
                    ShowLineDiscountAmount := true;
                    ShowtotalVatamount := true;
                    ShowQuantity := false;
                    ShowQtyToReceive := false;
                    ShowQuantityReceived := false
                end;
        end;
    end;
}
