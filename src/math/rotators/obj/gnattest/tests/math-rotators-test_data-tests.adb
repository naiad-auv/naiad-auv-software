--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Rotators.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
package body Math.Rotators.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_fa08a4 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/fa08a416da028852/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  math-rotators.ads:9:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNewRotator : pCRotator;
      fYaw : float := 90.0;
      fPitch : float := 90.0;
      fRoll : float := 0.0;

   begin
      Ada.Text_IO.Put_Line("----------- Here we go: " & float'Image(fPitch));
      pxNewRotator := Math.Rotators.pxCreate(fYaw   => fYaw,
                                             fPitch => fPitch,
                                             fRoll  => fRoll);

      --fPitch := fPitch + 360.0;

      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Yaw)) = fYaw,
                              Message   => "CRotator.pxCreate failed, yaw got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Yaw))) & ". Expected: " & float'Image(fYaw) & ".");
      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Pitch)) = fPitch,
                              Message   => "CRotator.pxCreate failed, pitch got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Pitch))) & ". Expected: " & float'Image(fPitch) & ".");
      AUnit.Assertions.Assert(Condition => float(pxNewRotator.tAngles(Roll)) = fRoll,
                              Message   => "CRotator.pxCreate failed, roll got wrong value. Value: " & float'Image(float(pxNewRotator.tAngles(Roll))) & ". Expected: " & float'Image(fRoll) & ".");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_74cb72 (Gnattest_T : in out Test) renames Test_Plus;
--  id:2.1/74cb72073ed6aee4/Plus/1/0/
   procedure Test_Plus (Gnattest_T : in out Test) is
   --  math-rotators.ads:11:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxSumRotator : pCRotator;

      pxLeftOperandRotator : pCRotator;
      fLeftYaw : float := 80.0;
      fLeftPitch : float := -120.0;
      fLeftRoll : float := 176.0;

      pxRightOperandRotator : pCRotator;
      fRightYaw : float := 80.0;
      fRightPitch : float := -120.0;
      fRightRoll : float := 176.0;

      fExpectedYaw : float;
      fExpectedPitch : float;
      fExpectedRoll : float;


   begin

      pxLeftOperandRotator := Math.Rotators.pxCreate(fYaw   => fLeftYaw,
                                                     fPitch => fLeftPitch,
                                                     fRoll  => fLeftRoll);
      pxRightOperandRotator := Math.Rotators.pxCreate(fYaw   => fRightYaw,
                                                      fPitch => fRightPitch,
                                                      fRoll  => fRightRoll);
      pxSumRotator := pxLeftOperandRotator + pxRightOperandRotator;

      fExpectedYaw := fLeftYaw + fRightYaw;
      fExpectedPitch := fLeftPitch + fRightPitch;
      fExpectedRoll := fLeftRoll + fRightRoll;

      fExpectedYaw := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedYaw,
                                                        fRangeFrom => -180.0);
      fExpectedPitch := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedPitch,
                                                          fRangeFrom => -180.0);
      fExpectedRoll := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedRoll,
                                                        fRangeFrom => -180.0);

      AUnit.Assertions.Assert(Condition => float(pxSumRotator.tfGet_Yaw) = fExpectedYaw,
                              Message   => "CRotator.+ failed, tfYaw got wrong value. Value: " & float'Image(float(pxSumRotator.tfGet_Yaw)) & ". Expected: " & float'Image(fExpectedYaw) & ".");
      AUnit.Assertions.Assert(Condition => float(pxSumRotator.tfGet_Pitch) = fExpectedPitch,
                              Message   => "CRotator.+ failed, tfPitch got wrong value. Value: " & float'Image(float(pxSumRotator.tfGet_Pitch)) & ". Expected: " & float'Image(fExpectedPitch) & ".");
      AUnit.Assertions.Assert(Condition => float(pxSumRotator.tfGet_Roll) = fExpectedRoll,
                              Message   => "CRotator.+ failed, tfYRoll got wrong value. Value: " & float'Image(float(pxSumRotator.tfGet_Roll)) & ". Expected: " & float'Image(fExpectedRoll) & ".");

--  begin read only
   end Test_Plus;
--  end read only


