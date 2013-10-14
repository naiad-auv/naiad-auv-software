

package body Navigation.Orientational_Controller is


   function pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix) return pCOrientationalController is
      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

   begin

      pxOrientationalController := new Navigation.Orientational_Controller.COrientationalController;

      pxOrientationalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      pxOrientationalController.pxWantedAbsoluteOrientation := pxWantedAbsoluteOrientation;

      pxOrientationalController.pxPlanalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Plane,
                                                                                                xPID_Scalings => (0.0,0.0,0.0));
      pxOrientationalController.pxDirectionalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Direction,
                                                                                                     xPID_Scalings => (0.0,0.0,0.0));

      return pxOrientationalController;
   end pxCreate;

   procedure Update_Current_Errors (this : in out COrientationalController) is
   begin
      this.Update_Current_Planal_Error;
      this.Update_Current_Directional_Error;
   end Update_Current_Errors;



   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      use Navigation.Thrusters;
   begin
      return this.xGet_Planal_Thruster_Control_Value(fDeltaTime) + this.xGet_Directional_Thruster_Control_Value(fDeltaTime);
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


   function fGet_Directional_Error (pxCurrentRelativeDirectionVector : in Math.Vectors.pCVector; pxWantedRelativeDirectionVector : in Math.Vectors.pCVector) return float is
   begin
      return Math.Vectors.fAngle_Between_In_Radians(pxWantedRelativeDirectionVector, pxCurrentRelativeDirectionVector);
   end fGet_Directional_Error;

   function fGet_Planal_Error (pxCurrentRelativePlane : in Math.Planes.pCPlane; pxWantedRelativePlane : in Math.Planes.pCPlane) return float is
   begin
      return Math.Angles.fDegrees_To_Radians(Math.Planes.fAngle_Between_In_Degrees(pxCurrentRelativePlane, pxWantedRelativePlane));
   end fGet_Planal_Error;

   function xGet_Planal_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      pxRotationAxis : Math.Vectors.pCVector;
      fControlValueScaling : float;
   begin
      fControlValueScaling := this.pxPlanalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue;
      pxRotationAxis := this.pxCurrentToWantedPlaneRotation.fGet_Axis_Vector;
      return (Navigation.Thrusters.XRotation => pxRotationAxis.fGet_X * fControlValueScaling,
              Navigation.Thrusters.YRotation => pxRotationAxis.fGet_Y * fControlValueScaling,
              others => 0.0);
   end xGet_Planal_Thruster_Control_Value;

   function xGet_Directional_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
   begin
      return (Navigation.Thrusters.ZRotation => this.pxDirectionalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime).fValue,
              others => 0.0);
   end xGet_Directional_Thruster_Control_Value;

   procedure Update_Current_Planal_Error (this : in out COrientationalController) is
      use Math.Matrices;
      pxWantedRelativeOrientation : Math.Matrices.pCMatrix;
      pxCurrentRelativeOrientation : Math.Matrices.pCMatrix;

      pxWantedRelativePlane : Math.Planes.pCPlane;
      pxCurrentRelativePlane : Math.Planes.pCPlane;

   begin
      pxCurrentRelativeOrientation := Math.Matrices.pxCreate_Identity;
      pxWantedRelativeOrientation := this.pxCurrentAbsoluteOrientation.pxGet_Inverse * this.pxWantedAbsoluteOrientation;

      pxCurrentRelativePlane := Math.Planes.pxCreate(pxNormalVector      => Math.Vectors.pxCross_Product(pxCurrentRelativeOrientation.pxGet_Y_Vector, pxCurrentRelativeOrientation.pxGet_Z_Vector),
                                                     fDistanceFromOrigin => 0.0);
      pxWantedRelativePlane := pxWantedRelativeOrientation * pxCurrentRelativePlane;


      this.pxCurrentToWantedPlaneRotation := Math.Quaternions.pxCreate(pxAxisVector => Math.Planes.pxGet_Intersection_Vector_Between(pxCurrentRelativePlane, pxWantedRelativePlane),
                                                                       fAngleInDegrees => Math.Planes.fAngle_Between_In_Degrees(pxCurrentRelativePlane, pxWantedRelativePlane));


      this.pxPlanalMotionComponent.Update_Current_Error(fGet_Planal_Error(pxCurrentRelativePlane, pxWantedRelativePlane));
   end Update_Current_Planal_Error;

   procedure Update_Current_Directional_Error (this : in COrientationalController) is
      use Math.Matrices;
      pxWantedRelativeOrientation : Math.Matrices.pCMatrix;
      pxCurrentRelativeOrientation : Math.Matrices.pCMatrix;
      pxCurrentDirectionVectorOnWantedPlane : Math.Vectors.pCVector;

   begin
      pxCurrentRelativeOrientation := Math.Matrices.pxCreate_Identity;
      pxWantedRelativeOrientation := this.pxCurrentAbsoluteOrientation.pxGet_Inverse * this.pxWantedAbsoluteOrientation;

      pxCurrentDirectionVectorOnWantedPlane := Math.Matrices.pxCreate_From_Quaternion(this.pxCurrentToWantedPlaneRotation) * pxCurrentRelativeOrientation.pxGet_X_Vector;
      this.pxDirectionalMotionComponent.Update_Current_Error(fGet_Directional_Error(pxCurrentDirectionVectorOnWantedPlane, pxWantedRelativeOrientation.pxGet_X_Vector));
   end Update_Current_Directional_Error;




end Navigation.Orientational_Controller;
