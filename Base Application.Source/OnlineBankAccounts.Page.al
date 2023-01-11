page 270 "Online Bank Accounts"
{
    Caption = 'Select which bank account to set up';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Online Bank Acc. Link";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                InstructionalText = 'Select which bank account to set up.';
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the online bank account.';
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the bank account name.';
                }
            }
        }
    }

    actions
    {
    }

    procedure SetRecs(var OnlineBankAccLink: Record "Online Bank Acc. Link")
    begin
        OnlineBankAccLink.Reset();
        OnlineBankAccLink.FindSet();
        repeat
            Rec := OnlineBankAccLink;
            Insert();
        until OnlineBankAccLink.Next() = 0
    end;
}

