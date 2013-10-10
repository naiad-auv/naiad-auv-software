

package body Navigation.Orientational_Controller is


   function pxCreate return pCOrientationalController is
      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

   begin

      pxOrientationalController := new Navigation.Orientational_Controller.COrientationalController;

      pxOrientationalController.pxCurrentOrientation := Math.Matrices.pxCreate_Identity;

      pxOrientationalController.pxWantedOrientation := Math.Matrices.pxCreate_Identity;

      pxOrientationalController.pxPlanalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Plane,
                                                                                                xPID_Scalings => (0.0,0.0,0.0));

      pxOrientationalController.pxDirectionalMotionComponent := Navigation.Motion_Component.pxCreate(eAxisIndex    => Navigation.Motion_Component.Direction,
                                                                                                     xPID_Scalings => (0.0,0.0,0.0));

      return pxOrientationalController;
   end pxCreate;

   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Motion_Component.TOrientationalControlValues is
      use Math.Matrices;
      pxWantedRelativeOrientation : Math.Matrices.pCMatrix;
      pxCurrentRelativeOrientation : Math.Matrices.pCMatrix;

      pxWantedRelativeDirectionVector : Math.Vectors.pCVector;
      pxCurrentRelativeDirectionVector : Math.Vectors.pCVector;
      pxCurrentDirectionVectorOnWantedPlane : Math.Vectors.pCVector;

      pxWantedRelativePlane : Math.Planes.pCPlane;
      pxCurrentRelativePlane : Math.Planes.pCPlane;

      tfNewOrientationalControlValues : Navigation.Motion_Component.TOrientationalControlValues;
   begin

      pxCurrentRelativeOrientation := Math.Matrices.pxCreate_Identity;

      pxWantedRelativeOrientation := this.pxCurrentOrientation.pxGet_Inverse * this.pxWantedOrientation;

      -- for plane
      pxCurrentRelativePlane := Math.Planes.pxCreate(pxNormalVector      => Math.Vectors.pxCross_Product(Math.Vectors.pxCreate(0.0,1.0,0.0), Math.Vectors.pxCreate(0.0,0.0,1.0)),
                                                     fDistanceFromOrigin => 0.0);
      pxWantedRelativePlane := pxWantedRelativeOrientation * pxCurrentRelativePlane;
      this.pxDirectionalMotionComponent.Update_Current_Error(fGet_Planal_Error(pxCurrentRelativePlane, pxWantedRelativePlane));
      tfNewOrientationalControlValues(Navigation.Motion_Component.Plane) := this.pxPlanalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime);

      -- for direction
      pxCurrentRelativeDirectionVector := pxCurrentRelativeOrientation * Math.Vectors.pxCreate(fX => 1.0,
                                                                                               fY => 0.0,
                                                                                               fZ => 0.0);
      pxWantedRelativeDirectionVector := pxWantedRelativeOrientation * pxCurrentRelativeDirectionVector;
--      pxCurrentDirectionVectorOnWantedPlane := pxWantedRelativePlane.pxProject_Vector_Onto(pxCurrentRelativeVector);

--      this.pxDirectionalMotionComponent.Update_Current_Error(fGet_Directional_Error(pxCurrentDirectionVectorOnWantedPlane, pxWantedRelativeDirectionVector));
      tfNewOrientationalControlValues(Navigation.Motion_Component.Direction) := this.pxDirectionalMotionComponent.xGet_New_Component_Control_Value(fDeltaTime);




      return tfNewOrientationalControlValues;
   end xGet_Orientational_Thruster_Control_Values;


   procedure Update_Current_Orientation (this : in out COrientationalController; pxNewCurrentOrientation : Math.Matrices.pCMatrix) is
   begin
      this.pxCurrentOrientation := pxNewCurrentOrientation.pxGet_Copy;

   end Update_Current_Orientation;

   procedure Update_Wanted_Orientation (this : in out COrientationalController; pxNewWantedOrientation : Math.Matrices.pCMatrix) is
   begin
      this.pxWantedOrientation := pxNewWantedOrientation.pxGet_Copy;

   end Update_Wanted_Orientation;


   procedure Set_New_PID_Component_Scalings(this : in out COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
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
      return Math.Vectors.fAngle_Between(pxWantedRelativeDirectionVector, pxCurrentRelativeDirectionVector);
   end fGet_Directional_Error;

   function fGet_Planal_Error (pxCurrentRelativePlane : in Math.Planes.pCPlane; pxWantedRelativePlane : in Math.Planes.pCPlane) return float is
   begin
      return Math.Angles.fDegrees_To_Radians(Math.Planes.fAngle_Between_In_Degrees(pxCurrentRelativePlane, pxWantedRelativePlane));
   end fGet_Planal_Error;

end Navigation.Orientational_Controller;
