page 9020 "Small Business Owner RC"
{
    Caption = 'President - Small Business';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(Control78; "Small Business Owner Act.")
                {
                    ApplicationArea = Basic, Suite;
                }
                part("User Tasks Activities"; "User Tasks Activities")
                {
                    ApplicationArea = Suite;
                }
            }
            group(Control1900724708)
            {
                ShowCaption = false;
                part(Control69; "Finance Performance")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control66; "Finance Performance")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control70; "Sales Performance")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control68; "Sales Performance")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control2; "Trailing Sales Orders Chart")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control12; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control99; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1905989608; "My Items")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                systempart(Control67; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("S&tatement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'S&tatement';
                Image = "Report";
                RunObject = Report "Customer Statement";
                ToolTip = 'View all entries for selected customers for a selected period. You can choose to have all overdue balances displayed, regardless of the period specified. You can also choose to include an aging band. For each currency, the report displays open entries and, if specified in the report, overdue entries. The statement can be sent to customers, for example, at the close of an accounting period or as a reminder of overdue balances.';
            }
            separator(Action61)
            {
            }
            action("Customer - Order Su&mmary")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - Order Su&mmary';
                Image = "Report";
                RunObject = Report "Customer - Order Summary";
                ToolTip = 'View the order detail (the quantity not yet shipped) for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
            }
            action("Customer - T&op 10 List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - T&op 10 List';
                Image = "Report";
                RunObject = Report "Customer - Top 10 List";
                ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
            }
            action("Customer/&Item Sales")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer/&Item Sales';
                Image = "Report";
                RunObject = Report "Customer/Item Sales";
                ToolTip = 'View a list of item sales for each customer during a selected time period. The report contains information on quantity, sales amount, profit, and possible discounts. It can be used, for example, to analyze a company''s customer groups.';
            }
            separator(Action75)
            {
            }
            action("Salesperson - Sales &Statistics")
            {
                ApplicationArea = Suite;
                Caption = 'Salesperson - Sales &Statistics';
                Image = "Report";
                RunObject = Report "Salesperson - Sales Statistics";
                ToolTip = 'View amounts for sales, profit, invoice discount, and payment discount, as well as profit percentage, for each salesperson for a selected period. The report also shows the adjusted profit and adjusted profit percentage, which reflect any changes to the original costs of the items in the sales.';
            }
#if not CLEAN21
            action("Price &List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Price &List';
                Image = "Report";
                RunPageView = WHERE("Object Type" = CONST(Report), "Object ID" = CONST(715)); // "Price List";
                RunObject = Page "Role Center Page Dispatcher";
                ToolTip = 'View a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '19.0';
            }
#else
            action("Price &List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Price &List';
                RunObject = Report "Item Price List";
                ToolTip = 'View a list of your items and their prices, for example, to send to customers. You can create the list for specific customers, campaigns, currencies, or other criteria.';
            }
