package body Navigation.Orientational_Controller is


   function xCreate (pxCurrentAbsoluteOrientation : access Math.Matrices.CMatrix; pxWantedAbsoluteOrientation : access Math.Matrices.CMatrix; pxCurrentAbsoluteOrientationInverse : access Math.Matrices.CMatrix) return COrientationalController is
      xOrientationalController : Navigation.Orientational_Controller.COrientationalController;
   begin

      xOrientationalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      xOrientationalController.pxWantedAbsoluteOrientation := pxWantedAbsoluteOrientation;
      xOrientationalController.pxCurrentAbsoluteOrientationInverse := pxCurrentAbsoluteOrientationInverse;

      xOrientationalController.xXRotMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.RotationX,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      xOrientationalController.xYRotMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.RotationY,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      xOrientationalController.xZRotMotionComponent := Navigation.Motion_Component.xCreate(eAxisIndex    => Navigation.Motion_Component.RotationZ,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      return xOrientationalController;
   end xCreate;

   procedure Update_Current_Errors (this : in out COrientationalController) is
   begin
      this.Update_Current_X_Rotation_Error;
      this.Update_Current_Y_Rotation_Error;
      this.Update_Current_Z_Rotation_Error;
   end Update_Current_Errors;



   procedure Get_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float; tfValues : out Navigation.Thrusters.TThrusterEffects) is
      fRotationX : float;
      fRotationY : float;
      fRotationZ : float;
   begin
      this.Get_X_Rotation_Thruster_Control_Value(fDeltaTime    => fDeltaTime,
                                                 fControlValue => fRotationX);
      this.Get_Y_Rotation_Thruster_Control_Value(fDeltaTime    => fDeltaTime,
                                                 fControlValue => fRotationY);
      this.Get_Z_Rotation_Thruster_Control_Value(fDeltaTime    => fDeltaTime,
                                                 fControlValue => fRotationZ);

      tfValues := (Navigation.Thrusters.XRotation => fRotationX,
                   Navigation.Thrusters.YRotation => fRotationY,
                   Navigation.Thrusters.ZRotation => fRotationZ,
                   others => 0.0);
   end Get_Orientational_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in out COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
      when Navigation.Motion_Component.RotationX =>
           this.xXRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when Navigation.Motion_Component.RotationY =>
           this.xYRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when Navigation.Motion_Component.RotationZ =>
           this.xZRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when Navigation.Motion_Component.AllComponents =>
           this.xXRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
           this.xYRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
           this.xZRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when others =>
         null;
      end case;
   end Set_New_PID_Component_Scalings;



   procedure Get_X_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      this.xXRotMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                                fControlValue => fControlValue);
   end Get_X_Rotation_Thruster_Control_Value;

   procedure Get_Y_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      this.xYRotMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                                fControlValue => fControlValue);
   end Get_Y_Rotation_Thruster_Control_Value;


   procedure Get_Z_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      this.xZRotMotionComponent.Get_New_Component_Control_Value(fDeltaTime    => fDeltaTime,
                                                                fControlValue => fControlValue);
   end Get_Z_Rotation_Thruster_Control_Value;

   procedure Update_Current_Z_Rotation_Error (this : in out COrientationalController) is
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

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
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

      if Math.Vectors.fDot_Product(xWantedXVector, Math.Vectors.xCross_Product(xCurrentXVector, xWantedRelativePlane.xGet_Normal_Vector)) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.xZRotMotionComponent.Update_Current_Error(fError);
   end Update_Current_Z_Rotation_Error;

   procedure Update_Current_Y_Rotation_Error (this : in out COrientationalController) is
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

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
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

      if Math.Vectors.fDot_Product(xWantedZVector, Math.Vectors.xCross_Product(xCurrentZVector, xWantedRelativePlane.xGet_Normal_Vector)) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.xYRotMotionComponent.Update_Current_Error(fError);
   end Update_Current_Y_Rotation_Error;


   procedure Update_Current_X_Rotation_Error (this : in out COrientationalController) is
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

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
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

      if Math.Vectors.fDot_Product(xWantedYVector, Math.Vectors.xCross_Product(xCurrentYVector, xWantedRelativePlane.xGet_Normal_Vector)) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.xXRotMotionComponent.Update_Current_Error(fError);
   end Update_Current_X_Rotation_Error;


end Navigation.Orientational_Controller;
