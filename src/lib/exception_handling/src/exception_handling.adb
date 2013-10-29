with Ada.Text_IO;
--with Ada.Exceptions.Traceback;
with Ada.Unchecked_Deallocation;
with GNAT.Traceback;
with GNAT.Traceback.Symbolic;
with Ada.Exceptions;

package body Exception_Handling is

   -------------------------
   -- Unhandled_Exception --
   -------------------------

   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Occurrence) is
   begin
      Ada.Text_IO.Put_Line("Unhandled exception: " & Ada.Exceptions.Exception_Name(E));
      Ada.Text_IO.Put_Line("Trace:");

      if pxUnhandledExceptionMsgList /= null then
         pxUnhandledExceptionMsgList.Print_Msg(1);
      end if;
      Ada.Text_IO.New_Line;
      raise UnhandledException;
   end Unhandled_Exception;

   procedure Print_Msg(this : in CExceptionMsgs; iCount : in integer) is
      sMsg : string (1 .. this.iMessageLength) := this.sMessage(1 .. this.iMessageLength);
   begin
      Ada.Text_IO.Put(integer'Image(iCount) & ": " & sMsg);
      Ada.Text_IO.New_Line;

      if this.pxNextExceptionMsg /= null then
         this.pxNextExceptionMsg.Print_Msg(iCount + 1);
      end if;
   end Print_Msg;



   procedure Handled_Exception is
   begin
      if pxUnhandledExceptionMsgList /= null then
         Exception_Handling.Free(pxUnhandledExceptionMsgList);
      end if;
   end Handled_Exception;


   procedure Reraise_Exception (E : Ada.Exceptions.Exception_Occurrence; Message : String := "") is
      SavedException : Ada.Exceptions.Exception_Occurrence;
   begin
      Save_Exception(Message);
      Ada.Exceptions.Save_Occurrence(Target => SavedException,
                                                       Source => E);
      Ada.Exceptions.Reraise_Occurrence(SavedException);
   end Reraise_Exception;


   procedure Save_Exception (Message : String := "") is
      sMsg : string (1 .. 1_000);
   begin
      sMsg(1 .. Message'Length) := Message;
      if pxUnhandledExceptionMsgList = null then
         pxUnhandledExceptionMsgList := new CExceptionMsgs'(Ada.Finalization.Controlled with
                                                              iMessageLength     => Message'Length,
                                                            sMessage           => sMsg,
                                                            pxNextExceptionMsg => null);
      else
         pxUnhandledExceptionMsgList.Add_Msg(Message);
      end if;
   end Save_Exception;


   procedure Raise_Exception (E : Ada.Exceptions.Exception_Id; Message : String := "") is
   begin
      Save_Exception(Message);
      Ada.Exceptions.Raise_Exception(E => E);
   end Raise_Exception;


   procedure Add_Msg(this : in out CExceptionMsgs; Message : String := "") is
      sMsg : string (1 .. 1_000);
   begin
      if this.pxNextExceptionMsg /= null then
         this.pxNextExceptionMsg.Add_Msg(Message);
      else
         sMsg(1 .. Message'Length) := Message;
         this.pxNextExceptionMsg := new CExceptionMsgs'(Ada.Finalization.Controlled with
                                                          iMessageLength     => Message'Length,
                                                        sMessage           => sMsg,
                                                        pxNextExceptionMsg => null);
      end if;
   end Add_Msg;

   procedure Finalize(this : in out CExceptionMsgs) is
   begin
      if this.pxNextExceptionMsg /= null then
         Exception_Handling.Free(this.pxNextExceptionMsg);
      end if;
   end Finalize;


   procedure Free(pxObjectToDeallocate : in out pCExceptionMsgs) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CExceptionMsgs, pCExceptionMsgs);
   begin
      Dealloc(pxObjectToDeallocate);
   end Free;

end Exception_Handling;