#endif
            separator(Action93)
            {
            }
            action("Inventory - Sales &Back Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory - Sales &Back Orders';
                Image = "Report";
                RunObject = Report "Inventory - Sales Back Orders";
                ToolTip = 'View a list with the order lines whose shipment date has been exceeded. The following information is shown for the individual orders for each item: number, customer name, customer''s telephone number, shipment date, order quantity and quantity on back order. The report also shows whether there are other items for the customer on back order.';
            }
            separator(Action129)
            {
            }
            action("&G/L Trial Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&G/L Trial Balance';
                Image = "Report";
                RunObject = Report "Trial Balance";
                ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
            }
            action("Trial Balance by &Period")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Trial Balance by &Period';
                Image = "Report";
                RunObject = Report "Trial Balance by Period";
                ToolTip = 'Show the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
            }
            action("Closing T&rial Balance")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Closing T&rial Balance';
                Image = "Report";
                RunObject = Report "Closing Trial Balance";
                ToolTip = 'View this year''s and last year''s figures as an ordinary trial balance. For income statement accounts, the balances are shown without closing entries. Closing entries are listed on a fictitious date that falls between the last day of one fiscal year and the first day of the next one. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
            }
            separator(Action49)
            {
            }
            action("Balance Sheet")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance Sheet';
                Image = "Report";
                RunObject = Report "Balance Sheet";
                ToolTip = 'Print the legal report that is required in Australia for accounts auditing. You can choose to round the amounts in display by tens, hundreds, thousands, hundred thousands or millions factor.';
            }
            action("Income Statement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Income Statement';
                Image = "Report";
                RunObject = Report "Income Statement";
                ToolTip = 'View the income statement.';
            }
            action("Financial Analysis Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Financial Analysis Report';
                Image = "Report";
                RunObject = Report "Financial Analysis Report";
                ToolTip = 'Open a report that compares the Balance at Date, Balance, Net Change, and Budget from the G/L account with budget entries or previous year entries according to your selection.';
            }
            action("Transaction Detail")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Transaction Detail';
                Image = "Report";
                RunObject = Report "Transaction Detail Report";
                ToolTip = 'View the information detail.';
            }
            separator(Action1500009)
            {
            }
            action("Aged Ac&counts Receivable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Ac&counts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
                ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Aged Accounts Pa&yable")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Accounts Pa&yable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
                ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
            }
            action("Reconcile Cust. and &Vend. Accs")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reconcile Cust. and &Vend. Accs';
                Image = "Report";
                RunObject = Report "Reconcile Cust. and Vend. Accs";
                ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
            }
            action("Aged Acc. Rec. (BackDating)")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Acc. Rec. (BackDating)';
                Image = "Report";
                RunObject = Report "Aged Acc. Rec. (BackDating)";
                ToolTip = 'View outstanding balance information based on the selections you make in the report request window.';
            }
            action("Aged Acc. Pay. (BackDating)")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Aged Acc. Pay. (BackDating)';
                Image = "Report";
                RunObject = Report "Aged Acc. Pay. (BackDating)";
                ToolTip = 'View outstanding balance information based on the selections you make in the report request window.';
            }
            action("AU/NZ Statement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'AU/NZ Statement';
                Image = "Report";
                RunObject = Report "AU/NZ Statement";
                ToolTip = 'Print the report of accounts receivable and accounts payable based on the selections you make in the report request window.';
            }
            separator(Action53)
            {
            }
            action("VAT Registration No. Chec&k")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Registration No. Chec&k';
                Image = "Report";
                RunObject = Report "VAT Registration No. Check";
                ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = VAT;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report "VAT Exceptions";
                ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
            }
            action("V&AT Statement")
            {
                ApplicationArea = VAT;
                Caption = 'V&AT Statement';
                Image = "Report";
                RunObject = Report "VAT Statement";
                ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
            }
            action("G/L - VAT Reconciliation")
            {
                ApplicationArea = VAT;
                Caption = 'G/L - VAT Reconciliation';
                Image = "Report";
                RunObject = Report "G/L - VAT Reconciliation";
                ToolTip = 'Verify that the VAT amounts on the VAT statements match the amounts from the G/L entries.';
            }
            action("VAT Report - Vendor")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Report - Vendor';
                Image = "Report";
                RunObject = Report "VAT Report - Vendor";
                ToolTip = 'Run a report of VAT entries for vendors. The report is based on the filters that you set up in the request window.';
            }
            action("VAT Report - Customer")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Report - Customer';
                Image = "Report";
                RunObject = Report "VAT Report - Customer";
                ToolTip = 'Run a report of VAT entries for customers. The report is based on the filters that you set up in the request window.';
            }
            action("Quarterly VAT Return")
            {
                ApplicationArea = VAT;
                Caption = 'Quarterly VAT Return';
                Image = "Report";
                RunObject = Report "Quarterly VAT Return";
                ToolTip = 'Create a new VAT return.';
            }
            action("Monthly VAT Declaration")
            {
                ApplicationArea = VAT;
                Caption = 'Monthly VAT Declaration';
                Image = "Report";
                RunObject = Report "Monthly VAT Declaration";
                ToolTip = 'Start the process of creating the monthly VAT declaration.';
            }
            action("VAT-VIES Declaration Tax A&uth")
            {
                ApplicationArea = BasicEU;
                Caption = 'VAT-VIES Declaration Tax A&uth';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Tax Auth";
                ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
            }
            action("VAT - VIES Declaration &Disk")
            {
                ApplicationArea = BasicEU;
                Caption = 'VAT - VIES Declaration &Disk';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Disk";
                ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
            }
            action("EC Sal&es List")
            {
                ApplicationArea = BasicEU;
                Caption = 'EC Sal&es List';
                Image = "Report";
                RunObject = Report "EC Sales List";
                ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            }
            separator(Action1500017)
            {
            }
            action("WHT PND 1")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'WHT PND 1';
                Image = "Report";
                RunObject = Report "WHT PND 1";
                ToolTip = 'Open the WHT PND 1 report.';
            }
            action("WHT PND 2")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'WHT PND 2';
                Image = "Report";
                RunObject = Report "WHT PND 2";
                ToolTip = 'Open the WHT PND 2 report.';
            }
            action("WHT PND 3")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'WHT PND 3';
                Image = "Report";
                RunObject = Report "WHT PND 3";
                ToolTip = 'Open the WHT PND 3 report.';
            }
            action("WHT PND 53")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'WHT PND 53';
                Image = "Report";
                RunObject = Report "WHT Report - PND 53";
                ToolTip = 'Open the WHT PND 53 report.';
            }
            action("Certificate of Creditable tax")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Certificate of Creditable tax';
                Image = "Report";
                RunObject = Report "Certificate of Creditable tax";
                ToolTip = 'Start the process of submitting the certificate of creditable tax.';
            }
            action("Monthly Remittance Return WHT")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Monthly Remittance Return WHT';
                Image = "Report";
                RunObject = Report "Monthly Remittance Return  WHT";
                ToolTip = 'Start the process of creating the monthly remittance return for withholding tax.';
            }
            action("E-Filing")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'E-Filing';
                Image = "Report";
                RunObject = Report "E-Filing";
                ToolTip = 'Start the electronic submission of withholding tax report.';
            }
            separator(Action1500025)
            {
            }
            action("Bank Account Reconciliation")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Account Reconciliation';
                Image = BankAccountRec;
                RunObject = Report "Bank Account Reconciliation";
                ToolTip = 'Prepare to print a report of bank ledger entries that are not recorded so that it helps in bank reconciliation. This report reconciles the balance of a defined bank account as at a defined date. The report displays open bank ledger entries as either unpresented checks or deposits not recorded.';
            }
        }
        area(embedding)
        {
            action("Sales Quotes")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quotes';
                Image = Quote;
                RunObject = Page "Sales Quotes";
                ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action("Sales Orders - Microsoft Dynamics 365 Sales")
            {
                ApplicationArea = Suite;
                Caption = 'Sales Orders - Microsoft Dynamics 365 Sales';
                RunObject = Page "CRM Sales Order List";
                ToolTip = 'View sales orders in Dynamics 365 Sales that are coupled with sales orders in Business Central.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(VendorsBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
        }
        area(sections)
        {
            group(Journals)
            {
                Caption = 'Journals';
                Image = Journals;
                action(ItemJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Item),
                                        Recurring = CONST(false));
                    ToolTip = 'Open a list of journals where you can adjust the physical quantity of items on inventory.';
                }
                action(PhysicalInventoryJournals)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Physical Inventory Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST("Phys. Inventory"),
                                        Recurring = CONST(false));
                    ToolTip = 'Prepare to count the actual items in inventory to check if the quantity registered in the system is the same as the physical quantity. If there are differences, post them to the item ledger with the physical inventory journal before you do the inventory valuation.';
                }
                action(RevaluationJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revaluation Journals';
                    RunObject = Page "Item Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Revaluation),
                                        Recurring = CONST(false));
                    ToolTip = 'Change the inventory value of items, for example after doing a physical inventory.';
                }
                action("Resource Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Journals';
                    RunObject = Page "Resource Jnl. Batches";
                    RunPageView = WHERE(Recurring = CONST(false));
                    ToolTip = 'View all resource journals.';
                }
                action("FA Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'FA Journals';
                    RunObject = Page "FA Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(false));
                    ToolTip = 'Post entries to a depreciation book without integration to the general ledger.';
                }
                action(CashReceiptJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Receipt Journals';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST("Cash Receipts"),
                                        Recurring = CONST(false));
                    ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
                }
                action(PaymentJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(GeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action(RecurringJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(true));
                    ToolTip = 'View all recurring journals';
                }
            }
            group(Worksheets)
            {
                Caption = 'Worksheets';
                Image = Worksheets;
                action("Requisition Worksheets")
                {
                    ApplicationArea = Planning;
                    Caption = 'Requisition Worksheets';
                    RunObject = Page "Req. Wksh. Names";
                    RunPageView = WHERE("Template Type" = CONST("Req."),
                                        Recurring = CONST(false));
                    ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Sales Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Posted Sales Tax Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Tax Invoices';
                    RunObject = Page "Posted Sales Tax Invoices";
                    ToolTip = 'View the list of posted documents.';
                }
                action("Posted Sales Tax Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Tax Credit Memos';
                    RunObject = Page "Posted Sales Tax Cr. Memos";
                    ToolTip = 'View the list of posted documents.';
                }
                action("Posted Purch. Tax Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purch. Tax Invoices';
                    RunObject = Page "Posted Purch. Tax Invoices";
                    ToolTip = 'View the list of posted documents.';
                }
                action("Posted Purch. Tax Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purch. Tax Credit Memos';
                    RunObject = Page "Posted Purch. Tax Cr. Memos";
                    ToolTip = 'View the list of posted documents.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'View the list of issued reminders.';
                }
                action("Issued Fin. Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Fin. Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'View the list of issued finance charge memos.';
                }
                action("Posted Bank Deposits")
                {
                    Caption = 'Posted Bank Deposits';
                    Image = PostedDeposit;
                    RunObject = codeunit "Open P. Bank Deposits L. Page";
                    ToolTip = 'View the posted bank deposit header, bank deposit header lines, bank deposit comments, and bank deposit dimensions.';
                }
            }
            group(Finance)
            {
                Caption = 'Finance';
                Image = Bank;
                action("VAT Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'VAT Statements';
                    RunObject = Page "VAT Statement Names";
                    ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
                }
                action("Chart of Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View the chart of accounts.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action(Currencies)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }
                action("Accounting Periods")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                    ToolTip = 'Set up the number of accounting periods, such as 12 monthly periods, within the fiscal year and specify which period is the start of the new fiscal year.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Bank Account Posting Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Posting Groups';
                    RunObject = Page "Bank Account Posting Groups";
                    ToolTip = 'Set up posting groups, so that payments in and out of each bank account are posted to the specified general ledger account.';
                }
            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                action("Deposits to Post")
                {
                    Caption = 'Bank Deposits to Post';
                    RunObject = codeunit "Open Deposits Page";
                    ToolTip = 'View the list of bank deposits that are ready to post.';
                }
            }
            group(Marketing)
            {
                Caption = 'Marketing';
                Image = Marketing;
                action(Contacts)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contacts';
                    Image = CustomerContact;
                    RunObject = Page "Contact List";
                    ToolTip = 'View a list of all your contacts.';
                }
                action(Tasks)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tasks';
                    Image = TaskList;
                    RunObject = Page "Task List";
                    ToolTip = 'View the list of marketing tasks that exist.';
                }
            }
            group(Sales)
            {
                Caption = 'Sales';
                Image = Sales;
                action("Assembly BOM")
                {
                    ApplicationArea = Assembly;
                    Caption = 'Assembly BOM';
                    Image = AssemblyBOM;
                    RunObject = Page "Assembly BOM";
                    ToolTip = 'View or edit the bill of material that specifies which items and resources are required to assemble the assembly item.';
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Credit Memos';
                    RunObject = Page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action("Standard Sales Codes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Standard Sales Codes';
                    RunObject = Page "Standard Sales Codes";
                    ToolTip = 'View or edit purchase lines that you have set up for recurring sales, such as a monthly replenishment order.';
                }
                action("Salespeople/Purchasers")
                {
                    ApplicationArea = Suite;
                    Caption = 'Salespeople/Purchasers';
                    RunObject = Page "Salespersons/Purchasers";
                    ToolTip = 'View a list of your sales people and your purchasers.';
                }
                action("Customer Invoice Discount")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Invoice Discount';
                    RunObject = Page "Cust. Invoice Discounts";
                    ToolTip = 'View or edit conditions for invoice discounts and service charges for different customers.';
                }
            }
            group(Purchasing)
            {
                Caption = 'Purchasing';
                Image = Purchasing;
                action("Standard Purchase Codes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Standard Purchase Codes';
                    RunObject = Page "Standard Purchase Codes";
                    ToolTip = 'View or edit purchase lines that you have set up for recurring purchases, such as a monthly replenishment order.';
                }
                action("Vendor Invoice Discounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor Invoice Discounts';
                    RunObject = Page "Vend. Invoice Discounts";
                    ToolTip = 'View or edit conditions for when your vendors grant you invoice discounts. Each line contains a set of conditions for an invoice discount. You can set up as many lines as necessary if you receive different discount percentages for different invoice amounts and for different currencies.';
                }
                action("Item Discount Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Discount Groups';
                    RunObject = Page "Item Disc. Groups";
                    ToolTip = 'Set up discount group codes that you can use as criteria when you define special discounts on a customer, vendor, or item card.';
                }
            }
            group(Resources)
            {
                Caption = 'Resources';
                Image = ResourcePlanning;
                action(Action126)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resources';
                    RunObject = Page "Resource List";
                    ToolTip = 'Manage your resources'' job activities by setting up their costs and prices. The job-related prices, discounts, and cost factor rules are set up on the respective job card. You can specify the costs and prices for individual resources, resource groups, or all available resources of the company. When resources are used or sold in a job, the specified prices and costs are recorded for the project.';
                }
                action("Resource Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Groups';
                    RunObject = Page "Resource Groups";
                    ToolTip = 'View all resource groups.';
                }
