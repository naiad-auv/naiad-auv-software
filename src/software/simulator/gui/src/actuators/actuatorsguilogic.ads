with Gtkada.Builder;

with Simulator.Model;
with Simulator.ViewModel_Actuators;
with Gtk.Drawing_Area;
with Gtk.Progress_Bar;

package ActuatorsGUILogic is

   type TBuilder is record
      xBuilder : access Gtkada.Builder.Gtkada_Builder_Record'Class;
   end record;

   xModel : Simulator.Model.pCModel;
   xViewmodel : Simulator.ViewModel_Actuators.pCViewModel_Actuators;

   function bSet_Motor_Levels (pxObject : TBuilder) return Boolean;

   procedure Register_Timeout_Handlers(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Set_Thruster_Power(pxObject : TBuilder;thrusterIndex : Simulator.ViewModel_Actuators.iMotorIndex; thrusterPower : float);

   function xGet_Thruster_Bar (pxObject : TBuilder; thrusterIndex : Simulator.ViewModel_Actuators.iMotorIndex) return Gtk.Progress_Bar.Gtk_Progress_Bar;

end ActuatorsGUILogic;
