pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__bbb_can_main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__bbb_can_main.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E062 : Short_Integer; pragma Import (Ada, E062, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__tags_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__streams_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "interfaces__c_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "system__exceptions_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__finalization_root_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "ada__finalization_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__storage_pools_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__finalization_masters_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__storage_pools__subpools_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__calendar_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "ada__calendar__delays_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "system__pool_global_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "gnat__serial_communications_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__secondary_stack_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "bbb_can_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "uartwrapper_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E094 := E094 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "uartwrapper__finalize_spec");
      begin
         F1;
      end;
      E058 := E058 - 1;
      E082 := E082 - 1;
      E078 := E078 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__serial_communications__finalize_spec");
      begin
         F2;
      end;
      E090 := E090 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__pool_global__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__storage_pools__subpools__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__finalization_masters__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E031 := E031 + 1;
      System.Finalization_Root'Elab_Spec;
      E076 := E076 + 1;
      Ada.Finalization'Elab_Spec;
      E074 := E074 + 1;
      System.Storage_Pools'Elab_Spec;
      E072 := E072 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E098 := E098 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E096 := E096 + 1;
      System.Pool_Global'Elab_Spec;
      E090 := E090 + 1;
      Gnat.Serial_Communications'Elab_Spec;
      E078 := E078 + 1;
      System.Finalization_Masters'Elab_Body;
      E082 := E082 + 1;
      E070 := E070 + 1;
      Ada.Tags'Elab_Body;
      E007 := E007 + 1;
      System.Soft_Links'Elab_Body;
      E015 := E015 + 1;
      System.Os_Lib'Elab_Body;
      E062 := E062 + 1;
      System.Secondary_Stack'Elab_Body;
      E019 := E019 + 1;
      E058 := E058 + 1;
      Uartwrapper'Elab_Spec;
      E094 := E094 + 1;
      E005 := E005 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_bbb_can_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/bbb_can_main.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/BeagleBoneBlack/UartWrapper/obj/uartwrapper.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/bbb_can.o
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/bbb_can/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/BeagleBoneBlack/UartWrapper/obj/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
