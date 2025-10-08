pageextension 65102 "Blanket page ext" extends "Blanket Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if Rec."No." = '' then
                        exit;
                    CurrPage.PurchLines.PAGE.Update();
                end;
            }

        }

    }


}
