with ada.Text_IO;
with TCPCANWrapper;
with TCPWrapper;
with Can_Float_Conversions;
with simulator.Comunication_Prot_Obj;
use Simulator.Comunication_Prot_Obj;
with Interfaces;
package body Simulator.Comunication is

   -------------------------
   -- Intialize_And_Reset --
   -------------------------

   procedure Intialize_And_Reset(sIPAdress : String;iPort : integer) is
      tMotorForce : simulator.submarine.TMotorForce := (others => 0.0);
   begin
      while bConnected = false loop
         ada.Text_IO.Put_Line("Test1.5");
         xConnection := TCPWrapper.xConnect_To(sAddress => sIPAdress,
                                               iPort    => iPort);
         ada.Text_IO.Put_Line("Test2");
         xConnection.bIs_Connected(bResult => bConnected);
         delay(0.1);
      end loop;
      xProtected_Read_Info.Set_Current_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Read_Info.Set_Current_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Read_Info.Set_Wanted_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Read_Info.Set_Wanted_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Read_Info.Set_Motor_Power(tMotorForce);
      xProtected_Read_Info.Set_Gripper_Left(false);
      xProtected_Read_Info.Set_Gripper_Right(false);
      xProtected_Read_Info.Set_Torpedo_Left(false);
      xProtected_Read_Info.Set_Torpedo_Right(false);
      xProtected_Read_Info.Set_Dropper_Left(false);
      xProtected_Read_Info.Set_Dropper_Right(false);
      xProtected_Read_Info.Set_Pressure(0.0);
      xProtected_Read_Info.Set_Temperature(0.0);
      ComunicationReadTask.Init;

      xProtected_Send_Info.Set_Current_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Send_Info.Set_Current_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Send_Info.Set_Wanted_Position(math.Vectors.xCreate(0.0,0.0,0.0));
      xProtected_Send_Info.Set_Wanted_Orientation(math.Matrices.xCreate_Identity);
      xProtected_Send_Info.Set_Motor_Power(tMotorForce);
      xProtected_Send_Info.Set_Gripper_Left(false);
      xProtected_Send_Info.Set_Gripper_Right(false);
      xProtected_Send_Info.Set_Torpedo_Left(false);
      xProtected_Send_Info.Set_Torpedo_Right(false);
      xProtected_Send_Info.Set_Dropper_Left(false);
      xProtected_Send_Info.Set_Dropper_Right(false);
      xProtected_Send_Info.Set_Pressure(0.0);
      xProtected_Send_Info.Set_Temperature(0.0);
      CommunicationSendTask.Init;
   end Intialize_And_Reset;

   --------------------------
   -- Set_Current_Position --
   --------------------------

   procedure Set_Current_Position (xCurrent_Position : math.Vectors.CVector)
   is
   begin
      xProtected_Send_Info.Set_Current_Position(xCurrent_Position);

   end Set_Current_Position;

   -----------------------------
   -- Set_Current_Orientation --
   -----------------------------

   procedure Set_Current_Orientation
     (xCurrent_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Send_Info.Set_Current_Orientation(xCurrent_Orientation);
   end Set_Current_Orientation;

   -------------------------
   -- Set_Wanted_Position --
   -------------------------

   procedure Set_Wanted_Position (xWanted_Position : math.Vectors.CVector) is
   begin
      xProtected_Send_Info.Set_Wanted_Position(xWanted_Position);
   end Set_Wanted_Position;

   ----------------------------
   -- Set_Wanted_Orientation --
   ----------------------------

   procedure Set_Wanted_Orientation
     (xWanted_Orientation : math.Matrices.CMatrix)
   is
   begin
      xProtected_Send_Info.Set_Wanted_Orientation(xWanted_Orientation);
   end Set_Wanted_Orientation;

   ----------------------
   -- Set_xMotor_Power --
   ----------------------

   procedure Set_Motor_Power
     (xMotor_Power : simulator.submarine.TMotorForce)
   is
   begin
      xProtected_Send_Info.Set_Motor_Power(xMotor_Power);
   end Set_Motor_Power;

   ----------------------
   -- Set_Gripper_Left --
   ----------------------

   procedure Set_Gripper_Left (bGripper_Left : boolean) is
   begin
      xProtected_Send_Info.Set_Gripper_Left(bGripper_Left);
   end Set_Gripper_Left;

   -----------------------
   -- Set_Gripper_Right --
   -----------------------

   procedure Set_Gripper_Right (bGripper_Right : boolean) is
   begin
      xProtected_Send_Info.Set_Gripper_Right(bGripper_Right);
   end Set_Gripper_Right;

   ----------------------
   -- Set_Torpedo_Left --
   ----------------------

   procedure Set_Torpedo_Left (bTorpedo_Left : boolean) is
   begin
      xProtected_Send_Info.Set_Torpedo_Left(bTorpedo_Left);
   end Set_Torpedo_Left;

   -----------------------
   -- Set_Torpedo_Right --
   -----------------------

   procedure Set_Torpedo_Right (bTorpedo_Right : boolean) is
   begin
      xProtected_Send_Info.Set_Torpedo_Right(bTorpedo_Right);
   end Set_Torpedo_Right;

   ----------------------
   -- Set_Dropper_Left --
   ----------------------

   procedure Set_Dropper_Left (bDropper_Left : boolean) is
   begin
      xProtected_Send_Info.Set_Dropper_Left(bDropper_Left);
   end Set_Dropper_Left;

   -----------------------
   -- Set_Dropper_Right --
   -----------------------

   procedure Set_Dropper_Right (bDropper_Right : boolean) is
   begin
      xProtected_Send_Info.Set_Dropper_Right(bDropper_Right);
   end Set_Dropper_Right;

   ------------------
   -- Set_Pressure --
   ------------------

   procedure Set_Pressure (fPressure : float) is
   begin
      xProtected_Send_Info.Set_Pressure(fPressure);
   end Set_Pressure;

   ---------------------
   -- Set_Temperature --
   ---------------------

   procedure Set_Temperature (fTemperature : float) is
   begin
      xProtected_Send_Info.Set_Temperature(fTemperature);
   end Set_Temperature;

   ---------------------
   -- Set_Pid_Scaling --
   ---------------------

   procedure Set_Pid_Scaling(eComponent : EMotionComponent; PidScaling : TPIDComponentScalings) is
      xMessage : CAN_Defs.CAN_Message;
      xPacket : TCPCANWrapper.CTCPCANPacket;
   begin
      xProtected_Send_Info.Set_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent),simulator.Comunication_Prot_Obj.TPIDComponentScalings(PidScaling));
      xMessage.ID := CAN_Defs.MSG_PID_SCALING_ID;
      Can_Float_Conversions.PID_Scalings_To_Message(u8ID          => Interfaces.Unsigned_8(EMotionComponent'pos(eComponent)),
                                                    fProportional => PidScaling.fProportionalScale,
                                                    fIntegral     => PidScaling.fIntegralScale,
                                                    fDerivative   => PidScaling.fDerivativeScale,
                                                    fScaleRange   => 60.0,
                                                    b8Message     => xMessage.data);
      xPacket.set_Message_to_Send(xMessage => xMessage);
      xConnection.Send_Packet(xPacket => xPacket);
   end Set_Pid_Scaling;

   ------------------------
   -- Set_Operating_Mode --
   ------------------------

   procedure Set_Operating_Mode(eOperationMode : EoperatingMode) is
   begin
      xProtected_Send_Info.Set_OperatingMode(simulator.Comunication_Prot_Obj.EOperatingMode(eOperationMode));
   end Set_Operating_Mode;

   ---------------------------
   -- xGet_Current_Position --
   ---------------------------

   function xGet_Current_Position return math.Vectors.CVector is
   begin
      return xProtected_Read_Info.xGet_Current_Position;

   end xGet_Current_Position;

   ------------------------------
   -- xGet_Current_Orientation --
   ------------------------------

   function xGet_Current_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Read_Info.xGet_Current_Orientation;
   end xGet_Current_Orientation;

   --------------------------
   -- xGet_Wanted_Position --
   --------------------------

   function xGet_Wanted_Position return math.Vectors.CVector is
   begin
      return xProtected_Read_Info.xGet_Wanted_Position;
   end xGet_Wanted_Position;

   -----------------------------
   -- xGet_Wanted_Orientation --
   -----------------------------

   function xGet_Wanted_Orientation return math.Matrices.CMatrix is
   begin
      return xProtected_Read_Info.xGet_Wanted_Orientation;
   end xGet_Wanted_Orientation;

   -----------------------
   -- xGet_xMotor_Power --
   -----------------------

   function xGet_Motor_Power return simulator.submarine.TMotorForce is
   begin
      return xProtected_Read_Info.xGet_Motor_Power;
   end xGet_Motor_Power;

   -----------------------
   -- bGet_Gripper_Left --
   -----------------------

   function bGet_Gripper_Left return boolean is
   begin
      return xProtected_Read_Info.bGet_Gripper_Left;
   end bGet_Gripper_Left;

   ------------------------
   -- bGet_Gripper_Right --
   ------------------------

   function bGet_Gripper_Right return boolean is
   begin
      return xProtected_Read_Info.bGet_Gripper_Right;
   end bGet_Gripper_Right;

   -----------------------
   -- bGet_Torpedo_Left --
   -----------------------

   function bGet_Torpedo_Left return boolean is
   begin
      return xProtected_Read_Info.bGet_Torpedo_Left;
   end bGet_Torpedo_Left;

   ------------------------
   -- bGet_Torpedo_Right --
   ------------------------

   function bGet_Torpedo_Right return boolean is
   begin
      return xProtected_Read_Info.bGet_Torpedo_Right;
   end bGet_Torpedo_Right;

   -----------------------
   -- bGet_Dropper_Left --
   -----------------------

   function bGet_Dropper_Left return boolean is
   begin
      return xProtected_Read_Info.bGet_Dropper_Left;
   end bGet_Dropper_Left;

   ------------------------
   -- bGet_Dropper_Right --
   ------------------------

   function bGet_Dropper_Right return boolean is
   begin
      return xProtected_Read_Info.bGet_Dropper_Right;
   end bGet_Dropper_Right;

   -------------------
   -- fGet_Pressure --
   -------------------

   function fGet_Pressure return float is
   begin
      return xProtected_Read_Info.fGet_Pressure;
   end fGet_Pressure;

   ----------------------
   -- fGet_Temperature --
   ----------------------

   function fGet_Temperature return float is
   begin
      return xProtected_Read_Info.fGet_Temperature;
   end fGet_Temperature;

   ----------------------
   -- xGet_Pid_Scaling --
   ----------------------

   function xGet_Pid_Scaling( eComponent : EMotionComponent ) return TPIDComponentScalings is
   begin
      return TPIDComponentScalings(xProtected_Read_Info.xGet_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(eComponent)));
   end xGet_Pid_Scaling;

   function eGet_Operating_Mode return EOperatingMode is
   begin
      return EOperatingMode(xProtected_Read_Info.eGet_OperatingMode);
   end eGet_Operating_Mode;

   ----------------------------
   -- TCommunicationSendTask --
   ----------------------------

   task body TCommunicationSendTask is
      xMessage : CAN_Defs.CAN_Message;
      xPacket : TCPCANWrapper.CTCPCANPacket;
   begin
      accept Init  do
         null;
      end Init;
      loop
         delay(0.25);
         if xProtected_Send_Info.eGet_OperatingMode = MotionControlTestMode then
            xMessage.Len := 1;

            xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_POSITION_ID;
            xMessage.data := CAN_Convertions_Math.Create_Can_Message_From_Vector(xProtected_Send_Info.xGet_Current_Position,500.0);
            xPacket.set_Message_to_Send(xMessage => xMessage);
            xConnection.Send_Packet(xPacket => xPacket);

            xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_ORIENTATION_ID;
            xMessage.data := CAN_Convertions_Math.Create_Can_Message_From_Matrix(xProtected_Send_Info.xGet_Current_Orientation);
            xPacket.set_Message_to_Send(xMessage => xMessage);
            xConnection.Send_Packet(xPacket => xPacket);

            xMessage.ID := CAN_Defs.MSG_MISSION_CONTROL_WANTED_POSITION_ID;
            xMessage.data := CAN_Convertions_Math.Create_Can_Message_From_Vector(xProtected_Send_Info.xGet_Wanted_Position,500.0);
            xPacket.set_Message_to_Send(xMessage => xMessage);
            xConnection.Send_Packet(xPacket => xPacket);

            xMessage.ID := CAN_Defs.MSG_MISSION_CONTROL_WANTED_ORIENTATION_ID;
            xMessage.data := CAN_Convertions_Math.Create_Can_Message_From_Matrix(xProtected_Send_Info.xGet_Wanted_Orientation);
            xPacket.set_Message_to_Send(xMessage => xMessage);
            xConnection.Send_Packet(xPacket => xPacket);
         end if;

      end loop;
   end TCommunicationSendTask;

   ----------------------------
   -- TCommunicationReadTask --
   ----------------------------

   task body TCommunicationReadTask is
      xPacket : TCPCANWrapper.CTCPCANPacket;
      bSuccess : boolean := false;
      iBytes : integer;
      bConnected : boolean := false;
   begin
      accept Init  do
         null;
      end Init;
      xPacket.Set_Type(TCPWrapper.PACKET_CAN);

      loop
         delay(0.01);
         iBytes := xConnection.iBytes_Available_For_Reading;
         if iBytes >= xPacket.iGet_Size_In_Bytes then
            ada.Text_IO.Put_Line("Antal bytes: " &iBytes'img);
            xConnection.Receive_Packet(xPacket  => xPacket,
                                       bSuccess => bSuccess);
            Get_Data_From_Message(xPacket.xReturn_Message);
         end if;
      end loop;

   end TCommunicationReadTask;

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
      if xMessage.ID = MSG_MODE_ID then
         null;
      end if;

      -- MSG_VISUALLY_DETECTED_OBSTACLE_ID --
      if xMessage.ID = MSG_VISUALLY_DETECTED_OBSTACLE_ID then
         null;
      end if;

      -- MSG_MOTION_CONTROL_MOTOR_FORCE --
      if xMessage.ID = MSG_MOTION_CONTROL_MOTOR_FORCE then
         xProtected_Read_Info.Set_Motor_Power(xMotor_Power => simulator.submarine.TMotorForce(CAN_Convertions_Math.Create_Motor_Value_From_Can_Message(xData => xMessage.data)));
      end if;

      -- MSG_MISSION_CONTROL_WANTED_ORIENTATION_ID --
      if xMessage.ID = MSG_MISSION_CONTROL_WANTED_ORIENTATION_ID then
         xProtected_Read_Info.Set_Wanted_Orientation(CAN_Convertions_Math.Create_Matrix_From_CAN_Message(xData => xMessage.Data));
      end if;

      -- MSG_MISSION_CONTROL_WANTED_POSITION_ID --
      if xMessage.ID = MSG_MISSION_CONTROL_WANTED_POSITION_ID then
         xProtected_Read_Info.Set_Wanted_Position(CAN_Convertions_Math.Create_Vector_From_CAN_Message(xData     => xMessage.Data,
                                                                                                      fMaxValue => 500.0));
      end if;

      -- MSG_SENSOR_FUSION_ORIENTATION_ID --
      if xMessage.ID = MSG_SENSOR_FUSION_ORIENTATION_ID then
            xProtected_Read_Info.Set_Current_Orientation(CAN_Convertions_Math.Create_Matrix_From_CAN_Message(xData => xMessage.Data));
      end if;

      -- MSG_SENSOR_FUSION_POSITION_ID --
      if xMessage.ID = MSG_SENSOR_FUSION_POSITION_ID then
         xProtected_Read_Info.Set_Current_Position(CAN_Convertions_Math.Create_Vector_From_CAN_Message(xData     => xMessage.Data,
                                                                                                       fMaxValue => 500.0));
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
         declare
            PidScaling : TPIDComponentScalings;
            eComponent : EMotionComponent;
            u8ID : Interfaces.Unsigned_8;
         begin
            Can_Float_Conversions.Message_To_PID_Scalings(u8ID          => u8id,
                                                          fProportional => PidScaling.fProportionalScale,
                                                          fIntegral     => PidScaling.fIntegralScale,
                                                          fDerivative   => PidScaling.fDerivativeScale,
                                                          fScaleRange   => 60.0,
                                                          b8Message     => xMessage.data);
            eComponent := EMotionComponent'Val(u8id);
            xProtected_Read_Info.Set_Pid_Scaling(eComponent => Comunication_Prot_Obj.EMotionComponent(eComponent),PidScaling => Comunication_Prot_Obj.TPIDComponentScalings(PidScaling));
         end;

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
