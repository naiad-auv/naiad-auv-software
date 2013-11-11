with Navigation.PID_Controller;

package body Navigation.Motion_Component is

   function xCreate (eAxisIndex : EMotionComponent; xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings) return CMotionComponent is 
   	xMotionComponent : CMotionComponent;   
   begin
      
      xMotionComponent.eComponentIndex := eAxisIndex;
      
      xMotionComponent.xComponentPIDController := Navigation.PID_Controller.xCreate(xPIDScalings);
      
      return xMotionComponent;
   end xCreate;

  
   procedure Get_New_Component_Control_Value (this : in out CMotionComponent; fDeltaTime : float; fControlValue : out float) is
   begin
      this.xComponentPIDController.Get_New_Control_Value(fDeltaTime    => fDeltaTime,
                                                         fControlValue => fControlValue); 
   end Get_New_Component_Control_Value;

   procedure Set_New_PID_Component_Scalings (this : in out CMotionComponent; xNewScalings : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
	this.xComponentPIDController.Set_New_PID_Component_Scalings(xNewScalings);
   end Set_New_PID_Component_Scalings;


   procedure Update_Current_Error (this : in out CMotionComponent; fNewErrorValue : float) is
   begin
      this.fCurrentError := fNewErrorValue;
      this.xComponentPIDController.Set_New_Set_Point(0.0);
      this.xComponentPIDController.Update_Current_Value_From_External_Source(-this.fCurrentError);
   end Update_Current_Error;



   procedure Reset_Component (this : in out CMotionComponent) is
   begin
      this.fCurrentError := 0.0;
      
      this.xComponentPIDController.Reset_Controller;
   end Reset_Component;
   

end Navigation.Motion_Component;
