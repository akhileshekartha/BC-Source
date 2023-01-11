enum 8 "Country/Region Address Format"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Post Code+City") { Caption = 'Post Code+City'; }
    value(1; "City+Post Code") { Caption = 'City+Post Code'; }
    value(2; "City+County+Post Code") { Caption = 'City+County+Post Code'; }
    value(3; "Blank Line+Post Code+City") { Caption = 'Blank Line+Post Code+City'; }
    value(4; "City+Post Code (no comma)") { Caption = 'City+Post Code (no comma)'; }
    value(5; "City+County+Post Code (no comma)") { Caption = 'City+County+Post Code (no comma)'; }
    value(13; "Custom") { Caption = 'Custom'; }
}