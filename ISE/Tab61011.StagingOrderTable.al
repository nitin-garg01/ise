table 61011 "Staging OrderTable"
{
    Caption = 'Staging OrderTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Document Type"; Enum "Document type")
        {
            Caption = 'Document Type';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; "Entry Type"; Option)
        {
            OptionMembers = Customer,Vendor,PurchaseOrder,SalesOrder;
            OptionCaption = 'Customer,Vendor,Purchase Order,Sales Order';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer/Vendor No."; Code[20])
        {
            Caption = 'Customer / Vendor No.';
            TableRelation = if ("Entry Type" = const(SalesOrder)) Customer."No."
            else if ("Entry Type" = const(PurchaseOrder)) Vendor."No.";
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }

        field(7; Status; Option)
        {
            OptionMembers = Ready,Processed,Failed,Skipped;
            OptionCaption = 'Ready,Processed,Failed,Skipped';
            DataClassification = ToBeClassified;
        }
        field(8; "Buyer Name"; Text[50])
        {
            Caption = 'Buyer Name';
        }
        field(9; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
        }
        field(10; "Confirmed By"; Text[50])
        {
            Caption = 'Confirmed By';
        }
        field(11; "Tax Schedule"; Code[20])
        {
            Caption = 'Tax Schedule';
        }
        field(12; "Currency Header"; Code[10])
        {
            Caption = 'Currency Header';
        }
        field(13; "Notes"; Text[100])
        {
            Caption = 'Notes';
        }
        field(14; "Module Header"; Text[20])
        {
            Caption = 'Module Header';
        }
        field(15; "Item No."; Code[20])
        {
            Caption = 'Item No.';

        }
        field(16; "Quantity"; Decimal)
        {
            Caption = 'Quantity';

        }
        field(17; "Requested By"; Text[50])
        {
            Caption = 'Requested By';
        }
        field(18; "Non-Inventory"; Boolean)
        {
            Caption = 'Non-Inventory';
        }
        field(19; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';

        }
        field(20; "Vendor Item Description"; Text[100])
        {
            Caption = 'Vendor Item Description';
        }
        field(21; "Unit Of Measure"; Code[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(22; "Currency Id"; Code[10])
        {
            Caption = 'Currency id';
        }
        field(23; "Module Line"; Text[20])
        {
            Caption = 'Module Line';
        }
        field(24; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(25; "user Defind"; Text[50])
        {

        }
        field(26; "Unit Cost"; Decimal)
        {

        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
