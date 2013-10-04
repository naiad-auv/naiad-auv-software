package body Navigation.Positional_Controller is


   function pxCreate return pCPositional_Controller is

      xPositionalController : pCPositional_Controller;

   begin

      xPositionalController := new CPositional_Controller;

      xPositionalController.pxCurrentPosition := Math.Vectors.pxCreate(0.0, 0.0, 0.0);
      xPositionalController.pxWantedPosition := Math.Vectors.pxCreate(0.0, 0.0, 0.0);

      xPositionalController.pxXMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.X,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxYMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Y,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxZMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Z,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      return xPositionalController;

   end pxCreate;

   function xGet_Positional_Thruster_Control_Values (this : in out CPositional_Controller) return Navigation.Motion_Component.TPositional_Control_Values is
      val : Navigation.Motion_Component.TPositional_Control_Values;
   begin
      return val;
   end xGet_Positional_Thruster_Control_Values;


   procedure Update_Current_Position (this : in out CPositional_Controller; pxNewCurrentPosition : Math.Vectors.pCVector) is
   begin
      this.pxCurrentPosition := pxNewCurrentPosition;

      this.pxXMotionComponent.Set_New_Current_Value(this.pxCurrentPosition.fGet_X);
      this.pxYMotionComponent.Set_New_Current_Value(this.pxCurrentPosition.fGet_Y);
      this.pxZMotionComponent.Set_New_Current_Value(this.pxCurrentPosition.fGet_Z);

   end Update_Current_Position;


   procedure Update_Wanted_Position (this : in out CPositional_Controller; pxNewWantedPosition : Math.Vectors.pCVector) is
   begin
      this.pxWantedPosition := pxNewWantedPosition;

      this.pxXMotionComponent.Set_New_Wanted_Value(this.pxWantedPosition.fGet_X);
      this.pxYMotionComponent.Set_New_Wanted_Value(this.pxWantedPosition.fGet_Y);
      this.pxZMotionComponent.Set_New_Wanted_Value(this.pxWantedPosition.fGet_Z);

   end Update_Wanted_Position;

   procedure Set_New_PID_Component_Scalings(this : in out CPositional_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
         when Navigation.Motion_Component.X =>
            this.pxXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.Y =>
            this.pxYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.Z =>
            this.pxZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      end case;

   end Set_New_PID_Component_Scalings;

end Navigation.Positional_Controller;
