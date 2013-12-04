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
      Navigation.PID_Controller.Get_New_Control_Value(this          => this.xComponentPIDController,
                                                      fDeltaTime    => fDeltaTime,
                                                      fControlValue => fControlValue);
   end Get_New_Component_Control_Value;

   procedure Set_New_PID_Component_Scalings (this : in out CMotionComponent; xNewScalings : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      Navigation.PID_Controller.Set_New_PID_Component_Scalings(this         => this.xComponentPIDController,
                                                               xNewScalings => xNewScalings);
   end Set_New_PID_Component_Scalings;


   procedure Update_Current_Error (this : in out CMotionComponent; fNewErrorValue : float) is
   begin
      this.fCurrentError := fNewErrorValue;
      Navigation.PID_Controller.Set_New_Set_Point(this         => this.xComponentPIDController,
                                                  fNewSetPoint => 0.0);
      Navigation.PID_Controller.Update_Current_Value_From_External_Source(this   => this.xComponentPIDController,
                                                                          fValue => -this.fCurrentError);
   end Update_Current_Error;



   procedure Reset_Component (this : in out CMotionComponent) is
   begin
      this.fCurrentError := 0.0;
      
      Navigation.PID_Controller.Reset_Controller(this => this.xComponentPIDController);
   end Reset_Component;
   

end Navigation.Motion_Component;
