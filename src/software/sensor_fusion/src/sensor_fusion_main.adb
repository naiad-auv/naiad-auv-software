

---------------------------------------------------------------------------
-- This code does the sensor fusion on the BeagleBone Black (BBB).
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-17

-- TODO: Everyhting

---------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Command_line;

with UartWrapper;
with BBB_CAN;
with CAN_Defs;    use CAN_Defs;
with Can_Float_Conversions;

with Math.Matrices;	use Math.Matrices;
with Math.Vectors;
with Math.Angles;

procedure Sensor_Fusion_main is
   pragma Suppress (All_Checks);
   msg : CAN_Defs.CAN_Message;
   bMsg : Boolean;
   bOk  : Boolean;

   fTIME_STEP : float := 1.0 / 200.0;

   bOrientationReceived, bAccelerationReceived : Boolean;
   fYaw, fPitch, fRoll : float;
   fAccX, fAccY, fAccZ : float;

   Position : Math.Vectors.CVector := Math.Vectors.xCreate(0.0, 0.0, 0.0);
   Velocity : Math.Vectors.CVector := Math.Vectors.xCreate(0.0, 0.0, 0.0);
   Acceleration_Relative, Acceleration_Absolute : Math.Vectors.CVector;

   Orientation : Math.Matrices.CMatrix;
   Orientation_Inverse : Math.Matrices.CMatrix;

begin
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Hello welcome to sensor fusion!");

   if Ada.Command_line.Argument_Count /= 2 then
      Ada.Text_IO.Put_Line("Please provide two arbuments, the name of the serial port (excluding '/dev/') and the baudrate (9600, 38400, 57600 or 115200)");
      return;
   else
      declare
         sPort : String := Ada.Command_line.Argument(1);
         baud : UartWrapper.BaudRates;
      begin
         if Ada.Command_line.Argument(2) = "9600" then
            baud := UartWrapper.B9600;
         elsif Ada.Command_line.Argument(2) = "115200" then
            baud := UartWrapper.B115200;
         else
            Ada.Text_IO.Put_Line("ERROR: Incorrect baudrate!");
            return;
         end if;
         BBB_CAN.Init(sPort, baud);
      end;
   end if;
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Successfully connected to COM port. Sensor fusion running.");


   loop
      BBB_CAN.Get(msg, bMsg, bOk);
      if bMsg then

         if msg.ID.Identifier = CAN_Defs.MSG_IMU_ORIENTATION_ID.Identifier and
            msg.ID.isExtended = CAN_Defs.MSG_IMU_ORIENTATION_ID.isExtended then

            bOrientationReceived := true;
            Can_Float_Conversions.Message_To_Orientation(fYaw, fPitch, fRoll, msg.Data);
         end if;

         if msg.ID.Identifier = CAN_Defs.MSG_IMU_ACCELERATION_ID.Identifier and
            msg.ID.isExtended = CAN_Defs.MSG_IMU_ACCELERATION_ID.isExtended then

            bAccelerationReceived := true;

            Can_Float_Conversions.Message_To_Vector(fAccX, fAccY, fAccZ,
                                                    msg.Data, Can_Float_Conversions.fACCELERATION_MAX);
         end if;

         if  bOrientationReceived and bAccelerationReceived then

            Acceleration_Relative := Math.Vectors.xCreate(fAccX, fAccY, fAccZ);
            Orientation := Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.tfFAngle_To_TAngle(fYaw)) *
              Math.Matrices.xCreate_Rotation_Around_Y_Axis(Math.Angles.tfFAngle_To_TAngle(fPitch)) *
              Math.Matrices.xCreate_Rotation_Around_Y_Axis(Math.Angles.tfFAngle_To_TAngle(fRoll));

            Orientation_Inverse := Orientation.xGet_Inverse;

            Acceleration_Absolute := Orientation_Inverse * Acceleration_Relative;



            Velocity := Math.Vectors."+"(Velocity, (Math.Vectors."*"(Acceleration_Absolute, fTIME_STEP)));

            Position := Math.Vectors."+"(Position, (Math.Vectors."*"(Velocity, fTIME_STEP)));

            msg.ID := CAN_Defs.MSG_SENSOR_FUSION_ORIENTATION_ID

            delay(Standard.Duration(fTIME_STEP * 0.8));

         end if;

      else
         delay(0.01);
      end if;

   end loop;
end Sensor_Fusion_main;
