--------------------------------------------------------------------------
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-03

--  TODO: Hardware testing....
--------------------------------------------------------------------------

with AVR.AT90CAN128.CAN;

with Can_Float_Conversions;
with Str2Float;

--  --  with Math.Angles;
--  with Math.Quaternions;

with Ins_Controller_Utils;

package body Ins_Controller is

   pragma Suppress (All_Checks);


   procedure Init(port : AVR.AT90CAN128.USART.USARTID; canBaud_Rate : Can_Defs.Baud_Rate; bUseExtendedID : Boolean) is

   begin
      bExtendedIds := bUseExtendedID;

      Ins_Controller_Utils.Init_Uart(port, AVR.AT90CAN128.USART.BAUD115200);
      AVR.AT90CAN128.CAN.Can_Init(canBaud_Rate);
      AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(0,(CAN_Defs.MSG_SIMULATION_MODE_ID.Identifier, bUseExtendedID),
                                               (536870911, bUseExtendedID));


      Ins_Controller_Utils.Communication_Protocol_Control(usart_port);
      Ins_Controller_Utils.Async_Data_Output_Type_Register_Off(usart_port);
      Ins_Controller_Utils.Async_Data_Output_Frequency_Register(usart_port);
      Ins_Controller_Utils.Synchronization_Control(usart_port);
      Ins_Controller_Utils.VPE_Basic_Control(usart_port);
      Ins_Controller_Utils.Async_Data_Output_Type_Register(usart_port);

      Ins_Controller_Utils.Serial_Baud_Rate_Register(usart_port);

      Ins_Controller_Utils.Init_Uart(port, AVR.AT90CAN128.USART.BAUD230400);

      AVR.AT90CAN128.USART.Flush_Receive_Buffer(usart_port);
      Ins_Controller_Utils.Init_Interrupts;

   end Init;


--     procedure Get_Position(fX : out Float; fY : out Float; fZ : out Float) is
--     begin
--        fX := xFixedPositionVector.fGet_X;
--        fY := xFixedPositionVector.fGet_Y;
--        fZ := xFixedPositionVector.fGet_Z;
--     end Get_Position;

--     function Get_Orientation return Math.Matrices.CMatrix is
--     begin
--        return xOrientationMatrix;
--     end Get_Orientation;


   procedure Imu_Interrupt is

      --this function assumes the format +1235.156
      function Read_Next_Float return float is
         sTemp : String(1..1);
         iCharsRead : Integer;
         sBuffer : String(1..20);
         i : Integer := 0;
      begin
         loop
            Ins_Controller_Utils.Read(sTemp, 1, iCharsRead, usart_port);

            if iCharsRead = 1 then
               exit when sTemp(1) = ',' or sTemp(1) = '*';

               i := i + 1;
               sBuffer(i) := sTemp(1);
            end if;
         end loop;

         declare
            sValue : String(1..i);
         begin
            for j in sValue'Range loop
               sValue(j) := sBuffer(j);
            end loop;

            --return Float'Value(sBuffer);
            return Str2Float.fStr2Float(sValue); --this function assumes the format +1235.156
         end;
      end Read_Next_Float;


      fXAccelerationNew : float := 0.0;
      fYAccelerationNew : float := 0.0;
      fZAccelerationNew : float := 0.0;

--        xOrientationMatrixInverse 	: Math.Matrices.CMatrix;
--        xRelativeAccelerationVector 	: math.Vectors.CVector;  --acceleration relative to the robot's reference system
--        xFixedAccelerationVector 		: math.Vectors.CVector;  --acceleration relative to an inertial reference system
--        xOrientationQuaternion : Math.Quaternions.CQuaternion;

--        use Math.Matrices;
--        use Math.Vectors;

      msg : Can_Defs.CAN_Message;

      fGyroYaw : float := 0.0;
      fYaw, fPitch, fRoll : float;

   begin

--        Send_Command("$VNRRG,36"); --sends command for reading the cosine orientation matrix

      Ins_Controller_Utils.Start_Message("VNYBA,", usart_port);

      fYaw 	:= Read_Next_Float;
      fPitch 	:= Read_Next_Float;
      fRoll 	:= Read_Next_Float;

      fXAccelerationNew := Read_Next_Float;
      fYAccelerationNew := Read_Next_Float;
      fZAccelerationNew := Read_Next_Float;

      AVR.AT90CAN128.USART.Flush_Receive_Buffer(usart_port);

      if not bSimulationMode then
         msg.ID := (CAN_Defs.MSG_IMU_ORIENTATION_ID.Identifier, bExtendedIds);
         Can_Float_Conversions.Orientation_To_Message(fYaw, fPitch, fRoll, msg.Data);
         msg.Len := 8;
         AVR.AT90CAN128.CAN.Can_Send(msg);

         msg.ID := (CAN_Defs.MSG_GYRO_YAW_ID.Identifier, bExtendedIds);
         Can_Float_Conversions.GyroReading_To_Message(fGyroYaw, msg.Data);
         msg.Len := 3;
         AVR.AT90CAN128.CAN.Can_Send(msg);

         msg.ID := (CAN_Defs.MSG_IMU_ORIENTATION_ID.Identifier, bExtendedIds);
         Can_Float_Conversions.Acceleration_To_Message(fXAccelerationNew, fYAccelerationNew, fZAccelerationNew, msg.Data);
         msg.Len := 8;
         AVR.AT90CAN128.CAN.Can_Send(msg);
      end if;


--        xOrientationMatrix := Math.Matrices.xCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(Wrap_Around(fYaw)))
--          		  * Math.Matrices.xCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(Wrap_Around(fPitch)))
--          		  * Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(Wrap_Around(fRoll)));
--
--        xOrientationMatrixInverse := xOrientationMatrix.xGet_Inverse;
--
--        xRelativeAccelerationVector := math.Vectors.xCreate(fXAccelerationNew, fYAccelerationNew, fZAccelerationNew);
--
--        xFixedAccelerationVector := xOrientationMatrixInverse * xRelativeAccelerationVector;
--
--        xFixedVelocityVector := xFixedVelocityVector + (xFixedAccelerationVector * fDeltaTime);
--
--        xFixedPositionVector := xFixedPositionVector + (xFixedVelocityVector * fDeltaTime);

   end Imu_Interrupt;

   procedure SimulationModeOn is
   begin
      bSimulationMode := true;
   end SimulationModeOn;

   procedure SimulationModeOff is
   begin
      bSimulationMode := false;
   end SimulationModeOff;

--     --ensures that the angle is in the -180 to +180 degree range
--     function Wrap_Around(fAngle : Float) return Float is
--     begin
--        if fAngle < -180.0  then
--           return Wrap_Around(fAngle + 360.0);
--        end if;
--
--        if fAngle > 180.0  then
--           return Wrap_Around(fAngle - 360.0);
--        end if;
--        --  -180.0 <= fAngle and fAngle <= 180.0:
--        return fAngle;
--     end Wrap_Around;

end Ins_Controller;
