pageextension 65102 "Blanket page ext" extends "Blanket Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Update();
    end;
}
