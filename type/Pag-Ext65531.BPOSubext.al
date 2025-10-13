pageextension 65531 "BPO Sub ext" extends "Blanket Purchase Order Subform"
{
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
            Visible = ShowQtyToReceive;
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
            Visible = ShowAmountInclvat;
        }
        modify("Line Discount Amount")
        {
            Visible = ShowLineDisCountAmount;
        }
        modify("Total VAT Amount")
        {
            Visible = ShowTotalVatAmount;
        }
        modify("Direct Unit Cost")
        {
            Visible = ShowDirecUnitCost;
        }
    }
    var

        ShowQuantity: Boolean;
        ShowQuantityReceived: Boolean;
        ShowQtyToReceive: Boolean;
        ShowTotalExclvatamount: Boolean;
        ShowQuantityinvoiced: Boolean;
        ShowLineAmount: Boolean;
        ShowAmountInclvat: Boolean;

        ShowLineDisCountAmount: Boolean;
        ShowTotalVatAmount: Boolean;
        ShowDirecUnitCost: Boolean;

    trigger OnAfterGetRecord()
    begin
        SetVisibility();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetVisibility();
    end;

    local procedure SetVisibility()
    var
        Header: Record "Purchase Header";
    begin

        ShowQuantity := true;
        ShowQuantityReceived := true;
        ShowQtyToReceive := true;

        ShowQuantityinvoiced := true;

        ShowLineAmount := true;
        ShowAmountInclvat := true;
        ShowTotalExclvatamount := true;
        ShowLineDisCountAmount := true;
        ShowTotalVatAmount := true;
        ShowDirecUnitCost := true;

        if Header.Get(Rec."Document Type", Rec."Document No.") then begin
            case Header.Type of
                Header.Type::" ":
                    begin
                        ShowQuantity := false;
                        ShowQuantityReceived := false;
                        ShowQtyToReceive := false;
                        ShowQuantityinvoiced := false;
                        ShowLineAmount := false;
                        ShowAmountInclvat := false;
                        ShowTotalExclvatamount := false;
                        ShowLineDisCountAmount := false;
                        ShowTotalVatAmount := false;
                        ShowDirecUnitCost := false;

                    end;

                Header.Type::QunatityWise:
                    begin

                        ShowQuantity := true;
                        ShowQuantityReceived := true;
                        ShowQtyToReceive := true;
                        ShowQuantityinvoiced := true;
                    end;

                Header.Type::ValueWise:
                    begin
                        ShowLineAmount := true;
                        ShowAmountInclvat := true;
                        ShowTotalExclvatamount := true;
                        ShowLineDisCountAmount := true;
                        ShowTotalVatAmount := true;
                        ShowDirecUnitCost := true;
                    end;
            end;
            CurrPage.Update(false);
        end;
    end;
}