--  begin read only
   procedure Test_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_e742e1 (Gnattest_T : in out Test) renames Test_Minus;
--  id:2.1/e742e1d4a9b9e6f5/Minus/1/0/
   procedure Test_Minus (Gnattest_T : in out Test) is
   --  math-rotators.ads:12:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDifferenceRotator : pCRotator;

      pxLeftOperandRotator : pCRotator;
      fLeftYaw : float := 80.0;
      fLeftPitch : float := -120.0;
      fLeftRoll : float := 176.0;

      pxRightOperandRotator : pCRotator;
      fRightYaw : float := 80.0;
      fRightPitch : float := -120.0;
      fRightRoll : float := 176.0;

      fExpectedYaw : float;
      fExpectedPitch : float;
      fExpectedRoll : float;


   begin

      pxLeftOperandRotator := Math.Rotators.pxCreate(fYaw   => fLeftYaw,
                                                     fPitch => fLeftPitch,
                                                     fRoll  => fLeftRoll);
      pxRightOperandRotator := Math.Rotators.pxCreate(fYaw   => fRightYaw,
                                                      fPitch => fRightPitch,
                                                      fRoll  => fRightRoll);
      pxDifferenceRotator := pxLeftOperandRotator - pxRightOperandRotator;

      fExpectedYaw := fLeftYaw - fRightYaw;
      fExpectedPitch := fLeftPitch - fRightPitch;
      fExpectedRoll := fLeftRoll - fRightRoll;

      fExpectedYaw := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedYaw,
                                                        fRangeFrom => -180.0);
      fExpectedPitch := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedPitch,
                                                          fRangeFrom => -180.0);
      fExpectedRoll := Math.Rotators.fGet_Angle_In_Range(fAngle     => fExpectedRoll,
                                                        fRangeFrom => -180.0);

      AUnit.Assertions.Assert(Condition => float(pxDifferenceRotator.tfGet_Yaw) = fExpectedYaw,
                              Message   => "CRotator.+ failed, tfYaw got wrong value. Value: " & float'Image(float(pxDifferenceRotator.tfGet_Yaw)) & ". Expected: " & float'Image(fExpectedYaw) & ".");
      AUnit.Assertions.Assert(Condition => float(pxDifferenceRotator.tfGet_Pitch) = fExpectedPitch,
                              Message   => "CRotator.+ failed, tfPitch got wrong value. Value: " & float'Image(float(pxDifferenceRotator.tfGet_Pitch)) & ". Expected: " & float'Image(fExpectedPitch) & ".");
      AUnit.Assertions.Assert(Condition => float(pxDifferenceRotator.tfGet_Roll) = fExpectedRoll,
                              Message   => "CRotator.+ failed, tfYRoll got wrong value. Value: " & float'Image(float(pxDifferenceRotator.tfGet_Roll)) & ". Expected: " & float'Image(fExpectedRoll) & ".");

--  begin read only
   end Test_Minus;
--  end read only


--  begin read only
   procedure Test_fGet_Angle_In_Range (Gnattest_T : in out Test);
   procedure Test_fGet_Angle_In_Range_d44697 (Gnattest_T : in out Test) renames Test_fGet_Angle_In_Range;
--  id:2.1/d44697d4f60bc519/fGet_Angle_In_Range/1/0/
   procedure Test_fGet_Angle_In_Range (Gnattest_T : in out Test) is
   --  math-rotators.ads:19:4:fGet_Angle_In_Range
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float := -250.0;
      fRangeFrom : float := -180.0;
   begin

      fAngle := Math.Rotators.fGet_Angle_In_Range(fAngle     => fAngle,
                                                  fRangeFrom => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + 360.0),
                              Message   => "CRotator.fGet_Angle_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + 360.0) & ".");

      fAngle := 43460.0;
      fAngle := Math.Rotators.fGet_Angle_In_Range(fAngle     => fAngle,
                                                  fRangeFrom => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + 360.0),
                              Message   => "CRotator.fGet_Angle_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + 360.0) & ".");

--  begin read only
   end Test_fGet_Angle_In_Range;
--  end read only

end Math.Rotators.Test_Data.Tests;
