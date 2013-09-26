with Navigation;
with Navigation.PID_Controller;

package Navigation.Motion_Axis is

   type CMotion_Axis is tagged private;
   type pCMotion_Axis is access CMotion_Axis;

   type EMotionAxis is (Unkown, AxisX, AxisY, AxisZ);

   type EThrusterIndex is (Unknown, ThrusterFront, ThrusterBack, ThrusterLeft, ThrusterRight, ThrusterTop, ThrusterBottom);

   type EAxisThrusters is (RotationalTop, RotationBottom, PositionalLeft, PositionalRight);

   type TAxisThrusters is array (EAxisThrusters range RotationalTop .. PositionalRight) of EThrusterIndex;

   type EPIDType is (Unknown, Rotational, Positional);

   type TThruster_Control_Value is
      record
         eIndexOfThruster : EThrusterIndex;
         xThrusterPowerPercentage : Navigation.PID_Controller.TThrusterPowerPercentage;
      end record;

   type TAxis_Thruster_Control_Values is
      record
         xRotaitionalThrusterBottom : TThruster_Control_Value;
         xRotaitionalThrusterTop : TThruster_Control_Value;
         xPositionalThrusterLeft : TThruster_Control_Value;
         xPositionalThrusterRight : TThruster_Control_Value;
      end record;



   function pxCreate(eAxisIndex : EMotionAxis; eThrusterIndexes : TAxisThrusters; xPID_Scalings_Rotational, xPID_Scalings_Positional : Navigation.PID_Controller.TPID_Component_Scalings) return pCMotion_Axis;

   function xGet_New_Control_Values(this : in out CMotion_Axis) return TAxis_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Axis; ePIDByType : EPIDType; xPID_Component_Scalings : Navigation.PID_Controller.TPID_Component_Scalings);



private

   type CMotion_Axis is tagged
      record
         eAxisIndex : EMotionAxis;

         fCurrentAngle : float;
         fWantedAngle : float;

         fCurrentPosition : float;
         fWantedPosition : float;

         xRotationalPIDController : Navigation.PID_Controller.CPID_Controller;
         xPositionalPIDController : Navigation.PID_Controller.CPID_Controller;

         xThrustersAffectedByAxis : TAxisThrusters;
      end record;


end Navigation.Motion_Axis;
