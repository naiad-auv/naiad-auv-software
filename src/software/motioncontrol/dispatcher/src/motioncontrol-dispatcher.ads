with MotionControl.Orientational_Controller;
with MotionControl.Positional_Controller;
with MotionControl.Thruster_Configurator;
with MotionControl.Motion_Component;
with Math.Vectors;
with MotionControl.PID_Controller;
with Math.Matrices;
with MotionControl.Thrusters;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Exception_Handling;
with MotionControl;

-- for tests
with System;
with Math.Angles;


package MotionControl.Dispatcher is

   type CDispatcher is new Ada.Finalization.Controlled with private;
   type pCDispatcher is access CDispatcher;

   type TMotionalErrors is array (MotionControl.Motion_Component.PositionX .. MotionControl.Motion_Component.RotationZ) of float;

   procedure Free(pxDispatcherToDeallocate : in out pCDispatcher);


   function pxCreate return pCDispatcher;
   --  <summary>Creates an object of type CDispatcher</summary>

   procedure Get_Thruster_Values(this : in CDispatcher; fDeltaTime : in float; tfValues : out MotionControl.Thrusters.TThrusterValuesArray);
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The CDispatcher to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>


   procedure Set_New_Component_PID_Scalings(this : in CDispatcher; eComponentToChange : MotionControl.Motion_Component.EMotionComponent;xNewPIDSCalings : in MotionControl.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on the CPIDcontroller in question</summary>
   --  <parameter name="this">The CDispatcher object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

   procedure Update_Current_Absolute_Position(this : in CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector);
    --  <summary>Updates the current absolute position.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewCurrentAbsolutePosition">The new absolute position to set.</parameter>


   procedure Update_Wanted_Absolute_Position(this : in CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector);
   --  <summary>Updates the wanted absolute position.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewWantedAbsolutePosition">The new absolute position to set.</parameter>

   procedure Update_Current_Absolute_Orientation(this : in CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.CMatrix);
   --  <summary>Updates the current absolute orientation.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewCurrentAbsoluteOrientation">The new absolute orientation to set.</parameter>

   procedure Update_Wanted_Absolute_Orientation(this : in CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.CMatrix);
   --  <summary>Updates the wanted absolute orientation.</summary>
   --  <parameter name="this">The CDispatcher to update.</parameter>
   --  <parameter name="xNewWantedAbsoluteOrientation">The new absolute orientation to set.</parameter>

   function fGetMotionalErrors(this : in CDispatcher) return TMotionalErrors;

   procedure Simulational_Reset(this : in CDispatcher);

private

   procedure Scale_Thruster_Values (tfThrusterValues : in out MotionControl.Thrusters.TThrusterValuesArray);
   function bThruster_Values_Need_Scaling (tfThrusterValues : in MotionControl.Thrusters.TThrusterValuesArray) return boolean;
   type CDispatcher is new Ada.Finalization.Controlled with
      record

         pxThrusterConfigurator : MotionControl.Thruster_Configurator.pCThrusterConfigurator;

         pxOrientationalController : MotionControl.Orientational_Controller.pCOrientationalController;

         pxPositionalController : MotionControl.Positional_Controller.pCPositionalController;

         pxCurrentAbsolutePosition : Math.Vectors.pCVector;
         pxWantedAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxWantedAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxCurrentAbsoluteOrientationInverse : Math.Matrices.pCMatrix;
      end record;

   procedure Finalize (this : in out CDispatcher);

end MotionControl.Dispatcher;
