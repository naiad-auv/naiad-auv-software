package body Navigation.Positional_Controller is


   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix) return pCPositionalController is

      xPositionalController : pCPositionalController;

   begin

      xPositionalController := new CPositionalController;

      xPositionalController.pxWantedAbsolutePosition := pxWantedAbsolutePosition;
      xPositionalController.pxCurrentAbsolutePosition := pxCurrentAbsolutePosition;
      xPositionalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;

      xPositionalController.pxXMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.X,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxYMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Y,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxZMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Z,
                                                                                       xPID_Scalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      return xPositionalController;

   end pxCreate;

   function xGet_Positional_Thruster_Control_Values (this : in out CPositionalController; fDeltaTime : float) return Navigation.Thrusters.TThrusterEffects is
   begin
      return (Navigation.Thrusters.XPosition => this.pxXMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              Navigation.Thrusters.YPosition => this.pxYMotionComponent.xGet_New_Component_Control_Value(fDeltatime).fValue,
              Navigation.Thrusters.ZPosition => this.pxZMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              others => 0.0);
   end xGet_Positional_Thruster_Control_Values;




   procedure Update_Current_Errors (this : in CPositionalController) is
      use Math.Vectors;
      use Math.Matrices;

      pxRelativeWantedPositionVector : Math.Vectors.pCVector;
      pxAbsoluteDifferenceVector : Math.Vectors.pCVector;
   begin
      pxAbsoluteDifferenceVector := this.pxWantedAbsolutePosition - this.pxCurrentAbsolutePosition;
      pxRelativeWantedPositionVector := this.pxCurrentAbsoluteOrientation.pxGet_Inverse * pxAbsoluteDifferenceVector;

      this.pxXMotionComponent.Update_Current_Error(pxRelativeWantedPositionVector.fGet_X);
      this.pxYMotionComponent.Update_Current_Error(pxRelativeWantedPositionVector.fGet_Y);
      this.pxZMotionComponent.Update_Current_Error(pxRelativeWantedPositionVector.fGet_Z);
   end Update_Current_Errors;



   procedure Set_New_PID_Component_Scalings(this : in out CPositionalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
         when Navigation.Motion_Component.X =>
            this.pxXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.Y =>
            this.pxYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.Z =>
            this.pxZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when Navigation.Motion_Component.AllComponents =>
            this.pxXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.pxYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.pxZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when others =>
            null;
      end case;

   end Set_New_PID_Component_Scalings;

end Navigation.Positional_Controller;
