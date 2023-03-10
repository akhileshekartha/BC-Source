codeunit 11600 "ABN Management"
{

    trigger OnRun()
    begin
    end;

    var
        Text1450000: Label 'You can enter only numbers in this field.';
        Text1450001: Label 'You should enter an 11-digit number in this field.';
        Text1450002: Label 'The number is invalid.';
        Text1450003: Label 'The number already exists for %1 %2. Do you wish to continue?';

    procedure CheckABN(ABN: Text[11]; Which: Option Customer,Vendor,Internal,Contact)
    var
        Vendor: Record Vendor;
        Customer: Record Customer;
        Contact: Record Contact;
        CheckDigit: Integer;
        AbnDigit: array[11] of Integer;
        WeightFactor: array[11] of Integer;
        AbnWeightSum: Integer;
        i: Integer;
        j: Integer;
    begin
        if ABN = '' then
            exit;

        if StrPos(ABN, ' ') <> 0 then
            Error(Text1450000);
        if StrLen(ABN) <> 11 then
            Error(Text1450001);

        j := -1;
        CheckDigit := 89;
        Clear(AbnDigit);
        Clear(WeightFactor);
        Clear(AbnWeightSum);

        for i := 1 to 11 do begin
            if not Evaluate(AbnDigit[i], CopyStr(ABN, i, 1)) then
                Error(Text1450000);
            if i = 1 then begin
                AbnDigit[i] := AbnDigit[i] - 1;
                WeightFactor[i] := 10;
            end else begin
                j += 2;
                WeightFactor[i] := j;
            end;
            AbnWeightSum += (WeightFactor[i] * AbnDigit[i]);
        end;

        if AbnWeightSum mod CheckDigit <> 0 then
            Error(Text1450002);

        case Which of
            Which::Vendor:
                begin
                    Vendor.SetCurrentKey(ABN);
                    Vendor.SetRange(ABN, ABN);
                    if Vendor.FindFirst() then
                        if not Confirm(Text1450003, false, Vendor.TableCaption(), Vendor."No.") then
                            Error('');
                end;
            Which::Customer:
                begin
                    Customer.SetCurrentKey(ABN);
                    Customer.SetRange(ABN, ABN);
                    if Customer.FindFirst() then
                        if not Confirm(Text1450003, false, Customer.TableCaption(), Customer."No.") then
                            Error('');
                end;
            Which::Contact:
                begin
                    Contact.SetCurrentKey(ABN, Type);
                    Contact.SetRange(ABN, ABN);
                    Contact.SetRange(Type, Contact.Type::Company);
                    if Contact.FindFirst() then
                        if not Confirm(Text1450003, false, Contact.TableCaption(), Contact."No.") then
                            Error('');
                end;
        end;
    end;
}

