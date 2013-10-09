--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Rotators.CRotator_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;

package body Math.Rotators.CRotator_Test_Data.CRotator_Tests is


--  begin read only
   procedure Test_tfGet_Yaw (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Yaw_28b483 (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Yaw;
--  id:2.1/28b4835142a9bf6b/tfGet_Yaw/1/0/
   procedure Test_tfGet_Yaw (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:20:4:tfGet_Yaw
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewRotator : pCRotator;
      fYaw : float := 50.0;

   begin

      for i in 1 .. 20000
      loop
         fYaw := float(i - 10000) * 0.1;
         pxNewRotator := Math.Rotators.pxCreate(fYaw   => fYaw,
                                                fPitch => 0.0,
                                                fRoll  => 0.0);
         fYaw := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fYaw,
                                                         fRangeFromExclusive => -180.0);
         AUnit.Assertions.Assert(Condition => float(pxNewRotator.tfGet_Yaw) = fYaw,
                                 Message   => "CRotator.tfGet_Yaw failed, yaw got wrong value. Value: " & float'Image(float(pxNewRotator.tfGet_Yaw)) & ". Expected: " & float'Image(fYaw) & ".");
      end loop;


--  begin read only
   end Test_tfGet_Yaw;
--  end read only


--  begin read only
   procedure Test_tfGet_Pitch (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Pitch_fa021d (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Pitch;
--  id:2.1/fa021dd29cbb6df3/tfGet_Pitch/1/0/
   procedure Test_tfGet_Pitch (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:21:4:tfGet_Pitch
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewRotator : pCRotator;
      fPitch : float := 50.0;

   begin

      for i in 1 .. 20000
      loop
         fPitch := float(i - 10000) * 0.1;
         pxNewRotator := Math.Rotators.pxCreate(fYaw   => 0.0,
                                                fPitch => fPitch,
                                                fRoll  => 0.0);
         fPitch := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fPitch,
                                                         fRangeFromExclusive => -180.0);
         AUnit.Assertions.Assert(Condition => float(pxNewRotator.tfGet_Pitch) = fPitch,
                                 Message   => "CRotator.tfGet_Pitch failed, pitch got wrong value. Value: " & float'Image(float(pxNewRotator.tfGet_Pitch)) & ". Expected: " & float'Image(fPitch) & ".");
      end loop;


--  begin read only
   end Test_tfGet_Pitch;
--  end read only


--  begin read only
   procedure Test_tfGet_Roll (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Roll_56e29e (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Roll;
--  id:2.1/56e29e194568171a/tfGet_Roll/1/0/
   procedure Test_tfGet_Roll (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:22:4:tfGet_Roll
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewRotator : pCRotator;
      fRoll : float := 50.0;

   begin

      for i in 1 .. 20000
      loop
         fRoll := float(i - 10000) * 0.1;
         pxNewRotator := Math.Rotators.pxCreate(fYaw   => 0.0,
                                                fPitch => 0.0,
                                                fRoll  => fRoll);
         fRoll := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fRoll,
                                                         fRangeFromExclusive => -180.0);
         AUnit.Assertions.Assert(Condition => float(pxNewRotator.tfGet_Roll) = fRoll,
                                 Message   => "CRotator.tfGet_Roll failed, roll got wrong value. Value: " & float'Image(float(pxNewRotator.tfGet_Roll)) & ". Expected: " & float'Image(fRoll) & ".");
      end loop;


--  begin read only
   end Test_tfGet_Roll;
--  end read only


--  begin read only
   procedure Test_Set_Rotator_Angle (Gnattest_T : in out Test_CRotator);
   procedure Test_Set_Rotator_Angle_fa1114 (Gnattest_T : in out Test_CRotator) renames Test_Set_Rotator_Angle;
--  id:2.1/fa111432c9540570/Set_Rotator_Angle/1/0/
   procedure Test_Set_Rotator_Angle (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:28:4:Set_Rotator_Angle
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNewRotator : pCRotator;

      fAngle : float;

   begin

      pxNewRotator := Math.Rotators.pxCreate(fYaw   => 0.0,
                                             fPitch => 0.0,
                                             fRoll  => 0.0);
      for a in Yaw .. Roll
      loop
         for i in 1 .. 20000
         loop
            fAngle := float(i - 10000) * 0.1;

            pxNewRotator.Set_Rotator_Angle(eAngle => a,
                                           fAngle => fAngle);

            fAngle := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fAngle,
                                                              fRangeFromExclusive => -180.0);

            AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(a)) = fAngle,
                                    Message   => "CRotator.Set_Rotator_Angle failed, wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(a))) & ". Expected: " & float'Image(fAngle) & ".");
         end loop;
      end loop;



--  begin read only
   end Test_Set_Rotator_Angle;
--  end read only


--  begin read only
   procedure Test_Set_Rotator_Angles_From_Matrix (Gnattest_T : in out Test_CRotator);
   procedure Test_Set_Rotator_Angles_From_Matrix_cf2dd9 (Gnattest_T : in out Test_CRotator) renames Test_Set_Rotator_Angles_From_Matrix;
--  id:2.1/cf2dd9024adeb384/Set_Rotator_Angles_From_Matrix/1/0/
   procedure Test_Set_Rotator_Angles_From_Matrix (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:29:4:Set_Rotator_Angles_From_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Matrices;
      fYaw : float;
      fPitch : float;
      fRoll : float;
      pxMatrix : Math.Matrices.pCMatrix;
      pxRotator : pCRotator;
   begin

      pxRotator := Math.Rotators.pxCreate(fYaw   => 0.0,
                                          fPitch => 0.0,
                                          fRoll  => 0.0);
      fYaw := 90.0;
      fPitch := 0.0;
      fRoll := 0.0;

      pxMatrix := Math.Matrices.pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(fYaw)) * Math.Matrices.pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(fPitch)) * Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(fRoll));

      pxRotator.Set_Rotator_Angles_From_Matrix(pxMatrix);



      AUnit.Assertions.Assert(Condition => abs(float(pxRotator.tAngles(Pitch)) - fPitch) < 0.00001,
                              Message   => "CRotator.Set_Rotator_Angles_From_Matrix failed, pitch got wrong value. Value: " & float'Image(float(pxRotator.tAngles(Pitch))) & ". Expected: " & float'Image(fPitch) & ".");
      AUnit.Assertions.Assert(Condition => abs(float(pxRotator.tAngles(Yaw)) - fYaw) < 0.00001,
                              Message   => "CRotator.Set_Rotator_Angles_From_Matrix failed, yaw got wrong value. Value: " & float'Image(float(pxRotator.tAngles(Yaw))) & ". Expected: " & float'Image(fYaw) & ".");
      AUnit.Assertions.Assert(Condition => abs(float(pxRotator.tAngles(Roll)) - fRoll) < 0.00001,
                              Message   => "CRotator.Set_Rotator_Angles_From_Matrix failed, roll got wrong value. Value: " & float'Image(float(pxRotator.tAngles(Roll))) & ". Expected: " & float'Image(fRoll) & ".");

--  begin read only
   end Test_Set_Rotator_Angles_From_Matrix;
--  end read only

end Math.Rotators.CRotator_Test_Data.CRotator_Tests;
