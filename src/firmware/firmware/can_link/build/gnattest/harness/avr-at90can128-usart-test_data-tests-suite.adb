--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AVR.AT90CAN128.USART.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AVR.AT90CAN128.USART.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_cc98cf : aliased Runner_1.Test_Case;
   Case_2_1_Test_Put_bf0d89 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Write_b20aeb : aliased Runner_1.Test_Case;
   Case_4_1_Test_Data_Available_fceaf9 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Get_Char_123568 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Read_d4720d : aliased Runner_1.Test_Case;
   Case_7_1_Test_Flush_Receive_Buffer_ffa7d4 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_cc98cf,
         "avr-at90can128-usart.ads:7:4:",
         Test_Init_cc98cf'Access);
      Runner_1.Create
        (Case_2_1_Test_Put_bf0d89,
         "avr-at90can128-usart.ads:9:4:",
         Test_Put_bf0d89'Access);
      Runner_1.Create
        (Case_3_1_Test_Write_b20aeb,
         "avr-at90can128-usart.ads:14:4:",
         Test_Write_b20aeb'Access);
      Runner_1.Create
        (Case_4_1_Test_Data_Available_fceaf9,
         "avr-at90can128-usart.ads:19:4:",
         Test_Data_Available_fceaf9'Access);
      Runner_1.Create
        (Case_5_1_Test_Get_Char_123568,
         "avr-at90can128-usart.ads:23:4:",
         Test_Get_Char_123568'Access);
      Runner_1.Create
        (Case_6_1_Test_Read_d4720d,
         "avr-at90can128-usart.ads:25:4:",
         Test_Read_d4720d'Access);
      Runner_1.Create
        (Case_7_1_Test_Flush_Receive_Buffer_ffa7d4,
         "avr-at90can128-usart.ads:31:4:",
         Test_Flush_Receive_Buffer_ffa7d4'Access);

      Result.Add_Test (Case_1_1_Test_Init_cc98cf'Access);
      Result.Add_Test (Case_2_1_Test_Put_bf0d89'Access);
      Result.Add_Test (Case_3_1_Test_Write_b20aeb'Access);
      Result.Add_Test (Case_4_1_Test_Data_Available_fceaf9'Access);
      Result.Add_Test (Case_5_1_Test_Get_Char_123568'Access);
      Result.Add_Test (Case_6_1_Test_Read_d4720d'Access);
      Result.Add_Test (Case_7_1_Test_Flush_Receive_Buffer_ffa7d4'Access);

      return Result'Access;

   end Suite;

end AVR.AT90CAN128.USART.Test_Data.Tests.Suite;
--  end read only
