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
      xOrientationalController.fSavedDeltaTime := 0.0;
      return xOrientationalController;
   end xCreate;

   procedure Update_Current_Errors (this : in out COrientationalController) is
   begin
      Update_Current_X_Rotation_Error(this);
      Update_Current_Y_Rotation_Error(this);
      Update_Current_Z_Rotation_Error(this);
   end Update_Current_Errors;



   procedure Get_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float; tfValues : out Navigation.Thrusters.TThrusterEffects) is
      fRotationX : float;
      fRotationY : float;
      fRotationZ : float;
   begin


      if abs(this.fCurrentXRotationError) = Math.Elementary.Pi or
      abs(this.fCurrentXRotationError) = Math.Elementary.Pi or
      abs(this.fCurrentXRotationError) = Math.Elementary.Pi then
      tfValues := (Navigation.Thrusters.XRotation => 0.0,
                   Navigation.Thrusters.YRotation => 0.0,
                   Navigation.Thrusters.ZRotation => 0.0,
                   others => 0.0);
                  this.fSavedDeltaTime := fDeltaTime;
      else
         Get_X_Rotation_Thruster_Control_Value(this          => this,
                                               fDeltaTime    => fDeltaTime + this.fSavedDeltaTime,
                                               fControlValue => fRotationX);
         Get_Y_Rotation_Thruster_Control_Value(this          => this,
                                               fDeltaTime    => fDeltaTime + this.fSavedDeltaTime,
                                               fControlValue => fRotationY);
         Get_Z_Rotation_Thruster_Control_Value(this          => this,
                                               fDeltaTime    => fDeltaTime + this.fSavedDeltaTime,
                                               fControlValue => fRotationZ);
         tfValues := (Navigation.Thrusters.XRotation => fRotationX,
                      Navigation.Thrusters.YRotation => fRotationY,
                      Navigation.Thrusters.ZRotation => fRotationZ,
                      others => 0.0);
         this.fSavedDeltaTime := 0.0;
      end if;

   end Get_Orientational_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in out COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
      when Navigation.Motion_Component.RotationX =>
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xXRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);
      when Navigation.Motion_Component.RotationY =>
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xYRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);
      when Navigation.Motion_Component.RotationZ =>
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xZRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);
      when Navigation.Motion_Component.AllComponents =>
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xXRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xYRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);
         Navigation.Motion_Component.Set_New_PID_Component_Scalings(this         => this.xZRotMotionComponent,
                                                                    xNewScalings => xNewPIDScaling);

      when others =>
         null;
      end case;
   end Set_New_PID_Component_Scalings;



   procedure Get_X_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      Navigation.Motion_Component.Get_New_Component_Control_Value(this          => this.xXRotMotionComponent,
                                                                  fDeltaTime    => fDeltaTime,
                                                                  fControlValue => fControlValue);
   end Get_X_Rotation_Thruster_Control_Value;

   procedure Get_Y_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      Navigation.Motion_Component.Get_New_Component_Control_Value(this          => this.xYRotMotionComponent,
                                                                  fDeltaTime    => fDeltaTime,
                                                                  fControlValue => fControlValue);
   end Get_Y_Rotation_Thruster_Control_Value;


   procedure Get_Z_Rotation_Thruster_Control_Value (this : in out COrientationalController; fDeltaTime : in float; fControlValue : out float) is
   begin
      Navigation.Motion_Component.Get_New_Component_Control_Value(this          => this.xZRotMotionComponent,
                                                                  fDeltaTime    => fDeltaTime,
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
      xCurrentXVector := Math.Matrices.xGet_X_Vector(xCurrentRelativeOrientation);

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
      xWantedXVector := Math.Matrices.xGet_X_Vector(xWantedRelativeOrientation);


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => Math.Matrices.xGet_Z_Vector(xCurrentRelativeOrientation),
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentXVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentXVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentXVector, xWantedXVector);

      if Math.Vectors.fDot_Product(xWantedXVector, Math.Vectors.xCross_Product(xCurrentXVector, Math.Planes.xGet_Normal_Vector(xWantedRelativePlane))) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.fCurrentZRotationError := fError;
      Navigation.Motion_Component.Update_Current_Error(this           => this.xZRotMotionComponent,
                                                       fNewErrorValue => fError);
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
      xCurrentZVector := Math.Matrices.xGet_Z_Vector(xCurrentRelativeOrientation);

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
      xWantedZVector := Math.Matrices.xGet_Z_Vector(xWantedRelativeOrientation);


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => Math.Matrices.xGet_Y_Vector(xCurrentRelativeOrientation),
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentZVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentZVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentZVector, xWantedZVector);

      if Math.Vectors.fDot_Product(xWantedZVector, Math.Vectors.xCross_Product(xCurrentZVector, Math.Planes.xGet_Normal_Vector(xWantedRelativePlane))) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.fCurrentYRotationError := fError;
      Navigation.Motion_Component.Update_Current_Error(this           => this.xYRotMotionComponent,
                                                       fNewErrorValue => fError);
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
      xCurrentYVector := Math.Matrices.xGet_Y_Vector(xCurrentRelativeOrientation);

      xWantedRelativeOrientation := this.pxCurrentAbsoluteOrientationInverse.all * this.pxWantedAbsoluteOrientation.all;
      xWantedYVector := Math.Matrices.xGet_Y_Vector(xWantedRelativeOrientation);


      xCurrentRelativePlane := Math.Planes.xCreate(xNormalVector      => Math.Matrices.xGet_X_Vector(xCurrentRelativeOrientation),
                                                     fDistanceFromOrigin => 0.0);
      xWantedRelativePlane := xWantedRelativeOrientation * xCurrentRelativePlane;



      fAngleBetweenPlanesInRadians := Math.Planes.fAngle_Between_In_Radians(xCurrentRelativePlane, xWantedRelativePlane);

      if abs(fAngleBetweenPlanesInRadians) /= 0.0 then
         xNewCurrentToWantedPlaneRotation := Math.Quaternions.xCreate(xAxisVector => Math.Planes.xGet_Intersection_Vector_Between(xCurrentRelativePlane, xWantedRelativePlane),
                                                                      fAngleInDegrees => Math.Angles.fRadians_To_Degrees(fAngleBetweenPlanesInRadians));
         xCurrentYVector := Math.Matrices.xCreate_From_Quaternion(xNewCurrentToWantedPlaneRotation) * xCurrentYVector;
      end if;

      fError := Math.Vectors.fAngle_Between_In_Radians(xCurrentYVector, xWantedYVector);

      if Math.Vectors.fDot_Product(xWantedYVector, Math.Vectors.xCross_Product(xCurrentYVector, Math.Planes.xGet_Normal_Vector(xWantedRelativePlane))) > 0.0 then
         fError := fError * (-1.0);
      end if;

      this.fCurrentXRotationError := fError;
      Navigation.Motion_Component.Update_Current_Error(this           => this.xXRotMotionComponent,
                                                       fNewErrorValue => fError);
   end Update_Current_X_Rotation_Error;


end Navigation.Orientational_Controller;
