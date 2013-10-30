package Database is

   type Motors is array(1..6) of float;
   type Orient is array(1..3, 1..3) of float;

   type TDatabase is tagged record
      tfMotor : Motors;
      bGripperOpen : Boolean;
      bLeftMarkerDropped : Boolean;
      bRightMarkerDropped : Boolean;
      bLeftTorpedoShot : Boolean;
      bRightTorpedoShot : Boolean;

      tfRollPitchYaw : Orient;

      fDepth : float;

      fPositionX : float;
      fPositionY : float;
      fPositionZ : float;

      fVelocityX : float;
      fVelocityY : float;
      fVelocityZ : float;

      fAngularVelocityX : float;
      fAngularVelocityY : float;
      fAngularVelocityZ : float;

      fGoalPositionX : float;
      fGoalPositionY : float;

      fGoalDirectionalAngle : float;
      fCurrentDirectionaAngle : float;
   end record;

   type pTDatabase is access all TDatabase;

   -- Ugly ugly ugly ugly
   fProportional : float := 0.0;
   fIntegrating : float := 0.0;
   fDerivative : float := 0.1;


   procedure set_Database
     (This : in out TDatabase;
      tfMotor : Motors;
      bGripperOpen : Boolean := True;
      bLeftMarkerDropped : Boolean := False;
      bRightMarkerDropped : Boolean := False;
      bLeftTorpedoShot : Boolean := False;
      bRightTorpedoShot : Boolean := False;
      tfRollPitchYaw : Orient;
      fDepth : float;
      fPositionX : float;
      fPositionY : float;
      fPositionZ : float;
      fVelocityX : float;
      fVelocityY : float;
      fVelocityZ : float;
      fAngularVelocityX : float;
      fAngularVelocityY : float;
      fAngularVelocityZ : float;
      fGoalPositionX : float;
      fGoalPositionY : float;
      fGoalDirectionalAngle : float;
      fCurrentDirectionaAngle : float);

   procedure set_Motors(This : in out TDatabase; tfMotor : Motors);
   procedure set_Gripper(This : in out TDatabase; bGripperOpen: Boolean);
   procedure set_Left_Dropper(This : in out TDatabase; bLeftMarkerDropped : Boolean);
   procedure set_Right_Dropper(This : in out TDatabase; bRightMarkerDropped : Boolean);
   procedure set_Left_Torpedo(This : in out TDatabase; bLeftTorpedoShot : Boolean);
   procedure set_Right_Torpedo(This : in out TDatabase; bRightTorpedoShot : Boolean);
   procedure set_RollPitchYaw(This : in out TDatabase; tfRollPitchYaw : Orient);
   procedure set_Depth(This : in out TDatabase; fDepth : float);
   procedure set_Translation(This : in out TDatabase; fPositionX : float; fPositionY : float; fPositionZ : float);
   procedure set_Velocity(This : in out TDatabase; fVelocityX : float; fVelocityY : float; fVelocityZ : float);
   procedure set_Angular_Velocity(This : in out TDatabase; fAngularVelocityX : float; fAngularVelocityY : float; fAngularVelocityZ : float);
   procedure set_Goal_Position(This : in out TDatabase; fGoalPositionX : float; fGoalPositionY : float);

end Database;
