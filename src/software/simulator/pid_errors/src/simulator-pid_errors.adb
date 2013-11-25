with Ada.Unchecked_Deallocation;
with Exception_Handling;
with Ada.Numerics;

package body Simulator.Pid_Errors is


   -----------------------------------------
   -- fCalculate_Current_Z_Rotation_Error --
   -----------------------------------------


 function fCalculate_Current_Z_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float is
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
      return fError*180.0/ada.Numerics.Pi;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Z_Rotation_Error (this : in COrientationalController)");
         return -1.0;

   end fCalculate_Current_Z_Rotation_Error;

   -----------------------------------------
   -- fCalculate_Current_Y_Rotation_Error --
   -----------------------------------------

 function fCalculate_Current_Y_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float is
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
      return fError*180.0/ada.Numerics.Pi;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_Y_Rotation_Error (this : in COrientationalController)");
         return -1.0;

   end fCalculate_Current_Y_Rotation_Error;

   -----------------------------------------
   -- fCalculate_Current_X_Rotation_Error --
   -----------------------------------------

 function fCalculate_Current_X_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float is
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
      return fError*180.0/ada.Numerics.Pi;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Navigation.Orientational_Controller.Update_Current_X_Rotation_Error (this : in COrientationalController)");
         return -1.0;

   end fCalculate_Current_X_Rotation_Error;


   --------------------------------------
   -- Update_Current_Positional_Errors --
   --------------------------------------

   function fCalculate_Current_Positional_Errors (ePositionComponent : EmotionComponentPosition; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsolutePosition : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float is
      use Math.Vectors;
      use Math.Matrices;

      xRelativeWantedPositionVector : Math.Vectors.CVector;
      xAbsoluteDifferenceVector : Math.Vectors.CVector;
   begin
      xAbsoluteDifferenceVector := xWantedAbsolutePosition - xCurrentAbsolutePosition;
      xRelativeWantedPositionVector := xCurrentAbsoluteOrientationInverse * xAbsoluteDifferenceVector;

      case ePositionComponent is
         when PositionX =>
            return xRelativeWantedPositionVector.fGet_X;
         when PositionY =>
            return xRelativeWantedPositionVector.fGet_Y;
         when PositionZ =>
            return xRelativeWantedPositionVector.fGet_Z;
      end case;

   end fCalculate_Current_Positional_Errors;

   -------------------
   -- Update_Errors --
   -------------------

   function fCalculate_Error_Component (eErrorComponent : EMotionComponentPosAndOrientation ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix) return float is


      xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix :=  xCurrentAbsoluteOrientation.xGet_Inverse;
   begin

      case eErrorComponent is
         when PositionX =>
            return fCalculate_Current_Positional_Errors(ePositionComponent                 => PositionX,
                                                        xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                                        xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                                        xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
         when PositionY =>
            return fCalculate_Current_Positional_Errors(ePositionComponent                 => PositionY,
                                                        xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                                        xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                                        xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
         when PositionZ =>
            return fCalculate_Current_Positional_Errors(ePositionComponent                 => PositionZ,
                                                        xWantedAbsolutePosition            => xWantedAbsolutePosition,
                                                        xCurrentAbsolutePosition           => xCurrentAbsolutePosition,
                                                        xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
         when RotationX =>
            return fCalculate_Current_X_Rotation_Error(xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                                       xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
         when RotationY =>
            return fCalculate_Current_Y_Rotation_Error(xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                                       xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
         when RotationZ =>
            return fCalculate_Current_Z_Rotation_Error(xWantedAbsoluteOrientation         => xWantedAbsoluteOrientation,
                                                       xCurrentAbsoluteOrientationInverse => xCurrentAbsoluteOrientationInverse);
      end case;

   end fCalculate_Error_Component;


end Simulator.Pid_Errors;
