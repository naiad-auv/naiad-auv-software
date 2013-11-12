with Ada.Unchecked_Deallocation;
with Exception_Handling;

package body Simulator.Pid_Errors is

   -------------------------------------
   -- Update_Current_Z_Rotation_Error --
   -------------------------------------

 procedure Update_Current_Z_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) is
      use Math.Matrices;
      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;

      xWantedRelativePlane : Math.Planes.CPlane;
      xCurrentRelativePlane : Math.Planes.CPlane;
      fAngleBetweenPlanesInRadians : float;

      xNewCurrentToWantedPlaneRotation : Math.Quaternions.CQuaternion;

      xCurrentXVector : Math.Vectors.CVector;
      xWantedXVector : Math.Vectors.CVector;

      fError : float := 0.0;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xCurrentXVector := xCurrentRelativeOrientation.xGet_X_Vector;

      xWantedRelativeOrientation := xCurrentAbsoluteOrientationInverse * xWantedAbsoluteOrientation;
      xWantedXVector := xWantedRelativeOrientation.xGet_X_Vector;


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => xCurrentRelativeOrientation.xGet_Z_Vector,
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentXVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentXVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentXVector, xWantedXVector);

      if Math.Vectors.fDot_Product(xWantedXVector, Math.Vectors.xCross_Product(xCurrentXVector, xWantedRelativePlane.xGet_Normal_Vector)) < 0.0 then
         fError := fError * (-1.0);
      end if;
      this.tfPIDErrors(EMotionComponent(RotationZ)) := fError;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Z_Rotation_Error (this : in COrientationalController)");

   end Update_Current_Z_Rotation_Error;

   -------------------------------------
   -- Update_Current_Y_Rotation_Error --
   -------------------------------------

 procedure Update_Current_Y_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) is
      use Math.Matrices;
      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;

      xWantedRelativePlane : Math.Planes.CPlane;
      xCurrentRelativePlane : Math.Planes.CPlane;
      fAngleBetweenPlanesInRadians : float;

      xNewCurrentToWantedPlaneRotation : Math.Quaternions.CQuaternion;

      xCurrentZVector : Math.Vectors.CVector;
      xWantedZVector : Math.Vectors.CVector;

      fError : float := 0.0;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xCurrentZVector := xCurrentRelativeOrientation.xGet_Z_Vector;

      xWantedRelativeOrientation := xCurrentAbsoluteOrientationInverse * xWantedAbsoluteOrientation;
      xWantedZVector := xWantedRelativeOrientation.xGet_Z_Vector;


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => xCurrentRelativeOrientation.xGet_Y_Vector,
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentZVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentZVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentZVector, xWantedZVector);

      if Math.Vectors.fDot_Product(xWantedZVector, Math.Vectors.xCross_Product(xCurrentZVector, xWantedRelativePlane.xGet_Normal_Vector)) < 0.0 then
         fError := fError * (-1.0);
      end if;

      this.tfPIDErrors(EMotionComponent(RotationY)) := fError;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Y_Rotation_Error (this : in COrientationalController)");

   end Update_Current_Y_Rotation_Error;

   -------------------------------------
   -- Update_Current_X_Rotation_Error --
   -------------------------------------

 procedure Update_Current_X_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) is
      use Math.Matrices;
      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;

      xWantedRelativePlane : Math.Planes.CPlane;
      xCurrentRelativePlane : Math.Planes.CPlane;
      fAngleBetweenPlanesInRadians : float;

      xNewCurrentToWantedPlaneRotation : Math.Quaternions.CQuaternion;

      xCurrentYVector : Math.Vectors.CVector;
      xWantedYVector : Math.Vectors.CVector;

      fError : float := 0.0;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xCurrentYVector := xCurrentRelativeOrientation.xGet_Y_Vector;

      xWantedRelativeOrientation := xCurrentAbsoluteOrientationInverse * xWantedAbsoluteOrientation;
      xWantedYVector := xWantedRelativeOrientation.xGet_Y_Vector;


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => xCurrentRelativeOrientation.xGet_X_Vector,
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentYVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentYVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentYVector, xWantedYVector);

      if Math.Vectors.fDot_Product(xWantedYVector, Math.Vectors.xCross_Product(xCurrentYVector, xWantedRelativePlane.xGet_Normal_Vector)) < 0.0 then
         fError := fError * (-1.0);
      end if;

      this.tfPIDErrors(EMotionComponent(RotationX)) := fError;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_X_Rotation_Error (this : in COrientationalController)");

   end Update_Current_X_Rotation_Error;


   --------------------------------------
   -- Update_Current_Positional_Errors --
   --------------------------------------

   procedure Update_Current_Positional_Errors (this : in out simulator.Pid_Errors.CPidErrors ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsolutePosition : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeWantedPositionVector : Math.Vectors.CVector;
      xAbsoluteDifferenceVector : Math.Vectors.CVector;
   begin
      xAbsoluteDifferenceVector := xWantedAbsolutePosition - xCurrentAbsolutePosition;
      xRelativeWantedPositionVector := xCurrentAbsoluteOrientationInverse * xAbsoluteDifferenceVector;

      this.tfPIDErrors(X) := xRelativeWantedPositionVector.fGet_X;
      this.tfPIDErrors(Y) := xRelativeWantedPositionVector.fGet_Y;
      this.tfPIDErrors(Z) := xRelativeWantedPositionVector.fGet_Z;

   end Update_Current_Positional_Errors;

   -------------------
   -- Update_Errors --
   -------------------

   procedure Update_Errors
     (this : in out CPidErrors ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xVelocityVector : math.Vectors.CVector; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix) is


      xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix :=  xCurrentAbsoluteOrientation.xGet_Inverse;
   begin

--      Update_Current_Drift_Errors(this                          => this,
--                                  xWantedAbsolutePosition            => xWantedAbsolutePosition,
--                                  xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
--                                  xVelocityVector                    => xVelocityVector,
--                                  xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      Update_Current_Z_Rotation_Error(this                               => this,
                                      xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                      xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      Update_Current_Y_Rotation_Error(this                               => this,
                                      xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                      xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      Update_Current_X_Rotation_Error(this                               => this,
                                      xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                      xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      Update_Current_Positional_Errors(this                          => this,
                                       xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                       xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                       xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
   end Update_Errors;

   --------------
   -- pxCreate --
   --------------

   function pxCreate return pCPidErrors is
      pxPidErrors : pCPidErrors;
   begin
      pxPidErrors := new CPidErrors;
      return pxPidErrors;
   end pxCreate;

   ----------
   -- Free --
   ----------

   procedure Free(pxPidErrors: in out pCPidErrors) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPidErrors, pCPidErrors);
   begin
      Dealloc(pxPidErrors);
   end;

   ----------------------------------
   -- fGet_PID_Error_For_Component --
   ----------------------------------

   function fGet_PID_Error_For_Component(this : in CPidErrors; eErrorComponent : in EMotionComponent) return float is

   begin
      return this.tfPIDErrors(eErrorComponent);
   end fGet_PID_Error_For_Component;



end Simulator.Pid_Errors;
