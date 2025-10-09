table 59991 "Middle Table"
{
    Caption = 'Middle Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Code[20])
        {
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Document date"; Date)
        {
            Caption = 'Document date';
        }
        field(4; "Customer Name"; Code[30])
        {
            Caption = 'Customer Name';
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(6; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(8; "Unit Of Measure"; Code[20])
        {
            Caption = 'Unit Of Measure';
        }
        field(9; "Buyer Name"; Text[50])
        {
            Caption = 'Buyer Name';
        }
        field(10; "Module header"; Text[50])
        {
            Caption = 'Module header';
        }
        field(11; "Module Line"; Text[50])
        {
            Caption = 'Module Line';
        }
        field(12; "vendor Item Description"; Text[100])
        {
            Caption = 'vendor Item Description';
        }
        field(13; "Currency Id"; Code[20])
        {
            Caption = 'Currency Id';
        }
        field(14; "Line No"; Integer)
        {
            Caption = '';
        }
        field(15; "Non-Inventory"; Boolean)
        {
            Caption = 'Non-Inventory';
        }
        field(16; "Confirmed By"; Text[50])
        {
            Caption = 'Confirmed By';
        }
        field(17; "Tax Schedule"; Code[20])
        {
            Caption = 'Tax Schedule';
        }
        field(18; "Currency Header"; Code[10])
        {
            Caption = 'Currency Header';
        }
        field(19; "Notes"; Text[100])
        {
            Caption = 'Notes';
        }
    }
    keys
    {
        key(PK; "Document Type")
        {
            Clustered = true;
        }
    }
}
