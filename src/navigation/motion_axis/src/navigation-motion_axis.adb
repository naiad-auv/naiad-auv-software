
package body Navigation.Motion_Axis is

   function pxCreate(eAxisIndex : EMotionAxis; eThrusterIndexes : TAxisThrusters; xPID_Scalings_Rotational, xPID_Scalings_Positional : Navigation.PID_Controller.TPID_Component_Scalings) return pCMotion_Axis is
   begin
      return null;
      end pxCreate;

   function xGet_New_Control_Values(this : in out CMotion_Axis) return TAxis_Thruster_Control_Values is
   begin
      return TAxis_Thruster_Control_values'(xRotaitionalThrusterBottom => TThruster_Control_Value'(eIndexOfThruster => EThrusterIndex'(Unknown),xThrusterPowerPercentage => 0),
                                            xRotaitionalThrusterTop    => TThruster_Control_Value'(eIndexOfThruster => EThrusterIndex'(Unknown),xThrusterPowerPercentage => 0),
                                            xPositionalThrusterLeft    => TThruster_Control_Value'(eIndexOfThruster => EThrusterIndex'(Unknown),xThrusterPowerPercentage => 0),
                                            xPositionalThrusterRight   => TThruster_Control_Value'(eIndexOfThruster => EThrusterIndex'(Unknown),xThrusterPowerPercentage => 0));
   end xGet_New_Control_Values;


   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Axis; ePIDByType : EPIDType; xPID_Component_Scalings : Navigation.PID_Controller.TPID_Component_Scalings) is
   begin
      null;
   end Set_New_Pid_Component_Scalings;




end Navigation.Motion_Axis;
