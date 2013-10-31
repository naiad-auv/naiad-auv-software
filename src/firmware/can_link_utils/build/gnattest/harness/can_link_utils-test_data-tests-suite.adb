--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body CAN_Link_Utils.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.CAN_Link_Utils.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Calculate_Checksum_b57d3d : aliased Runner_1.Test_Case;
   Case_2_1_Test_Bytes_To_Message_Header_e3d094 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Bytes_To_Message_Data_0647ae : aliased Runner_1.Test_Case;
   Case_4_1_Test_Message_To_Bytes_7306eb : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Calculate_Checksum_b57d3d,
         "can_link_utils.ads:34:4:",
         Test_Calculate_Checksum_b57d3d'Access);
      Runner_1.Create
        (Case_2_1_Test_Bytes_To_Message_Header_e3d094,
         "can_link_utils.ads:36:4:",
         Test_Bytes_To_Message_Header_e3d094'Access);
      Runner_1.Create
        (Case_3_1_Test_Bytes_To_Message_Data_0647ae,
         "can_link_utils.ads:38:4:",
         Test_Bytes_To_Message_Data_0647ae'Access);
      Runner_1.Create
        (Case_4_1_Test_Message_To_Bytes_7306eb,
         "can_link_utils.ads:40:4:",
         Test_Message_To_Bytes_7306eb'Access);

      Result.Add_Test (Case_1_1_Test_Calculate_Checksum_b57d3d'Access);
      Result.Add_Test (Case_2_1_Test_Bytes_To_Message_Header_e3d094'Access);
      Result.Add_Test (Case_3_1_Test_Bytes_To_Message_Data_0647ae'Access);
      Result.Add_Test (Case_4_1_Test_Message_To_Bytes_7306eb'Access);

      return Result'Access;

   end Suite;

end CAN_Link_Utils.Test_Data.Tests.Suite;
--  end read only
