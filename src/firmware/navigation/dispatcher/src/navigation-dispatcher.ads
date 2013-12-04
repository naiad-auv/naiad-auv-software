with Navigation.Orientational_Controller;
with Navigation.Positional_Controller;
with Navigation.Thruster_Configurator;
with Navigation.Thrusters;
with Navigation.Motion_Component;
with Navigation.PID_Controller;

with Math.Vectors;
with Math.Matrices;
with Navigation.Globals;


package Navigation.Dispatcher is

   type CDispatcher is private;


   function xCreate return CDispatcher;
   --  <summary>Creates an object of type CDispatcher</summary>

   procedure Get_Thruster_Values(this : in out CDispatcher; fDeltaTime : in float; tfThrusterValues : out Navigation.Thrusters.TThrusterValuesArray);
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

   type CDispatcher is
      record

         xThrusterConfigurator : Navigation.Thruster_Configurator.CThrusterConfigurator;

         xOrientationalController : Navigation.Orientational_Controller.COrientationalController;

         xPositionalController : Navigation.Positional_Controller.CPositionalController;

      end record;

end Navigation.Dispatcher;
