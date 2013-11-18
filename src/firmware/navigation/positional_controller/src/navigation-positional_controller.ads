with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Navigation.Thrusters;

with Math.Vectors;
with Math.Matrices;

package Navigation.Positional_Controller is

   type CPositionalController is tagged private;

   function xCreate (pxCurrentAbsolutePosition : access Math.Vectors.CVector; pxWantedAbsolutePosition : access Math.Vectors.CVector; pxCurrentAbsoluteOrientation : access Math.Matrices.CMatrix; pxCurrentAbsoluteOrientationInverse : access Math.Matrices.CMatrix) return CPositionalController;
   --  <summary>Creates an object of type CPositionalController and sets references to the current and wanted position</summary>
   --  <parameter name="pxCurrentAbsoluteOrientation">A reference to the current absolute position</parameter>
   --  <parameter name="pxWantedAbsoluteOrientation">A reference to the wanted absolute position</parameter>

   procedure Get_Positional_Thruster_Control_Values(this : in out CPositionalController; fDeltaTime : float; tfValues : out Navigation.Thrusters.TThrusterEffects);
   --  <summary>Calculates thruster control values for all thrusters and scales them accordingly</summary>
   --  <parameter name="this">The CPositionalController to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   procedure Update_Current_Errors (this : in out CPositionalController);
   --  <summary>Cascades the difference between the current orientation and the wanted orientation to all motion components</summary>
   --  <parameter name="this">The CPositionalController object that holds the objects that needs to be updated</parameter>

   procedure Set_New_PID_Component_Scalings(this : in out CPositionalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);
   --  <summary>Sets new component scalings on a PID controller held by the CPositionalController in question</summary>
   --  <parameter name="this">The CPositionalController object that holds the PID controller to update.</parameter>
   --  <parameter name="xNewPIDSCalings">The TPIDComponetScalings object to set for the object.</parameter>
   --  <parameter name="eComponentToChange">The index of the component to change.</parameter>

private
   type CPositionalController is tagged
      record

         pxWantedAbsolutePosition : access Math.Vectors.CVector;
         pxCurrentAbsolutePosition : access Math.Vectors.CVector;

         pxCurrentAbsoluteOrientation : access Math.Matrices.CMatrix;
         pxCurrentAbsoluteOrientationInverse : access Math.Matrices.CMatrix;

         xXMotionComponent : Navigation.Motion_Component.CMotionComponent;
         xYMotionComponent : Navigation.Motion_Component.CMotionComponent;
         xZMotionComponent : Navigation.Motion_Component.CMotionComponent;
      end record;

end Navigation.Positional_Controller;
