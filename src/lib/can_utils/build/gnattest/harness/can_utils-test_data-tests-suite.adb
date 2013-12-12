--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body CAN_Utils.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.CAN_Utils.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Bytes_To_Message_Header_50b6ff : aliased Runner_1.Test_Case;
   Case_2_1_Test_Bytes_To_Message_Data_98d965 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Message_To_Bytes_de59e8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Calculate_Checksum_3e3043 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Bytes_To_Message_Header_50b6ff,
         "can_utils.ads:29:4:",
         Test_Bytes_To_Message_Header_50b6ff'Access);
      Runner_1.Create
        (Case_2_1_Test_Bytes_To_Message_Data_98d965,
         "can_utils.ads:31:4:",
         Test_Bytes_To_Message_Data_98d965'Access);
      Runner_1.Create
        (Case_3_1_Test_Message_To_Bytes_de59e8,
         "can_utils.ads:33:4:",
         Test_Message_To_Bytes_de59e8'Access);
      Runner_1.Create
        (Case_4_1_Test_Calculate_Checksum_3e3043,
         "can_utils.ads:46:4:",
         Test_Calculate_Checksum_3e3043'Access);

      Result.Add_Test (Case_1_1_Test_Bytes_To_Message_Header_50b6ff'Access);
      Result.Add_Test (Case_2_1_Test_Bytes_To_Message_Data_98d965'Access);
      Result.Add_Test (Case_3_1_Test_Message_To_Bytes_de59e8'Access);
      Result.Add_Test (Case_4_1_Test_Calculate_Checksum_3e3043'Access);

      return Result'Access;

   end Suite;

end CAN_Utils.Test_Data.Tests.Suite;
--  end read only
