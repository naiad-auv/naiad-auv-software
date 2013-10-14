--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body CAN_Handler.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.CAN_Handler.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_6f1958 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Enable_de0369 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Disable_0ad7dc : aliased Runner_1.Test_Case;
   Case_4_1_Test_Enable_Reception_a21e82 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Send_a6848d : aliased Runner_1.Test_Case;
   Case_6_1_Test_Valid_Message_4ef40c : aliased Runner_1.Test_Case;
   Case_7_1_Test_Get_dfb46f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_6f1958,
         "can_handler.ads:17:4:",
         Test_Init_6f1958'Access);
      Runner_1.Create
        (Case_2_1_Test_Enable_de0369,
         "can_handler.ads:18:4:",
         Test_Enable_de0369'Access);
      Runner_1.Create
        (Case_3_1_Test_Disable_0ad7dc,
         "can_handler.ads:19:4:",
         Test_Disable_0ad7dc'Access);
      Runner_1.Create
        (Case_4_1_Test_Enable_Reception_a21e82,
         "can_handler.ads:21:4:",
         Test_Enable_Reception_a21e82'Access);
      Runner_1.Create
        (Case_5_1_Test_Send_a6848d,
         "can_handler.ads:23:4:",
         Test_Send_a6848d'Access);
      Runner_1.Create
        (Case_6_1_Test_Valid_Message_4ef40c,
         "can_handler.ads:24:4:",
         Test_Valid_Message_4ef40c'Access);
      Runner_1.Create
        (Case_7_1_Test_Get_dfb46f,
         "can_handler.ads:25:4:",
         Test_Get_dfb46f'Access);

      Result.Add_Test (Case_1_1_Test_Init_6f1958'Access);
      Result.Add_Test (Case_2_1_Test_Enable_de0369'Access);
      Result.Add_Test (Case_3_1_Test_Disable_0ad7dc'Access);
      Result.Add_Test (Case_4_1_Test_Enable_Reception_a21e82'Access);
      Result.Add_Test (Case_5_1_Test_Send_a6848d'Access);
      Result.Add_Test (Case_6_1_Test_Valid_Message_4ef40c'Access);
      Result.Add_Test (Case_7_1_Test_Get_dfb46f'Access);

      return Result'Access;

   end Suite;

end CAN_Handler.Test_Data.Tests.Suite;
--  end read only