#if not CLEAN21
                action("Resource Price Changes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Price Changes';
                    Image = ResourcePrice;
                    RunObject = Page "Resource Price Changes";
                    ToolTip = 'Edit or update alternate resource prices, by running either the Suggest Res. Price Chg. (Res.) batch job or the Suggest Res. Price Chg. (Price) batch job.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';
                }
#endif
                action("Resource Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Registers';
                    Image = ResourceRegisters;
                    RunObject = Page "Resource Registers";
                    ToolTip = 'View a list of all the resource registers. Every time a resource entry is posted, a register is created. Every register shows the first and last entry numbers of its entries. You can use the information in a resource register to document when entries were posted.';
                }
            }
            group("Human Resources")
            {
                Caption = 'Human Resources';
                Image = HumanResources;
                action(Employees)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Employees';
                    Image = Employee;
                    RunObject = Page "Employee List";
                    ToolTip = 'Manage employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                }
            }
            group("Fixed Assets")
            {
                Caption = 'Fixed Assets';
                Image = FixedAssets;
                action(Action17)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Fixed Assets';
                    RunObject = Page "Fixed Asset List";
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action("User Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Setup';
                    Image = UserSetup;
                    RunObject = Page "User Setup";
                    ToolTip = 'Set up users and define their permissions..';
                }
                action("Data Templates List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Data Templates List';
                    RunObject = Page "Config. Template List";
                    ToolTip = 'View or edit template that are being used for data migration.';
                }
                action("Base Calendar List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Base Calendar List';
                    RunObject = Page "Base Calendar List";
                    ToolTip = 'View the list of calendars that exist for your company and your business partners to define the agreed working days.';
                }
                action("Post Codes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post Codes';
                    RunObject = Page "Post Codes";
                    ToolTip = 'Set up the post codes of cities where your business partners are located.';
                }
                action("Reason Codes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Reason Codes';
                    RunObject = Page "Reason Codes";
                    ToolTip = 'View or set up codes that specify reasons why entries were created, such as Return, to specify why a purchase credit memo was posted.';
                }
                action("Extended Texts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Extended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    ToolTip = 'View or edit additional text for the descriptions of items. Extended text can be inserted under the Description field on document lines for the item.';
                }
            }
        }
        area(creation)
        {
            action("C&ustomer")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'C&ustomer';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Customer Card";
                RunPageMode = Create;
                ToolTip = 'Create a new customer card.';
            }
            action("Sales &Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales Credit &Memo")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Credit &Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
            }
            action("&Sales Reminder")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Sales Reminder';
                Image = Reminder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Reminder;
                RunPageMode = Create;
                ToolTip = 'Create a reminder to remind a customer of overdue payment.';
            }
            action(Deposit)
            {
                Caption = 'Bank Deposit';
                Image = DepositSlip;
                RunObject = codeunit "Open Deposit Page";
                ToolTip = 'Create a new bank deposit. ';
            }
            separator(Action5)
            {
            }
            action("&Vendor")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Vendor';
                Image = Vendor;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Vendor Card";
                RunPageMode = Create;
                ToolTip = 'Set up a new vendor from whom you buy goods or services. ';
            }
            action("&Purchase Order")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Purchase Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Purchase goods or services from a vendor.';
            }
        }
        area(processing)
        {
            separator(Action13)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Cash Receipt &Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Receipt &Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
                ToolTip = 'Open the cash receipt journal to post incoming payments.';
            }
            action("Vendor Pa&yment Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor Pa&yment Journal';
                Image = VendorPaymentJournal;
                RunObject = Page "Payment Journal";
                ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
            }
