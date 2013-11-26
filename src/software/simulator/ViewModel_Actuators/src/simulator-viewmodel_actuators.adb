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

end Simulator.ViewModel_Actuators;
