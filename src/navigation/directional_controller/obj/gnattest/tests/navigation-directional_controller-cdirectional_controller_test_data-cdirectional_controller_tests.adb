--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Directional_Controller.CDirectional_Controller_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Angles; use Math.Angles;

package body Navigation.Directional_Controller.CDirectional_Controller_Test_Data.CDirectional_Controller_Tests is


--  begin read only
   procedure Test_Update_Current_Direction (Gnattest_T : in out Test_CDirectional_Controller);
   procedure Test_Update_Current_Direction_a0eb6a (Gnattest_T : in out Test_CDirectional_Controller) renames Test_Update_Current_Direction;
--  id:2.1/a0eb6a5db3251706/Update_Current_Direction/1/0/
   procedure Test_Update_Current_Direction (Gnattest_T : in out Test_CDirectional_Controller) is
   --  navigation-directional_controller.ads:15:4:Update_Current_Direction
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDirectionalController : Navigation.Directional_Controller.pCDirectional_Controller;

   begin

      pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      pxDirectionalController.Update_Current_Direction(180.0);

      AUnit.Assertions.Assert(Condition => pxDirectionalController.xCurrentDirection = 180.0,
                              Message   => "WantedDirection not set correctly");

      pxDirectionalController.Update_Current_Direction(-180.0);


      AUnit.Assertions.Assert(Condition => pxDirectionalController.xCurrentDirection = -180.0,
                              Message   => "WantedDirection not set correctly");


--  begin read only
   end Test_Update_Current_Direction;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Direction (Gnattest_T : in out Test_CDirectional_Controller);
   procedure Test_Update_Wanted_Direction_59ece8 (Gnattest_T : in out Test_CDirectional_Controller) renames Test_Update_Wanted_Direction;
--  id:2.1/59ece89f823f7a41/Update_Wanted_Direction/1/0/
   procedure Test_Update_Wanted_Direction (Gnattest_T : in out Test_CDirectional_Controller) is
   --  navigation-directional_controller.ads:16:4:Update_Wanted_Direction
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDirectionalController : Navigation.Directional_Controller.pCDirectional_Controller;

   begin

      pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      pxDirectionalController.Update_Wanted_Direction(180.0);

      AUnit.Assertions.Assert(Condition => pxDirectionalController.xWantedDirection = 180.0,
                              Message   => "WantedDirection not set correctly");

      pxDirectionalController.Update_Wanted_Direction(-180.0);


      AUnit.Assertions.Assert(Condition => pxDirectionalController.xWantedDirection = -180.0,
                              Message   => "WantedDirection not set correctly");


--  begin read only
   end Test_Update_Wanted_Direction;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CDirectional_Controller);
   procedure Test_Set_New_PID_Component_Scalings_80cee4 (Gnattest_T : in out Test_CDirectional_Controller) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/80cee46e03dbbaf0/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CDirectional_Controller) is
   --  navigation-directional_controller.ads:18:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "TODO, dont know how to test yet, need to look up mocking.");

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only

end Navigation.Directional_Controller.CDirectional_Controller_Test_Data.CDirectional_Controller_Tests;
