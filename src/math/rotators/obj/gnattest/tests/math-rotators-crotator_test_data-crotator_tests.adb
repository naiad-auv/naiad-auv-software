--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Rotators.CRotator_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Rotators.CRotator_Test_Data.CRotator_Tests is


--  begin read only
   procedure Test_tfGet_Yaw (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Yaw_1e984d (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Yaw;
--  id:2.1/1e984d6e68c25873/tfGet_Yaw/1/0/
   procedure Test_tfGet_Yaw (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:14:4:tfGet_Yaw
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewRotator : pCRotator;
      fYaw : float := 50.0;
      fPitch : float := -320.0;
      fRoll : float := -5.0;

   begin

      pxNewRotator := Math.Rotators.pxCreate(fYaw   => fYaw,
                                             fPitch => fPitch,
                                             fRoll  => fRoll);

      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Yaw)) = fYaw,
                              Message   => "CRotator.tfGet_Yaw failed, yaw got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Yaw))) & ". Expected: " & float'Image(fYaw) & ".");

--  begin read only
   end Test_tfGet_Yaw;
--  end read only


--  begin read only
   procedure Test_tfGet_Pitch (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Pitch_2ff57f (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Pitch;
--  id:2.1/2ff57fc0de488b51/tfGet_Pitch/1/0/
   procedure Test_tfGet_Pitch (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:15:4:tfGet_Pitch
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxNewRotator : pCRotator;
      fYaw : float := 50.0;
      fPitch : float := -320.0;
      fRoll : float := -5.0;

   begin

      pxNewRotator := Math.Rotators.pxCreate(fYaw   => fYaw,
                                             fPitch => fPitch,
                                             fRoll  => fRoll);

      fPitch := fPitch + 360.0;

      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Pitch)) = fPitch,
                              Message   => "CRotator.tfGet_Pitch failed, pitch got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Pitch))) & ". Expected: " & float'Image(fPitch) & ".");

--  begin read only
   end Test_tfGet_Pitch;
--  end read only


--  begin read only
   procedure Test_tfGet_Roll (Gnattest_T : in out Test_CRotator);
   procedure Test_tfGet_Roll_05255f (Gnattest_T : in out Test_CRotator) renames Test_tfGet_Roll;
--  id:2.1/05255f3fd8b0f3a0/tfGet_Roll/1/0/
   procedure Test_tfGet_Roll (Gnattest_T : in out Test_CRotator) is
   --  math-rotators.ads:16:4:tfGet_Roll
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxNewRotator : pCRotator;
      fYaw : float := 50.0;
      fPitch : float := -320.0;
      fRoll : float := -5.0;

   begin

      pxNewRotator := Math.Rotators.pxCreate(fYaw   => fYaw,
                                             fPitch => fPitch,
                                             fRoll  => fRoll);



      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Roll)) = fRoll,
                              Message   => "CRotator.tfGet_Roll failed, roll got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Roll))) & ". Expected: " & float'Image(fRoll) & ".");

--  begin read only
   end Test_tfGet_Roll;
--  end read only

end Math.Rotators.CRotator_Test_Data.CRotator_Tests;
