with simulator;
with simulator.Model;

package simulator.ViewModel_Sensors is

   type CViewModel_Sensors is tagged private;
   type pCViewModel_Sensors is access CViewModel_Sensors;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Sensors;
   procedure Free(pxViewModel_Sensors : in out pCViewModel_Sensors);

private
   type CViewModel_Sensors is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;

end simulator.ViewModel_Sensors;
