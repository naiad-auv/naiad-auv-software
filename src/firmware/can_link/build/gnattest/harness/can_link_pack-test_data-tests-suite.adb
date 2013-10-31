--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body CAN_Link_pack.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.CAN_Link_pack.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Calculate_Checksum_7699a5 : aliased Runner_1.Test_Case;
   Case_2_1_Test_usart_write_17f8a1 : aliased Runner_1.Test_Case;
   Case_3_1_Test_usart_Read_78e0e3 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Send_CanData_To_Qseven_bf8957 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Send_CanData_To_Can_d35b56 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Send_Serial_Data_Out_36aea2 : aliased Runner_1.Test_Case;
   Case_7_1_Test_CANBUS_Monitoring_33fa33 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Qseven_Cmd_Handler_bfa791 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Wait_For_Reply_bd7220 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Send_Reply_25b07b : aliased Runner_1.Test_Case;
   Case_11_1_Test_HandshakeWithQseven_ccd8f0 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Main_Loop_e916b3 : aliased Runner_1.Test_Case;
   Case_13_1_Test_hardware_init_f8f1ce : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Calculate_Checksum_7699a5,
         "can_link_pack.ads:53:4:",
         Test_Calculate_Checksum_7699a5'Access);
      Runner_1.Create
        (Case_2_1_Test_usart_write_17f8a1,
         "can_link_pack.ads:55:4:",
         Test_usart_write_17f8a1'Access);
      Runner_1.Create
        (Case_3_1_Test_usart_Read_78e0e3,
         "can_link_pack.ads:57:4:",
         Test_usart_Read_78e0e3'Access);
      Runner_1.Create
        (Case_4_1_Test_Send_CanData_To_Qseven_bf8957,
         "can_link_pack.ads:60:4:",
         Test_Send_CanData_To_Qseven_bf8957'Access);
      Runner_1.Create
        (Case_5_1_Test_Send_CanData_To_Can_d35b56,
         "can_link_pack.ads:62:4:",
         Test_Send_CanData_To_Can_d35b56'Access);
      Runner_1.Create
        (Case_6_1_Test_Send_Serial_Data_Out_36aea2,
         "can_link_pack.ads:64:4:",
         Test_Send_Serial_Data_Out_36aea2'Access);
      Runner_1.Create
        (Case_7_1_Test_CANBUS_Monitoring_33fa33,
         "can_link_pack.ads:66:4:",
         Test_CANBUS_Monitoring_33fa33'Access);
      Runner_1.Create
        (Case_8_1_Test_Qseven_Cmd_Handler_bfa791,
         "can_link_pack.ads:68:4:",
         Test_Qseven_Cmd_Handler_bfa791'Access);
      Runner_1.Create
        (Case_9_1_Test_Wait_For_Reply_bd7220,
         "can_link_pack.ads:70:4:",
         Test_Wait_For_Reply_bd7220'Access);
      Runner_1.Create
        (Case_10_1_Test_Send_Reply_25b07b,
         "can_link_pack.ads:72:4:",
         Test_Send_Reply_25b07b'Access);
      Runner_1.Create
        (Case_11_1_Test_HandshakeWithQseven_ccd8f0,
         "can_link_pack.ads:74:4:",
         Test_HandshakeWithQseven_ccd8f0'Access);
      Runner_1.Create
        (Case_12_1_Test_Main_Loop_e916b3,
         "can_link_pack.ads:76:4:",
         Test_Main_Loop_e916b3'Access);
      Runner_1.Create
        (Case_13_1_Test_hardware_init_f8f1ce,
         "can_link_pack.ads:78:4:",
         Test_hardware_init_f8f1ce'Access);

      Result.Add_Test (Case_1_1_Test_Calculate_Checksum_7699a5'Access);
      Result.Add_Test (Case_2_1_Test_usart_write_17f8a1'Access);
      Result.Add_Test (Case_3_1_Test_usart_Read_78e0e3'Access);
      Result.Add_Test (Case_4_1_Test_Send_CanData_To_Qseven_bf8957'Access);
      Result.Add_Test (Case_5_1_Test_Send_CanData_To_Can_d35b56'Access);
      Result.Add_Test (Case_6_1_Test_Send_Serial_Data_Out_36aea2'Access);
      Result.Add_Test (Case_7_1_Test_CANBUS_Monitoring_33fa33'Access);
      Result.Add_Test (Case_8_1_Test_Qseven_Cmd_Handler_bfa791'Access);
      Result.Add_Test (Case_9_1_Test_Wait_For_Reply_bd7220'Access);
      Result.Add_Test (Case_10_1_Test_Send_Reply_25b07b'Access);
      Result.Add_Test (Case_11_1_Test_HandshakeWithQseven_ccd8f0'Access);
      Result.Add_Test (Case_12_1_Test_Main_Loop_e916b3'Access);
      Result.Add_Test (Case_13_1_Test_hardware_init_f8f1ce'Access);

      return Result'Access;

   end Suite;

end CAN_Link_pack.Test_Data.Tests.Suite;
--  end read only
