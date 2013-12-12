package body MotionControl.Positional_Controller is


   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCPositionalController is

      use System;
      xPositionalController : pCPositionalController;


   begin

      xPositionalController := new CPositionalController;

      xPositionalController.pxWantedAbsolutePosition := pxWantedAbsolutePosition;
      xPositionalController.pxCurrentAbsolutePosition := pxCurrentAbsolutePosition;
      xPositionalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      xPositionalController.pxCurrentAbsoluteOrientationInverse := pxCurrentAbsoluteOrientationInverse;

      xPositionalController.pxXMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.PositionX,
                                                                                       xPIDScalings => MotionControl.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxYMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.PositionY,
                                                                                       xPIDScalings => MotionControl.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxZMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.PositionZ,
                                                                                       xPIDScalings => MotionControl.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      return xPositionalController;

   end pxCreate;

   procedure Get_Positional_Thruster_Control_Values(this : in CPositionalController; fDeltaTime : float; tfValues : out MotionControl.Thrusters.TThrusterEffects) is
      fXControlValue : float;
      fYControlValue : float;
      fZControlValue : float;
   begin

      fXControlValue := this.pxXMotionComponent.fGet_New_Component_Control_Value(fDeltaTime);
      fYControlValue := this.pxYMotionComponent.fGet_New_Component_Control_Value(fDeltaTime);
      fZControlValue := this.pxZMotionComponent.fGet_New_Component_Control_Value(fDeltaTime);

      tfValues := (MotionControl.Thrusters.XPosition => fXControlValue,
                   MotionControl.Thrusters.YPosition => fYControlValue,
                   MotionControl.Thrusters.ZPosition => fZControlValue,
                   others => 0.0);
   end Get_Positional_Thruster_Control_Values;




   procedure Update_Current_Errors (this : in CPositionalController) is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeWantedPositionVector : Math.Vectors.CVector;
      xAbsoluteDifferenceVector : Math.Vectors.CVector;
   begin
      xAbsoluteDifferenceVector := this.pxWantedAbsolutePosition.all - this.pxCurrentAbsolutePosition.all;
      xRelativeWantedPositionVector := this.pxCurrentAbsoluteOrientationInverse.all * xAbsoluteDifferenceVector;

      this.pxXMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_X);
      this.pxYMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Y);
      this.pxZMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Z);

   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Positional_Controller.Update_Current_Errors (this : in CPositionalController)");

   end Update_Current_Errors;



   procedure Set_New_PID_Component_Scalings(this : in CPositionalController; eComponentToUpdate : MotionControl.Motion_Component.EMotionComponent; xNewPIDScaling : MotionControl.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
         when MotionControl.Motion_Component.PositionX =>
            this.pxXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when MotionControl.Motion_Component.PositionY =>
            this.pxYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when MotionControl.Motion_Component.PositionZ =>
            this.pxZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when MotionControl.Motion_Component.AllComponents =>
            this.pxXMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.pxYMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
            this.pxZMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         when others =>
            null;
      end case;

   end Set_New_PID_Component_Scalings;

   procedure Free(pxPositionalControllerToDeallocate : in out pCPositionalController) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPositionalController, pCPositionalController);
   begin
      Dealloc(pxPositionalControllerToDeallocate);
   end Free;


   procedure Finalize(this : in out CPositionalController) is
      use MotionControl.Motion_Component;
   begin
      if this.pxXMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxXMotionComponent);
      end if;
      if this.pxYMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxYMotionComponent);
      end if;
      if this.pxZMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxZMotionComponent);
      end if;

   end Finalize;


   function fGetCurrentErrors(this : in CPositionalController) return TPositionalErrors is
   begin
      return TPositionalErrors'(MotionControl.Motion_Component.PositionX => this.pxXMotionComponent.fGetCurrentError,
                                MotionControl.Motion_Component.PositionY => this.pxYMotionComponent.fGetCurrentError,
                                MotionControl.Motion_Component.PositionZ => this.pxZMotionComponent.fGetCurrentError);
   end fGetCurrentErrors;

end MotionControl.Positional_Controller;
