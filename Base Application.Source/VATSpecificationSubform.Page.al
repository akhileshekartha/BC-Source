page 576 "VAT Specification Subform"
{
    Caption = 'Lines';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "VAT Amount Line";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("VAT Identifier"; Rec."VAT Identifier")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the contents of this field from the VAT Identifier field in the VAT Posting Setup table.';
                    Visible = false;
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies the VAT percentage that was used on the sales or purchase lines with this VAT Identifier.';
                }
                field("VAT Calculation Type"; Rec."VAT Calculation Type")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies how VAT will be calculated for purchases or sales of items with this particular combination of VAT business posting group and VAT product posting group.';
                    Visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the total amount for sales or purchase lines with a specific VAT identifier.';
                }
                field("Inv. Disc. Base Amount"; Rec."Inv. Disc. Base Amount")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the invoice discount base amount.';
                    Visible = false;
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    Editable = InvoiceDiscountAmountEditable;
                    ToolTip = 'Specifies the invoice discount amount for a specific VAT identifier.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CalcVATFields(CurrencyCode, PricesIncludingVAT, VATBaseDiscPct);
                        ModifyRec();
                    end;
                }
                field("VAT Base"; Rec."VAT Base")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the total net amount (amount excluding VAT) for sales or purchase lines with a specific VAT Identifier.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    Editable = VATAmountEditable;
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';

                    trigger OnValidate()
                    begin
                        if AllowVATDifference and not AllowVATDifferenceOnThisTab then
                            if ParentControl = PAGE::"Service Order Statistics" then
                                Error(Text000, FieldCaption("VAT Amount"), Text002)
                            else
                                Error(Text000, FieldCaption("VAT Amount"), Text003);

                        GLSetup.Get();
                        if GLSetup."Additional Reporting Currency" <> '' then
                            AddCurrency.Get(GLSetup."Additional Reporting Currency");
                        if PurchHeader1."Posting Date" <> 0D then begin
                            if (PurchHeader1."Vendor Exchange Rate (ACY)" <> 0) and (PurchHeader1."Currency Code" = '') then begin
                                CurrencyFactor :=
                                  CurrExchRate.ExchangeRateFactorFRS21(
                                    PurchHeader1."Posting Date", GLSetup."Additional Reporting Currency", PurchHeader1."Vendor Exchange Rate (ACY)")
                            end else
                                CurrencyFactor :=
                                  CurrExchRate.ExchangeRate(
                                    PurchHeader1."Posting Date", GLSetup."Additional Reporting Currency");

                            "VAT Amount (ACY)" :=
                              Round(
                                CurrExchRate.ExchangeAmtLCYToFCY(
                                  PurchHeader1."Posting Date", GLSetup."Additional Reporting Currency",
                                  Round(CurrExchRate.ExchangeAmtFCYToLCY(
                                      PurchHeader1."Posting Date", PurchHeader1."Currency Code", "VAT Amount",
                                      PurchHeader1."Currency Factor"), AddCurrency."Amount Rounding Precision"), CurrencyFactor),
                                AddCurrency."Amount Rounding Precision");
                        end;

                        if PricesIncludingVAT then begin
                            "VAT Base" := "Amount Including VAT" - "VAT Amount";
                            "VAT Base (ACY)" := "Amount Including VAT (ACY)" - "VAT Amount (ACY)";
                        end else begin
                            "Amount Including VAT" := "VAT Amount" + "VAT Base";
                            "Amount Including VAT (ACY)" := "VAT Amount (ACY)" + "VAT Base (ACY)";
                        end;

                        FormCheckVATDifference();
                        ModifyRec();
                    end;
                }
                field("Calculated VAT Amount"; Rec."Calculated VAT Amount")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the calculated VAT amount and is only used for reference when the user changes the VAT Amount manually.';
                    Visible = false;
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the difference between the calculated VAT amount and a VAT amount that you have entered manually.';
                    Visible = false;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic, Suite;
                    AutoFormatExpression = CurrencyCode;
                    AutoFormatType = 1;
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';

                    trigger OnValidate()
                    begin
                        FormCheckVATDifference();
                    end;
                }
                field("VAT Base (ACY)"; Rec."VAT Base (ACY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the net amount (amount excluding VAT) in your additional reporting currency.';
                    Visible = VATBaseACYVisible;
                }
                field("VAT Amount (ACY)"; Rec."VAT Amount (ACY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT amount in your additional reporting currency.';
                    Visible = "VAT Amount (ACY)Visible";

                    trigger OnValidate()
                    begin
                        "Amount Including VAT (ACY)" := "VAT Amount (ACY)" + "VAT Base (ACY)";
                        FormCheckVATDifference();
                        ModifyRec();
                    end;
                }
                field("Amount Including VAT (ACY)"; Rec."Amount Including VAT (ACY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total amount including VAT in additional currency.';
                    Visible = AmountIncludingVATACYVisible;
                }
                field("Amount (ACY)"; Rec."Amount (ACY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the net amount (excluding VAT) in additional currency.';
                    Visible = "Amount (ACY)Visible";
                }
                field("VAT Difference (ACY)"; Rec."VAT Difference (ACY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT difference for one VAT identifier in your additional reporting currency.';
                    Visible = "VAT Difference (ACY)Visible";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if MainFormActiveTab = MainFormActiveTab::Other then
            VATAmountEditable := AllowVATDifference and not "Includes Prepayment"
        else
            VATAmountEditable := AllowVATDifference;
        InvoiceDiscountAmountEditable := AllowInvDisc and not "Includes Prepayment";
    end;

    trigger OnInit()
    begin
        "VAT Difference (ACY)Visible" := true;
        "Amount (ACY)Visible" := true;
        AmountIncludingVATACYVisible := true;
        "VAT Amount (ACY)Visible" := true;
        VATBaseACYVisible := true;
        InvoiceDiscountAmountEditable := true;
        VATAmountEditable := true;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        ModifyRec();
        exit(false);
    end;

    var
        Currency: Record Currency;
        ServHeader: Record "Service Header";
        CurrencyCode: Code[10];
        AllowVATDifference: Boolean;
        AllowVATDifferenceOnThisTab: Boolean;
        PricesIncludingVAT: Boolean;
        AllowInvDisc: Boolean;
        VATBaseDiscPct: Decimal;
        ParentControl: Integer;
        CurrentTabNo: Integer;
        MainFormActiveTab: Option Other,Prepayment;
        PurchHeader1: Record "Purchase Header";
        CurrExchRate: Record "Currency Exchange Rate";
        GLSetup: Record "General Ledger Setup";
        AddCurrency: Record Currency;
        CurrencyFactor: Decimal;
        [InDataSet]
        VATAmountEditable: Boolean;
        [InDataSet]
        InvoiceDiscountAmountEditable: Boolean;
        [InDataSet]
        VATBaseACYVisible: Boolean;
        [InDataSet]
        "VAT Amount (ACY)Visible": Boolean;
        [InDataSet]
        AmountIncludingVATACYVisible: Boolean;
        [InDataSet]
        "Amount (ACY)Visible": Boolean;
        [InDataSet]
        "VAT Difference (ACY)Visible": Boolean;

        Text000: Label '%1 can only be modified on the %2 tab.';
        Text001: Label 'The total %1 for a document must not exceed the value %2 in the %3 field.';
        Text002: Label 'Details';
        Text003: Label 'Invoicing';

    procedure SetTempVATAmountLine(var NewVATAmountLine: Record "VAT Amount Line")
    begin
        DeleteAll();
        if NewVATAmountLine.Find('-') then
            repeat
                Copy(NewVATAmountLine);
                Insert();
            until NewVATAmountLine.Next() = 0;
        CurrPage.Update(false);
    end;

    procedure GetTempVATAmountLine(var NewVATAmountLine: Record "VAT Amount Line")
    begin
        NewVATAmountLine.DeleteAll();
        if Find('-') then
            repeat
                NewVATAmountLine.Copy(Rec);
                NewVATAmountLine.Insert();
            until Next() = 0;
    end;

    procedure InitGlobals(NewCurrencyCode: Code[10]; NewAllowVATDifference: Boolean; NewAllowVATDifferenceOnThisTab: Boolean; NewPricesIncludingVAT: Boolean; NewAllowInvDisc: Boolean; NewVATBaseDiscPct: Decimal)
    begin
        OnBeforeInitGlobals(NewCurrencyCode, NewAllowVATDifference, NewAllowVATDifferenceOnThisTab, NewPricesIncludingVAT, NewAllowInvDisc, NewVATBaseDiscPct);
        CurrencyCode := NewCurrencyCode;
        AllowVATDifference := NewAllowVATDifference;
        AllowVATDifferenceOnThisTab := NewAllowVATDifferenceOnThisTab;
        PricesIncludingVAT := NewPricesIncludingVAT;
        AllowInvDisc := NewAllowInvDisc;
        VATBaseDiscPct := NewVATBaseDiscPct;
        VATAmountEditable := AllowVATDifference;
        InvoiceDiscountAmountEditable := AllowInvDisc;
        Currency.Initialize(CurrencyCode);
        CurrPage.Update(false);
    end;

#if not CLEAN19
    [Obsolete('Replaced by W1 InitGlobals and ShowGSTAmountACY().', '19.0')]
    procedure InitGlobals(NewCurrencyCode: Code[10]; NewAllowVATDifference: Boolean; NewAllowVATDifferenceOnThisTab: Boolean; NewPricesIncludingVAT: Boolean; NewAllowInvDisc: Boolean; NewVATBaseDiscPct: Decimal; Type: Option Purchase,Sales,Services)
    begin
        OnBeforeInitGlobals(NewCurrencyCode, NewAllowVATDifference, NewAllowVATDifferenceOnThisTab, NewPricesIncludingVAT, NewAllowInvDisc, NewVATBaseDiscPct);
        CurrencyCode := NewCurrencyCode;
        AllowVATDifference := NewAllowVATDifference;
        AllowVATDifferenceOnThisTab := NewAllowVATDifferenceOnThisTab;
        PricesIncludingVAT := NewPricesIncludingVAT;
        AllowInvDisc := NewAllowInvDisc;
        VATBaseDiscPct := NewVATBaseDiscPct;
        VATAmountEditable := AllowVATDifference;
        InvoiceDiscountAmountEditable := AllowInvDisc;
        Currency.Initialize(CurrencyCode);
        if Type = Type::Purchase then
            ShowGSTAmountACY();
        CurrPage.Update(false);
    end;
#endif

    procedure ShowGSTAmountACY()
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        PurchSetup.Get();
        VATBaseACYVisible := PurchSetup."Enable Vendor GST Amount (ACY)";
        "VAT Amount (ACY)Visible" := PurchSetup."Enable Vendor GST Amount (ACY)";
        AmountIncludingVATACYVisible := PurchSetup."Enable Vendor GST Amount (ACY)";
        "Amount (ACY)Visible" := PurchSetup."Enable Vendor GST Amount (ACY)";
        "VAT Difference (ACY)Visible" := PurchSetup."Enable Vendor GST Amount (ACY)";
        CurrPage.Update(false);
    end;

    local procedure FormCheckVATDifference()
    var
        VATAmountLine2: Record "VAT Amount Line";
        TotalVATDifference: Decimal;
        TotalVATDifferenceACY: Decimal;
    begin
        CheckVATDifference(CurrencyCode, AllowVATDifference);
        VATAmountLine2 := Rec;
        TotalVATDifference := Abs("VAT Difference") - Abs(xRec."VAT Difference");
        TotalVATDifferenceACY := Abs("VAT Difference (ACY)") - Abs(xRec."VAT Difference (ACY)");
        if Find('-') then
            repeat
                TotalVATDifference := TotalVATDifference + Abs("VAT Difference");
                TotalVATDifferenceACY := TotalVATDifferenceACY + Abs("VAT Difference (ACY)");
            until Next() = 0;
        Rec := VATAmountLine2;
        if TotalVATDifference > Currency."Max. VAT Difference Allowed" then
            Error(
              Text001, FieldCaption("VAT Difference"),
              Currency."Max. VAT Difference Allowed", Currency.FieldCaption("Max. VAT Difference Allowed"));

        if TotalVATDifferenceACY > (Currency."Max. VAT Difference Allowed" * PurchHeader1."Vendor Exchange Rate (ACY)") then
            Error(
              Text001, FieldCaption("VAT Difference (ACY)"),
              Currency."Max. VAT Difference Allowed" * PurchHeader1."Vendor Exchange Rate (ACY)",
              Currency.FieldCaption("Max. VAT Difference Allowed"));
    end;

    local procedure ModifyRec()
    var
        ServLine: Record "Service Line";
    begin
        Modified := true;
        Modify();

        if ((ParentControl = PAGE::"Service Order Statistics") and
            (CurrentTabNo <> 1)) or
           (ParentControl = PAGE::"Service Statistics")
        then
            if GetAnyLineModified() then begin
                ServLine.UpdateVATOnLines(0, ServHeader, ServLine, Rec);
                ServLine.UpdateVATOnLines(1, ServHeader, ServLine, Rec);
            end;
    end;

    procedure SetParentControl(ID: Integer)
    begin
        ParentControl := ID;
        OnAfterSetParentControl(ParentControl);
    end;

    procedure SetServHeader(ServiceHeader: Record "Service Header")
    begin
        ServHeader := ServiceHeader;
    end;

    procedure SetCurrentTabNo(TabNo: Integer)
    begin
        CurrentTabNo := TabNo;
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterSetParentControl(var ParentControl: integer)
    begin
    end;

    [IntegrationEvent(true, false)]
    procedure OnBeforeInitGlobals(NewCurrencyCode: Code[10]; NewAllowVATDifference: Boolean; NewAllowVATDifferenceOnThisTab: Boolean; NewPricesIncludingVAT: Boolean; NewAllowInvDisc: Boolean; NewVATBaseDiscPct: Decimal)
    begin
    end;

    [Scope('OnPrem')]
    procedure SetPurchHeader(var PurchHeader: Record "Purchase Header")
    begin
        PurchHeader1.Get(PurchHeader."Document Type", PurchHeader."No.");
    end;
}

