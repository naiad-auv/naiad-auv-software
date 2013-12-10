--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Can_Float_Conversions.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Can_Float_Conversions.Test_Data.Tests is


   --  begin read only
   procedure Test_Orientation_To_Message (Gnattest_T : in out Test);
   procedure Test_Orientation_To_Message_f946a5 (Gnattest_T : in out Test) renames Test_Orientation_To_Message;
   --  id:2.1/f946a5f7629f3e51/Orientation_To_Message/1/0/
   procedure Test_Orientation_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:20:4:Orientation_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fYaw   : float := 45.0;
      fPitch : float := 35.0;
      fRoll  : float := -45.0;

      fYawOut   : float := 0.0;
      fPitchOut : float := 0.0;
      fRollOut  : float := 0.0;

      b8Output : Can_Defs.Byte8;
   begin

      Orientation_To_Message(fYaw, fPitch, fRoll, b8Output);

      Message_To_Orientation(fYawOut, fPitchOut, fRollOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fYawOut - fYaw) <= 0.0001,
         "Orientation_To_Message conversion incorrect, test 1 fYawOut=" &
           fYawOut'Img & " fYaw= " & fYaw'Img);

      AUnit.Assertions.Assert(
                              abs(fPitchOut - fPitch) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 2 fPitchOut=" &
                                fPitchOut'Img & " fPitch= " & fPitch'Img);

      AUnit.Assertions.Assert(
                              abs(fRollOut - fRoll) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 3 fRoll=" &
                                fRoll'Img & " fRollOut= " & fRollout'Img);


      fYaw    := -fYAW_MAX - 45.0;
      fPitch  := fPITCH_MAX + 35.0;
      fRoll   := fROLL_MAX + 10.0;

      Orientation_To_Message(fYaw, fPitch, fRoll, b8Output);
      Message_To_Orientation(fYawOut, fPitchOut, fRollOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fYawOut - (180.0 - 45.0)) <= 0.0001,
         "Orientation_To_Message conversion incorrect, test 4 fYawOut=" &
           fYawOut'Img & " fYaw= " & fYaw'Img);

      AUnit.Assertions.Assert(
                              abs(fPitchOut - fPITCH_MAX) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 5 fPitchOut=" &
                                fPitchOut'Img & " fPitch= " & fPitch'Img);

      AUnit.Assertions.Assert(
                              abs(fRollOut - (-170.0)) <= 0.001,
                              "Orientation_To_Message conversion incorrect, test 6 fRoll=" &
                                fRoll'Img & " fRollOut= " & fRollout'Img);
      --  begin read only
   end Test_Orientation_To_Message;
   --  end read only


   --  begin read only
   procedure Test_Message_To_Orientation (Gnattest_T : in out Test);
   procedure Test_Message_To_Orientation_ed8395 (Gnattest_T : in out Test) renames Test_Message_To_Orientation;
   --  id:2.1/ed8395d00ddacf8a/Message_To_Orientation/1/0/
   procedure Test_Message_To_Orientation (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:21:4:Message_To_Orientation
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fYaw   : float := 45.0;
      fPitch : float := 35.0;
      fRoll  : float := -45.0;

      fYawOut   : float := 0.0;
      fPitchOut : float := 0.0;
      fRollOut  : float := 0.0;

      b8Output : Can_Defs.Byte8;
   begin

      Orientation_To_Message(fYaw, fPitch, fRoll, b8Output);

      Message_To_Orientation(fYawOut, fPitchOut, fRollOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fYawOut - fYaw) <= 0.0001,
         "Orientation_To_Message conversion incorrect, test 1 fYawOut=" &
           fYawOut'Img & " fYaw= " & fYaw'Img);

      AUnit.Assertions.Assert(
                              abs(fPitchOut - fPitch) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 2 fPitchOut=" &
                                fPitchOut'Img & " fPitch= " & fPitch'Img);

      AUnit.Assertions.Assert(
                              abs(fRollOut - fRoll) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 3 fRoll=" &
                                fRoll'Img & " fRollOut= " & fRollout'Img);


      fYaw    := -fYAW_MAX - 25.0;
      fPitch  := fPITCH_MAX + 11.0;
      fRoll   := fROLL_MAX + 50.0;

      Orientation_To_Message(fYaw, fPitch, fRoll, b8Output);
      Message_To_Orientation(fYawOut, fPitchOut, fRollOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fYawOut - (180.0 - 25.0)) <= 0.0001,
         "Orientation_To_Message conversion incorrect, test 4 fYawOut=" &
           fYawOut'Img & " fYaw= " & fYaw'Img);

      AUnit.Assertions.Assert(
                              abs(fPitchOut - fPITCH_MAX) <= 0.0001,
                              "Orientation_To_Message conversion incorrect, test 5 fPitchOut=" &
                                fPitchOut'Img & " fPitch= " & fPitch'Img);

      AUnit.Assertions.Assert(
                              abs(fRollOut - (-180.0 + 50.0)) <= 0.001,
                              "Orientation_To_Message conversion incorrect, test 6 fRoll=" &
                                fRoll'Img & " fRollOut= " & fRollout'Img);


      --  begin read only
   end Test_Message_To_Orientation;
   --  end read only


   --  begin read only
   procedure Test_Acceleration_To_Message (Gnattest_T : in out Test);
   procedure Test_Acceleration_To_Message_d21584 (Gnattest_T : in out Test) renames Test_Acceleration_To_Message;
   --  id:2.1/d21584ba20bdb393/Acceleration_To_Message/1/0/
   procedure Test_Acceleration_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:24:4:Acceleration_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fX   : float := 2.0;
      fY : float := 5.0;
      fZ  : float := -5.0;

      fXOut   : float := 0.0;
      fYOut : float := 0.0;
      fZOut  : float := 0.0;

      b8Output : Can_Defs.Byte8;
   begin

      Acceleration_To_Message(fX, fY, fZ, b8Output);

      Message_To_Acceleration(fXOut, fYOut, fZOut, b8Output);

      --        AUnit.Assertions.Assert
      --          (abs(fXOut - fX) <= 0.0001,
      --           "Acceleration_To_Message conversion incorrect, test 1 fXOut=" &
      --             fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fY) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 2 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fZ) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 3 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      fX  := -fACCELERATION_MAX - 3.0;
      fY  := fACCELERATION_MAX + 5.0;
      fZ  := fACCELERATION_MAX + 2.0;

      Acceleration_To_Message(fX, fY, fZ, b8Output);
      Message_To_Acceleration(fXOut, fYOut, fZOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fXOut + fACCELERATION_MAX) <= 0.0001,
         "Acceleration_To_Message conversion incorrect, test 4 fXOut=" &
           fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fACCELERATION_MAX) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 5 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fACCELERATION_MAX) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 6 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      --  begin read only
   end Test_Acceleration_To_Message;
   --  end read only


   --  begin read only
   procedure Test_Message_To_Acceleration (Gnattest_T : in out Test);
   procedure Test_Message_To_Acceleration_a49ed1 (Gnattest_T : in out Test) renames Test_Message_To_Acceleration;
   --  id:2.1/a49ed1a2a519be4a/Message_To_Acceleration/1/0/
   procedure Test_Message_To_Acceleration (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:27:4:Message_To_Acceleration
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fX   : float := 2.0;
      fY : float := 5.0;
      fZ  : float := -5.0;

      fXOut   : float := 0.0;
      fYOut : float := 0.0;
      fZOut  : float := 0.0;

      b8Output : Can_Defs.Byte8;
   begin

      Acceleration_To_Message(fX, fY, fZ, b8Output);

      Message_To_Acceleration(fXOut, fYOut, fZOut, b8Output);

      --        AUnit.Assertions.Assert
      --          (abs(fXOut - fX) <= 0.0001,
      --           "Acceleration_To_Message conversion incorrect, test 1 fXOut=" &
      --             fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fY) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 2 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fZ) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 3 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      fX  := -fACCELERATION_MAX - 3.0;
      fY  := fACCELERATION_MAX + 5.0;
      fZ  := fACCELERATION_MAX + 2.0;

      Acceleration_To_Message(fX, fY, fZ, b8Output);
      Message_To_Acceleration(fXOut, fYOut, fZOut, b8Output);

      AUnit.Assertions.Assert
        (abs(fXOut + fACCELERATION_MAX) <= 0.0001,
         "Acceleration_To_Message conversion incorrect, test 4 fXOut=" &
           fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fACCELERATION_MAX) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 5 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fACCELERATION_MAX) <= 0.0001,
                              "Acceleration_To_Message conversion incorrect, test 6 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      --  begin read only
   end Test_Message_To_Acceleration;
   --  end read only


   --  begin read only
   procedure Test_GyroReading_To_Message (Gnattest_T : in out Test);
   procedure Test_GyroReading_To_Message_a54dc5 (Gnattest_T : in out Test) renames Test_GyroReading_To_Message;
   --  id:2.1/a54dc5119646430b/GyroReading_To_Message/1/0/
   procedure Test_GyroReading_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:32:4:GyroReading_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fIn  : float := -5.0;
      fOut   : float := 0.0;
      b8Output, b8Input : Can_Defs.Byte8;

   begin

      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - fIn) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      fIn := 190.0;
      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - (-170.0)) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      fIn := -200.0;
      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - 160.0) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      --  begin read only
   end Test_GyroReading_To_Message;
   --  end read only


   --  begin read only
   procedure Test_Message_To_GyroReading (Gnattest_T : in out Test);
   procedure Test_Message_To_GyroReading_9c2114 (Gnattest_T : in out Test) renames Test_Message_To_GyroReading;
   --  id:2.1/9c21149cf2a6d2e7/Message_To_GyroReading/1/0/
   procedure Test_Message_To_GyroReading (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:33:4:Message_To_GyroReading
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fIn  : float := -25.0;
      fOut   : float := 0.0;
      b8Output, b8Input : Can_Defs.Byte8;

   begin

      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - fIn) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      fIn := 230.0;
      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - (-130.0)) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      fIn := -210.0;
      GyroReading_To_Message(fIn, b8Output);

      --only thee bytes will be sent when sending the gyro values
      b8Input(1) := b8Output(1);
      b8Input(2) := b8Output(2);
      b8Input(3) := b8Output(3);

      Message_To_GyroReading(fOut, b8Input);

      AUnit.Assertions.Assert(abs(fOut - 150.0) <= 0.0001,
                              "GyroReading_To_Message conversion incorrect, test 1 fIn=" &
                                fIn'Img & " fOut= " & fOut'Img);

      --  begin read only
   end Test_Message_To_GyroReading;
   --  end read only


   --  begin read only
   procedure Test_i21_Get_Integer (Gnattest_T : in out Test);
   procedure Test_i21_Get_Integer_2ffcf0 (Gnattest_T : in out Test) renames Test_i21_Get_Integer;
   --  id:2.1/2ffcf0cc58bc5289/i21_Get_Integer/1/0/
   procedure Test_i21_Get_Integer (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:81:4:i21_Get_Integer
      --  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

      --  begin read only
   end Test_i21_Get_Integer;
   --  end read only


   --  begin read only
   procedure Test_fMod (Gnattest_T : in out Test);
   procedure Test_fMod_e22caf (Gnattest_T : in out Test) renames Test_fMod;
   --  id:2.1/e22caf44918f4c8f/fMod/1/0/
   procedure Test_fMod (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:82:4:fMod
      --  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

      --  begin read only
   end Test_fMod;
   --  end read only

end Can_Float_Conversions.Test_Data.Tests;
