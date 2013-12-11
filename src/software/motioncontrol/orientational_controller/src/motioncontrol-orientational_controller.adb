with Exception_Handling;

package body MotionControl.Orientational_Controller is


   function pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCOrientationalController is
      pxOrientationalController : MotionControl.Orientational_Controller.pCOrientationalController;
      use System;
   begin

      pxOrientationalController := new MotionControl.Orientational_Controller.COrientationalController;


      pxOrientationalController.pxCurrentAbsoluteOrientation := pxCurrentAbsoluteOrientation;
      pxOrientationalController.pxWantedAbsoluteOrientation := pxWantedAbsoluteOrientation;
      pxOrientationalController.pxCurrentAbsoluteOrientationInverse := pxCurrentAbsoluteOrientationInverse;

      pxOrientationalController.pxXRotMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.RotationX,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      pxOrientationalController.pxYRotMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.RotationY,
                                                                                                xPIDScalings => (0.0,0.0,0.0));
      pxOrientationalController.pxZRotMotionComponent := MotionControl.Motion_Component.pxCreate(eAxisIndex    => MotionControl.Motion_Component.RotationZ,
                                                                                                xPIDScalings => (0.0,0.0,0.0));

      --Ada.Text_IO.Put_Line("CAO: " & System.Address_Image(pxOrientationalController.pxCurrentAbsoluteOrientation.all'Address));
      --Ada.Text_IO.Put_Line("WAO: " & System.Address_Image(pxOrientationalController.pxWantedAbsoluteOrientation.all'Address));
      pxOrientationalController.fSavedDeltaTime := 0.0;
      return pxOrientationalController;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Orientational_Controller.pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCOrientationalController");
         return pxOrientationalController;
   end pxCreate;

   procedure Update_Current_Errors (this : in out COrientationalController) is
   begin
      this.Update_Current_X_Rotation_Error;
      this.Update_Current_Y_Rotation_Error;
      this.Update_Current_Z_Rotation_Error;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Orientational_Controller.Update_Current_Errors (this : in out COrientationalController)");
   end Update_Current_Errors;



   procedure Get_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float; tfValues : out MotionControl.Thrusters.TThrusterEffects) is
      use MotionControl.Thrusters;
      fSavedDT : float;
   begin

      if abs(this.fCurrentXRotationError) = Ada.Numerics.Pi or
      abs(this.fCurrentXRotationError) = Ada.Numerics.Pi or
      abs(this.fCurrentXRotationError) = Ada.Numerics.Pi then
         this.fSavedDeltaTime := fDeltaTime;
         tfValues := (others => 0.0);
      else
         fSavedDT := this.fSavedDeltaTime;
         this.fSavedDeltaTime := 0.0;
         -- TODO: fix for 180 degree error fuck-up (already done in firmware)
         tfValues := this.xGet_X_Rotation_Thruster_Control_Value(fDeltaTime + fSavedDT) +
           this.xGet_Y_Rotation_Thruster_Control_Value(fDeltaTime + fSavedDT) +
           this.xGet_Z_Rotation_Thruster_Control_Value(fDeltaTime + fSavedDT);
      end if;
   end Get_Orientational_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in COrientationalController; eComponentToUpdate : MotionControl.Motion_Component.EMotionComponent; xNewPIDScaling : MotionControl.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToUpdate is
      when MotionControl.Motion_Component.RotationX =>
           this.pxXRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when MotionControl.Motion_Component.RotationY =>
           this.pxYRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when MotionControl.Motion_Component.RotationZ =>
           this.pxZRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when MotionControl.Motion_Component.AllComponents =>
           this.pxXRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
           this.pxYRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
           this.pxZRotMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
      when others =>
         null;
      end case;
   end Set_New_PID_Component_Scalings;



   function xGet_X_Rotation_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return MotionControl.Thrusters.TThrusterEffects is
   begin
      return (MotionControl.Thrusters.XRotation => this.pxXRotMotionComponent.fGet_New_Component_Control_Value(fDeltaTime),
              others => 0.0);
   end xGet_X_Rotation_Thruster_Control_Value;

   function xGet_Y_Rotation_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return MotionControl.Thrusters.TThrusterEffects is
   begin
      return (MotionControl.Thrusters.YRotation => this.pxYRotMotionComponent.fGet_New_Component_Control_Value(fDeltaTime),
              others => 0.0);
   end xGet_Y_Rotation_Thruster_Control_Value;


   function xGet_Z_Rotation_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return MotionControl.Thrusters.TThrusterEffects is
   begin
      return (MotionControl.Thrusters.ZRotation => this.pxZRotMotionComponent.fGet_New_Component_Control_Value(fDeltaTime),
              others => 0.0);
   end xGet_Z_Rotation_Thruster_Control_Value;

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


      this.fCurrentZRotationError := fError;
     --this.fZRotError := fError;
      this.pxZRotMotionComponent.Update_Current_Error(fError);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Orientational_Controller.Update_Current_Z_Rotation_Error (this : in COrientationalController)");

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

      this.fCurrentYRotationError := fError;
      --this.fYRotError := fError;
      this.pxYRotMotionComponent.Update_Current_Error(fError);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Orientational_Controller.Update_Current_Y_Rotation_Error (this : in COrientationalController)");

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

      this.fCurrentXRotationError := fError;
      --this.fXRotError := fError;
      this.pxXRotMotionComponent.Update_Current_Error(fError);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Orientational_Controller.Update_Current_X_Rotation_Error (this : in COrientationalController)");

   end Update_Current_X_Rotation_Error;



   procedure Free(pxOrientationalControllerToDeallocate : in out pCOrientationalController) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(COrientationalController, pCOrientationalController);
   begin
      Dealloc(pxOrientationalControllerToDeallocate);
   end Free;

   procedure Finalize(this : in out COrientationalController) is
      use MotionControl.Motion_Component;
      use Math.Quaternions;
   begin
      if this.pxXRotMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxXRotMotionComponent);
      end if;
      if this.pxYRotMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxYRotMotionComponent);
      end if;
      if this.pxZRotMotionComponent /= null then
         MotionControl.Motion_Component.Free(pxMotionComponentToDeallocate => this.pxZRotMotionComponent);
      end if;
   end Finalize;

   function fGetCurrentErrors(this : in COrientationalController) return TOrientationalErrors is
   begin
      return TOrientationalErrors'(MotionControl.Motion_Component.RotationX => this.pxXRotMotionComponent.fGetCurrentError,
                                   MotionControl.Motion_Component.RotationY => this.pxYRotMotionComponent.fGetCurrentError,
                                   MotionControl.Motion_Component.RotationZ => this.pxZRotMotionComponent.fGetCurrentError);
   end fGetCurrentErrors;

end MotionControl.Orientational_Controller;
