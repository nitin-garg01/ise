table 64888 "Temp Table"
{
    Caption = 'Temp Table';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Document Type"; Enum "Document type")
        {
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Entry Type"; Option)
        {
            OptionMembers = Customer,Vendor,PurchaseOrder,SalesOrder;
            OptionCaption = 'Customer,Vendor,Purchase Order,Sales Order';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer/Vendor No."; Code[20])
        {
            Caption = 'Customer / Vendor No.';
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }

        field(6; Status; Option)
        {
            OptionMembers = Ready,Processed,Failed,Skipped;
            OptionCaption = 'Ready,Processed,Failed,Skipped';
            DataClassification = ToBeClassified;
        }
        field(7; "Buyer Name"; Text[50])
        {
            Caption = 'Buyer Name';
        }
        field(8; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
        }
        field(9; "Confirmed By"; Text[50])
        {
            Caption = 'Confirmed By';
        }
        field(10; "Tax Schedule"; Code[20])
        {
            Caption = 'Tax Schedule';
        }
        field(11; "Currency Header"; Code[10])
        {
            Caption = 'Currency Header';
        }
        field(12; "Notes"; Text[100])
        {
            Caption = 'Notes';
        }
        field(13; "Module Header"; Text[20])
        {
            Caption = 'Module Header';
        }
        field(14; "Item No."; Code[20])
        {
            Caption = 'Item No.';

        }
        field(15; "Quantity"; Decimal)
        {
            Caption = 'Quantity';

        }
        field(16; "Requested By"; Text[50])
        {
            Caption = 'Requested By';
        }
        field(17; "Non-Inventory"; Boolean)
        {
            Caption = 'Non-Inventory';
        }
        field(18; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';

        }
        field(19; "Vendor Item Description"; Text[100])
        {
            Caption = 'Vendor Item Description';
        }
        field(20; "Unit Of Measure"; Code[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(21; "Currency Id"; Code[10])
        {
            Caption = 'Currency id';
        }
        field(22; "Module Line"; Text[20])
        {
            Caption = 'Module Line';
        }
        field(23; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }


}