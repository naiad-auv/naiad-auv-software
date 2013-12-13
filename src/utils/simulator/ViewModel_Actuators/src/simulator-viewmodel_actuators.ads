with simulator;
with simulator.Model;
package Simulator.ViewModel_Actuators is

   type CViewModel_Actuators is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCViewModel_Actuators is access CViewModel_Actuators;

   type iMotorIndex is new simulator.Model.iMotorIndex;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Actuators;
   procedure Free(pxViewModel_Actuators : in out pCViewModel_Actuators);

   function fGet_Motor_Force(this : in CViewModel_Actuators; iIndexMotor  : iMotorIndex) return float;

   function bGet_Left_Gripper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;
   function bGet_Right_Gripper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;
   function bGet_Left_Torpedo_Satus(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;
   function bGet_Right_Torpedo_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;
   function bGet_Left_Dropper_Satus(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;
   function bGet_Right_Dropper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean;

private
   type CViewModel_Actuators is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;

end Simulator.ViewModel_Actuators;
