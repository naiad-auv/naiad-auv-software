with Math.Angles;
with Math.Vectors;
with Math.Planes;
with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Matrices;
with Math.Quaternions;
with Navigation.Thrusters;
with System;
with Ada.Text_IO;
with System.Address_Image;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package Navigation.Orientational_Controller is

   type COrientationalController is new Ada.Finalization.Controlled with private;
   type pCOrientationalController is access COrientationalController;

   procedure Free(pxOrientationalControllerToDeallocate : in out pCOrientationalController);

   function pxCreate (pxCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix; pxWantedAbsoluteOrientation : in Math.Matrices.pCMatrix; pxCurrentAbsoluteOrientationInverse : in Math.Matrices.pCMatrix) return pCOrientationalController;
   --  <summary>Creates an object of type COrientationalController and sets references to the current and wanted orientation</summary>
   --  <parameter name="pxCurrentAbsoluteOrientation">A reference to the current absolute orientation</parameter>
   --  <parameter name="pxWantedAbsoluteOrientation">A reference to the wanted absolute orientation</parameter>

   function xGet_Orientational_Thruster_Control_Values (this : in out COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The COrientationalController to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>


   procedure Update_Current_Errors (this : in out COrientationalController);
   --  <summary>Cascades the difference between the current orientation and the wanted orientation to all motion components</summary>
   --  <parameter name="this">The COrientationalController object that holds the objects that needs to be updated</parameter>

   procedure Set_New_PID_Component_Scalings(this : in COrientationalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on a PID controller held by the COrientationalController in question</summary>
   --  <parameter name="this">The COrientationalController object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

private

   procedure Update_Current_Planal_Error (this : in out COrientationalController);
   procedure Update_Current_Directional_Error (this : in COrientationalController);

   function fGet_Directional_Error (xCurrentRelativeDirectionVector : in Math.Vectors.CVector; xWantedRelativeDirectionVector : in Math.Vectors.CVector) return float;
   function fGet_Planal_Error (xCurrentRelativePlane : in Math.Planes.CPlane; xWantedRelativePlane : in Math.Planes.CPlane) return float;

   function xGet_Planal_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;
   function xGet_Directional_Thruster_Control_Value (this : in COrientationalController; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects;

   type COrientationalController is new Ada.Finalization.Controlled with
      record
         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxWantedAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxCurrentAbsoluteOrientationInverse : Math.Matrices.pCMatrix;

         pxPlanalMotionComponent: Navigation.Motion_Component.pCMotionComponent;
         pxDirectionalMotionComponent : Navigation.Motion_Component.pCMotionComponent;

         pxCurrentToWantedPlaneRotation : Math.Quaternions.pCQuaternion;
      end record;

   procedure Finalize(this : in out COrientationalController);
end Navigation.Orientational_Controller;
