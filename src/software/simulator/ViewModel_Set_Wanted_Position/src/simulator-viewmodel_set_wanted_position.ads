with simulator.Model;
with math.Matrices;
with Exception_Handling;
with ada.Unchecked_Deallocation;
with math.Vectors;
with math.Angles;


package simulator.Viewmodel_Set_Wanted_Position is

   type CViewmodel_Set_Wanted_Position is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCViewmodel_Set_Wanted_Position is access CViewmodel_Set_Wanted_Position;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewmodel_Set_Wanted_Position;
   procedure Free(pxViewmodel_Set_Wanted_Position : in out pCViewmodel_Set_Wanted_Position);

   procedure Set_Wanted_Position_And_Orientation(this : in CViewmodel_Set_Wanted_Position; fPositionX : float ;  fPositionY : float ; fPositionZ : float ; fOrientationR : float ;fOrientationP : float ;fOrientationY : float);

private
   type CViewmodel_Set_Wanted_Position is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;

end simulator.Viewmodel_Set_Wanted_Position;
