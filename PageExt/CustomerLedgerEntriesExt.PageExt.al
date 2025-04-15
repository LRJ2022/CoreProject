pageextension 50101 "cust.Ledger Entry PageExt" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(NumberOfDaysExpired; NumberOfDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of days Expired';
                ToolTip = 'The number of days this entry is expired, based upoun due date and today';
                StyleExpr = DaysExpiredStyle;
            }
        }
        addfirst(factboxes)
        {
            part(CustomerReminderFactbox; "sol Customer Reminder Factbox")
            {
                SubPageLink = "Customer Entry No." = field("Entry No.");
                ApplicationArea = All;
            }
        }
    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;

                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due Date")
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not ThresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetRecord()
    var
        StyleEnum: Enum "Style Type";
    begin
        NumberOfDaysExpired := rec.GetNumberOfDaysExpired();
        case NumberOfDaysExpired of
            ThresholdSetup."Threshold 1 Value" ..
              ThresholdSetup."Threshold 2 Value":
                DaysExpiredStyle := Format(ThresholdSetup."Threshold 1 Style");

            ThresholdSetup."Threshold 2 Value" .. 99999:
                DaysExpiredStyle := Format(ThresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := Format(StyleEnum::None);
        end;
    end;

    procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        runThresholdSetuplbl: Label 'You need to run the Threshold Setup', Comment = 'Commen for thresholdsetup';
        runThresholdClicklbl: Label 'Click here to run ThresholdSetup', Comment = 'Comment for click';

    begin
        ThresholdSetupNotification.Message(runThresholdSetuplbl);
        ThresholdSetupNotification.AddAction(runThresholdClicklbl, Codeunit::"Threshold Setup Mangement", 'RunThresholdSetup');
        ThresholdSetupNotification.Send();
    end;


    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        ThresholdSetup: Record "Threshold Setup";


}