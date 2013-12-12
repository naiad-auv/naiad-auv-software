--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Vectors; use Math.Vectors;
with Math.Matrices; use Math.Matrices;
with ada.Text_IO;

package body Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.CViewModel_Actuators_Tests is


--  begin read only
   procedure Test_fGet_Motor_Force (Gnattest_T : in out Test_CViewModel_Actuators);
   procedure Test_fGet_Motor_Force_3b66dc (Gnattest_T : in out Test_CViewModel_Actuators) renames Test_fGet_Motor_Force;
--  id:2.1/3b66dc3839a34407/fGet_Motor_Force/1/0/
   procedure Test_fGet_Motor_Force (Gnattest_T : in out Test_CViewModel_Actuators) is
   --  simulator-viewmodel_actuators.ads:13:4:fGet_Motor_Force
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      pxViewModel : pCViewModel_Actuators;
      xComponentScaling : simulator.Model.TPIDComponentScalings;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => math.Vectors.xCreate(3.0, 0.0, 0.0),
                                                  xWantedOrientation => math.Matrices.xCreate_Identity);
      xComponentScaling.fProportionalScale := 3.0;
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionX);
      pxModel.Update_Model(0.251);
      pxModel.Update_Model(0.170);
      pxModel.Update_Model(0.235);
      ada.Text_IO.Put_Line("Value of motor 2 is: " & pxModel.fGet_Motor_Force(2)'img);

      AUnit.Assertions.Assert(Condition => pxModel.fGet_Motor_Force(iIndexMotor => 1)<0.0,
                              Message   => "Simulator.ViewModel_Actuators.fGet_Motor_Force failed, Wrong motor1Value");
      AUnit.Assertions.Assert(Condition => pxModel.fGet_Motor_Force(iIndexMotor => 3)>0.0,
                              Message   => "Simulator.ViewModel_Actuators.fGet_Motor_Force failed, Wrong motor3Value");



--  begin read only
   end Test_fGet_Motor_Force;
--  end read only

end Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.CViewModel_Actuators_Tests;
