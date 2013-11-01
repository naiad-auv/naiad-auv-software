with Exception_Handling;

package body Navigation.Orientational_Controller is


   function pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCOrientationalController is
      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;
      use System;
   begin

      pxOrientationalController := new Navigation.Orientational_Controller.COrientationalController;

      pxOrientationalController.pxCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector     => Math.Matrices.xCreate_Identity.xGet_X_Vector,
                                                                                            fAngleInDegrees => 0.0).pxGet_Allocated_Copy;

      pxOrientationalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      pxOrientationalController.pxWantedAbsoluteOrientation := pxWantedAbsoluteOrientation;
      pxOrientationalController.pxCurrentAbsoluteOrientationInverse := pxCurrentAbsoluteOrientationInverse;

      pxOrientationalController.pxPlanalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Plane,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      pxOrientationalController.pxDirectionalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Direction,
                                                                                                     xPIDScalings => (0.0,0.0,0.0));

      --Ada.Text_IO.Put_Line("CAO: " & System.Address_Image(pxOrientationalController.pxCurrentAbsoluteOrientation.all'Address));
      --Ada.Text_IO.Put_Line("WAO: " & System.Address_Image(pxOrientationalController.pxWantedAbsoluteOrientation.all'Address));
      return pxOrientationalController;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCOrientationalController");
         return pxOrientationalController;
   end pxCreate;

   procedure Update_Current_Errors (this : in out COrientationalController) is
   begin
      this.Update_Current_Planal_Error;
      this.Update_Current_Directional_Error;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Errors (this : in out COrientationalController)");
   end Update_Current_Errors;



   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      use Navigation.Thrusters;

   begin

      return  this.xGet_Planal_Thruster_Control_Value(fDeltaTime) + this.xGet_Directional_Thruster_Control_Value(fDeltaTime);
   end xGet_Orientational_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
      when Navigation.Motion_Component.Direction =>
           this.pxDirectionalMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when Navigation.Motion_Component.Plane =>
           this.pxPlanalMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when Navigation.Motion_Component.AllComponents =>
         this.pxDirectionalMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
         this.pxPlanalMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when others =>
         null;
      end case;
   end Set_New_PID_Component_Scalings;


   function fGet_Directional_Error (xCurrentRelativeDirectionVector : in Math.Vectors.CVector; xWantedRelativeDirectionVector : in Math.Vectors.CVector) return float is
   begin
      return Math.Vectors.fAngle_Between_In_Radians(xWantedRelativeDirectionVector, xCurrentRelativeDirectionVector);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.fGet_Directional_Error (xCurrentRelativeDirectionVector : in Math.Vectors.CVector; xWantedRelativeDirectionVector : in Math.Vectors.CVector) return float");
         return 0.0;
   end fGet_Directional_Error;

   function fGet_Planal_Error (xCurrentRelativePlane : in Math.Planes.CPlane; xWantedRelativePlane : in Math.Planes.CPlane) return float is
   begin
      return Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.fGet_Planal_Error (xCurrentRelativePlane : in Math.Planes.CPlane; xWantedRelativePlane : in Math.Planes.CPlane) return float");
         return 0.0;
   end fGet_Planal_Error;

   function xGet_Planal_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      xRotationAxis : Math.Vectors.CVector;
      fControlValueScaling : float;
   begin

      fControlValueScaling := this.pxPlanalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue;
      xRotationAxis := this.pxCurrentToWantedPlaneRotation.xGet_Axis_Vector;

      return (Navigation.Thrusters.XRotation => xRotationAxis.fGet_X * fControlValueScaling,
              Navigation.Thrusters.YRotation => xRotationAxis.fGet_Y * fControlValueScaling,
              others => 0.0);
   end xGet_Planal_Thruster_Control_Value;

   function xGet_Directional_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
   begin

      return (Navigation.Thrusters.ZRotation => this.pxDirectionalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              others => 0.0);
   end xGet_Directional_Thruster_Control_Value;

   procedure Update_Current_Planal_Error (this : in out COrientationalController) is
      use Math.Matrices;
      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;

      xWantedRelativePlane : Math.Planes.CPlane;
      xCurrentRelativePlane : Math.Planes.CPlane;
      fAngleBetweenPlanesInDegrees : float;

      xNewCurrentToWantedPlaneRotation : Math.Quaternions.CQuaternion;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => Math.Vectors.xCross_Product(xCurrentRelativeOrientation.xGet_X_Vector, xCurrentRelativeOrientation.xGet_Y_Vector),
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;




      fAngleBetweenPlanesInDegrees := Math.Angles.fRadians_To_Degrees(Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane));
      xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                   fAngleInDegrees => fAngleBetweenPlanesInDegrees);


      this.pxCurrentToWantedPlaneRotation.Copy_From(xSourceQuaternion => xNewCurrentToWantedPlaneRotation);

      this.pxPlanalMotionComponent.Update_Current_Error(fGet_Planal_Error(xCurrentRelativePlane, xWantedRelativePlane));
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Planal_Error (this : in out COrientationalController)");

   end Update_Current_Planal_Error;

   procedure Update_Current_Directional_Error (this : in COrientationalController) is
      use Math.Matrices;
      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentDirectionVectorOnWantedPlane : Math.Vectors.CVector;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;

      xCurrentDirectionVectorOnWantedPlane := Math.Matrices.xCreate_From_Quaternion(this.pxCurrentToWantedPlaneRotation) * xCurrentRelativeOrientation.xGet_X_Vector;

      this.pxDirectionalMotionComponent.Update_Current_Error(fGet_Directional_Error(xCurrentDirectionVectorOnWantedPlane, xWantedRelativeOrientation.xGet_X_Vector));
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Directional_Error (this : in COrientationalController)");
   end Update_Current_Directional_Error;

   procedure Free(pxOrientationalControllerToDeallocate : in out pCOrientationalController) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(COrientationalController, pCOrientationalController);
   begin
      Dealloc(pxOrientationalControllerToDeallocate);
   end Free;

   procedure Finalize(this : in out COrientationalController) is
      use Navigation.Motion_Component;
      use Math.Quaternions;
   begin
      if this.pxPlanalMotionComponent /= null then
         Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxPlanalMotionComponent);
      end if;
      if this.pxDirectionalMotionComponent /= null then
         Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxDirectionalMotionComponent);
      end if;
      if this.pxCurrentToWantedPlaneRotation /= null then
         Math.Quaternions.Free(pxQuaternionToDeallocate => this.pxCurrentToWantedPlaneRotation);
      end if;
   end Finalize;

end Navigation.Orientational_Controller;
