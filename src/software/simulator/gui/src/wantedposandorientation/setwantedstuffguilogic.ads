with Gtkada.Builder;
with Simulator.Model;
with Simulator.ViewModel_Wanted_Pos;

package SetWantedStuffGUILogic is

   xViewModel : Simulator.ViewModel_Wanted_Pos.pCViewModel_Wanted_Pos;

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end SetWantedStuffGUILogic;
