--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Queue.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Queue.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_iDataAvailable_a432a5 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Write_7b301f : aliased Runner_1.Test_Case;
   Case_3_1_Test_Read_7c3830 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_iDataAvailable_a432a5,
         "queue.ads:19:4:",
         Test_iDataAvailable_a432a5'Access);
      Runner_1.Create
        (Case_2_1_Test_Write_7b301f,
         "queue.ads:21:4:",
         Test_Write_7b301f'Access);
      Runner_1.Create
        (Case_3_1_Test_Read_7c3830,
         "queue.ads:23:4:",
         Test_Read_7c3830'Access);

      Result.Add_Test (Case_1_1_Test_iDataAvailable_a432a5'Access);
      Result.Add_Test (Case_2_1_Test_Write_7b301f'Access);
      Result.Add_Test (Case_3_1_Test_Read_7c3830'Access);

      return Result'Access;

   end Suite;

end Queue.Test_Data.Tests.Suite;
--  end read only
