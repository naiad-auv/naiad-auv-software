

---------------------------------------------------------------------------
-- This code implements functions to put INS-data (float values) into can messages.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-17

---------------------------------------------------------------------------

package body Can_Float_Conversions is

   pragma Suppress(All_Checks);


   procedure Orientation_To_Message(fYaw : float; fPitch : float; fRoll : float; b8Message : out Can_Defs.Byte8) is
      Data : TThree_i21s;
   begin
      Data.i21One   := i21_Get_Integer(fMod(fYaw, fYAW_MAX),   fYAW_RESOLUTION);
      Data.i21Two   := i21_Get_Integer(fPitch, fPITCH_RESOLUTION);
      Data.i21Three := i21_Get_Integer(fMod(fRoll, fROLL_MAX),  fROLL_RESOLUTION);

      b8Message :=  b8Orientation_To_Message(Data);
   end Orientation_To_Message;

   procedure Message_To_Orientation(fYaw : out float; fPitch : out float; fRoll : out float; b8Message : Can_Defs.Byte8) is
      Data : TThree_i21s;
   begin
      Data :=  TMessage_To_Orientation(b8Message);
      fYaw   := Float(Data.i21One)   * fYAW_RESOLUTION;
      fPitch := Float(Data.i21Two)   * fPITCH_RESOLUTION;
      fRoll  := Float(Data.i21Three) * fROLL_RESOLUTION;
   end Message_To_Orientation;


   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure Vector_To_Message(fX : float; fY : float; fZ : float;
                               b8Message : out Can_Defs.Byte8;
                               fMax : float) is

      fResolution : float := 2.0 * fMax / Float(2 ** 21);
      Data : TThree_i21s;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data.i21One   := i21_Get_Integer(fX, fResolution);
      Data.i21Two   := i21_Get_Integer(fY, fResolution);
      Data.i21Three := i21_Get_Integer(fZ, fResolution);

      b8Message :=  b8Orientation_To_Message(Data);
   end Vector_To_Message;



   procedure Message_To_Vector(fX : out float; fY : out float; fZ : out float;
                               b8Message : Can_Defs.Byte8;
                               fMax : float) is

      fResolution : float := 2.0 * fMax / Float(2 ** 21);
      Data : TThree_i21s;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data  := TMessage_To_Orientation(b8Message);
      fX := Float(Data.i21One)   * fResolution;
      fY := Float(Data.i21Two)   * fResolution;
      fZ := Float(Data.i21Three) * fResolution;
   end Message_To_Vector;

   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure GyroReading_To_Message(fGyroReading : float; b8Message : out Can_Defs.Byte8) is

      function i24Get_Integer(fValue : float; fResolution : float) return Integer_24 is
         fInternal : float;
      begin
         fInternal := fValue / fResolution;
         return Integer_24(fMod(fInternal, Float(Integer_24'Last)));
      end i24Get_Integer;


      i24Reading : Integer_24;
      ReadingArr : TGyroReadingArray;
   begin

      i24Reading   := i24Get_Integer(fGyroReading, fGYRO_RESOLUTION);
      ReadingArr   := i24To_Gyro_Reading(i24Reading);

      b8Message(1) := ReadingArr(1);
      b8Message(2) := ReadingArr(2);
      b8Message(3) := ReadingArr(3);
   end GyroReading_To_Message;


   procedure Message_To_GyroReading(fGyroReading : out float; b8Message : Can_Defs.Byte8) is
      i24Reading : Integer_24;
      ReadingArr : TGyroReadingArray;
   begin
      ReadingArr(1) := b8Message(1);
      ReadingArr(2) := b8Message(2);
      ReadingArr(3) := b8Message(3);

      i24Reading := Gyro_Reading_To_i24(ReadingArr);

      fGyroReading := Float(i24Reading) * fGYRO_RESOLUTION;
   end Message_To_GyroReading;


   procedure PID_Scalings_To_Message(u8ID : Interfaces.Unsigned_8; fProportional : float;
                                     fIntegral : float;     fDerivative : float;
                                     fScaleRange : float;   b8Message   : out Can_Defs.Byte8) is

      fScaleResolution : float := 2.0 * fScaleRange / Float(2 ** 16);

      xScalings : TPID_Scalings;
      xScalingsArr : TPID_ScalingsArray;
   begin

      xScalings.u8ID := u8ID;
      xScalings.i16P := i16_Get_Integer(fProportional, fScaleResolution);
      xScalings.i16I := i16_Get_Integer(fIntegral, fScaleResolution);
      xScalings.i16D := i16_Get_Integer(fDerivative, fScaleResolution);

      xScalingsArr := PID_Scalings_To_Array(xScalings);

      for i in 1..7 loop
         b8Message(CAN_Defs.DLC_Type(i)) := xScalingsArr(i);
      end loop;
   end PID_Scalings_To_Message;


   procedure Message_To_PID_Scalings(u8ID : out Interfaces.Unsigned_8; fProportional : out float;
                                     fIntegral : out float; fDerivative : out float;
                                     fScaleRange : float;   b8Message   :   Can_Defs.Byte8) is

      fScaleResolution : float := 2.0 * fScaleRange / Float(2 ** 16);
      xScalings : TPID_Scalings;
      xScalingsArr : TPID_ScalingsArray;
   begin
      for i in 1..7 loop
         xScalingsArr(i) := b8Message(CAN_Defs.DLC_Type(i));
      end loop;

      xScalings := Array_To_PID_Scalings(xScalingsArr);

      u8ID := xScalings.u8ID;
      fProportional 	:= Float(xScalings.i16P) * fScaleResolution;
      fIntegral 	:= Float(xScalings.i16I) * fScaleResolution;
      fDerivative 	:= Float(xScalings.i16D) * fScaleResolution;
   end Message_To_PID_Scalings;


   procedure OrientationMatrix_To_Message(fFloats : TOrientation_Matrix_Float_Array;
                                          b8Message : out Can_Defs.Byte8) is

      fScaleResolution : float := 2.0 * 1.0 / Float(2 ** 10);
      data : TOrientation_Matrix_Record;
   begin
      data.i10Value1 := i10_Get_Integer(fFloats(1), fScaleResolution);
      data.i10Value2 := i10_Get_Integer(fFloats(2), fScaleResolution);
      data.i10Value3 := i10_Get_Integer(fFloats(3), fScaleResolution);
      data.i10Value4 := i10_Get_Integer(fFloats(4), fScaleResolution);
      data.i10Value5 := i10_Get_Integer(fFloats(5), fScaleResolution);
      data.i10Value6 := i10_Get_Integer(fFloats(6), fScaleResolution);

      b8Message := b8OTOrientation_Matrix_Record_To_Message(data);
   end OrientationMatrix_To_Message;

   procedure Message_To_OrientationMatrix(fFloats : out TOrientation_Matrix_Float_Array;
                                          b8Message : Can_Defs.Byte8) is

      fScaleResolution : float := 2.0 * 1.0 / Float(2 ** 10);
      data : TOrientation_Matrix_Record;
   begin

      data := TMessage_To_TOrientation_Matrix_Record(b8Message);

      fFloats(1) := float(data.i10Value1) * fScaleResolution;
      fFloats(2) := float(data.i10Value2) * fScaleResolution;
      fFloats(3) := float(data.i10Value3) * fScaleResolution;
      fFloats(4) := float(data.i10Value4) * fScaleResolution;
      fFloats(5) := float(data.i10Value5) * fScaleResolution;
      fFloats(6) := float(data.i10Value6) * fScaleResolution;
   end Message_To_OrientationMatrix;


   function i21_Get_Integer(fValue : float; fResolution : float) return Integer_21 is
      fInternal : float;
   begin
      fInternal := fValue / fResolution;

      if fInternal >= Float(Integer_21'Last) then
         return Integer_21'Last;
      elsif fInternal <= Float(Integer_21'First) then
         return Integer_21'First;
      else
         return Integer_21(fInternal);
      end if;
   end i21_Get_Integer;

   function i16_Get_Integer(fValue : float; fResolution : float) return Interfaces.Integer_16 is
      fInternal : float;
   begin
      fInternal := fValue / fResolution;

      if fInternal >= Float(Interfaces.Integer_16'Last) then
         return Interfaces.Integer_16'Last;
      elsif fInternal <= Float(Interfaces.Integer_16'First) then
         return Interfaces.Integer_16'First;
      else
         return Interfaces.Integer_16(fInternal);
      end if;
   end i16_Get_Integer;

   function i10_Get_Integer(fValue : float; fResolution : float) return Integer_10 is
      fInternal : float;
   begin
      fInternal := fValue / fResolution;

      if fInternal >= Float(Integer_10'Last) then
         return Integer_10'Last;
      elsif fInternal <= Float(Integer_10'First) then
         return Integer_10'First;
      else
         return Integer_10(fInternal);
      end if;
   end i10_Get_Integer;



   function fMod(fValue : float; fRange : float) return float is
   begin
      if fValue >= fRange then
         return fMod(fValue - 2.0 * fRange, fRange);
      elsif  fValue <= -fRange then
         return fMod(fValue + 2.0 * fRange, fRange);
      end if;
      return  fValue;
   end fMod;
end Can_Float_Conversions;
