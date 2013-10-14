--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Orientational_Controller.COrientationalController_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Navigation.Orientational_Controller;
with Navigation.Motion_Component;
with Math.Matrices;

package body Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests is


--  begin read only
   procedure Test_xGet_Orientational_Thruster_Control_Values (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Orientational_Thruster_Control_Values_623a50 (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Orientational_Thruster_Control_Values;
--  id:2.1/623a50465bb77148/xGet_Orientational_Thruster_Control_Values/1/0/
   procedure Test_xGet_Orientational_Thruster_Control_Values (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:16:4:xGet_Orientational_Thruster_Control_Values
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      pxOrientationalMatrix : Math.Matrices.pCMatrix;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;
      bAtleasteOneControlValue : boolean := false;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));

      pxOrientationalMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Z_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Y_Axis(50.0);

      pxOrientationalController.Update_Wanted_Absolute_Orientation(pxOrientationalMatrix);

      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Orientational_Thruster_Control_Values(1.0);

      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");

--  begin read only
   end Test_xGet_Orientational_Thruster_Control_Values;
--  end read only


--  begin read only
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Absolute_Orientation_d358b4 (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Absolute_Orientation;
--  id:2.1/d358b49a3e9eadce/Update_Current_Absolute_Orientation/1/0/
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:18:4:Update_Current_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      pxOrientationalMatrix : Math.Matrices.pCMatrix;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;

      for i in 10 .. 100 loop
       pxOrientationalMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(i/10))
        			* Math.Matrices.pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(i/10))
        			* Math.Matrices.pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(i/10));

         pxOrientationalController.Update_Current_Absolute_Orientation(pxOrientationalMatrix);

         AUnit.Assertions.Assert(Condition => pxOrientationalMatrix = pxOrientationalController.pxCurrentAbsoluteOrientation,
                                 Message   => "Update of current absolute orientation failed");

      end loop;

--  begin read only
   end Test_Update_Current_Absolute_Orientation;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Wanted_Absolute_Orientation_3f7b4c (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Wanted_Absolute_Orientation;
--  id:2.1/3f7b4cb6b566694c/Update_Wanted_Absolute_Orientation/1/0/
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:19:4:Update_Wanted_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      pxOrientationalMatrix : Math.Matrices.pCMatrix;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;

      for i in 10 .. 100 loop
       pxOrientationalMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(i/10))
        			* Math.Matrices.pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(i/10))
        			* Math.Matrices.pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(i/10));

         pxOrientationalController.Update_Wanted_Absolute_Orientation(pxOrientationalMatrix);

         AUnit.Assertions.Assert(Condition => pxOrientationalMatrix = pxOrientationalController.pxWantedAbsoluteOrientation,
                                 Message   => "Update of current absolute orientation failed");

      end loop;

--  begin read only
   end Test_Update_Wanted_Absolute_Orientation;
--  end read only


--  begin read only
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Errors_8bd63a (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Errors;
--  id:2.1/8bd63a920fdd0490/Update_Current_Errors/1/0/
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:20:4:Update_Current_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible
      null;

--  begin read only
   end Test_Update_Current_Errors;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Set_New_PID_Component_Scalings_29d7cb (Gnattest_T : in out Test_COrientationalController) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/29d7cb2ef38e73c8/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:22:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      null;

      --TODO, unable to test before mocking is possible

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Planal_Error (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Planal_Error_cf72af (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Planal_Error;
--  id:2.1/cf72af1c309fa5e1/Update_Current_Planal_Error/1/0/
   procedure Test_Update_Current_Planal_Error (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:26:4:Update_Current_Planal_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible
      null;


--  begin read only
   end Test_Update_Current_Planal_Error;
--  end read only


--  begin read only
   procedure Test_Update_Current_Directional_Error (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Directional_Error_2d1e01 (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Directional_Error;
--  id:2.1/2d1e0158c40f8775/Update_Current_Directional_Error/1/0/
   procedure Test_Update_Current_Directional_Error (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:27:4:Update_Current_Directional_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible,
      null;

--  begin read only
   end Test_Update_Current_Directional_Error;
--  end read only


--  begin read only
   procedure Test_xGet_Planal_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Planal_Thruster_Control_Value_b4f4c1 (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Planal_Thruster_Control_Value;
--  id:2.1/b4f4c15ad761a1ce/xGet_Planal_Thruster_Control_Value/1/0/
   procedure Test_xGet_Planal_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:32:4:xGet_Planal_Thruster_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      pxOrientationalMatrix : Math.Matrices.pCMatrix;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;

      bAtleasteOneControlValue : boolean := false;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));

      pxOrientationalMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Z_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Y_Axis(50.0);

      pxOrientationalController.Update_Wanted_Absolute_Orientation(pxOrientationalMatrix);

      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Planal_Thruster_Control_Value(1.0);


      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");



--  begin read only
   end Test_xGet_Planal_Thruster_Control_Value;
--  end read only


--  begin read only
   procedure Test_xGet_Directional_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Directional_Thruster_Control_Value_128ef2 (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Directional_Thruster_Control_Value;
--  id:2.1/128ef23e9de34327/xGet_Directional_Thruster_Control_Value/1/0/
   procedure Test_xGet_Directional_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:33:4:xGet_Directional_Thruster_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      pxOrientationalMatrix : Math.Matrices.pCMatrix;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;
      bAtleasteOneControlValue : boolean := false;

   begin
      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));

      pxOrientationalMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Z_Axis(50.0)
        			* Math.Matrices.pxCreate_Rotation_Around_Y_Axis(50.0);

      pxOrientationalController.Update_Wanted_Absolute_Orientation(pxOrientationalMatrix);

      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Directional_Thruster_Control_Value(1.0);

      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");


--  begin read only
   end Test_xGet_Directional_Thruster_Control_Value;
--  end read only

end Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests;