#if not CLEAN21
            action("Sales Price &Worksheet")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Price &Worksheet';
                Image = PriceWorksheet;
                RunPageView = WHERE("Object Type" = CONST(Page), "Object ID" = CONST(7023)); // "Sales Price Worksheet";
                RunObject = Page "Role Center Page Dispatcher";
                ToolTip = 'Manage sales prices for individual customers, for a group of customers, for all customers, or for a campaign.';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '17.0';
            }
            action("Sales P&rices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales P&rices';
                Image = SalesPrices;
                RunPageView = WHERE("Object Type" = CONST(Page), "Object ID" = CONST(7002)); // "Sales Prices";
                RunObject = Page "Role Center Page Dispatcher";
                ToolTip = 'View or edit special sales prices that you grant when certain conditions are met, such as customer, quantity, or ending date. The price agreements can be for individual customers, for a group of customers, for all customers or for a campaign.';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '17.0';
            }
            action("Sales &Line Discounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales &Line Discounts';
                Image = SalesLineDisc;
                RunPageView = WHERE("Object Type" = CONST(Page), "Object ID" = CONST(7004)); // "Sales Line Discounts";
                RunObject = Page "Role Center Page Dispatcher";
                ToolTip = 'View the sales line discounts that are available. These discount agreements can be for individual customers, for a group of customers, for all customers or for a campaign.';
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '17.0';
            }
