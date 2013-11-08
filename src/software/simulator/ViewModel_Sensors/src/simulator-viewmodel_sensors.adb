with Exception_Handling;
with ada.Unchecked_Deallocation;
package body simulator.ViewModel_Sensors is

   --------------
   -- pxCreate --
   --------------

   function pxCreate
     (pxModel : Simulator.Model.pCModel)
      return pCViewModel_Sensors
   is
      pxNewViewModel : pCViewModel_Sensors;

   begin
      pxNewViewModel := new CViewModel_Sensors;
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

   procedure Free (pxViewModel_Sensors : in out pCViewModel_Sensors) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel_Sensors, pCViewModel_Sensors);
   begin
      Dealloc(pxViewModel_Sensors);
   end Free;

end simulator.ViewModel_Sensors;
