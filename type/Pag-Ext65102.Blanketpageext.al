pageextension 65102 "Blanket page ext" extends "Blanket Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field(Type; Rec.Type)
            {

                trigger OnValidate()
                begin
                    CurrPage.PurchLines.Page.Update();
                end;
            }
        }
    }


}
