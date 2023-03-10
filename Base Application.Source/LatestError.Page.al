page 9180 "Latest Error"
{
    ApplicationArea = All;
    Caption = 'Latest Error';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = StandardDialog;
    ShowFilter = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Control2)
            {
                ShowCaption = false;
                group("Error Details")
                {
                    Caption = 'Error Details';
                    Visible = ErrorOccurred;
                    field(ErrorText; GetLastErrorText)
                    {
                        ApplicationArea = All;
                        Caption = 'Error Text';
                    }
                    field(ErrorCode; GetLastErrorCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Error Code';
                    }
                    group(ErrorCallStackLabel)
                    {
                        Caption = 'Error Callstack';
                        field(ErrorCallStack; GetLastErrorCallstack)
                        {
                            ApplicationArea = All;
                            MultiLine = true;
                            ShowCaption = false;
                        }
                    }
#if not CLEAN19
                    group(ErrorObjectLabel)
                    {
                        ObsoleteState = Pending;
                        ObsoleteReason = 'The field might contain sensitive data.';
                        Visible = false;
                        Caption = 'Error Object';
                        ObsoleteTag = '16.0';

                        field(ErrorObject; '')
                        {
                            ApplicationArea = All;
                            ShowCaption = false;
                            ObsoleteState = Pending;
                            ObsoleteReason = 'The field is always empty.';
                            ObsoleteTag = '19.0';
                        }
                    }
#endif
                }
                group(Control12)
                {
                    InstructionalText = 'No errors have occurred since you last logged in';
                    ShowCaption = false;
                    Visible = NOT ErrorOccurred;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        ErrorOccurred := GetLastErrorCallstack <> '';
    end;

    var
        ErrorOccurred: Boolean;
}

