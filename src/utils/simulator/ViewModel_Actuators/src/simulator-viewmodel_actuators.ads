with simulator;
with simulator.Model;
package Simulator.ViewModel_Actuators is

   type CViewModel_Actuators is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCViewModel_Actuators is access CViewModel_Actuators;

   type iMotorIndex is new simulator.Model.iMotorIndex;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Actuators;
   procedure Free(pxViewModel_Actuators : in out pCViewModel_Actuators);

   function fGet_Motor_Force(this : in CViewModel_Actuators; iIndexMotor  : iMotorIndex) return float;


private
   type CViewModel_Actuators is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;

end Simulator.ViewModel_Actuators;
