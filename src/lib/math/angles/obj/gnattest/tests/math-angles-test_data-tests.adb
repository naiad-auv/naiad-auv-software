--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Angles.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Angles.Test_Data.Tests is


--  begin read only
   procedure Test_fGet_Angle_Degrees_In_Range (Gnattest_T : in out Test);
   procedure Test_fGet_Angle_Degrees_In_Range_1c8f14 (Gnattest_T : in out Test) renames Test_fGet_Angle_Degrees_In_Range;
--  id:2.1/1c8f147d4fbef554/fGet_Angle_Degrees_In_Range/1/0/
   procedure Test_fGet_Angle_Degrees_In_Range (Gnattest_T : in out Test) is
   --  math-angles.ads:8:4:fGet_Angle_Degrees_In_Range
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float := -250.0;
      fRangeFrom : float := -180.0;
   begin

      fAngle := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fAngle,
                                                        fRangeFromExclusive => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + 360.0),
                              Message   => "CRotator.fGet_Angle_Degrees_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + 360.0) & ".");

      fAngle := 43460.0;
      fAngle := Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fAngle,
                                                        fRangeFromExclusive => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + 360.0),
                              Message   => "CRotator.fGet_Angle_Degrees_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + 360.0) & ".");

--  begin read only
   end Test_fGet_Angle_Degrees_In_Range;
--  end read only


--  begin read only
   procedure Test_fGet_Angle_Radians_In_Range (Gnattest_T : in out Test);
   procedure Test_fGet_Angle_Radians_In_Range_73a42b (Gnattest_T : in out Test) renames Test_fGet_Angle_Radians_In_Range;
