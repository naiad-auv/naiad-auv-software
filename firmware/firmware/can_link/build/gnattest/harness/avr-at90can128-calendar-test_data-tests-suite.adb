--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AVR.AT90CAN128.CALENDAR.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AVR.AT90CAN128.CALENDAR.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Clock_4df497 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Plus_9d85b3 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Plus_97af1f : aliased Runner_1.Test_Case;
   Case_4_1_Test_Minus_991b1b : aliased Runner_1.Test_Case;
   Case_5_1_Test_Minus_5e3f7b : aliased Runner_1.Test_Case;
   Case_6_1_Test_Less_Than_a830ad : aliased Runner_1.Test_Case;
   Case_7_1_Test_Less_Than_Or_Equal_fda296 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Greater_Than_782ae9 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Greater_Than_Or_Equal_1f6514 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Delay_ms_bb00d9 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Delay_Until_bbd367 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Init_bf9922 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Clock_4df497,
         "avr-at90can128-calendar.ads:8:4:",
         Test_Clock_4df497'Access);
      Runner_1.Create
        (Case_2_1_Test_Plus_9d85b3,
         "avr-at90can128-calendar.ads:10:4:",
         Test_Plus_9d85b3'Access);
      Runner_1.Create
        (Case_3_1_Test_Plus_97af1f,
         "avr-at90can128-calendar.ads:15:4:",
         Test_Plus_97af1f'Access);
      Runner_1.Create
        (Case_4_1_Test_Minus_991b1b,
         "avr-at90can128-calendar.ads:20:4:",
         Test_Minus_991b1b'Access);
      Runner_1.Create
        (Case_5_1_Test_Minus_5e3f7b,
         "avr-at90can128-calendar.ads:25:4:",
         Test_Minus_5e3f7b'Access);
      Runner_1.Create
        (Case_6_1_Test_Less_Than_a830ad,
         "avr-at90can128-calendar.ads:30:4:",
         Test_Less_Than_a830ad'Access);
      Runner_1.Create
        (Case_7_1_Test_Less_Than_Or_Equal_fda296,
         "avr-at90can128-calendar.ads:34:4:",
         Test_Less_Than_Or_Equal_fda296'Access);
      Runner_1.Create
        (Case_8_1_Test_Greater_Than_782ae9,
         "avr-at90can128-calendar.ads:38:4:",
         Test_Greater_Than_782ae9'Access);
      Runner_1.Create
        (Case_9_1_Test_Greater_Than_Or_Equal_1f6514,
         "avr-at90can128-calendar.ads:42:4:",
         Test_Greater_Than_Or_Equal_1f6514'Access);
      Runner_1.Create
        (Case_10_1_Test_Delay_ms_bb00d9,
         "avr-at90can128-calendar.ads:46:4:",
         Test_Delay_ms_bb00d9'Access);
      Runner_1.Create
        (Case_11_1_Test_Delay_Until_bbd367,
         "avr-at90can128-calendar.ads:49:4:",
         Test_Delay_Until_bbd367'Access);
      Runner_1.Create
        (Case_12_1_Test_Init_bf9922,
         "avr-at90can128-calendar.ads:52:4:",
         Test_Init_bf9922'Access);

      Result.Add_Test (Case_1_1_Test_Clock_4df497'Access);
      Result.Add_Test (Case_2_1_Test_Plus_9d85b3'Access);
      Result.Add_Test (Case_3_1_Test_Plus_97af1f'Access);
      Result.Add_Test (Case_4_1_Test_Minus_991b1b'Access);
      Result.Add_Test (Case_5_1_Test_Minus_5e3f7b'Access);
      Result.Add_Test (Case_6_1_Test_Less_Than_a830ad'Access);
      Result.Add_Test (Case_7_1_Test_Less_Than_Or_Equal_fda296'Access);
      Result.Add_Test (Case_8_1_Test_Greater_Than_782ae9'Access);
      Result.Add_Test (Case_9_1_Test_Greater_Than_Or_Equal_1f6514'Access);
      Result.Add_Test (Case_10_1_Test_Delay_ms_bb00d9'Access);
      Result.Add_Test (Case_11_1_Test_Delay_Until_bbd367'Access);
      Result.Add_Test (Case_12_1_Test_Init_bf9922'Access);

      return Result'Access;

   end Suite;

end AVR.AT90CAN128.CALENDAR.Test_Data.Tests.Suite;
--  end read only
