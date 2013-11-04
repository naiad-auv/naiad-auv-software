with Ada.Unchecked_Deallocation;

package body Simulator.Pid_Errors is

   -------------------
   -- Update_Errors --
   -------------------


   procedure Update_Current_Drift_Errors(this : in out simulator.Pid_Errors.CPidErrors; xWantedAbsolutePosition : math.Vectors.CVector; xCurrentAbsolutePosition : math.Vectors.CVector; xVelocityVector : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeDriftVelocityVector : Math.Vectors.CVector;
      xAbsoluteDirectionVector : Math.Vectors.CVector;
      xAbsoluteVelocityVector : Math.Vectors.CVector;
      xAbsoluteDriftVelocityVector : Math.Vectors.CVector;
      fDriftComponent : float;
   begin
      xAbsoluteDirectionVector := Math.Vectors.CVector(xWantedAbsolutePosition - xCurrentAbsolutePosition);
      if abs(xAbsoluteDirectionVector.fLength_Squared) /= 0.0 then
         xAbsoluteDirectionVector := xAbsoluteDirectionVector.xGet_Normalized;
      end if;

      xAbsoluteVelocityVector := xCurrentAbsolutePosition;

      fDriftComponent := Math.Vectors.fDot_Product(xAbsoluteVelocityVector, xAbsoluteDirectionVector);

      xAbsoluteDriftVelocityVector := xAbsoluteVelocityVector - (xAbsoluteDirectionVector * fDriftComponent);
      xRelativeDriftVelocityVector := xCurrentAbsoluteOrientationInverse * xAbsoluteDriftVelocityVector;

      this.tfPIDErrors(DriftX) := xRelativeDriftVelocityVector.fGet_X;
      this.tfPIDErrors(DriftY) := xRelativeDriftVelocityVector.fGet_Y;
      this.tfPIDErrors(DriftZ) := xRelativeDriftVelocityVector.fGet_Z;

   end Update_Current_Drift_Errors;



   procedure Update_Current_Orientational_Errors (this : in out simulator.Pid_Errors.CPidErrors ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix ; xWantedAbsoluteOrientation : math.Matrices.CMatrix) is
      use Math.Matrices;

      xWantedRelativeOrientation : Math.Matrices.CMatrix;
      xCurrentRelativeOrientation : Math.Matrices.CMatrix;

      xWantedRelativePlane : Math.Planes.CPlane;
      xCurrentRelativePlane : Math.Planes.CPlane;
      xCurrentDirectionVectorOnWantedPlane : Math.Vectors.CVector;
      fAngleBetweenPlanesInRadians : float;

      xNewCurrentToWantedPlaneRotation : Math.Quaternions.CQuaternion;

   begin
      xCurrentRelativeOrientation := Math.Matrices.xCreate_Identity;
      xWantedRelativeOrientation := xCurrentAbsoluteOrientationInverse * xWantedAbsoluteOrientation;


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => Math.Vectors.xCross_Product(xCurrentRelativeOrientation.xGet_X_Vector, xCurrentRelativeOrientation.xGet_Y_Vector),
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;




      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);


      this.tfPIDErrors(Plane) := fAngleBetweenPlanesInRadians;

      xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                   fAngleInDegrees => math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));

      xCurrentDirectionVectorOnWantedPlane := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentRelativeOrientation.xGet_X_Vector;

      this.tfPIDErrors(Direction) := math.Vectors.fAngle_Between_In_Radians(xCurrentDirectionVectorOnWantedPlane, xWantedRelativeOrientation.xGet_X_Vector);

end Update_Current_Orientational_Errors;






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


   procedure Update_Errors
     (this : in out CPidErrors ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xVelocityVector : math.Vectors.CVector; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix) is


      xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix :=  xCurrentAbsoluteOrientation.xGet_Inverse;
   begin

      Update_Current_Drift_Errors(this                          => this,
                                  xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                  xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                  xVelocityVector                    => xVelocityVector,
                                  xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      Update_Current_Orientational_Errors(this                          => this,
                                          xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse,
                                          xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation);
      Update_Current_Positional_Errors(this                          => this,
                                       xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                       xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                       xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
   end Update_Errors;



   function pxCreate return pCPidErrors is
      pxPidErrors : pCPidErrors;
   begin
      pxPidErrors := new CPidErrors;
      return pxPidErrors;
   end pxCreate;



   procedure Free(pxPidErrors: in out pCPidErrors) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPidErrors, pCPidErrors);
   begin
      Dealloc(pxPidErrors);
   end;


   function fGet_PID_Error_For_Component(this : in CPidErrors; eErrorComponent : in EMotionComponent) return float is

   begin
      return this.tfPIDErrors(eErrorComponent);
   end fGet_PID_Error_For_Component;



end Simulator.Pid_Errors;
