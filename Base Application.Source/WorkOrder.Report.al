report 752 "Work Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './WorkOrder.rdlc';
    Caption = 'Work Order';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(No1_SalesHeader; "Sales Header"."No.")
                {
                }
                column(ShipmentDate_SalesHeader; Format("Sales Header"."Shipment Date"))
                {
                }
                column(CompanyName; COMPANYPROPERTY.DisplayName())
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                {
                }
                column(SalesOrderNoCaption; SalesOrderNoCaptionLbl)
                {
                }
                column(PageNoCaption; PageNoCaptionLbl)
                {
                }
                column(WorkOrderCaption; WorkOrderCaptionLbl)
                {
                }
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    column(No_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitofMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(Type_SalesLine; Type)
                    {
                        IncludeCaption = true;
                    }
                    column(QtyworkPostSalesOrderCptn; QtyworkPostSalesOrderCptnLbl)
                    {
                    }
                    column(QuantityUsedCaption; QuantityUsedCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaption; UnitofMeasureCaptionLbl)
                    {
                    }
                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = WHERE("Document Line No." = CONST(0));
                    column(Date_SalesCommentLine; Format(Date))
                    {
                    }
                    column(Code_SalesCommentLine; Code)
                    {
                        IncludeCaption = true;
                    }
                    column(Comment_SalesCommentLine; Comment)
                    {
                        IncludeCaption = true;
                    }
                    column(CommentsCaption; CommentsCaptionLbl)
                    {
                    }
                    column(SalesCommentLineDtCptn; SalesCommentLineDtCptnLbl)
                    {
                    }
                }
                dataitem("Extra Lines"; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(NoCaption; NoCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(QuantityCaption; QuantityCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaptionControl33; UnitofMeasureCaptionControl33Lbl)
                    {
                    }
                    column(DateCaption; DateCaptionLbl)
                    {
                    }
                    column(workPostdItemorResJnlCptn; workPostdItemorResJnlCptnLbl)
                    {
                    }
                    column(TypeCaption; TypeCaptionLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[100];
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        PageNoCaptionLbl: Label 'Page';
        WorkOrderCaptionLbl: Label 'Work Order';
        QtyworkPostSalesOrderCptnLbl: Label 'Quantity used during work (Posted with the Sales Order)';
        QuantityUsedCaptionLbl: Label 'Quantity Used';
        UnitofMeasureCaptionLbl: Label 'Unit of Measure';
        CommentsCaptionLbl: Label 'Comments';
        SalesCommentLineDtCptnLbl: Label 'Date';
        NoCaptionLbl: Label 'No.';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitofMeasureCaptionControl33Lbl: Label 'Unit of Measure';
        DateCaptionLbl: Label 'Date';
        workPostdItemorResJnlCptnLbl: Label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        TypeCaptionLbl: Label 'Type';
}

