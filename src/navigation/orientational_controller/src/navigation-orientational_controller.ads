with Math.Angles;
with Math.Vectors;
with Math.Planes;
with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Matrices;


package Navigation.Orientational_Controller is

   type COrientationalController is tagged private;
   type pCOrientationalController is access COrientationalController;

   function pxCreate return pCOrientationalController;

   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Motion_Component.TOrientationalControlValues;

   procedure Update_Current_Orientation(this : in out COrientationalController; pxNewCurrentOrientation : Math.Matrices.pCMatrix);
   procedure Update_Wanted_Orientation (this : in out COrientationalController; pxNewWantedOrientation : Math.Matrices.pCMatrix);

   procedure Set_New_PID_Component_Scalings(this : in out COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private

   function fGet_Directional_Error (pxCurrentRelativeDirectionVector : in Math.Vectors.pCVector; pxWantedRelativeDirectionVector : in Math.Vectors.pCVector) return float;
   function fGet_Planal_Error (pxCurrentRelativePlane : in Math.Planes.pCPlane; pxWantedRelativePlane : in Math.Planes.pCPlane) return float;
   type COrientationalController is tagged
      record
         pxCurrentOrientation : Math.Matrices.pCMatrix;
         pxWantedOrientation : Math.Matrices.pCMatrix;

         pxPlanalMotionComponent: Navigation.Motion_Component.pCMotion_Component;
         pxDirectionalMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      end record;
end Navigation.Orientational_Controller;
