--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Vision.Image_Processing.Canny.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Vision.Image_Processing.Canny.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_DummyTest_01f4ef : aliased Runner_1.Test_Case;
   Case_2_1_Test_Canny_c6b85e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_DummyTest_01f4ef,
         "vision-image_processing-canny.ads:3:4:",
         Test_DummyTest_01f4ef'Access);
      Runner_1.Create
        (Case_2_1_Test_Canny_c6b85e,
         "vision-image_processing-canny.ads:4:4:",
         Test_Canny_c6b85e'Access);

      Result.Add_Test (Case_1_1_Test_DummyTest_01f4ef'Access);
      Result.Add_Test (Case_2_1_Test_Canny_c6b85e'Access);

      return Result'Access;

   end Suite;

end Vision.Image_Processing.Canny.Test_Data.Tests.Suite;
--  end read only
