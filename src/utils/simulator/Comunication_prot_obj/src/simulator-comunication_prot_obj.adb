package body Simulator.Comunication_Prot_Obj is

   -------------------
   -- tCom_Prot_Obj --
   -------------------

   protected body tCom_Prot_Obj is

      --------------------------
      -- Set_Current_Position --
      --------------------------

      procedure Set_Current_Position
        (xCurrent_Position : math.Vectors.CVector)
      is
      begin
         tCom_Prot_Obj.xCurrent_Position := xCurrent_Position;
      end Set_Current_Position;

      -----------------------------
      -- Set_Current_Orientation --
      -----------------------------

      procedure Set_Current_Orientation
        (xCurrent_Orientation : math.Matrices.CMatrix)
      is
      begin
         tCom_Prot_Obj.xCurrent_Orientation := xCurrent_Orientation;
      end Set_Current_Orientation;

      -------------------------
      -- Set_Wanted_Position --
      -------------------------

      procedure Set_Wanted_Position
        (xWanted_Position : math.Vectors.CVector)
      is
      begin
         tCom_Prot_Obj.xWanted_Position := xWanted_Position;
      end Set_Wanted_Position;

      ----------------------------
      -- Set_Wanted_Orientation --
      ----------------------------

      procedure Set_Wanted_Orientation
        (xWanted_Orientation : math.Matrices.CMatrix)
      is
      begin
         tCom_Prot_Obj.xWanted_Orientation := xWanted_Orientation;
      end Set_Wanted_Orientation;

      ----------------------
      -- Set_xMotor_Power --
      ----------------------

      procedure Set_Motor_Power
        (xMotor_Power : simulator.submarine.TMotorForce)
      is
      begin
         tCom_Prot_Obj.xMotor_Power := xMotor_Power;
      end Set_Motor_Power;

      ----------------------
      -- Set_Gripper_Left --
      ----------------------

      procedure Set_Gripper_Left (bGripper_Left : boolean) is
      begin
         tCom_Prot_Obj.bGripper_Left := bGripper_Left;
      end Set_Gripper_Left;

      -----------------------
      -- Set_Gripper_Right --
      -----------------------

      procedure Set_Gripper_Right (bGripper_Right : boolean) is
      begin
         tCom_Prot_Obj.bGripper_Right := bGripper_Right;
      end Set_Gripper_Right;

      ----------------------
      -- Set_Torpedo_Left --
      ----------------------

      procedure Set_Torpedo_Left (bTorpedo_Left : boolean) is
      begin
         tCom_Prot_Obj.bTorpedo_Left := bTorpedo_Left;

      end Set_Torpedo_Left;

      -----------------------
      -- Set_Torpedo_Right --
      -----------------------

      procedure Set_Torpedo_Right (bTorpedo_Right : boolean) is
      begin
         tCom_Prot_Obj.bTorpedo_Right := bTorpedo_Right;

      end Set_Torpedo_Right;

      ----------------------
      -- Set_Dropper_Left --
      ----------------------

      procedure Set_Dropper_Left (bDropper_Left : boolean) is
      begin
         tCom_Prot_Obj.bDropper_Left := bDropper_Left;

      end Set_Dropper_Left;

      -----------------------
      -- Set_Dropper_Right --
      -----------------------

      procedure Set_Dropper_Right (bDropper_Right : boolean) is
      begin
         tCom_Prot_Obj.bDropper_Right := bDropper_Right;

      end Set_Dropper_Right;

      ------------------
      -- Set_Pressure --
      ------------------

      procedure Set_Pressure (fPressure : float) is
      begin
         tCom_Prot_Obj.fPressure := fPressure;

      end Set_Pressure;

      ---------------------
      -- Set_Temperature --
      ---------------------

      procedure Set_Temperature (fTemperature : float) is
      begin
         tCom_Prot_Obj.fTemperature := fTemperature;

      end Set_Temperature;

      ----------------------
      -- Set_Pid_Scalings --
      ----------------------

      procedure Set_Pid_Scaling(eComponent : EMotionComponent; PidScaling : TPIDComponentScalings) is
      begin
         case eComponent is
            when AllPosition =>
               tCom_Prot_Obj.txPidScalings(PositionX) := PidScaling;
               tCom_Prot_Obj.txPidScalings(PositionY) := PidScaling;
               tCom_Prot_Obj.txPidScalings(PositionZ) := PidScaling;

            when AllRotation =>
               tCom_Prot_Obj.txPidScalings(RotationX) := PidScaling;
               tCom_Prot_Obj.txPidScalings(RotationY) := PidScaling;
               tCom_Prot_Obj.txPidScalings(RotationZ) := PidScaling;

            when AllComponents =>
               tCom_Prot_Obj.txPidScalings(PositionX) := PidScaling;
               tCom_Prot_Obj.txPidScalings(PositionY) := PidScaling;
               tCom_Prot_Obj.txPidScalings(PositionZ) := PidScaling;
               tCom_Prot_Obj.txPidScalings(RotationX) := PidScaling;
               tCom_Prot_Obj.txPidScalings(RotationY) := PidScaling;
               tCom_Prot_Obj.txPidScalings(RotationZ) := PidScaling;

            when others =>
               tCom_Prot_Obj.txPidScalings(eComponent) := PidScaling;
         end case;

      end;

      -----------------------
      -- Set_OperatingMode --
      -----------------------

      procedure Set_OperatingMode(eOperationMode: EOperatingMode) is
      begin
         tCom_Prot_Obj.eOperationMode := eOperationMode;
      end Set_OperatingMode;


      ---------------------------
      -- xGet_Current_Position --
      ---------------------------

      function xGet_Current_Position return math.Vectors.CVector is
      begin
         return tCom_Prot_Obj.xCurrent_Position;

      end xGet_Current_Position;

      ------------------------------
      -- xGet_Current_Orientation --
      ------------------------------

      function xGet_Current_Orientation return math.Matrices.CMatrix is
      begin
         return tCom_Prot_Obj.xCurrent_Orientation;

      end xGet_Current_Orientation;

      --------------------------
      -- xGet_Wanted_Position --
      --------------------------

      function xGet_Wanted_Position return math.Vectors.CVector is
      begin
         return tCom_Prot_Obj.xWanted_Position;

      end xGet_Wanted_Position;

      -----------------------------
      -- xGet_Wanted_Orientation --
      -----------------------------

      function xGet_Wanted_Orientation return math.Matrices.CMatrix is
      begin
         return tCom_Prot_Obj.xWanted_Orientation;

      end xGet_Wanted_Orientation;

      -----------------------
      -- xGet_xMotor_Power --
      -----------------------

      function xGet_Motor_Power return simulator.submarine.TMotorForce is
      begin
         return tCom_Prot_Obj.xMotor_Power;

      end xGet_Motor_Power;

      -----------------------
      -- bGet_Gripper_Left --
      -----------------------

      function bGet_Gripper_Left return boolean is
      begin
         return tCom_Prot_Obj.bGripper_Left;

      end bGet_Gripper_Left;

      ------------------------
      -- bGet_Gripper_Right --
      ------------------------

      function bGet_Gripper_Right return boolean is
      begin
         return tCom_Prot_Obj.bGripper_Right;

      end bGet_Gripper_Right;

      -----------------------
      -- bGet_Torpedo_Left --
      -----------------------

      function bGet_Torpedo_Left return boolean is
      begin
         return tCom_Prot_Obj.bTorpedo_Left;

      end bGet_Torpedo_Left;

      ------------------------
      -- bGet_Torpedo_Right --
      ------------------------

      function bGet_Torpedo_Right return boolean is
      begin
         return tCom_Prot_Obj.bTorpedo_Right;

      end bGet_Torpedo_Right;

      -----------------------
      -- bGet_Dropper_Left --
      -----------------------

      function bGet_Dropper_Left return boolean is
      begin
         return tCom_Prot_Obj.bDropper_Left;

      end bGet_Dropper_Left;

      ------------------------
      -- bGet_Dropper_Right --
      ------------------------

      function bGet_Dropper_Right return boolean is
      begin
         return tCom_Prot_Obj.bDropper_Right;

      end bGet_Dropper_Right;

      -------------------
      -- fGet_Pressure --
      -------------------

      function fGet_Pressure return float is
      begin
         return tCom_Prot_Obj.fPressure;

      end fGet_Pressure;

      ----------------------
      -- fGet_Temperature --
      ----------------------

      function fGet_Temperature return float is
      begin
         return tCom_Prot_Obj.fTemperature;

      end fGet_Temperature;

      ----------------------
      -- xGet_Pid_Scaling --
      ----------------------
      function xGet_Pid_Scaling( eComponent : EMotionComponent ) return TPIDComponentScalings is
      begin
         return txPidScalings(eComponent);
      end;

      ------------------------
      -- eGet_OperatingMode --
      ------------------------

      function eGet_OperatingMode return EOperatingMode is
      begin
         return tCom_Prot_Obj.eOperationMode;
      end eGet_OperatingMode;

   end tCom_Prot_Obj;

end Simulator.Comunication_Prot_Obj;
