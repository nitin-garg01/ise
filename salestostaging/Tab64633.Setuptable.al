table 64633 "Setup table"
{
    Caption = 'Setup table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Las Document No."; Code[20])
        {

        }
    }
    keys
    {
        key(PK; "Las Document No.")
        {
            Clustered = true;
        }
    }
}
