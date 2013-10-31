--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Orientational_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Orientational_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_e23ec6 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/e23ec6022931e50d/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-orientational_controller.ads:20:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_fcd516 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/fcd516d1ef10cef2/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-orientational_controller.ads:22:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Matrices;
      use Navigation.Motion_Component;
      use Math.Quaternions;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Copy;
      pxWantedOrientation : Math.Matrices.pCMatrix := Math.Matrices.CMatrix(Math.Matrices.xCreate_Rotation_Around_X_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Y_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Z_Axis(50.0)).pxGet_Copy;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate(pxCurrentOrientation, pxWantedOrientation);

      AUnit.Assertions.Assert(Condition => pxOrientationalController /= null,
                              Message   => "OrientationalController is null after construction");

      Aunit.Assertions.Assert(Condition => pxOrientationalController.pxCurrentAbsoluteOrientation /= null,
                              Message   => "Current absolute orientation is null after construction");

      Aunit.Assertions.Assert(Condition => pxOrientationalController.pxWantedAbsoluteOrientation /= null,
                              Message   => "wanted absolute orientation is null after construction");

      Aunit.Assertions.Assert(Condition => pxOrientationalController.pxPlanalMotionComponent /= null,
                              Message   => "pxPlanalMotionComponent is null after construction");

      Aunit.Assertions.Assert(Condition => pxOrientationalController.pxDirectionalMotionComponent /= null,
                              Message   => "pxDirectionalMotionComponent is null after construction");

      Navigation.Orientational_Controller.Free(pxOrientationalControllerToDeallocate => pxOrientationalController);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCurrentOrientation);
      Math.Matrices.Free(pxMatrixToDeallocate => pxWantedOrientation);

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_fGet_Directional_Error (Gnattest_T : in out Test);
   procedure Test_fGet_Directional_Error_3df5b3 (Gnattest_T : in out Test) renames Test_fGet_Directional_Error;
--  id:2.1/3df5b3dea6636632/fGet_Directional_Error/1/0/
   procedure Test_fGet_Directional_Error (Gnattest_T : in out Test) is
   --  navigation-orientational_controller.ads:48:4:fGet_Directional_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, untestable before mocks
      null;

--  begin read only
   end Test_fGet_Directional_Error;
--  end read only


--  begin read only
   procedure Test_fGet_Planal_Error (Gnattest_T : in out Test);
   procedure Test_fGet_Planal_Error_9256bd (Gnattest_T : in out Test) renames Test_fGet_Planal_Error;
--  id:2.1/9256bd0e986fcd8c/fGet_Planal_Error/1/0/
   procedure Test_fGet_Planal_Error (Gnattest_T : in out Test) is
   --  navigation-orientational_controller.ads:49:4:fGet_Planal_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, untestable before mocks
      null;

--  begin read only
   end Test_fGet_Planal_Error;
--  end read only

end Navigation.Orientational_Controller.Test_Data.Tests;
