--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with Gnattest_Generated;

package CAN_Utils.Test_Data.Tests is

   type Test is new GNATtest_Generated.GNATtest_Standard.CAN_Utils.Test_Data.Test
   with null record;

   procedure Test_Bytes_To_Message_Header_50b6ff (Gnattest_T : in out Test);
   --  can_utils.ads:29:4:Bytes_To_Message_Header

   procedure Test_Bytes_To_Message_Data_98d965 (Gnattest_T : in out Test);
   --  can_utils.ads:31:4:Bytes_To_Message_Data

   procedure Test_Message_To_Bytes_de59e8 (Gnattest_T : in out Test);
   --  can_utils.ads:33:4:Message_To_Bytes

   procedure Test_Calculate_Checksum_3e3043 (Gnattest_T : in out Test);
   --  can_utils.ads:46:4:Calculate_Checksum

end CAN_Utils.Test_Data.Tests;
--  end read only
