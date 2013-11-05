--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AVR.AT90CAN128.CAN.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AVR.AT90CAN128.CAN.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Can_Init_9ae941 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Can_SetBaudRate_1227a5 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Can_Enable_5d3bf8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Can_Disable_8509b2 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Can_Enable_Reception_3755dd : aliased Runner_1.Test_Case;
   Case_6_1_Test_Can_Send_97cec3 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Can_Get_382456 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Can_Valid_Message_253ef8 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Can_Init_9ae941,
         "avr-at90can128-can.ads:21:4:",
         Test_Can_Init_9ae941'Access);
      Runner_1.Create
        (Case_2_1_Test_Can_SetBaudRate_1227a5,
         "avr-at90can128-can.ads:22:4:",
         Test_Can_SetBaudRate_1227a5'Access);
      Runner_1.Create
        (Case_3_1_Test_Can_Enable_5d3bf8,
         "avr-at90can128-can.ads:23:4:",
         Test_Can_Enable_5d3bf8'Access);
      Runner_1.Create
        (Case_4_1_Test_Can_Disable_8509b2,
         "avr-at90can128-can.ads:24:4:",
         Test_Can_Disable_8509b2'Access);
      Runner_1.Create
        (Case_5_1_Test_Can_Enable_Reception_3755dd,
         "avr-at90can128-can.ads:26:4:",
         Test_Can_Enable_Reception_3755dd'Access);
      Runner_1.Create
        (Case_6_1_Test_Can_Send_97cec3,
         "avr-at90can128-can.ads:28:4:",
         Test_Can_Send_97cec3'Access);
      Runner_1.Create
        (Case_7_1_Test_Can_Get_382456,
         "avr-at90can128-can.ads:29:4:",
         Test_Can_Get_382456'Access);
      Runner_1.Create
        (Case_8_1_Test_Can_Valid_Message_253ef8,
         "avr-at90can128-can.ads:30:4:",
         Test_Can_Valid_Message_253ef8'Access);

      Result.Add_Test (Case_1_1_Test_Can_Init_9ae941'Access);
      Result.Add_Test (Case_2_1_Test_Can_SetBaudRate_1227a5'Access);
      Result.Add_Test (Case_3_1_Test_Can_Enable_5d3bf8'Access);
      Result.Add_Test (Case_4_1_Test_Can_Disable_8509b2'Access);
      Result.Add_Test (Case_5_1_Test_Can_Enable_Reception_3755dd'Access);
      Result.Add_Test (Case_6_1_Test_Can_Send_97cec3'Access);
      Result.Add_Test (Case_7_1_Test_Can_Get_382456'Access);
      Result.Add_Test (Case_8_1_Test_Can_Valid_Message_253ef8'Access);

      return Result'Access;

   end Suite;

end AVR.AT90CAN128.CAN.Test_Data.Tests.Suite;
--  end read only
