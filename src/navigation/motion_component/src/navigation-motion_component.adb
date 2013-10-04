with Navigation.PID_Controller;

package body Navigation.Motion_Component is

   function pxCreate(eAxisIndex : EMotionComponent; xPID_Scalings : Navigation.PID_Controller.TPIDComponentScalings) return pCMotion_Component is 
   	pxMotionComponent : pCMotion_Component := new CMotion_Component;   
   begin
      
      pxMotionComponent.eComponentIndex := eAxisIndex;
      
      pxMotionComponent.xComponentPIDController := Navigation.PID_Controller.pxCreate(xPID_Scalings);
      
      return pxMotionComponent;
   end pxCreate;

   function xGet_New_Component_Control_Value(this : in out CMotion_Component; fDeltaTime : float) return TComponentControlValue is
   	fNewControlValue : float;
   begin
      
      fNewControlValue := this.xComponentPIDController.xGet_New_Control_Value(fDeltaTime);
 
      return TComponentControlValue'(fNewControlValue, this.eComponentIndex);
      
   end xGet_New_Component_Control_Value;

   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Component; xPID_Component_Scalings : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
	this.xComponentPIDController.Set_New_PID_Component_Scalings(xPID_Component_Scalings);
   end Set_New_PID_Component_Scalings;


   procedure Set_New_Wanted_Value(this : in out CMotion_Component; fNewValue : float)is
   begin
      this.fWantedValue := fNewValue;
      this.xComponentPIDController.Set_New_Set_Point(fNewValue);
   end Set_New_Wanted_Value;



   procedure Set_New_Current_Value(this : in out CMotion_Component; fNewValue : float) is
   begin
      this.fCurrentValue := fNewValue;
      this.xComponentPIDController.Update_Current_Value_From_External_Source(fNewValue);
   end Set_New_Current_Value;



   procedure Reset_Component(this : in out CMotion_Component) is
   begin
      this.fCurrentValue := 0.0;
      this.fWantedValue := 0.0;
      
      this.xComponentPIDController.Reset_Controller;
   end Reset_Component;


end Navigation.Motion_Component;
