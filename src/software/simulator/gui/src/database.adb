package body Database is

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
      fCurrentDirectionaAngle : float) is
   begin
      This.set_Motors(tfMotor);
      This.set_Gripper(bGripperOpen);
      This.set_Left_Dropper(bLeftMarkerDropped);
      This.set_Right_Dropper(bRightMarkerDropped);
      This.set_Left_Torpedo(bLeftTorpedoShot);
      This.set_Right_Torpedo(bRightTorpedoShot);
      This.set_RollPitchYaw(tfRollPitchYaw);
      This.set_Depth(fDepth);
      This.set_Translation(fPositionX, fPositionY, fPositionZ);
      This.set_Velocity(fVelocityX, fVelocityY, fVelocityZ);
      This.set_Angular_Velocity(fAngularVelocityX, fAngularVelocityY, fAngularVelocityZ);
      This.set_Goal_Position(fGoalPositionX, fGoalPositionY);

      this.fGoalDirectionalAngle := fGoalDirectionalAngle;
      this.fCurrentDirectionaAngle := fCurrentDirectionaAngle;


   end set_Database;

   procedure set_Motors(This : in out TDatabase; tfMotor : Motors) is
   begin
      This.tfMotor := tfMotor;
   end set_Motors;

   procedure set_Gripper(This : in out TDatabase; bGripperOpen: Boolean) is
   begin
      This.bGripperOpen := bGripperOpen;
   end set_Gripper;

   procedure set_Left_Dropper(This : in out TDatabase; bLeftMarkerDropped : Boolean) is
   begin
      This.bLeftMarkerDropped := bLeftMarkerDropped;
   end set_Left_Dropper;

   procedure set_Right_Dropper(This : in out TDatabase; bRightMarkerDropped : Boolean) is
   begin
      This.bRightMarkerDropped := bRightMarkerDropped;
   end set_Right_Dropper;

   procedure set_Left_Torpedo(This : in out TDatabase; bLeftTorpedoShot : Boolean) is
   begin
      This.bLeftTorpedoShot := bLeftTorpedoShot;
   end set_Left_Torpedo;
   procedure set_Right_Torpedo(This : in out TDatabase; bRightTorpedoShot : Boolean) is
   begin
      This.bRightTorpedoShot := bRightTorpedoShot;
   end set_Right_Torpedo;

   procedure set_RollPitchYaw(This : in out TDatabase; tfRollPitchYaw : Orient) is
   begin
      This.tfRollPitchYaw := tfRollPitchYaw;
   end set_RollPitchYaw;

   procedure set_Depth(This : in out TDatabase; fDepth : float) is
   begin
      This.fDepth := fDepth;
   end set_Depth;

   procedure set_Translation(This : in out TDatabase; fPositionX : float; fPositionY : float; fPositionZ : float) is
   begin
      This.fPositionX := fPositionX;
      This.fPositionY := fPositionY;
      This.fPositionZ := fPositionZ;
   end set_Translation;

   procedure set_Velocity(This : in out TDatabase; fVelocityX : float; fVelocityY : float; fVelocityZ : float) is
   begin
      This.fVelocityX := fVelocityX;
      This.fVelocityY := fVelocityY;
      This.fVelocityZ := fVelocityZ;
   end set_Velocity;

   procedure set_Angular_Velocity(This : in out TDatabase; fAngularVelocityX : float; fAngularVelocityY : float; fAngularVelocityZ : float) is
   begin
      This.fAngularVelocityX := fAngularVelocityX;
      This.fAngularVelocityY := fAngularVelocityY;
      This.fAngularVelocityZ := fAngularVelocityZ;
   end set_Angular_Velocity;

   procedure set_Goal_Position(This : in out TDatabase; fGoalPositionX : float; fGoalPositionY : float) is
   begin
      This.fGoalPositionX := fGoalPositionX;
      This.fGoalPositionY := fGoalPositionY;
   end set_Goal_Position;

end Database;
