codeunit 50140 "Threshold Setup Mangement"
{
    procedure RunThresholdSetup(var thresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: page "Threshold Setup";
    begin
        ThresholdSetupPage.Run();
    end;
}