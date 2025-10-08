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
            Visible = ShowTotalamount;
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
            Visible = ShowVatamount;
        }

    }
    var
        purchheader: Record "Purchase Header";
        ShowQuantity: Boolean;

        ShowQtytoreceive: Boolean;
        ShowQuantityReceived: Boolean;

        ShowTotalamount: Boolean;
        ShowLineAmount: Boolean;
        showAmountinclvat: Boolean;
        ShowQuantityinvoiced: Boolean;
        ShowLineDisCountAmount: Boolean;
        ShowVatamount: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateVisibility();
    end;

    local procedure UpdateVisibility()
    begin
        if Rec."Document No." = '' then
            exit;
        if purchheader.Get(Rec.Type) then
            SetVisibility(purchheader.Type);
        CurrPage.Update();
    end;

    local procedure SetVisibility(TypeOption: Enum "Type ")
    begin
        ShowQuantity := true;
        ShowQtyToReceive := true;
        ShowQuantityReceived := true;
        ShowTotalAmount := true;
        ShowLineAmount := true;
        ShowAmountInclVat := true;
        ShowQuantityInvoiced := true;
        ShowLineDiscountAmount := true;
        ShowVatAmount := true;

        case TypeOption of
            TypeOption::QunatityWise:
                begin
                    ShowQuantity := true;
                    ShowQtyToReceive := true;
                    ShowQuantityReceived := true;
                    ShowQuantityInvoiced := true;

                    ShowLineAmount := false;
                    ShowTotalAmount := false;
                    ShowAmountInclVat := false;
                    ShowLineDiscountAmount := false;
                    ShowVatAmount := false;
                end;

            TypeOption::ValueWise:
                begin
                    ShowQuantity := false;
                    ShowQtyToReceive := false;
                    ShowQuantityReceived := false;
                    ShowQuantityInvoiced := false;

                    ShowLineAmount := true;
                    ShowTotalAmount := true;
                    ShowAmountInclVat := true;
                    ShowLineDiscountAmount := true;
                    ShowVatAmount := true;
                end;
            else
        end;
    end;
}
