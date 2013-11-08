with Ada.Text_IO;

package body Exception_Handling is

   -------------------------
   -- Unhandled_Exception --
   -------------------------

   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Id) is
   begin
      Ada.Text_IO.Put_Line("Unhandled exception: " & sGet_Exception_Name(E));
      Ada.Text_IO.Put_Line("Trace:");

      Print_Msg(1);

      raise UnhandledException;
   end Unhandled_Exception;

   procedure Print_Msg(iIndex : in Positive) is
   begin
      if xUnhandledExceptionMsgList(iIndex).iMessageLength > 0 then
         Ada.Text_IO.Put(iIndex'Img & ": " & xUnhandledExceptionMsgList(iIndex).sMessage);
         Ada.Text_IO.New_Line;
         Print_Msg(iIndex + 1);
      end if;
   end Print_Msg;



   procedure Handled_Exception is
   begin
      for index in xUnhandledExceptionMsgList'Range loop
         xUnhandledExceptionMsgList(index).iMessageLength := 0;
      end loop;
   end Handled_Exception;

   procedure Save_Exception (Message : String := "") is
   begin
      Add_Msg(1, Message);
   end Save_Exception;


   procedure Raise_Exception (E : Ada.Exceptions.Exception_Id; Message : String := "") is
   begin
      Save_Exception(Message);
      Ada.Exceptions.Raise_Exception(E => E);
   end Raise_Exception;


   procedure Add_Msg(iIndex : Positive; Message : String := "") is
   begin
      if xUnhandledExceptionMsgList(iIndex).iMessageLength > 0 then
         Add_Msg(iIndex + 1, Message);
      else
         xUnhandledExceptionMsgList(iIndex).iMessageLength := Message'Length;
         xUnhandledExceptionMsgList(iIndex).sMessage(1 .. Message'Length) := Message;
      end if;
   end Add_Msg;


   function sGet_Exception_Name(E : in Ada.Exceptions.Exception_Id) return String is
      use Ada.Exceptions;
   begin
      for index in txExceptions'Range loop
         if txExceptions(index).ActualException = E then
            return txExceptions(index).sExceptionName;
         end if;
      end loop;
      raise UnknownException;
   end sGet_Exception_Name;

end Exception_Handling;
