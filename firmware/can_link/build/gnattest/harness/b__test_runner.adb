pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E171 : Short_Integer; pragma Import (Ada, E171, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__io_exceptions_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "ada__strings_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada__strings__maps_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "ada__strings__maps__constants_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__tags_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__streams_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "interfaces__c_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "interfaces__c__strings_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__exceptions_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__finalization_root_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__finalization_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "system__storage_pools_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__finalization_masters_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__storage_pools__subpools_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "ada__calendar_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "gnat__directory_operations_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "system__pool_global_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__file_control_block_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "system__file_io_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__object_reader_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__dwarf_lines_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__secondary_stack_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "ada__strings__unbounded_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "system__regexp_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "gnat__command_line_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "ada__text_io_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "aunit__memory__utils_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "aunit__tests_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "aunit__test_filters_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "aunit__time_measure_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "aunit__test_results_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "aunit__assertions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "aunit__reporter__gnattest_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "aunit__simple_test_cases_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "aunit__test_fixtures_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "aunit__test_caller_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "aunit__test_suites_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "aunit__run_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "avr__at90can128_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "avr__at90can128__calendar_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "avr__at90can128__calendar__test_data_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "avr__at90can128__can_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "avr__at90can128__can__test_data_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "avr__at90can128__usart_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "avr__at90can128__usart__test_data_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "can_link_pack_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "can_link_pack__test_data_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "avr__at90can128__calendar__test_data__tests_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "avr__at90can128__calendar__test_data__tests__suite_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "avr__at90can128__can__test_data__tests_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "avr__at90can128__can__test_data__tests__suite_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "avr__at90can128__usart__test_data__tests_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "avr__at90can128__usart__test_data__tests__suite_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "can_link_pack__test_data__tests_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "can_link_pack__test_data__tests__suite_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "gnattest_main_suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "can_link_pack__test_data__tests__suite__finalize_body");
      begin
         E232 := E232 - 1;
         F1;
      end;
      E230 := E230 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "can_link_pack__test_data__tests__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "avr__at90can128__usart__test_data__tests__suite__finalize_body");
      begin
         E223 := E223 - 1;
         F3;
      end;
      E221 := E221 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "avr__at90can128__usart__test_data__tests__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "avr__at90can128__can__test_data__tests__suite__finalize_body");
      begin
         E215 := E215 - 1;
         F5;
      end;
      E213 := E213 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "avr__at90can128__can__test_data__tests__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "avr__at90can128__calendar__test_data__tests__suite__finalize_body");
      begin
         E205 := E205 - 1;
         F7;
      end;
      E203 := E203 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "avr__at90can128__calendar__test_data__tests__finalize_spec");
      begin
         F8;
      end;
      E228 := E228 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "can_link_pack__test_data__finalize_spec");
      begin
         F9;
      end;
      E219 := E219 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "avr__at90can128__usart__test_data__finalize_spec");
      begin
         F10;
      end;
      E211 := E211 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "avr__at90can128__can__test_data__finalize_spec");
      begin
         F11;
      end;
      E199 := E199 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "avr__at90can128__calendar__test_data__finalize_spec");
      begin
         F12;
      end;
      E083 := E083 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "aunit__test_suites__finalize_spec");
      begin
         F13;
      end;
      E201 := E201 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "aunit__test_fixtures__finalize_spec");
      begin
         F14;
      end;
      E086 := E086 - 1;
      E088 := E088 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "aunit__simple_test_cases__finalize_spec");
      begin
         F15;
      end;
      E076 := E076 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "aunit__reporter__gnattest__finalize_spec");
      begin
         F16;
      end;
      E090 := E090 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "aunit__assertions__finalize_spec");
      begin
         F17;
      end;
      E061 := E061 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "aunit__test_results__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aunit__test_filters__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "aunit__tests__finalize_spec");
      begin
         E091 := E091 - 1;
         F20;
      end;
      E164 := E164 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "ada__text_io__finalize_spec");
      begin
         F21;
      end;
      E188 := E188 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "system__regexp__finalize_spec");
      begin
         F22;
      end;
      E160 := E160 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "ada__strings__unbounded__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "system__object_reader__finalize_body");
      begin
         E142 := E142 - 1;
         F24;
      end;
      E093 := E093 - 1;
      E146 := E146 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "system__file_io__finalize_body");
      begin
         E166 := E166 - 1;
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "system__object_reader__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "system__file_control_block__finalize_spec");
      begin
         E174 := E174 - 1;
         F27;
      end;
      E107 := E107 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "system__pool_global__finalize_spec");
      begin
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "system__storage_pools__subpools__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "system__finalization_masters__finalize_spec");
      begin
         F30;
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
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
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
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E151 := E151 + 1;
      Ada.Strings'Elab_Spec;
      E124 := E124 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E158 := E158 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E050 := E050 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E032 := E032 + 1;
      System.Finalization_Root'Elab_Spec;
      E103 := E103 + 1;
      Ada.Finalization'Elab_Spec;
      E101 := E101 + 1;
      System.Storage_Pools'Elab_Spec;
      E105 := E105 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E070 := E070 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E107 := E107 + 1;
      System.File_Control_Block'Elab_Spec;
      E174 := E174 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.File_Io'Elab_Body;
      E166 := E166 + 1;
      E146 := E146 + 1;
      System.Finalization_Masters'Elab_Body;
      E093 := E093 + 1;
      E119 := E119 + 1;
      E072 := E072 + 1;
      Ada.Tags'Elab_Body;
      E052 := E052 + 1;
      E128 := E128 + 1;
      System.Soft_Links'Elab_Body;
      E018 := E018 + 1;
      System.Os_Lib'Elab_Body;
      E171 := E171 + 1;
      System.Secondary_Stack'Elab_Body;
      E022 := E022 + 1;
      System.Dwarf_Lines'Elab_Body;
      E123 := E123 + 1;
      System.Object_Reader'Elab_Body;
      E142 := E142 + 1;
      Gnat.Directory_Operations'Elab_Body;
      E176 := E176 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E160 := E160 + 1;
      System.Regexp'Elab_Spec;
      E188 := E188 + 1;
      Gnat.Command_Line'Elab_Spec;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E164 := E164 + 1;
      Gnat.Command_Line'Elab_Body;
      E155 := E155 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E063 := E063 + 1;
      E066 := E066 + 1;
      Aunit.Tests'Elab_Spec;
      E091 := E091 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E068 := E068 + 1;
      Aunit.Test_Results'Elab_Spec;
      Aunit.Test_Results'Elab_Body;
      E061 := E061 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E090 := E090 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Gnattest'Elab_Spec;
      E076 := E076 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E088 := E088 + 1;
      E086 := E086 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E201 := E201 + 1;
      E207 := E207 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E083 := E083 + 1;
      E081 := E081 + 1;
      AVR.AT90CAN128'ELAB_SPEC;
      E194 := E194 + 1;
      AVR.AT90CAN128.CALENDAR'ELAB_BODY;
      E196 := E196 + 1;
      AVR.AT90CAN128.CALENDAR.TEST_DATA'ELAB_SPEC;
      E199 := E199 + 1;
      E209 := E209 + 1;
      AVR.AT90CAN128.CAN.TEST_DATA'ELAB_SPEC;
      E211 := E211 + 1;
      E217 := E217 + 1;
      AVR.AT90CAN128.USART.TEST_DATA'ELAB_SPEC;
      E219 := E219 + 1;
      E225 := E225 + 1;
      Can_Link_Pack.Test_Data'Elab_Spec;
      E228 := E228 + 1;
      AVR.AT90CAN128.CALENDAR.TEST_DATA.TESTS'ELAB_SPEC;
      E203 := E203 + 1;
      AVR.AT90CAN128.CALENDAR.TEST_DATA.TESTS.SUITE'ELAB_BODY;
      E205 := E205 + 1;
      AVR.AT90CAN128.CAN.TEST_DATA.TESTS'ELAB_SPEC;
      E213 := E213 + 1;
      AVR.AT90CAN128.CAN.TEST_DATA.TESTS.SUITE'ELAB_BODY;
      E215 := E215 + 1;
      AVR.AT90CAN128.USART.TEST_DATA.TESTS'ELAB_SPEC;
      E221 := E221 + 1;
      AVR.AT90CAN128.USART.TEST_DATA.TESTS.SUITE'ELAB_BODY;
      E223 := E223 + 1;
      Can_Link_Pack.Test_Data.Tests'Elab_Spec;
      E230 := E230 + 1;
      Can_Link_Pack.Test_Data.Tests.Suite'Elab_Body;
      E232 := E232 + 1;
      Gnattest_Main_Suite'Elab_Body;
      E192 := E192 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_runner");

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
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/avr.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/avr-at90can128.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/avr-at90can128-calendar.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-calendar-test_data.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/avr-at90can128-can.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-can-test_data.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/avr-at90can128-usart.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-usart-test_data.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/can_link_pack.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/can_link_pack-test_data.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/gnattest_generated.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-calendar-test_data-tests.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-calendar-test_data-tests-suite.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-can-test_data-tests.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-can-test_data-tests-suite.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-usart-test_data-tests.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/avr-at90can128-usart-test_data-tests-suite.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/can_link_pack-test_data-tests.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/can_link_pack-test_data-tests-suite.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/gnattest_main_suite.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/test_runner.o
   --   -L/home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/
   --   -L/home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/gnattest/harness/
   --   -L/usr/gnat/lib/aunit/native-full/
   --   -L/home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/can_link/build/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