#else
            action("Sales Price &Worksheet")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Price &Worksheet';
                Image = PriceWorksheet;
                RunObject = Page "Price Worksheet";
                ToolTip = 'Manage sales prices for individual customers, for a group of customers, for all customers, or for a campaign.';
            }
            action("Price Lists")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Prices';
                Image = SalesPrices;
                RunObject = Page "Sales Price Lists";
                ToolTip = 'View or set up sales price lists for products that you sell to the customer. A product price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
            }
#endif
            separator(Action19)
            {
            }
            action("&Bank Account Reconciliation")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Bank Account Reconciliation';
                Image = BankAccountRec;
                RunObject = Page "Bank Acc. Reconciliation";
                ToolTip = 'Reconcile entries in your bank account ledger entries with the actual transactions in your bank account, according to the latest bank statement. ';
            }
            action("Payment Registration")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payment Registration';
                Image = Payment;
                RunObject = Codeunit "Payment Registration Mgt.";
                ToolTip = 'Apply customer payments observed on your bank account to non-posted sales documents to record that payment is made.';
            }
            action("Adjust E&xchange Rates")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Adjust E&xchange Rates';
                Ellipsis = true;
                Image = AdjustExchangeRates;
                RunObject = Codeunit "Exch. Rate Adjmt. Run Handler";
                ToolTip = 'Adjust general ledger, customer, vendor, and bank account entries to reflect a more updated balance if the exchange rate has changed since the entries were posted.';
            }
            action("Adjust &Item Costs/Prices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Adjust &Item Costs/Prices';
                Image = AdjustItemCost;
                RunObject = Report "Adjust Item Costs/Prices";
                ToolTip = 'Adjusts the Last Direct Cost, Standard Cost, Unit Price, Profit %, and Indirect Cost % fields on the item or stockkeeping unit cards. For example, you can change Last Direct Cost by 5% on all items from a specific vendor. The changes are processed immediately when the batch job is started. The fields on the item card that are dependent on the adjusted field are also changed.';
            }
            action("Adjust &Cost - Item Entries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Adjust &Cost - Item Entries';
                Image = AdjustEntries;
                RunObject = Report "Adjust Cost - Item Entries";
                ToolTip = 'Adjust inventory values in value entries so that you use the correct adjusted cost for updating the general ledger and so that sales and profit statistics are up to date.';
            }
            action("Post Inve&ntory Cost to G/L")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Inve&ntory Cost to G/L';
                Ellipsis = true;
                Image = PostInventoryToGL;
                RunObject = Report "Post Inventory Cost to G/L";
                ToolTip = 'Post the quantity and value changes to the inventory in the item ledger entries and the value entries when you post inventory transactions, such as sales shipments or purchase receipts.';
            }
            group("Tax Settlement")
            {
                Caption = 'Tax Settlement';
                action("Calc. and Post VAT Settlem&ent")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Calc. and Post VAT Settlem&ent';
                    Ellipsis = true;
                    Image = SettleOpenTransactions;
                    RunObject = Report "Calc. and Post VAT Settlement";
                    ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
                }
                action("Calc. and Post WHT Settlement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Calc. and Post WHT Settlement';
                    Image = "Report";
                    RunObject = Report "Calc. and Post WHT Settlement";
                    ToolTip = 'Start the process of calculating and posting the withholding tax settlement.';
                }
                action("Adjust Settlement Exch. Rates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Adjust Settlement Exch. Rates';
                    Image = "Report";
                    RunObject = Report "Adjust Settlement Exch. Rates";
                    ToolTip = 'Settle the VAT entries to the government exchange rate based on the dates that you specify. You can also specify if you want to use a daily settlement exchange rate.';
                }
                action("Calculate GST Settlement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Calculate GST Settlement';
                    Image = CalculateSalesTax;
                    RunObject = Report "Calculate GST Settlement";
                    ToolTip = 'Start the process of calculating the GST settlement.';
                }
            }
            group(BAS)
            {
                Caption = 'BAS';
                action("BAS-Update")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'BAS-Update';
                    Image = "Report";
                    RunObject = Report "BAS-Update";
                    ToolTip = 'Start the process of submiting a new Business Activity Statement (BAS).';
                }
                action("Print BAS Export File")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Print BAS Export File';
                    Image = "Report";
                    RunObject = Report "Print BAS Export File";
                    ToolTip = 'Start the process of printing the business activity statement (BAS) export file.';
                }
                action("BAS Calculation Sheet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'BAS Calculation Sheet';
                    Image = CalculateVAT;
                    RunObject = Page "BAS Calculation Sheet";
                    ToolTip = 'View or edit the business activity statement (BAS) calculation information for goods and services tax (GST).';
                }
                action("BAS Setup Preview")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'BAS Setup Preview';
                    Image = View;
                    RunObject = Page "BAS Setup Preview";
                    ToolTip = 'See a preview of the BAS. Optionally, export the preview to Excel for manual adjustments.';
                }
            }
            separator(Action31)
            {
                Caption = 'Administration';
                IsHeader = true;
            }
            action("General Le&dger Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'General Le&dger Setup';
                Image = Setup;
                RunObject = Page "General Ledger Setup";
                ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
            }
            action("S&ales && Receivables Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'S&ales && Receivables Setup';
                Image = Setup;
                RunObject = Page "Sales & Receivables Setup";
                ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
            }
            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                RunObject = Page Navigate;
                ShortCutKey = 'Ctrl+Alt+Q';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
        }
    }
}

