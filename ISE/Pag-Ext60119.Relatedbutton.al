pageextension 60119 Relatedbutton extends "List Order Page"
{
    actions
    {
        addlast(Navigation)
        {
            group(RelatedGroup)
            {
                Caption = 'Related';
                Image = Link;

                action(RelatedOrders)
                {
                    Caption = 'Open Related';
                    ApplicationArea = All;
                    Image = Link;

                    trigger OnAction()
                    begin
                        case Rec."Entry Type" of
                            Rec."Entry Type"::SalesOrder:
                                PAGE.Run(PAGE::"Sales Order List");

                            Rec."Entry Type"::PurchaseOrder:
                                PAGE.Run(PAGE::"Purchase Order List");

                            else
                                Message('No related page defined for this entry type.');
                        end;
                    end;
                }
            }
        }
    }
}