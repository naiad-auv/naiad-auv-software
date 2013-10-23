pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is
   pragma Warnings (Off);


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2012 (20120509)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#d878d93d#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#459a3aac#;
   pragma Export (C, u00002, "alohaB");
   u00003 : constant Version_32 := 16#c2d65e80#;
   pragma Export (C, u00003, "alohaS");
   u00004 : constant Version_32 := 16#1abf334e#;
   pragma Export (C, u00004, "circular_bufferB");
   u00005 : constant Version_32 := 16#f631b16b#;
   pragma Export (C, u00005, "circular_bufferS");
   u00006 : constant Version_32 := 16#332b9772#;
   pragma Export (C, u00006, "avrS");
   u00007 : constant Version_32 := 16#a3cd32b3#;
   pragma Export (C, u00007, "avr__at90can128S");
   u00008 : constant Version_32 := 16#c6276048#;
   pragma Export (C, u00008, "interfacesS");
   u00009 : constant Version_32 := 16#ba728cd0#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#d093d0a6#;
   pragma Export (C, u00010, "system__unsigned_typesS");
   u00011 : constant Version_32 := 16#c8037c48#;
   pragma Export (C, u00011, "avr__at90can128__clockB");
   u00012 : constant Version_32 := 16#c59adceb#;
   pragma Export (C, u00012, "avr__at90can128__clockS");
   u00013 : constant Version_32 := 16#417b669e#;
   pragma Export (C, u00013, "avr__at90can128__interruptB");
   u00014 : constant Version_32 := 16#0f51c395#;
   pragma Export (C, u00014, "avr__at90can128__interruptS");
   u00015 : constant Version_32 := 16#b5c9f71e#;
   pragma Export (C, u00015, "system__machine_codeS");
   --  BEGIN ELABORATION ORDER
   --  interfaces%s
   --  system%s
   --  system.machine_code%s
   --  system.unsigned_types%s
   --  avr%s
   --  avr.at90can128%s
   --  avr.at90can128.clock%s
   --  aloha%s
   --  main%b
   --  avr.at90can128.interrupt%s
   --  avr.at90can128.interrupt%b
   --  avr.at90can128.clock%b
   --  circular_buffer%s
   --  circular_buffer%b
   --  aloha%b
   --  END ELABORATION ORDER


end ada_main;
