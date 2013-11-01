with Gtkada.Builder;
with Gtk;
with Gtk.Drawing_Area;
with Database;

package Simulator_Callbacks is

   pxDatabaseReference : Database.pTDatabase;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Set_Database(pxDatabase : Database.pTDatabase);

   procedure Start_Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Start_Sensor_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Start_Actuator_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Change_Goal(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Change_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end Simulator_Callbacks;
