--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Positional_Controller.CPositional_Controller_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests is


--  begin read only
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_xGet_Positional_Thruster_Control_Values_b5ee7d (Gnattest_T : in out Test_CPositional_Controller) renames Test_xGet_Positional_Thruster_Control_Values;
--  id:2.1/b5ee7d7f437db00c/xGet_Positional_Thruster_Control_Values/1/0/
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:12:4:xGet_Positional_Thruster_Control_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      use Navigation.Motion_Component;

      pxPositionalController : Navigation.Positional_Controller.pCPositional_Controller;

      pxNewWanted : Math.Vectors.pCVector := Math.Vectors.pxCreate(5.0,5.0,5.0);
      pxPositionalScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0,1.0);

      xPositionalControlValues : Navigation.Motion_Component.TPositionalControlValues;
   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate;

      pxPositionalController.Update_Wanted_Position(pxNewWanted);

      pxPositionalController.Set_New_PID_Component_Scalings(Navigation.Motion_Component.AllComponents, pxPositionalScalings);

      xPositionalControlValues := pxPositionalController.xGet_Positional_Thruster_Control_Values(1.0);

      AUnit.Assertions.Assert(Condition => xPositionalControlValues(1).xMotionComponent = Navigation.Motion_Component.X,
                              Message => "PositionalControlvalue component 1 is not X");

      AUnit.Assertions.Assert(Condition => xPositionalControlValues(2).xMotionComponent = Navigation.Motion_Component.Y,
                              Message => "PositionalControlvalue component 2 is not Y");

      AUnit.Assertions.Assert(Condition => xPositionalControlValues(3).xMotionComponent = Navigation.Motion_Component.Z,
                              Message => "PositionalControlvalue component 3 is not Z");

      AUnit.Assertions.Assert(Condition => abs(xPositionalControlValues(1).fValue) > 0.00001,
                              Message => "PositionalControlvalue component 1 is 0");

      AUnit.Assertions.Assert(Condition => abs(xPositionalControlValues(2).fValue) > 0.00001,
                              Message => "PositionalControlvalue component 1 is 0");

      AUnit.Assertions.Assert(Condition => abs(xPositionalControlValues(3).fValue) > 0.00001,
                              Message => "PositionalControlvalue component 1 is 0");




--  begin read only
   end Test_xGet_Positional_Thruster_Control_Values;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CPositional_Controller);
   procedure Test_Update_Wanted_Position_1139f7 (Gnattest_T : in out Test_CPositional_Controller) renames Test_Update_Wanted_Position;
--  id:2.1/1139f73ed7f8fdbf/Update_Wanted_Position/1/0/
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CPositional_Controller) is
   --  navigation-positional_controller.ads:14:4:Update_Wanted_Position
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      use Math.Vectors;

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
   --  navigation-positional_controller.ads:16:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (True,
         "TODO, i dont know how to really test it atm");

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only



end Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests;
