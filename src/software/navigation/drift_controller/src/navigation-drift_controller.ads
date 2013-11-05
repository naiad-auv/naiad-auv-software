with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Vectors;
with Math.Matrices;
with Navigation.Thrusters;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Exception_Handling;

package Navigation.Drift_Controller is

   type CDriftController is new Ada.Finalization.Controlled with private;
   type pCDriftController is access CDriftController;

   procedure Free(pxDriftControllerToDeallocate : in out pCDriftController);

   function pxCreate (pxCurrentAbsolutePosition : in Math.Vectors.pCVector; pxWantedAbsolutePosition : in Math.Vectors.pCVector; pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCDriftController;
   --  <summary>Creates an object of type CPositionalController and sets references to the current and wanted position</summary>
   --  <parameter name="pxCurrentAbsoluteOrientation">A reference to the current absolute position</parameter>
   --  <parameter name="pxWantedAbsoluteOrientation">A reference to the wanted absolute position</parameter>

   procedure Get_Positional_Thruster_Control_Values(this : in out CDriftController; fDeltaTime : float; xDriftControllerControlValues : out Navigation.Thrusters.TThrusterEffects);
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The CPositionalController to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   procedure Update_Current_Errors (this : in CDriftController; fDeltaTime : float);
   --  <summary>Cascades the difference between the current orientation and the wanted orientation to all motion components</summary>
   --  <parameter name="this">The CPositionalController object that holds the objects that needs to be updated</parameter>

   procedure Set_New_PID_Component_Scalings(this : in out CDriftController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on a PID controller held by the CPositionalController in question</summary>
   --  <parameter name="this">The CPositionalController object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

private
   type CDriftController is new Ada.Finalization.Controlled with
      record

         pxWantedAbsolutePosition : Math.Vectors.pCVector;
         pxCurrentAbsolutePosition : Math.Vectors.pCVector;
         pxLastAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxCurrentAbsoluteOrientationInverse : Math.Matrices.pCMatrix;

         pxXDriftMotionComponent : Navigation.Motion_Component.pCMotionComponent;
         pxYDriftMotionComponent : Navigation.Motion_Component.pCMotionComponent;
         pxZDriftMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      end record;

   procedure Finalize(this : in out CDriftController);

end Navigation.Drift_Controller;
