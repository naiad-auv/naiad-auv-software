--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Digital_IO.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Digital_IO.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_make_output_pin_58eb13 : aliased Runner_1.Test_Case;
   Case_2_1_Test_make_input_pin_c94ff8 : aliased Runner_1.Test_Case;
   Case_3_1_Test_clear_pin_f86393 : aliased Runner_1.Test_Case;
   Case_4_1_Test_set_pin_b38fd7 : aliased Runner_1.Test_Case;
   Case_5_1_Test_read_pin_dfad73 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_make_output_pin_58eb13,
         "digital_io.ads:15:4:",
         Test_make_output_pin_58eb13'Access);
      Runner_1.Create
        (Case_2_1_Test_make_input_pin_c94ff8,
         "digital_io.ads:16:4:",
         Test_make_input_pin_c94ff8'Access);
      Runner_1.Create
        (Case_3_1_Test_clear_pin_f86393,
         "digital_io.ads:17:4:",
         Test_clear_pin_f86393'Access);
      Runner_1.Create
        (Case_4_1_Test_set_pin_b38fd7,
         "digital_io.ads:18:4:",
         Test_set_pin_b38fd7'Access);
      Runner_1.Create
        (Case_5_1_Test_read_pin_dfad73,
         "digital_io.ads:19:4:",
         Test_read_pin_dfad73'Access);

      Result.Add_Test (Case_1_1_Test_make_output_pin_58eb13'Access);
      Result.Add_Test (Case_2_1_Test_make_input_pin_c94ff8'Access);
      Result.Add_Test (Case_3_1_Test_clear_pin_f86393'Access);
      Result.Add_Test (Case_4_1_Test_set_pin_b38fd7'Access);
      Result.Add_Test (Case_5_1_Test_read_pin_dfad73'Access);

      return Result'Access;

   end Suite;

end Digital_IO.Test_Data.Tests.Suite;
--  end read only
