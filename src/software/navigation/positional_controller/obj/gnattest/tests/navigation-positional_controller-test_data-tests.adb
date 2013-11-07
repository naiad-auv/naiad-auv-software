--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Positional_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Positional_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_6e3c60 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/6e3c605df8c73dbc/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-positional_controller.ads:18:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

 	pxPositionalController : Navigation.Positional_Controller.pCPositionalController;

      pxNewWanted : Math.Vectors.pCVector := Math.Vectors.xCreate(5.0,5.0,5.0).pxGet_Allocated_Copy;

      pxCurrentPosition : Math.Vectors.pCVector := Math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;



   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPosition,
                                                                          pxWantedAbsolutePosition     => pxNewWanted,
                                                                          pxCurrentAbsoluteOrientation => pxCurrentOrientation,
                                                                          pxCurrentAbsoluteOrientationInverse => pxCurrentOrientation.xGet_Inverse.pxGet_Allocated_Copy);

      AUnit.Assertions.Assert(Condition => pxPositionalController /= null,
                              Message   => "pxPositionalController is null after construction");

      Navigation.Positional_Controller.Free(pxPositionalController);

      AUnit.Assertions.Assert(Condition => pxPositionalController = null,
                              Message   => "pxPositionalController is not null after deconstruction");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_9768c2 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/9768c2b4e7b92b4e/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-positional_controller.ads:20:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

     use Math.Vectors;
      use Navigation.Motion_Component;

      pxPositionalController : Navigation.Positional_Controller.pCPositionalController;

   pxNewWanted : Math.Vectors.pCVector := Math.Vectors.xCreate(5.0,5.0,5.0).pxGet_Allocated_Copy;

      pxCurrentPosition : Math.Vectors.pCVector := Math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;



   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPosition,
                                                                          pxWantedAbsolutePosition     => pxNewWanted,
                                                                          pxCurrentAbsoluteOrientation => pxCurrentOrientation,
                                                                          pxCurrentAbsoluteOrientationInverse => pxCurrentOrientation.xGet_Inverse.pxGet_Allocated_Copy);

      AUnit.Assertions.Assert(Condition => pxPositionalController /= null,
                              Message => "pxPositionalController is not pointing towards on object");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxWantedAbsolutePosition /= null,
                              Message => "pxWantedPosition is null after construction");

      AUnit.Assertions.Assert(Condition => pxPositionalController.pxXMotionComponent /= null,
                              Message => "pxXMotionComponent is null after construction");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxYMotionComponent /= null,
                              Message => "pxYMotionComponent is null after construction");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxZMotionComponent /= null,
                              Message => "pxZMotionComponent is null after construction");

      Navigation.Positional_Controller.Free(pxPositionalControllerToDeallocate => pxPositionalController);
      Math.Vectors.Free(pxVectorToDeallocate => pxNewWanted);
      Math.Vectors.Free(pxVectorToDeallocate => pxCurrentPosition);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCurrentOrientation);
--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Positional_Controller.Test_Data.Tests;
