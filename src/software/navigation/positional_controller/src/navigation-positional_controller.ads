with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Vectors;
with Math.Matrices;
with Navigation.Thrusters;

package Navigation.Positional_Controller is

   type CPositionalController is tagged private;
   type pCPositionalController is access CPositionalController;

   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix) return pCPositionalController;

   function xGet_Positional_Thruster_Control_Values(this : in out CPositionalController; fDeltaTime : float) return Navigation.Thrusters.TThrusterEffects;

   procedure Update_Current_Errors (this : in CPositionalController);


   procedure Set_New_PID_Component_Scalings(this : in out CPositionalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private
   type CPositionalController is tagged
      record

         pxWantedAbsolutePosition : Math.Vectors.pCVector;
         pxCurrentAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;

         pxXMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxYMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxZMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      end record;

end Navigation.Positional_Controller;
