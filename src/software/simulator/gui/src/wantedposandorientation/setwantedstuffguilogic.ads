with Gtkada.Builder;
with Simulator.Model;
with Simulator.Viewmodel_Set_Wanted_Position;

package SetWantedStuffGUILogic is

   xModel : Simulator.Model.pCModel;
   xViewModel : Simulator.ViewModel_Set_Wanted_Position.pCViewmodel_Set_Wanted_Position;

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end SetWantedStuffGUILogic;
