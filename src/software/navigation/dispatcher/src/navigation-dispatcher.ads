with Navigation.Orientational_Controller;
with Navigation.Positional_Controller;
with Navigation.Thruster_Configurator;
with Navigation.Motion_Component;
with Math.Vectors;
with Navigation.PID_Controller;
with Math.Matrices;
with Navigation.Thrusters;

package Navigation.Dispatcher is

   type CDispatcher is tagged private;
   type pCDispatcher is access CDispatcher;

   function pxCreate return pCDispatcher;


   function tfGet_Thruster_Values(this : in CDispatcher; fDeltaTime : in float) return Navigation.Thrusters.TThrusterValuesArray;


   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings);

   procedure Update_Current_Absolute_Position(this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.pCVector);
   procedure Update_Wanted_Absolute_Position(this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.pCVector);

   procedure Update_Current_Absolute_Orientation(this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix);
   procedure Update_Wanted_Absolute_Orientation(this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.pCMatrix);

   --borde hålla motorkonfigurationen

private

   procedure Insert_Values_Into_Matrix(tfValues : in Navigation.Thrusters.TThrusterEffects; tfThrusterEffectsMatrix : in out Navigation.Thrusters.TThrusterEffectsMatrix);
   procedure Get_Thruster_Values(tfThrusterEffectsMatrix : in Navigation.Thrusters.TThrusterEffectsMatrix; tfThrusterValues : in out Navigation.Thrusters.TThrusterValuesArray);
   procedure Scale_Thruster_Values (tfThrusterValues : in out Navigation.Thrusters.TThrusterValuesArray);
   function bThruster_Values_Need_Scaling (tfThrusterValues : in Navigation.Thrusters.TThrusterValuesArray) return boolean;
   type CDispatcher is tagged
      record

         pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;

         pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

         pxPositionalController : Navigation.Positional_Controller.pCPositionalController;

         pxCurrentAbsolutePosition : Math.Vectors.pCVector;
         pxWantedAbsolutePosition : Math.Vectors.pCVector;

         pxCurrentAbsoluteOrientation : Math.Matrices.pCMatrix;
         pxWantedAbsoluteOrientation : Math.Matrices.pCMatrix;
      end record;

end Navigation.Dispatcher;
