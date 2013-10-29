with Ada.Text_IO;
with GNAT.Traceback;
with GNAT.Traceback.Symbolic;
--with Ada.Exceptions.Traceback;

package body Exception_Handling is

   -------------------------
   -- Unhandled_Exception --
   -------------------------

   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Occurrence) is
      Trace  : GNAT.Traceback.Tracebacks_Array (1 .. 1_000);
      Length : Natural;
   begin
      Ada.Text_IO.Put_Line("Unhandled exception: " & Ada.Exceptions.Exception_Name(E));
      Ada.Text_IO.Put_Line("Message:");
      --Trace := Ada.Exceptions.Traceback.Tracebacks(E);
      GNAT.Traceback.Call_Chain (Trace, Length);
      Ada.Text_IO.Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (Trace (1..Length)));

      Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Message(E));
      raise UnhandledException;
   end Unhandled_Exception;

end Exception_Handling;
