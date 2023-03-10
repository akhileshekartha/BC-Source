table 28079 "Tax Document Buffer Build"
{
    Caption = 'Tax Document Buffer Build';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(12; "Payment Discount %"; Integer)
        {
            Caption = 'Payment Discount %';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
        key(Key2; "Bill-to Customer No.", "Currency Code", "Payment Discount %")
        {
        }
    }

    fieldgroups
    {
    }
}

