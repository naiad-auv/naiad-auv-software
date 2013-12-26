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
   --  can_float_conversions.ads:23:4:Orientation_To_Message
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
   --  can_float_conversions.ads:24:4:Message_To_Orientation
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
   procedure Test_Vector_To_Message (Gnattest_T : in out Test);
   procedure Test_Vector_To_Message_7572aa (Gnattest_T : in out Test) renames Test_Vector_To_Message;
--  id:2.1/7572aac6fa27de43/Vector_To_Message/1/0/
   procedure Test_Vector_To_Message (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:27:4:Vector_To_Message
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

      Vector_To_Message(fX, fY, fZ, b8Output, fACCELERATION_MAX);

      Message_To_Vector(fXOut, fYOut, fZOut, b8Output, fACCELERATION_MAX);

      --        AUnit.Assertions.Assert
      --          (abs(fXOut - fX) <= 0.0001,
      --           "Acceleration_To_Message conversion incorrect, test 1 fXOut=" &
      --             fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fY) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 2 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fZ) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 3 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      fX  := -fACCELERATION_MAX - 3.0;
      fY  := fACCELERATION_MAX + 5.0;
      fZ  := fACCELERATION_MAX + 2.0;

      Vector_To_Message(fX, fY, fZ, b8Output, fACCELERATION_MAX);
      Message_To_Vector(fXOut, fYOut, fZOut, b8Output, fACCELERATION_MAX);

      AUnit.Assertions.Assert
        (abs(fXOut + fACCELERATION_MAX) <= 0.0001,
         "Vector_To_Message conversion incorrect, test 4 fXOut=" &
           fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fACCELERATION_MAX) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 5 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fACCELERATION_MAX) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 6 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);
--  begin read only
   end Test_Vector_To_Message;
--  end read only


--  begin read only
   procedure Test_Message_To_Vector (Gnattest_T : in out Test);
   procedure Test_Message_To_Vector_d1620e (Gnattest_T : in out Test) renames Test_Message_To_Vector;
--  id:2.1/d1620e40d7d2596e/Message_To_Vector/1/0/
   procedure Test_Message_To_Vector (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:30:4:Message_To_Vector
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

      Vector_To_Message(fX, fY, fZ, b8Output, fACCELERATION_MAX);

      Message_To_Vector(fXOut, fYOut, fZOut, b8Output, fACCELERATION_MAX);

      --        AUnit.Assertions.Assert
      --          (abs(fXOut - fX) <= 0.0001,
      --           "Acceleration_To_Message conversion incorrect, test 1 fXOut=" &
      --             fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fY) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 2 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fZ) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 3 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);

      fX  := -fACCELERATION_MAX - 3.0;
      fY  := fACCELERATION_MAX + 5.0;
      fZ  := fACCELERATION_MAX + 2.0;

      Vector_To_Message(fX, fY, fZ, b8Output, fACCELERATION_MAX);
      Message_To_Vector(fXOut, fYOut, fZOut, b8Output, fACCELERATION_MAX);

      AUnit.Assertions.Assert
        (abs(fXOut + fACCELERATION_MAX) <= 0.0001,
         "Vector_To_Message conversion incorrect, test 4 fXOut=" &
           fXOut'Img & " fX= " & fX'Img);

      AUnit.Assertions.Assert(
                              abs(fYOut - fACCELERATION_MAX) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 5 fYOut=" &
                                fYOut'Img & " fY= " & fY'Img);

      AUnit.Assertions.Assert(
                              abs(fZOut - fACCELERATION_MAX) <= 0.0001,
                              "Vector_To_Message conversion incorrect, test 6 fZOut=" &
                                fZOut'Img & " fZ= " & fZ'Img);
--  begin read only
   end Test_Message_To_Vector;
--  end read only


--  begin read only
   procedure Test_GyroReading_To_Message (Gnattest_T : in out Test);
   procedure Test_GyroReading_To_Message_a54dc5 (Gnattest_T : in out Test) renames Test_GyroReading_To_Message;
