table 54524 "SO Import Table"
{
    Caption = 'SO Import Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Batch Name"; Code[10])
        {
            Caption = 'Batch Name';
            Editable = true;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
    }
    keys
    {
        key(PK; "Batch Name", "Line No")
        {
            Clustered = true;
        }
    }
}
