with ada.Text_IO;
with TCPCANWrapper;
with TCPWrapper;
with Can_Float_Conversions;
package body Simulator.Comunication is

   -------------------------
   -- Intialize_And_Reset --
   -------------------------

   procedure Intialize_And_Reset is
      tMotorForce : simulator.submarine.TMotorForce := (others => 0.0);
   begin
      xProtected_Info.Set_Current_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Info.Set_Current_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Info.Set_Wanted_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Info.Set_Wanted_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Info.Set_Motor_Power(tMotorForce);
      xProtected_Info.Set_Gripper_Left(false);
      xProtected_Info.Set_Gripper_Right(false);
      xProtected_Info.Set_Torpedo_Left(false);
      xProtected_Info.Set_Torpedo_Right(false);
      xProtected_Info.Set_Dropper_Left(false);
      xProtected_Info.Set_Dropper_Right(false);
      xProtected_Info.Set_Pressure(0.0);
      xProtected_Info.Set_Temperature(0.0);
   end Intialize_And_Reset;

   --------------------------
   -- Set_Current_Position --
   --------------------------

   procedure Set_Current_Position (xCurrent_Position : math.Vectors.CVector)
   is
   begin
      xProtected_Info.Set_Current_Position(xCurrent_Position);

   end Set_Current_Position;

   -----------------------------
   -- Set_Current_Orientation --
   -----------------------------

   procedure Set_Current_Orientation
     (xCurrent_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Info.Set_Current_Orientation(xCurrent_Orientation);
   end Set_Current_Orientation;

   -------------------------
   -- Set_Wanted_Position --
   -------------------------

   procedure Set_Wanted_Position (xWanted_Position : math.Vectors.CVector) is
   begin
      xProtected_Info.Set_Wanted_Position(xWanted_Position);
   end Set_Wanted_Position;

   ----------------------------
   -- Set_Wanted_Orientation --
   ----------------------------

   procedure Set_Wanted_Orientation
     (xWanted_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Info.Set_Wanted_Orientation(xWanted_Orientation);
   end Set_Wanted_Orientation;

   ----------------------
   -- Set_xMotor_Power --
   ----------------------

   procedure Set_Motor_Power
     (xMotor_Power : simulator.submarine.TMotorForce)
   is
   begin
      xProtected_Info.Set_Motor_Power(xMotor_Power);
   end Set_Motor_Power;

   ----------------------
   -- Set_Gripper_Left --
   ----------------------

   procedure Set_Gripper_Left (bGripper_Left : boolean) is
   begin
      xProtected_Info.Set_Gripper_Left(bGripper_Left);
   end Set_Gripper_Left;

   -----------------------
   -- Set_Gripper_Right --
   -----------------------

   procedure Set_Gripper_Right (bGripper_Right : boolean) is
   begin
      xProtected_Info.Set_Gripper_Right(bGripper_Right);
   end Set_Gripper_Right;

   ----------------------
   -- Set_Torpedo_Left --
   ----------------------

   procedure Set_Torpedo_Left (bTorpedo_Left : boolean) is
   begin
      xProtected_Info.Set_Torpedo_Left(bTorpedo_Left);
   end Set_Torpedo_Left;

   -----------------------
   -- Set_Torpedo_Right --
   -----------------------

   procedure Set_Torpedo_Right (bTorpedo_Right : boolean) is
   begin
      xProtected_Info.Set_Torpedo_Right(bTorpedo_Right);
   end Set_Torpedo_Right;

   ----------------------
   -- Set_Dropper_Left --
   ----------------------

   procedure Set_Dropper_Left (bDropper_Left : boolean) is
   begin
      xProtected_Info.Set_Dropper_Left(bDropper_Left);
   end Set_Dropper_Left;

   -----------------------
   -- Set_Dropper_Right --
   -----------------------

   procedure Set_Dropper_Right (bDropper_Right : boolean) is
   begin
      xProtected_Info.Set_Dropper_Right(bDropper_Right);
   end Set_Dropper_Right;

   ------------------
   -- Set_Pressure --
   ------------------

   procedure Set_Pressure (fPressure : float) is
   begin
      xProtected_Info.Set_Pressure(fPressure);
   end Set_Pressure;

   ---------------------
   -- Set_Temperature --
   ---------------------

   procedure Set_Temperature (fTemperature : float) is
   begin
      xProtected_Info.Set_Temperature(fTemperature);
   end Set_Temperature;

   ---------------------
   -- Set_Pid_Scaling --
   ---------------------

   procedure Set_Pid_Scaling(eComponent : EMotionComponent; PidScaling : TPIDComponentScalings) is
   begin
      xProtected_Info.Set_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent),simulator.Comunication_Prot_Obj.TPIDComponentScalings(PidScaling));
   end Set_Pid_Scaling;

   ------------------------
   -- Set_Operating_Mode --
   ------------------------

   procedure Set_Operating_Mode(eOperationMode : EoperatingMode) is
   begin
      xProtected_Info.Set_OperatingMode(simulator.Comunication_Prot_Obj.EOperatingMode(eOperationMode));
   end Set_Operating_Mode;

   ---------------------------
   -- xGet_Current_Position --
   ---------------------------

   function xGet_Current_Position return math.Vectors.CVector is
   begin
      return xProtected_Info.xGet_Current_Position;

   end xGet_Current_Position;

   ------------------------------
   -- xGet_Current_Orientation --
   ------------------------------

   function xGet_Current_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Info.xGet_Current_Orientation;
   end xGet_Current_Orientation;

   --------------------------
   -- xGet_Wanted_Position --
   --------------------------

   function xGet_Wanted_Position return math.Vectors.CVector is
   begin
      return xProtected_Info.xGet_Wanted_Position;
   end xGet_Wanted_Position;

   -----------------------------
   -- xGet_Wanted_Orientation --
   -----------------------------

   function xGet_Wanted_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Info.xGet_Wanted_Orientation;
   end xGet_Wanted_Orientation;

   -----------------------
   -- xGet_xMotor_Power --
   -----------------------

   function xGet_Motor_Power return simulator.submarine.TMotorForce is
   begin
      return xProtected_Info.xGet_Motor_Power;
   end xGet_Motor_Power;

   -----------------------
   -- bGet_Gripper_Left --
   -----------------------

   function bGet_Gripper_Left return boolean is
   begin
      return xProtected_Info.bGet_Gripper_Left;
   end bGet_Gripper_Left;

   ------------------------
   -- bGet_Gripper_Right --
   ------------------------

   function bGet_Gripper_Right return boolean is
   begin
      return xProtected_Info.bGet_Gripper_Right;
   end bGet_Gripper_Right;

   -----------------------
   -- bGet_Torpedo_Left --
   -----------------------

   function bGet_Torpedo_Left return boolean is
   begin
      return xProtected_Info.bGet_Torpedo_Left;
   end bGet_Torpedo_Left;

   ------------------------
   -- bGet_Torpedo_Right --
   ------------------------

   function bGet_Torpedo_Right return boolean is
   begin
      return xProtected_Info.bGet_Torpedo_Right;
   end bGet_Torpedo_Right;

   -----------------------
   -- bGet_Dropper_Left --
   -----------------------

   function bGet_Dropper_Left return boolean is
   begin
      return xProtected_Info.bGet_Dropper_Left;
   end bGet_Dropper_Left;

   ------------------------
   -- bGet_Dropper_Right --
   ------------------------

   function bGet_Dropper_Right return boolean is
   begin
      return xProtected_Info.bGet_Dropper_Right;
   end bGet_Dropper_Right;

   -------------------
   -- fGet_Pressure --
   -------------------

   function fGet_Pressure return float is
   begin
      return xProtected_Info.fGet_Pressure;
   end fGet_Pressure;

   ----------------------
   -- fGet_Temperature --
   ----------------------

   function fGet_Temperature return float is
   begin
      return xProtected_Info.fGet_Temperature;
   end fGet_Temperature;

   ----------------------
   -- xGet_Pid_Scaling --
   ----------------------

   function xGet_Pid_Scaling( eComponent : EMotionComponent ) return TPIDComponentScalings is
   begin
      return TPIDComponentScalings(xProtected_Info.xGet_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent)));
   end xGet_Pid_Scaling;

   function eGet_Operating_Mode return EOperatingMode is
   begin
      return EOperatingMode(xProtected_Info.eGet_OperatingMode);
   end eGet_Operating_Mode;


   ------------------------
   -- TCommunicationTask --
   ------------------------

   task body TCommunicationTask is
      xPacket : TCPCANWrapper.CTCPCANPacket;
      bSuccess : boolean := false;
      iBytes : integer;
      bConnected : boolean := false;
   begin
      xPacket.Set_Type(TCPWrapper.PACKET_CAN);
      ada.Text_IO.Put_Line("Test1");
      while bConnected = false loop
         ada.Text_IO.Put_Line("Test1.5");
         xConnection := TCPWrapper.xConnect_To(sAddress => "127.0.0.1",
                                               iPort    => 1337);
         ada.Text_IO.Put_Line("Test2");
         xConnection.bIs_Connected(bResult => bConnected);
         delay(0.1);
      end loop;
      ada.Text_IO.Put_Line("Test3");
      loop
         delay(0.1);
         iBytes := xConnection.iBytes_Available_For_Reading;
         if iBytes >= xPacket.iGet_Size_In_Bytes then
            ada.Text_IO.Put_Line("Antal bytes: " &iBytes'img);
            xConnection.Receive_Packet(xPacket  => xPacket,
                                       bSuccess => bSuccess);
            Get_Data_From_Message(xPacket.xReturn_Message);
         end if;
      end loop;

   end TCommunicationTask;

   ---------------------------
   -- Get_Data_From_Message --
   ---------------------------

   procedure Get_Data_From_Message(xMessage : CAN_Defs.CAN_Message) is

      use CAN_Defs;

   begin

      -- MSG_STATUS_REQUEST_RESPONSE_ID --
      if xMessage.ID = MSG_STATUS_REQUEST_RESPONSE_ID then
         null;
      end if;

      -- MSG_KILL_SWITCH_ID --
      if xMessage.ID = MSG_KILL_SWITCH_ID then
         null;
      end if;

      -- MSG_SIMULATION_MODE_ID --
      if xMessage.ID = MSG_SIMULATION_MODE_ID then
         null;
      end if;

      -- MSG_VISUALLY_DETECTED_OBSTACLE_ID --
      if xMessage.ID = MSG_VISUALLY_DETECTED_OBSTACLE_ID then
         null;
      end if;

      -- MSG_SENSOR_FUSION_ORIENTATION_ID --
      if xMessage.ID = MSG_SENSOR_FUSION_ORIENTATION_ID then
         null;
      end if;

      -- MSG_SENSOR_FUSION_POSITION_ID --
      if xMessage.ID = MSG_SENSOR_FUSION_POSITION_ID then
         declare
            fX,fY,fZ : float;
         begin
            Can_Float_Conversions.Message_To_Vector(fX            => fX,
                                                    fY            => fY,
                                                    fZ            => fZ,
                                                    b8Message        => xMessage.Data,
                                                    fMax => 500.0);
            xProtected_Info.Set_Current_Position(math.Vectors.xCreate(fX,fY,fZ));
         end;
      end if;

      -- MSG_Sim_Orientation_X_Vector_ID --
      if xMessage.ID = MSG_Sim_Orientation_X_Vector_ID then
         Can_Float_Conversions.Message_To_Vector(fX        => xNonCompleteOrientationMatrix(1,1),
                                                 fY        => xNonCompleteOrientationMatrix(2,1),
                                                 fZ        => xNonCompleteOrientationMatrix(3,1),
                                                 b8Message => xMessage.Data,
                                                 fMax      => 1.0);
      end if;

      -- MSG_Sim_Orientation_Y_Vector_ID --
      if xMessage.ID = MSG_Sim_Orientation_Y_Vector_ID then
         Can_Float_Conversions.Message_To_Vector(fX        => xNonCompleteOrientationMatrix(1,2),
                                                 fY        => xNonCompleteOrientationMatrix(2,2),
                                                 fZ        => xNonCompleteOrientationMatrix(3,2),
                                                 b8Message => xMessage.Data,
                                                 fMax      => 1.0);
      end if;

      -- MSG_Sim_Orientation_Z_Vector_ID --
      if xMessage.ID = MSG_Sim_Orientation_Z_Vector_ID then
         Can_Float_Conversions.Message_To_Vector(fX        => xNonCompleteOrientationMatrix(1,3),
                                                 fY        => xNonCompleteOrientationMatrix(2,3),
                                                 fZ        => xNonCompleteOrientationMatrix(3,3),
                                                 b8Message => xMessage.Data,
                                                 fMax      => 1.0);
         xProtected_Info.Set_Current_Orientation(xCurrent_Orientation => math.Matrices.xCreate(xNonCompleteOrientationMatrix));
      end if;

      -- MSG_IMU_ORIENTATION_ID --
      if xMessage.ID = MSG_IMU_ORIENTATION_ID then
         null;
      end if;

      -- MSG_IMU_ACCELERATION_ID --
      if xMessage.ID = MSG_IMU_ACCELERATION_ID then
         null;
      end if;

      -- MSG_GYRO_YAW_ID --
      if xMessage.ID = MSG_GYRO_YAW_ID then
         null;
      end if;

      -- MSG_MISSION_SWITCH_ID --
      if xMessage.ID = MSG_MISSION_SWITCH_ID then
         null;
      end if;

      -- MSG_THRUSTER_ID --
      if xMessage.ID = MSG_THRUSTER_ID then
         null;
      end if;

      -- MSG_PNEUMATICS_ID --
      if xMessage.ID = MSG_PNEUMATICS_ID then
         null;
      end if;

      -- MSG_PNEUMATICS_CONFIRM_ID --
      if xMessage.ID = MSG_PNEUMATICS_CONFIRM_ID then
         null;
      end if;

      -- MSG_BATTERY_STATUS_ID --
      if xMessage.ID = MSG_BATTERY_STATUS_ID then
         null;
      end if;

      -- MSG_VISION_REQUEST_FORWARD_ID --
      if xMessage.ID = MSG_VISION_REQUEST_FORWARD_ID then
         null;
      end if;

      -- MSG_VISION_REQUEST_DOWN_ID --
      if xMessage.ID = MSG_VISION_REQUEST_DOWN_ID then
         null;
      end if;

      -- MSG_VISION_ANSWER_FORWARD_ID --
      if xMessage.ID = MSG_VISION_ANSWER_FORWARD_ID then
         null;
      end if;

      -- MSG_VISION_ANSWER_DOWN_ID --
      if xMessage.ID = MSG_VISION_ANSWER_DOWN_ID then
         null;
      end if;

      -- MSG_MISSION_STATUS_ID --
      if xMessage.ID = MSG_MISSION_STATUS_ID then
         null;
      end if;

      -- MSG_PID_SCALING_ID --
      if xMessage.ID = MSG_PID_SCALING_ID then
         null;
      end if;

      -- MSG_STATUS_REQUEST_ID --
      if xMessage.ID = MSG_STATUS_REQUEST_ID then
         null;
      end if;

      -- MSG_REQUEST_KILL_SWITCH_ID --
      if xMessage.ID = MSG_REQUEST_KILL_SWITCH_ID then
         null;
      end if;

      -- MSG_SENSOR_ID --
      if xMessage.ID = MSG_SENSOR_ID then
         null;
      end if;

   end Get_Data_From_Message;








end Simulator.Comunication;
