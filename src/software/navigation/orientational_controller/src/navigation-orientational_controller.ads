with Math.Angles;
with Math.Vectors;
with Math.Planes;
with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Matrices;
with Math.Quaternions;
with Navigation.Thrusters;

package Navigation.Orientational_Controller is

   type COrientationalController is tagged private;
   type pCOrientationalController is access COrientationalController;

   function pxCreate return pCOrientationalController;

   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;

   procedure Update_Current_Absolute_Orientation(this : in out COrientationalController; pxNewCurrentAbsoluteOrientation : Math.Matrices.pCMatrix);
   procedure Update_Wanted_Absolute_Orientation (this : in out COrientationalController; pxNewWantedAbsoluteOrientation : Math.Matrices.pCMatrix);
   procedure Update_Current_Errors (this : in out COrientationalController);

   procedure Set_New_PID_Component_Scalings(this : in COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private

   procedure Update_Current_Planal_Error (this : in out COrientationalController);
   procedure Update_Current_Directional_Error (this : in COrientationalController);

   function fGet_Directional_Error (pxCurrentRelativeDirectionVector : in Math.Vectors.pCVector; pxWantedRelativeDirectionVector : in Math.Vectors.pCVector) return float;
   function fGet_Planal_Error (pxCurrentRelativePlane : in Math.Planes.pCPlane; pxWantedRelativePlane : in Math.Planes.pCPlane) return float;

   function xGet_Planal_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;
   function xGet_Directional_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;

   type COrientationalController is tagged
      record
         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxWantedAbsoluteOrientation : Math.Matrices.pCMatrix;

         pxPlanalMotionComponent: Navigation.Motion_Component.pCMotion_Component;
         pxDirectionalMotionComponent : Navigation.Motion_Component.pCMotion_Component;

         pxCurrentToWantedPlaneRotation : Math.Quaternions.pCQuaternion;
      end record;
end Navigation.Orientational_Controller;