--  id:2.1/a54dc5119646430b/GyroReading_To_Message/1/0/
   procedure Test_GyroReading_To_Message (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:38:4:GyroReading_To_Message
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
   --  can_float_conversions.ads:39:4:Message_To_GyroReading
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
   procedure Test_PID_Scalings_To_Message (Gnattest_T : in out Test);
   procedure Test_PID_Scalings_To_Message_99b448 (Gnattest_T : in out Test) renames Test_PID_Scalings_To_Message;
--  id:2.1/99b448c2b2fd3410/PID_Scalings_To_Message/1/0/
   procedure Test_PID_Scalings_To_Message (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:43:4:PID_Scalings_To_Message
--  end read only

      pragma Unreferenced (Gnattest_T);
      use Interfaces;

      IDin, IDout : Interfaces.Unsigned_8;
      fPin, fPout, fIin, fIout, fDin, fDout, fRange : float;

      b8MsgOut, b8MsgIn : CAN_Defs.Byte8;

   begin
      IDin 	:= 2;
      fPin 	:= -6.0;
      fIin 	:= -1.0;
      fDin 	:= 2.0;
      fRange 	:= 5.0;

      PID_Scalings_To_Message(IDin, fPin, fIin, fDin, fRange, b8MsgOut);
      for i in 1..7 loop
         b8MsgIn(CAN_Defs.DLC_Type(i)) := b8MsgOut(CAN_Defs.DLC_Type(i));
      end loop;
      Message_To_PID_Scalings(IDout, fPout, fIout, fDout, fRange, b8MsgIn);

      AUnit.Assertions.Assert
        (IDout = 2,
         "IDout incorrect");
      AUnit.Assertions.Assert
        (abs(fPout - (-5.0)) < 0.01,
         "fPout incorrect = " & fPout'Img);
      AUnit.Assertions.Assert
        (abs(fIout - (-1.0)) < 0.01,
         "fIout incorrect = " & fIout'Img);
      AUnit.Assertions.Assert
        (abs(fDout - (2.0)) < 0.01,
         "fDout incorrect = " & fDout'Img);

      IDin 	:= 3;
      fPin 	:= -4.0;
      fIin 	:= 0.0;
      fDin 	:= 7.36;
      fRange 	:= 7.0;

      PID_Scalings_To_Message(IDin, fPin, fIin, fDin, fRange, b8MsgOut);
      for i in 1..7 loop
         b8MsgIn(CAN_Defs.DLC_Type(i)) := b8MsgOut(CAN_Defs.DLC_Type(i));
      end loop;
      Message_To_PID_Scalings(IDout, fPout, fIout, fDout, fRange, b8MsgIn);

      AUnit.Assertions.Assert
        (IDout = 3,
         "IDout incorrect");
      AUnit.Assertions.Assert
        (abs(fPout - (-4.0)) < 0.01,
         "fPout incorrect = " & fPout'Img);
      AUnit.Assertions.Assert
        (abs(fIout - (0.0)) < 0.01,
         "fIout incorrect = " & fIout'Img);
      AUnit.Assertions.Assert
        (abs(fDout - (7.0)) < 0.01,
         "fDout incorrect = " & fDout'Img);
--  begin read only
   end Test_PID_Scalings_To_Message;
--  end read only


--  begin read only
   procedure Test_Message_To_PID_Scalings (Gnattest_T : in out Test);
   procedure Test_Message_To_PID_Scalings_839a1d (Gnattest_T : in out Test) renames Test_Message_To_PID_Scalings;
--  id:2.1/839a1db7175b045c/Message_To_PID_Scalings/1/0/
   procedure Test_Message_To_PID_Scalings (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:47:4:Message_To_PID_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);
      use Interfaces;
      IDin, IDout : Interfaces.Unsigned_8;
      fPin, fPout, fIin, fIout, fDin, fDout, fRange : float;

      b8MsgOut, b8MsgIn : CAN_Defs.Byte8;

   begin
      IDin 	:= 2;
      fPin 	:= -6.0;
      fIin 	:= -1.0;
      fDin 	:= 2.0;
      fRange 	:= 5.0;

      PID_Scalings_To_Message(IDin, fPin, fIin, fDin, fRange, b8MsgOut);
      for i in 1..7 loop
         b8MsgIn(CAN_Defs.DLC_Type(i)) := b8MsgOut(CAN_Defs.DLC_Type(i));
      end loop;
      Message_To_PID_Scalings(IDout, fPout, fIout, fDout, fRange, b8MsgIn);

      AUnit.Assertions.Assert
        (IDout = 2,
         "IDout incorrect");
      AUnit.Assertions.Assert
        (abs(fPout - (-5.0)) < 0.01,
         "fPout incorrect = " & fPout'Img);
      AUnit.Assertions.Assert
        (abs(fIout - (-1.0)) < 0.01,
         "fIout incorrect = " & fIout'Img);
      AUnit.Assertions.Assert
        (abs(fDout - (2.0)) < 0.01,
         "fDout incorrect = " & fDout'Img);

      IDin 	:= 3;
      fPin 	:= -4.0;
      fIin 	:= 0.0;
      fDin 	:= 7.36;
      fRange 	:= 7.0;

      PID_Scalings_To_Message(IDin, fPin, fIin, fDin, fRange, b8MsgOut);
      for i in 1..7 loop
         b8MsgIn(CAN_Defs.DLC_Type(i)) := b8MsgOut(CAN_Defs.DLC_Type(i));
      end loop;
      Message_To_PID_Scalings(IDout, fPout, fIout, fDout, fRange, b8MsgIn);

      AUnit.Assertions.Assert
        (IDout = 3,
         "IDout incorrect");
      AUnit.Assertions.Assert
        (abs(fPout - (-4.0)) < 0.01,
         "fPout incorrect = " & fPout'Img);
      AUnit.Assertions.Assert
        (abs(fIout - (0.0)) < 0.01,
         "fIout incorrect = " & fIout'Img);
      AUnit.Assertions.Assert
        (abs(fDout - (7.0)) < 0.01,
         "fDout incorrect = " & fDout'Img);

--  begin read only
   end Test_Message_To_PID_Scalings;
--  end read only


--  begin read only
   procedure Test_OrientationMatrix_To_Message (Gnattest_T : in out Test);
   procedure Test_OrientationMatrix_To_Message_974485 (Gnattest_T : in out Test) renames Test_OrientationMatrix_To_Message;
--  id:2.1/9744854faa920df2/OrientationMatrix_To_Message/1/0/
   procedure Test_OrientationMatrix_To_Message (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:55:4:OrientationMatrix_To_Message
--  end read only

      pragma Unreferenced (Gnattest_T);

      InData, OutData : Can_Float_Conversions.TOrientation_Matrix_Float_Array;
      b8Message : CAN_Defs.Byte8;
   begin

      InData(1) := 2.0;
      InData(2) := 1.0;
      InData(3) := 0.5;
      InData(4) := -0.3;
      InData(5) := -1.0;
      InData(6) := -1.6;

      Can_Float_Conversions.OrientationMatrix_To_Message(InData,  b8Message);

      Can_Float_Conversions.Message_To_OrientationMatrix(OutData, b8Message);

      AUnit.Assertions.Assert
        (abs(OutData(1) - (1.0)) < 0.01,
         "Test OutData incorrect. OutData(1)= " & OutData(1)'img);

      AUnit.Assertions.Assert
        (abs(OutData(2) - (1.0)) < 0.01,
         "Test OutData incorrect. OutData(2)= " & OutData(2)'img);

      AUnit.Assertions.Assert
        (abs(OutData(3) - (0.5)) < 0.01,
         "Test OutData incorrect. OutData(3)= " & OutData(3)'img);

      AUnit.Assertions.Assert
        (abs(OutData(4) - (-0.3)) < 0.01,
         "Test OutData incorrect. OutData(4)= " & OutData(4)'img);

      AUnit.Assertions.Assert
        (abs(OutData(5) - (-1.0)) < 0.01,
         "Test OutData incorrect. OutData(5)= " & OutData(5)'img);

      AUnit.Assertions.Assert
        (abs(OutData(6) - (-1.0)) < 0.01,
         "Test OutData incorrect. OutData(6)= " & OutData(6)'img);

--  begin read only
   end Test_OrientationMatrix_To_Message;
--  end read only


--  begin read only
   procedure Test_Message_To_OrientationMatrix (Gnattest_T : in out Test);
   procedure Test_Message_To_OrientationMatrix_8960e9 (Gnattest_T : in out Test) renames Test_Message_To_OrientationMatrix;
--  id:2.1/8960e973892256d3/Message_To_OrientationMatrix/1/0/
   procedure Test_Message_To_OrientationMatrix (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:56:4:Message_To_OrientationMatrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      InData, OutData : Can_Float_Conversions.TOrientation_Matrix_Float_Array;
      b8Message : CAN_Defs.Byte8;
   begin

      InData(1) := 2.0;
      InData(2) := 1.0;
      InData(3) := 0.5;
      InData(4) := -0.3;
      InData(5) := -1.0;
      InData(6) := -1.6;

      Can_Float_Conversions.OrientationMatrix_To_Message(InData, b8Message);

      Can_Float_Conversions.Message_To_OrientationMatrix(OutData, b8Message);

      AUnit.Assertions.Assert
        (abs(OutData(1) - (1.0)) < 0.01,
         "Test OutData incorrect.");

      AUnit.Assertions.Assert
        (abs(OutData(2) - (1.0)) < 0.01,
         "Test OutData incorrect.");

      AUnit.Assertions.Assert
        (abs(OutData(3) - (0.5)) < 0.01,
         "Test OutData incorrect.");

      AUnit.Assertions.Assert
        (abs(OutData(4) - (-0.3)) < 0.01,
         "Test OutData incorrect.");

      AUnit.Assertions.Assert
        (abs(OutData(5) - (-1.0)) < 0.01,
         "Test OutData incorrect.");

      AUnit.Assertions.Assert
        (abs(OutData(6) - (-1.0)) < 0.01,
         "Test OutData incorrect.");

--  begin read only
   end Test_Message_To_OrientationMatrix;
--  end read only


--  begin read only
   procedure Test_i21_Get_Integer (Gnattest_T : in out Test);
   procedure Test_i21_Get_Integer_2ffcf0 (Gnattest_T : in out Test) renames Test_i21_Get_Integer;
--  id:2.1/2ffcf0cc58bc5289/i21_Get_Integer/1/0/
   procedure Test_i21_Get_Integer (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:163:4:i21_Get_Integer
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      --there is no need to test this since if this function fails
      -- then other tests will still detect this since those tests
      --indirectly call this function
      AUnit.Assertions.Assert
        (True,
         "Test not implemented.");
--  begin read only
   end Test_i21_Get_Integer;
--  end read only


--  begin read only
   procedure Test_i16_Get_Integer (Gnattest_T : in out Test);
   procedure Test_i16_Get_Integer_3215f1 (Gnattest_T : in out Test) renames Test_i16_Get_Integer;
--  id:2.1/3215f1efe2f43887/i16_Get_Integer/1/0/
   procedure Test_i16_Get_Integer (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:164:4:i16_Get_Integer
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      --there is no need to test this since if this function fails
      -- then other tests will still detect this since those tests
      --indirectly call this function
      AUnit.Assertions.Assert
        (True,
         "Test not implemented.");
--  begin read only
   end Test_i16_Get_Integer;
--  end read only


--  begin read only
   procedure Test_i10_Get_Integer (Gnattest_T : in out Test);
   procedure Test_i10_Get_Integer_2bbcea (Gnattest_T : in out Test) renames Test_i10_Get_Integer;
--  id:2.1/2bbceafc0fd70ef3/i10_Get_Integer/1/0/
   procedure Test_i10_Get_Integer (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:165:4:i10_Get_Integer
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --there is no need to test this since if this function fails
      -- then other tests will still detect this since those tests
      --indirectly call this function
      AUnit.Assertions.Assert
        (true,
         "Test not implemented.");

--  begin read only
   end Test_i10_Get_Integer;
--  end read only


--  begin read only
   procedure Test_fMod (Gnattest_T : in out Test);
   procedure Test_fMod_e22caf (Gnattest_T : in out Test) renames Test_fMod;
--  id:2.1/e22caf44918f4c8f/fMod/1/0/
   procedure Test_fMod (Gnattest_T : in out Test) is
   --  can_float_conversions.ads:166:4:fMod
--  end read only

      pragma Unreferenced (Gnattest_T);
      f : float;
   begin

      f := fMod(1.0, 180.0);
      AUnit.Assertions.Assert
        (abs(f - 1.0) < 0.001,
         "fMod incorrect, result= " & f'Img);

      f := fMod(200.0, 180.0);
      AUnit.Assertions.Assert
        (abs(f + 160.0) < 0.001,
         "fMod incorrect, result= " & f'Img);

      f := fMod(-210.0, 180.0);
      AUnit.Assertions.Assert
        (abs(f - 150.0) < 0.001,
         "fMod incorrect, result= " & f'Img);
--  begin read only
   end Test_fMod;
--  end read only

end Can_Float_Conversions.Test_Data.Tests;
