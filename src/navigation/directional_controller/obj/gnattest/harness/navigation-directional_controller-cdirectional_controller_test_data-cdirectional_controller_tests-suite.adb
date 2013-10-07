--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Directional_Controller.CDirectional_Controller_Test_Data.CDirectional_Controller_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Directional_Controller.CDirectional_Controller_Test_Data.CDirectional_Controller_Tests.Test_CDirectional_Controller);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Update_Current_Direction_a0eb6a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Wanted_Direction_59ece8 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_New_PID_Component_Scalings_80cee4 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Update_Current_Direction_a0eb6a,
         "navigation-directional_controller.ads:15:4:",
         Test_Update_Current_Direction_a0eb6a'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Wanted_Direction_59ece8,
         "navigation-directional_controller.ads:16:4:",
         Test_Update_Wanted_Direction_59ece8'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_New_PID_Component_Scalings_80cee4,
         "navigation-directional_controller.ads:18:4:",
         Test_Set_New_PID_Component_Scalings_80cee4'Access);

      Result.Add_Test (Case_1_1_Test_Update_Current_Direction_a0eb6a'Access);
      Result.Add_Test (Case_2_1_Test_Update_Wanted_Direction_59ece8'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_PID_Component_Scalings_80cee4'Access);

      return Result'Access;

   end Suite;

end Navigation.Directional_Controller.CDirectional_Controller_Test_Data.CDirectional_Controller_Tests.Suite;
--  end read only
