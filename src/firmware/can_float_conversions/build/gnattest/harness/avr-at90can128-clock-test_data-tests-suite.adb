--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AVR.AT90CAN128.CLOCK.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AVR.AT90CAN128.CLOCK.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_getClockTime_db38bc : aliased Runner_1.Test_Case;
   Case_2_1_Test_Plus_f21a46 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Plus_64aca2 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Minus_398eb1 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Minus_71e8e5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Less_Than_156305 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Less_Than_Or_Equal_e0598d : aliased Runner_1.Test_Case;
   Case_8_1_Test_Greater_Than_378683 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Greater_Than_Or_Equal_e8ea03 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Delay_ms_fc632a : aliased Runner_1.Test_Case;
   Case_11_1_Test_Delay_Until_ee71b6 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Init_bf9922 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_getClockTime_db38bc,
         "avr-at90can128-clock.ads:8:4:",
         Test_getClockTime_db38bc'Access);
      Runner_1.Create
        (Case_2_1_Test_Plus_f21a46,
         "avr-at90can128-clock.ads:10:4:",
         Test_Plus_f21a46'Access);
      Runner_1.Create
        (Case_3_1_Test_Plus_64aca2,
         "avr-at90can128-clock.ads:15:4:",
         Test_Plus_64aca2'Access);
      Runner_1.Create
        (Case_4_1_Test_Minus_398eb1,
         "avr-at90can128-clock.ads:20:4:",
         Test_Minus_398eb1'Access);
      Runner_1.Create
        (Case_5_1_Test_Minus_71e8e5,
         "avr-at90can128-clock.ads:25:4:",
         Test_Minus_71e8e5'Access);
      Runner_1.Create
        (Case_6_1_Test_Less_Than_156305,
         "avr-at90can128-clock.ads:30:4:",
         Test_Less_Than_156305'Access);
      Runner_1.Create
        (Case_7_1_Test_Less_Than_Or_Equal_e0598d,
         "avr-at90can128-clock.ads:34:4:",
         Test_Less_Than_Or_Equal_e0598d'Access);
      Runner_1.Create
        (Case_8_1_Test_Greater_Than_378683,
         "avr-at90can128-clock.ads:38:4:",
         Test_Greater_Than_378683'Access);
      Runner_1.Create
        (Case_9_1_Test_Greater_Than_Or_Equal_e8ea03,
         "avr-at90can128-clock.ads:42:4:",
         Test_Greater_Than_Or_Equal_e8ea03'Access);
      Runner_1.Create
        (Case_10_1_Test_Delay_ms_fc632a,
         "avr-at90can128-clock.ads:46:4:",
         Test_Delay_ms_fc632a'Access);
      Runner_1.Create
        (Case_11_1_Test_Delay_Until_ee71b6,
         "avr-at90can128-clock.ads:49:4:",
         Test_Delay_Until_ee71b6'Access);
      Runner_1.Create
        (Case_12_1_Test_Init_bf9922,
         "avr-at90can128-clock.ads:52:4:",
         Test_Init_bf9922'Access);

      Result.Add_Test (Case_1_1_Test_getClockTime_db38bc'Access);
      Result.Add_Test (Case_2_1_Test_Plus_f21a46'Access);
      Result.Add_Test (Case_3_1_Test_Plus_64aca2'Access);
      Result.Add_Test (Case_4_1_Test_Minus_398eb1'Access);
      Result.Add_Test (Case_5_1_Test_Minus_71e8e5'Access);
      Result.Add_Test (Case_6_1_Test_Less_Than_156305'Access);
      Result.Add_Test (Case_7_1_Test_Less_Than_Or_Equal_e0598d'Access);
      Result.Add_Test (Case_8_1_Test_Greater_Than_378683'Access);
      Result.Add_Test (Case_9_1_Test_Greater_Than_Or_Equal_e8ea03'Access);
      Result.Add_Test (Case_10_1_Test_Delay_ms_fc632a'Access);
      Result.Add_Test (Case_11_1_Test_Delay_Until_ee71b6'Access);
      Result.Add_Test (Case_12_1_Test_Init_bf9922'Access);

      return Result'Access;

   end Suite;

end AVR.AT90CAN128.CLOCK.Test_Data.Tests.Suite;
--  end read only
