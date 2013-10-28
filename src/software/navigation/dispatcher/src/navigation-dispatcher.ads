with Navigation.Orientational_Controller;
with Navigation.Positional_Controller;
with Navigation.Thruster_Configurator;
with Navigation.Motion_Component;
with Math.Vectors;
with Navigation.PID_Controller;
with Math.Matrices;
with Navigation.Thrusters;
with System;
with Ada.Text_IO;
with System.Address_Image;
with System.Pool_Local;
with Math.Angles;
with Navigation.Drift_Controller;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Exception_Handling;

package Navigation.Dispatcher is

   type CDispatcher is new Ada.Finalization.Controlled with private;
   type pCDispatcher is access CDispatcher;

   procedure Free(pxDispatcherToDeallocate : in out pCDispatcher);


   function pxCreate return pCDispatcher;
   --  <summary>Creates an object of type CDispatcher</summary>

   function tfGet_Thruster_Values(this : in CDispatcher; fDeltaTime : in float) return Navigation.Thrusters.TThrusterValuesArray;
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The CDispatcher to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>


   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on the CPIDcontroller in question</summary>
   --  <parameter name="this">The CDispatcher object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

   procedure Update_Current_Absolute_Position(this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector);
    --  <summary>Updates the current absolute position.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewCurrentAbsolutePosition">The new absolute position to set.</parameter>


   procedure Update_Wanted_Absolute_Position(this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector);
   --  <summary>Updates the wanted absolute position.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewWantedAbsolutePosition">The new absolute position to set.</parameter>

   procedure Update_Current_Absolute_Orientation(this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.CMatrix);
   --  <summary>Updates the current absolute orientation.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewCurrentAbsoluteOrientation">The new absolute orientation to set.</parameter>

   procedure Update_Wanted_Absolute_Orientation(this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.CMatrix);
   --  <summary>Updates the wanted absolute orientation.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewWantedAbsoluteOrientation">The new absolute orientation to set.</parameter>


private

   procedure Scale_Thruster_Values (tfThrusterValues : in out Navigation.Thrusters.TThrusterValuesArray);
   function bThruster_Values_Need_Scaling (tfThrusterValues : in Navigation.Thrusters.TThrusterValuesArray) return boolean;
   type CDispatcher is new Ada.Finalization.Controlled with
      record

         pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;

         pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

         pxPositionalController : Navigation.Positional_Controller.pCPositionalController;

         pxDriftController : Navigation.Drift_Controller.pCDriftController;

         pxCurrentAbsolutePosition : Math.Vectors.pCVector;
         pxWantedAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxWantedAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxCurrentAbsoluteOrientationInverse : Math.Matrices.pCMatrix;
      end record;

   procedure Finalize (this : in out CDispatcher);

end Navigation.Dispatcher;
