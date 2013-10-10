with AVR.AT90CAN128;
use  AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
use  AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CALENDAR;
use  AVR.AT90CAN128.CALENDAR;

procedure test is
   pragma Suppress (All_Checks);


begin
   Can_Init(K100);
end test;
