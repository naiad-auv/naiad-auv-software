package body Navigation.Positional_Controller is


   function xCreate (pxCurrentAbsolutePosition : access Math.Vectors.CVector; pxWantedAbsolutePosition : access Math.Vectors.CVector; pxCurrentAbsoluteOrientation : access Math.Matrices.CMatrix; pxCurrentAbsoluteOrientationInverse : access Math.Matrices.CMatrix) return CPositionalController is
      xPositionalController : CPositionalController;

   begin

      xPositionalController.pxWantedAbsolutePosition := pxWantedAbsolutePosition;
      xPositionalController.pxCurrentAbsolutePosition := pxCurrentAbsolutePosition;
      xPositionalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      xPositionalController.pxCurrentAbsoluteOrientationInverse := pxCurrentAbsoluteOrientationInverse;

      xPositionalController.xXMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.PositionX,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.xYMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.PositionY,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.xZMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.PositionZ,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      return xPositionalController;
   end xCreate;

   procedure Get_Positional_Thruster_Control_Values(this : in out CPositionalController; fDeltaTime : float; tfValues : out Navigation.Thrusters.TThrusterEffects) is
      fPositionX : float;
      fPositionY : float;
      fPositionZ : float;
   begin
      this.xXMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                             fControlValue => fPositionX);
      this.xYMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                             fControlValue => fPositionY);
      this.xZMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                             fControlValue => fPositionZ);
      tfValues := (Navigation.Thrusters.XPosition => fPositionX,
                   Navigation.Thrusters.YPosition => fPositionY,
                   Navigation.Thrusters.ZPosition => fPositionZ,
                   others => 0.0);
   end Get_Positional_Thruster_Control_Values;




   procedure Update_Current_Errors (this : in out CPositionalController) is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeWantedPositionVector : Math.Vectors.CVector;
      xAbsoluteDifferenceVector : Math.Vectors.CVector;
   begin
      xAbsoluteDifferenceVector := this.pxWantedAbsolutePosition.all - this.pxCurrentAbsolutePosition.all;
      xRelativeWantedPositionVector := this.pxCurrentAbsoluteOrientationInverse.all * xAbsoluteDifferenceVector;

      this.xXMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_X);
      this.xYMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Y);
      this.xZMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Z);

   end Update_Current_Errors;



   procedure Set_New_PID_Component_Scalings(this : in out CPositionalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
         when Navigation.Motion_Component.PositionX =>
            this.xXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.PositionY =>
            this.xYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.PositionZ =>
            this.xZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.AllComponents =>
            this.xXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.xYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.xZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when others =>
            null;
      end case;

   end Set_New_PID_Component_Scalings;


end Navigation.Positional_Controller;
