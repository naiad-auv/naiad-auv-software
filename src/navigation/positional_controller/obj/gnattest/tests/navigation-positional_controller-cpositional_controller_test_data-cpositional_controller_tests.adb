--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Positional_Controller.CPositional_Controller_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Vectors; use Math.Vectors;

package body Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests is


--  begin read only
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_xGet_Positional_Thruster_Control_Values_c13bf2 (Gnattest_T : in out Test_CPositional_Controller) renames Test_xGet_Positional_Thruster_Control_Values;
--  id:2.1/c13bf26808ac96cb/xGet_Positional_Thruster_Control_Values/1/0/
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:12:4:xGet_Positional_Thruster_Control_Values
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Positional_Thruster_Control_Values;
--  end read only


--  begin read only
   procedure Test_Update_Current_Position (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_Update_Current_Position_c1f77b (Gnattest_T : in out Test_CPositional_Controller) renames Test_Update_Current_Position;
--  id:2.1/c1f77b75145b1daa/Update_Current_Position/1/0/
   procedure Test_Update_Current_Position (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:14:4:Update_Current_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxPositionalController : Navigation.Positional_Controller.pCPositional_Controller;

      pxNewCurrent : Math.Vectors.pCVector := Math.Vectors.pxCreate(1.0,2.0,3.0);

   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate;

      pxPositionalController.Update_Current_Position(pxNewCurrent);

      AUnit.Assertions.Assert(Condition => pxPositionalController.pxCurrentPosition = pxNewCurrent,
                              Message => "current position is not equal to pxNewWanted");



--  begin read only
   end Test_Update_Current_Position;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_Update_Wanted_Position_1139f7 (Gnattest_T : in out Test_CPositional_Controller) renames Test_Update_Wanted_Position;
--  id:2.1/1139f73ed7f8fdbf/Update_Wanted_Position/1/0/
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:15:4:Update_Wanted_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxPositionalController : Navigation.Positional_Controller.pCPositional_Controller;

      pxNewWanted : Math.Vectors.pCVector := Math.Vectors.pxCreate(1.0,2.0,3.0);

   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate;

      pxPositionalController.Update_Wanted_Position(pxNewWanted);

      AUnit.Assertions.Assert(Condition => pxPositionalController.pxWantedPosition = pxNewWanted,
                              Message => "current position is not equal to pxNewWanted");


--  begin read only
   end Test_Update_Wanted_Position;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_Set_New_PID_Component_Scalings_fb8920 (Gnattest_T : in out Test_CPositional_Controller) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/fb8920e9181389bd/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:17:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only

end Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests;
