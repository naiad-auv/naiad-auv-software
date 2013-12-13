with Ada.Unchecked_Deallocation;
with Exception_Handling;
package body Simulator.ViewModel_Actuators is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Actuators is
   pxNewViewModel : pCViewModel_Actuators;
   begin
      pxNewViewModel := new CViewModel_Actuators;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;
   end pxCreate;

   ----------
   -- Free --
   ----------

   procedure Free (pxViewModel_Actuators : in out pCViewModel_Actuators) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel_Actuators, pCViewModel_Actuators);
   begin
      Dealloc(pxViewModel_Actuators);
   end Free;

   ----------------------
   -- fGet_Motor_Force --
   ----------------------

   function fGet_Motor_Force (this : in CViewModel_Actuators; iIndexMotor  : iMotorIndex) return float
   is
   begin
      return this.pxModel.fGet_Motor_Force(simulator.Model.iMotorIndex(iIndexMotor));
   end fGet_Motor_Force;

   ------------------------------
   -- bGet_Left_Gripper_Status --
   ------------------------------

   function bGet_Left_Gripper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Left_Gripper_Status;
   end bGet_Left_Gripper_Status;

   -------------------------------
   -- bGet_Right_Gripper_Status --
   -------------------------------

   function bGet_Right_Gripper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Right_Gripper_Status;
   end bGet_Right_Gripper_Status;

   -----------------------------
   -- bGet_Left_Torpedo_Satus --
   -----------------------------

   function bGet_Left_Torpedo_Satus(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Left_Torpedo_Satus;
   end bGet_Left_Torpedo_Satus;

   -------------------------------
   -- bGet_Right_Torpedo_Status --
   -------------------------------

   function bGet_Right_Torpedo_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Right_Torpedo_Status;
   end bGet_Right_Torpedo_Status;

   -----------------------------
   -- bGet_Left_Dropper_Satus --
   -----------------------------

   function bGet_Left_Dropper_Satus(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Left_Dropper_Satus;
   end bGet_Left_Dropper_Satus;

   -------------------------------
   -- bGet_Right_Dropper_Status --
   -------------------------------

   function bGet_Right_Dropper_Status(this : in CViewModel_Actuators; iIndexMotor : iMotorIndex) return boolean is
   begin
      return this.pxModel.bGet_Right_Dropper_Status;
   end bGet_Right_Dropper_Status;


end Simulator.ViewModel_Actuators;
