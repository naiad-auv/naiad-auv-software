pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

package body ada_main is
   pragma Warnings (Off);

   E12 : Short_Integer; pragma Import (Ada, E12, "avr__at90can128__clock_E");
   E03 : Short_Integer; pragma Import (Ada, E03, "aloha_E");
   E14 : Short_Integer; pragma Import (Ada, E14, "avr__at90can128__interrupt_E");
   E05 : Short_Integer; pragma Import (Ada, E05, "circular_buffer_E");

   Is_Elaborated : Boolean := False;

   procedure adainit is
   begin
      null;

      E14 := E14 + 1;
      AVR.AT90CAN128.CLOCK'ELAB_BODY;
      E12 := E12 + 1;
      E05 := E05 + 1;
      Aloha'Elab_Body;
      E03 := E03 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\avr.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\avr-at90can128.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\main.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\avr-at90can128-interrupt.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\avr-at90can128-clock.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\circular_buffer.o
   --   C:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\aloha.o
   --   -LC:\Users\KKND\Desktop\naiad-auv-software\src\firmware\underwater_communication\build\
   --   -LC:/GNAT/2012/lib/gcc/avr/4.5.4/rts-zfp/adalib\
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