--  id:2.1/73a42b665dbd6024/fGet_Angle_Radians_In_Range/1/0/
   procedure Test_fGet_Angle_Radians_In_Range (Gnattest_T : in out Test) is
   --  math-angles.ads:9:4:fGet_Angle_Radians_In_Range
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float := -100.5;
      fRangeFrom : float := -1.0 * Ada.Numerics.Pi;
   begin

      fAngle := Math.Angles.fGet_Angle_Radians_In_Range(fAngle              => fAngle,
                                                        fRangeFromExclusive => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + 360.0),
                              Message   => "CRotator.fGet_Angle_Radians_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + (2.0 * Ada.Numerics.Pi)) & ".");

      fAngle := 43460.0;
      fAngle := Math.Angles.fGet_Angle_Radians_In_Range(fAngle              => fAngle,
                                                        fRangeFromExclusive => fRangeFrom);

      AUnit.Assertions.Assert(Condition => fAngle > fRangeFrom and fAngle <= (fRangeFrom + (2.0 * Ada.Numerics.Pi)),
                              Message   => "CRotator.fGet_Angle_Radians_In_Range failed, value outside of range. Value: " & float'Image(fAngle) & ". Range from " & float'Image(fRangeFrom) & " to " & float'Image(fRangeFrom + (2.0 * Ada.Numerics.Pi)) & ".");

--  begin read only
   end Test_fGet_Angle_Radians_In_Range;
--  end read only


--  begin read only
   procedure Test_fRadians_To_Degrees (Gnattest_T : in out Test);
   procedure Test_fRadians_To_Degrees_020d52 (Gnattest_T : in out Test) renames Test_fRadians_To_Degrees;
--  id:2.1/020d52faaa612588/fRadians_To_Degrees/1/0/
   procedure Test_fRadians_To_Degrees (Gnattest_T : in out Test) is
   --  math-angles.ads:10:4:fRadians_To_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float;
   begin

      for i in 1 .. 20000
      loop
         fAngle := Math.Angles.fRadians_To_Degrees(fAngle => float(i) / 100.0);
         AUnit.Assertions.Assert(Condition => fAngle = ((float(i) / 100.0) * 180.0) / Ada.Numerics.Pi,
                                 Message   => "Angles.fRadians_To_Degrees failed, wrong value. Value: " & float'Image(fAngle) & ". Expected: " & float'Image(((float(i) / 100.0) * 180.0) / Ada.Numerics.Pi) & ".");
      end loop;

      for i in 1 .. 20000
      loop
         fAngle := Math.Angles.fRadians_To_Degrees(fAngle => float(i) / (-100.0));
         AUnit.Assertions.Assert(Condition => fAngle = ((float(i) / (-100.0)) * 180.0) / Ada.Numerics.Pi,
                                 Message   => "Angles.fRadians_To_Degrees failed, wrong value. Value: " & float'Image(fAngle) & ". Expected: " & float'Image(((float(i) / 100.0) * 180.0) / Ada.Numerics.Pi) & ".");
      end loop;

--  begin read only
   end Test_fRadians_To_Degrees;
--  end read only


--  begin read only
   procedure Test_fDegrees_To_Radians (Gnattest_T : in out Test);
   procedure Test_fDegrees_To_Radians_82d864 (Gnattest_T : in out Test) renames Test_fDegrees_To_Radians;
--  id:2.1/82d864d89bdadfe4/fDegrees_To_Radians/1/0/
   procedure Test_fDegrees_To_Radians (Gnattest_T : in out Test) is
   --  math-angles.ads:11:4:fDegrees_To_Radians
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float;
   begin

      for i in 1 .. 20000
      loop
         fAngle := Math.Angles.fDegrees_To_Radians(fAngle => float(i));
         AUnit.Assertions.Assert(Condition => fAngle = ((float(i)) * Ada.Numerics.Pi) / 180.0,
                                 Message   => "Angles.fDegrees_To_Radians failed, wrong value. Value: " & float'Image(fAngle) & ". Expected: " & float'Image(((float(i) / 100.0) * 180.0) / Ada.Numerics.Pi) & ".");
      end loop;

      for i in 1 .. 20000
      loop
         fAngle := Math.Angles.fDegrees_To_Radians(fAngle => -float(i));
         AUnit.Assertions.Assert(Condition => fAngle = ((-float(i)) * Ada.Numerics.Pi) / 180.0,
                                 Message   => "Angles.fDegrees_To_Radians failed, wrong value. Value: " & float'Image(fAngle) & ". Expected: " & float'Image(((float(i) / 100.0) * 180.0) / Ada.Numerics.Pi) & ".");
      end loop;

--  begin read only
   end Test_fDegrees_To_Radians;
--  end read only


--  begin read only
   procedure Test_fTAngle_To_FAngle (Gnattest_T : in out Test);
   procedure Test_fTAngle_To_FAngle_d09c7f (Gnattest_T : in out Test) renames Test_fTAngle_To_FAngle;
--  id:2.1/d09c7fc8a4672d05/fTAngle_To_FAngle/1/0/
   procedure Test_fTAngle_To_FAngle (Gnattest_T : in out Test) is
   --  math-angles.ads:12:4:fTAngle_To_FAngle
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfAngle : TAngle := 120.0;
   begin



      AUnit.Assertions.Assert(Condition => Math.Angles.fTAngle_To_FAngle(tfAngle) = 120.0,
                              Message   => "fTAngle_To_FAngle failed.");

--  begin read only
   end Test_fTAngle_To_FAngle;
--  end read only


--  begin read only
   procedure Test_tfFAngle_To_TAngle (Gnattest_T : in out Test);
   procedure Test_tfFAngle_To_TAngle_52086e (Gnattest_T : in out Test) renames Test_tfFAngle_To_TAngle;
--  id:2.1/52086e37e67bb240/tfFAngle_To_TAngle/1/0/
   procedure Test_tfFAngle_To_TAngle (Gnattest_T : in out Test) is
   --  math-angles.ads:13:4:tfFAngle_To_TAngle
--  end read only

      pragma Unreferenced (Gnattest_T);

      fAngle : float := 380.0;
   begin



      AUnit.Assertions.Assert(Condition => Math.Angles.tfFAngle_To_TAngle(fAngle) = TAngle(fAngle - 360.0),
                              Message   => "tfFAngle_To_TAngle failed.");


--  begin read only
   end Test_tfFAngle_To_TAngle;
--  end read only



end Math.Angles.Test_Data.Tests;
