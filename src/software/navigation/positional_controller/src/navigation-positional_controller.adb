package body Navigation.Positional_Controller is


   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix) return pCPositionalController is

      use System;
      xPositionalController : pCPositionalController;


   begin

      xPositionalController := new CPositionalController;

      xPositionalController.pxWantedAbsolutePosition := pxWantedAbsolutePosition;
      xPositionalController.pxCurrentAbsolutePosition := pxCurrentAbsolutePosition;
      xPositionalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;

      xPositionalController.pxXMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.X,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxYMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Y,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      xPositionalController.pxZMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Z,
                                                                                       xPIDScalings => Navigation.PID_Controller.TPIDComponentScalings'(0.0,0.0,0.0));

      --Ada.Text_IO.Put_Line("CAO: " & System.Address_Image(xPositionalController.pxCurrentAbsoluteOrientation.all'Address));
      --Ada.Text_IO.Put_Line("CAP: " & System.Address_Image(xPositionalController.pxCurrentAbsolutePosition.all'Address));
      --Ada.Text_IO.Put_Line("WAP: " & System.Address_Image(xPositionalController.pxWantedAbsolutePosition.all'Address));
      return xPositionalController;

   end pxCreate;

   function xGet_Positional_Thruster_Control_Values (this : in out CPositionalController; fDeltaTime : float) return Navigation.Thrusters.TThrusterEffects is
   begin
      return Navigation.Thrusters.TThrusterEffects'(Navigation.Thrusters.XPosition => this.pxXMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              Navigation.Thrusters.YPosition => this.pxYMotionComponent.xGet_New_Component_Control_Value(fDeltatime).fValue,
              Navigation.Thrusters.ZPosition => this.pxZMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              others => 0.0);
   end xGet_Positional_Thruster_Control_Values;




   procedure Update_Current_Errors (this : in CPositionalController) is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeWantedPositionVector : Math.Vectors.CVector;
      xAbsoluteDifferenceVector : Math.Vectors.CVector;
   begin
      xAbsoluteDifferenceVector := this.pxWantedAbsolutePosition - this.pxCurrentAbsolutePosition;
      xRelativeWantedPositionVector := this.pxCurrentAbsoluteOrientation.xGet_Inverse * xAbsoluteDifferenceVector;

      this.pxXMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_X);
      this.pxYMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Y);
      this.pxZMotionComponent.Update_Current_Error(xRelativeWantedPositionVector.fGet_Z);
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

   procedure Free(pxPositionalControllerToDeallocate : in out pCPositionalController) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPositionalController, pCPositionalController);
   begin
      Dealloc(pxPositionalControllerToDeallocate);
   end Free;


   procedure Finalize(this : in out CPositionalController) is
      use Navigation.Motion_Component;
   begin
      if this.pxXMotionComponent /= null then
         Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxXMotionComponent);
      end if;
      if this.pxYMotionComponent /= null then
         Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxYMotionComponent);
      end if;
      if this.pxZMotionComponent /= null then
         Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxZMotionComponent);
      end if;

   end Finalize;


end Navigation.Positional_Controller;
