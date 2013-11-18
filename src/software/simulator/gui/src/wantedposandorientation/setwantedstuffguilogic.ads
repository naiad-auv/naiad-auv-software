with Gtkada.Builder;
with Simulator.Model;
with Simulator.Viewmodel_Set_Wanted_Position;

package SetWantedStuffGUILogic is

   xViewModel : Simulator.ViewModel_Set_Wanted_Position.pCViewmodel_Set_Wanted_Position;

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

private
   function fTry_Get_Float_From_Text_Box(sValueToConvert : string) return float;

end SetWantedStuffGUILogic;
