with simulator.Model;
with math.Matrices;
with Exception_Handling;
with ada.Unchecked_Deallocation;
with math.Vectors;
with math.Angles;

package simulator.ViewModel_Wanted_Pos is

   type CViewModel_Wanted_Pos is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCViewModel_Wanted_Pos is access CViewModel_Wanted_Pos;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Wanted_Pos;
   procedure Free(pxViewmodel_Wanted_Pos : in out pCViewModel_Wanted_Pos);

   procedure Set_Wanted_Position_And_Orientation(this : in CViewModel_Wanted_Pos; fPositionX : float ;  fPositionY : float ; fPositionZ : float ; fRotationX : float ;fRotationY : float ;fRotationZ : float);

private
   type CViewModel_Wanted_Pos is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;

end simulator.ViewModel_Wanted_Pos;
