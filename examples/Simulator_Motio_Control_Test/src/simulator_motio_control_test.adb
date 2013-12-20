

package body Simulator_Motio_Control_Test is


      -------------------------
   -- Intialize_And_Reset --
   -------------------------

   procedure Intialize_And_Reset(sIPAdress : String;iPort : integer) is
      tMotorForce : simulator.submarine.TMotorForce := (others => 0.0);
   begin
      xConnection := TCPWrapper.xStart_Listening(iPort    => 1337);
      while not bConnected loop
         xConnection.bIs_Connected(bConnected);
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

            xMessage.ID := CAN_Defs.MSG_MOTION_CONTROL_MOTOR_FORCE;
            xMessage.data := CAN_Convertions_Math.Create_Can_Message_From_Motor_Value(CAN_Convertions_Math.TMotorValues(xProtected_Send_Info.xGet_Motor_Power));
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
            xProtected_Read_Info.Set_Pid_Scaling(eComponent => simulator.Comunication_Prot_Obj.EMotionComponent(eComponent),PidScaling => simulator.Comunication_Prot_Obj.TPIDComponentScalings(PidScaling));
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









end Simulator_Motio_Control_Test;
