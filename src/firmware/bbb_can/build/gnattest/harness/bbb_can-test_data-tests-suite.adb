--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body BBB_CAN.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.BBB_CAN.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_bf9922 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Handshake_5f7b88 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Send_006149 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Get_bd4d93 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Bytes_To_Message_d4818d : aliased Runner_1.Test_Case;
   Case_6_1_Test_Message_To_Bytes_a63283 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Calculate_Checksum_e6925f : aliased Runner_1.Test_Case;
   Case_8_1_Test_Usart_Write_e4c49d : aliased Runner_1.Test_Case;
   Case_9_1_Test_Usart_Read_71be54 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_bf9922,
         "bbb_can.ads:58:4:",
         Test_Init_bf9922'Access);
      Runner_1.Create
        (Case_2_1_Test_Handshake_5f7b88,
         "bbb_can.ads:62:4:",
         Test_Handshake_5f7b88'Access);
      Runner_1.Create
        (Case_3_1_Test_Send_006149,
         "bbb_can.ads:64:4:",
         Test_Send_006149'Access);
      Runner_1.Create
        (Case_4_1_Test_Get_bd4d93,
         "bbb_can.ads:66:4:",
         Test_Get_bd4d93'Access);
      Runner_1.Create
        (Case_5_1_Test_Bytes_To_Message_d4818d,
         "bbb_can.ads:71:4:",
         Test_Bytes_To_Message_d4818d'Access);
      Runner_1.Create
        (Case_6_1_Test_Message_To_Bytes_a63283,
         "bbb_can.ads:73:4:",
         Test_Message_To_Bytes_a63283'Access);
      Runner_1.Create
        (Case_7_1_Test_Calculate_Checksum_e6925f,
         "bbb_can.ads:75:4:",
         Test_Calculate_Checksum_e6925f'Access);
      Runner_1.Create
        (Case_8_1_Test_Usart_Write_e4c49d,
         "bbb_can.ads:77:4:",
         Test_Usart_Write_e4c49d'Access);
      Runner_1.Create
        (Case_9_1_Test_Usart_Read_71be54,
         "bbb_can.ads:79:4:",
         Test_Usart_Read_71be54'Access);

      Result.Add_Test (Case_1_1_Test_Init_bf9922'Access);
      Result.Add_Test (Case_2_1_Test_Handshake_5f7b88'Access);
      Result.Add_Test (Case_3_1_Test_Send_006149'Access);
      Result.Add_Test (Case_4_1_Test_Get_bd4d93'Access);
      Result.Add_Test (Case_5_1_Test_Bytes_To_Message_d4818d'Access);
      Result.Add_Test (Case_6_1_Test_Message_To_Bytes_a63283'Access);
      Result.Add_Test (Case_7_1_Test_Calculate_Checksum_e6925f'Access);
      Result.Add_Test (Case_8_1_Test_Usart_Write_e4c49d'Access);
      Result.Add_Test (Case_9_1_Test_Usart_Read_71be54'Access);

      return Result'Access;

   end Suite;

end BBB_CAN.Test_Data.Tests.Suite;
--  end read only
