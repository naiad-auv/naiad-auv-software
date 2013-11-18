with Gtkada.Builder;

with Simulator.Model;
with Simulator.ViewModel_Actuators;
with Gtk.Drawing_Area;

package ActuatorsGUILogic is

   xModel : Simulator.Model.pCModel;
   xViewmodel : Simulator.ViewModel_Actuators.pCViewModel_Actuators;

   procedure Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   function bDraw_Motor_Levels (xMotorArea : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean;

end ActuatorsGUILogic;
