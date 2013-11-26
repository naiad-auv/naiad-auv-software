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
   procedure Test_Orientation_To_Message_77271c (Gnattest_T : in out Test) renames Test_Orientation_To_Message;
   --  id:2.1/77271cdd101c2b2a/Orientation_To_Message/1/0/
   procedure Test_Orientation_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:18:4:Orientation_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fYaw   : float := 45.0;
      fPitch : float := 35.0;
      fRoll  : float := -45.0;

      fYawOut   : float := 0.0;
      fPitchOut : float := 0.0;
      fRollOut  : float := 0.0;

      b8Output : AVR.AT90CAN128.CAN.Byte8;
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
   procedure Test_Message_To_Orientation_c23cdc (Gnattest_T : in out Test) renames Test_Message_To_Orientation;
   --  id:2.1/c23cdc47416321aa/Message_To_Orientation/1/0/
   procedure Test_Message_To_Orientation (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:19:4:Message_To_Orientation
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fYaw   : float := 45.0;
      fPitch : float := 35.0;
      fRoll  : float := -45.0;

      fYawOut   : float := 0.0;
      fPitchOut : float := 0.0;
      fRollOut  : float := 0.0;

      b8Output : AVR.AT90CAN128.CAN.Byte8;
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
   procedure Test_Acceleration_To_Message_eaa5d2 (Gnattest_T : in out Test) renames Test_Acceleration_To_Message;
   --  id:2.1/eaa5d20cc98b9060/Acceleration_To_Message/1/0/
   procedure Test_Acceleration_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:22:4:Acceleration_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fX   : float := 2.0;
      fY : float := 5.0;
      fZ  : float := -5.0;

      fXOut   : float := 0.0;
      fYOut : float := 0.0;
      fZOut  : float := 0.0;

      b8Output : AVR.AT90CAN128.CAN.Byte8;
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
   procedure Test_Message_To_Acceleration_1ee59d (Gnattest_T : in out Test) renames Test_Message_To_Acceleration;
   --  id:2.1/1ee59d567c7d564a/Message_To_Acceleration/1/0/
   procedure Test_Message_To_Acceleration (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:23:4:Message_To_Acceleration
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fX   : float := 2.0;
      fY : float := 5.0;
      fZ  : float := -5.0;

      fXOut   : float := 0.0;
      fYOut : float := 0.0;
      fZOut  : float := 0.0;

      b8Output : AVR.AT90CAN128.CAN.Byte8;
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
   procedure Test_GyroReading_To_Message_aec609 (Gnattest_T : in out Test) renames Test_GyroReading_To_Message;
   --  id:2.1/aec6097599dd539a/GyroReading_To_Message/1/0/
   procedure Test_GyroReading_To_Message (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:26:4:GyroReading_To_Message
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fIn  : float := -5.0;
      fOut   : float := 0.0;
      b8Output, b8Input : AVR.AT90CAN128.CAN.Byte8;

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
   procedure Test_Message_To_GyroReading_19064a (Gnattest_T : in out Test) renames Test_Message_To_GyroReading;
   --  id:2.1/19064a81df281166/Message_To_GyroReading/1/0/
   procedure Test_Message_To_GyroReading (Gnattest_T : in out Test) is
      --  can_float_conversions.ads:27:4:Message_To_GyroReading
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fIn  : float := -25.0;
      fOut   : float := 0.0;
      b8Output, b8Input : AVR.AT90CAN128.CAN.Byte8;

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

end Can_Float_Conversions.Test_Data.Tests;
