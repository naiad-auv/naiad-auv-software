with Navigation.PID_Controller;

package body Navigation.Motion_Component is

   function pxCreate(eAxisIndex : EMotionComponent; xPID_Scalings : Navigation.PID_Controller.TPIDComponentScalings) return pCMotion_Component is -- här ska referensen till stället man hämtar thruster force distri värdena läggas till
   begin
      return null;
   end pxCreate;


   function xGet_New_Control_Values(this : in out CMotion_Component) return TThruster_Control_Values is
      controlValues : TThrusteR_Control_Values;
   begin
      return controlValues;
   end xGet_New_Control_Values;



   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Component; xPID_Component_Scalings : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_PID_Component_Scalings;


   procedure Set_New_Wanted_Value(this : in out CMotion_Component; fNewValue : float)is
   begin
      null;
   end Set_New_Wanted_Value;



   procedure Set_New_Current_Value(this : in out CMotion_Component; fNewValue : float) is
   begin
      null;
   end Set_New_Current_Value;



   procedure Reset_Component(this : in out CMotion_Component) is
   begin
      null;
   end Reset_Component;


end Navigation.Motion_Component;
