report 5065 "Segment - Labels"
{
    DefaultLayout = RDLC;
    RDLCLayout = './SegmentLabels.rdlc';
    Caption = 'Segment - Labels';

    dataset
    {
        dataitem("Segment Header"; "Segment Header")
        {
            DataItemTableView = SORTING("No.");
            dataitem("Segment Line"; "Segment Line")
            {
                DataItemLink = "Segment No." = FIELD("No.");
                DataItemTableView = SORTING("Segment No.", "Line No.");
                column(ContAddr11; ContAddr[1] [1])
                {
                }
                column(ContAddr12; ContAddr[1] [2])
                {
                }
                column(ContAddr13; ContAddr[1] [3])
                {
                }
                column(ContAddr14; ContAddr[1] [4])
                {
                }
                column(ContAddr15; ContAddr[1] [5])
                {
                }
                column(ContAddr16; ContAddr[1] [6])
                {
                }
                column(ContAddr21; ContAddr[2] [1])
                {
                }
                column(ContAddr22; ContAddr[2] [2])
                {
                }
                column(ContAddr23; ContAddr[2] [3])
                {
                }
                column(ContAddr24; ContAddr[2] [4])
                {
                }
                column(ContAddr25; ContAddr[2] [5])
                {
                }
                column(ContAddr26; ContAddr[2] [6])
                {
                }
                column(ContAddr31; ContAddr[3] [1])
                {
                }
                column(ContAddr32; ContAddr[3] [2])
                {
                }
                column(ContAddr33; ContAddr[3] [3])
                {
                }
                column(ContAddr34; ContAddr[3] [4])
                {
                }
                column(ContAddr35; ContAddr[3] [5])
                {
                }
                column(ContAddr36; ContAddr[3] [6])
                {
                }
                column(ContAddr17; ContAddr[1] [7])
                {
                }
                column(ContAddr18; ContAddr[1] [8])
                {
                }
                column(ContAddr27; ContAddr[2] [7])
                {
                }
                column(ContAddr28; ContAddr[2] [8])
                {
                }
                column(ContAddr37; ContAddr[3] [7])
                {
                }
                column(ContAddr38; ContAddr[3] [8])
                {
                }
                column(ShowBody36X70; (ColumnNo = 0) and (LabelFormat = LabelFormat::"36 x 70 mm (3 columns)"))
                {
                }
                column(GroupNo; GroupNo)
                {
                }
                column(ShowBody37X70; (ColumnNo = 0) and (LabelFormat = LabelFormat::"37 x 70 mm (3 columns)"))
                {
                }
                column(ContBarCode1; ContBarCode[1])
                {
                }
                column(ContBarCode2; ContBarCode[2])
                {
                }
                column(ShowBody48X105; (ColumnNo = 0) and (LabelFormat = LabelFormat::"48 x 105 mm (2 columns - Bar Code)"))
                {
                }
                column(ShowBody36X105; (ColumnNo = 0) and (LabelFormat = LabelFormat::"36 x 105 mm (2 columns)"))
                {
                }
                column(ShowBody37X105; (ColumnNo = 0) and (LabelFormat = LabelFormat::"37 x 105 mm (2 columns)"))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Cont.Get("Contact No.");

                    RecordNo := RecordNo + 1;
                    ColumnNo := ColumnNo + 1;

                    FormatAddr.ContactAddrAlt(ContAddr[ColumnNo], Cont, "Contact Alt. Address Code", Date);
                    ContBarCode[ColumnNo] := FormatAddr.PrintBarCode(0);

                    if RecordNo = NoOfRecords then begin
                        for i := ColumnNo + 1 to NoOfColumns do begin
                            Clear(ContAddr[i]);
                            ContBarCode[i] := '';
                        end;
                        ColumnNo := 0;
                    end else
                        if ColumnNo = NoOfColumns then
                            ColumnNo := 0;

                    if ColumnNo = 0 then begin
                        if Counter = RecPerPageNum then begin
                            GroupNo := GroupNo + 1;
                            Counter := 0;
                        end;
                        Counter := Counter + 1;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    case LabelFormat of
                        LabelFormat::"36 x 70 mm (3 columns)", LabelFormat::"37 x 70 mm (3 columns)":
                            NoOfColumns := 3;
                        LabelFormat::"36 x 105 mm (2 columns)", LabelFormat::"37 x 105 mm (2 columns)", LabelFormat::"48 x 105 mm (2 columns - Bar Code)":
                            NoOfColumns := 2;
                    end;

                    RecordNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                NoOfRecords := 0;
                SegLine.SetFilter("Segment No.", "No.");
                NoOfRecords := SegLine.Count();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(LabelFormat; LabelFormat)
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Format';
                        OptionCaption = '36 x 70 mm (3 columns),37 x 70 mm (3 columns),36 x 105 mm (2 columns),37 x 105 mm (2 columns),48 x 105 mm (2 columns - Bar Code)';
                        ToolTip = 'Specifies the format of the label.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        var
            GLSetup: Record "General Ledger Setup";
        begin
            GLSetup.Get();
            /*REQUESTOPTIONSPAGE."Bar Code".ENABLED(
              (GLSetup."Address Validation" <> GLSetup."Address Validation"::"Post Code & City") AND
              (GLSetup."AMAS Software" <> 0));*/

        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        GroupNo := 1;
        case LabelFormat of
            LabelFormat::"36 x 70 mm (3 columns)", LabelFormat::"37 x 70 mm (3 columns)", LabelFormat::"36 x 105 mm (2 columns)", LabelFormat::"37 x 105 mm (2 columns)":
                RecPerPageNum := 8;
            LabelFormat::"48 x 105 mm (2 columns - Bar Code)":
                RecPerPageNum := 6;
        end;
    end;

    var
        Cont: Record Contact;
        SegLine: Record "Segment Line";
        FormatAddr: Codeunit "Format Address";
        LabelFormat: Option "36 x 70 mm (3 columns)","37 x 70 mm (3 columns)","36 x 105 mm (2 columns)","37 x 105 mm (2 columns)","48 x 105 mm (2 columns - Bar Code)";
        ContAddr: array[3, 8] of Text[100];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        ContBarCode: array[3] of Text[100];
        GroupNo: Integer;
        Counter: Integer;
        RecPerPageNum: Integer;

    procedure InitializeRequest(LabelFormatFrom: Option)
    begin
        LabelFormat := LabelFormatFrom;
    end;
}

