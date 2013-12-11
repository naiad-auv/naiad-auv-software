--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Vectors; use Math.Vectors;
with math.Matrices; use math.Matrices;

package body simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.CViewModel_Wanted_Pos_Tests is


--  begin read only
   procedure Test_Set_Wanted_Position_And_Orientation (Gnattest_T : in out Test_CViewModel_Wanted_Pos);
   procedure Test_Set_Wanted_Position_And_Orientation_b04f45 (Gnattest_T : in out Test_CViewModel_Wanted_Pos) renames Test_Set_Wanted_Position_And_Orientation;
--  id:2.1/b04f458394428577/Set_Wanted_Position_And_Orientation/1/0/
   procedure Test_Set_Wanted_Position_And_Orientation (Gnattest_T : in out Test_CViewModel_Wanted_Pos) is
   --  simulator-viewmodel_wanted_pos.ads:16:4:Set_Wanted_Position_And_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Wanted_Pos;
      pxModel : simulator.Model.pCModel;
      xWantedPositionVector: math.Vectors.CVector;
      xWantedOrientationMatrix : math.Matrices.CMatrix;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.Set_Wanted_Position_And_Orientation(fPositionX => 15.742,
                                                      fPositionY => 1.42,
                                                      fPositionZ => 5.2,
                                                      fRotationX => 1.72,
                                                      fRotationY => 5.7,
                                                      fRotationZ => 15.2);
      xWantedPositionVector := math.Vectors.xCreate(fX => 15.742,
                                                    fY => 1.42,
                                                    fZ => 5.2);
      xWantedOrientationMatrix := math.Matrices.xCreate_Rotation_Around_Z_Axis(15.2)*
                                  math.Matrices.xCreate_Rotation_Around_Y_Axis(5.7)*
                                  math.Matrices.xCreate_Rotation_Around_X_Axis(1.72);
      AUnit.Assertions.Assert(Condition => pxViewModel.pxModel.xGet_Wanted_Submarine_Positional_Vector=xWantedPositionVector,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.Set_Wanted_Position_And_Orientation failed, Faulty wanted position set");
      AUnit.Assertions.Assert(Condition => pxViewModel.pxModel.xGet_Wanted_Submarine_Orientation_Matrix=xWantedOrientationMatrix,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.Set_Wanted_Position_And_Orientation failed, Faulty wanted position set");


--  begin read only
   end Test_Set_Wanted_Position_And_Orientation;
--  end read only

end simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.CViewModel_Wanted_Pos_Tests;
