with Ada.Exceptions;
with Ada.Finalization;

package Exception_Handling is

   type CExceptionMsgs is new Ada.Finalization.Controlled with private;
   type pCExceptionMsgs is access CExceptionMsgs;



   pxUnhandledExceptionMsgList : pCExceptionMsgs;

   procedure Free(pxObjectToDeallocate : in out pCExceptionMsgs);

   UnhandledException : exception;
   --  <summary>Unhandled exception, thrown after logging is performed</summary>

   NullPointer : exception;
   --  <summary>Null pointer exception, thrown by methods with pointers passed as arguments</summary>

   NotUnitQuaternion : exception;
   --  <summary>Not unit quaternion, thrown by operations that needs a unit quaternion to complete</summary>

   SingularMatrix : exception;
   --  <summary>Singular matrix exception, thrown by operations not permitted with a singular matrix. I.e gauss-jordan elimination</summary>

   NoIntersectionBetweenPlanes : exception;
   --  <summary>Parallel planes exception, thrown by operations not permitted with two parallel planes. I.e when trying to find a instersection vector between two planes</summary>

   DivisionByZero : exception;
   --  <summary>Division by zero exception, thrown by functions where the passed divident is 0</summary>

   IndexOutOfBounds : exception;
   --  <summary>Index out of bounds exception, thrown by functions where an index of i.e and array is out of the bounds of the array</summary>

   UnknownMotionComponent : exception;
   --  <summary>Unkown motion component exception, thrown when a user tries to update the PID scalings of an undefined component</summary>

   BufferOverflow : exception;
   --  <summary>Data was written to a buffer that did not have enough free space</summary>

   UnknownException : exception;

   UndefinedPlane : exception;

   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Occurrence);
   --  <summary>Handles the exception E, prints a stacktrace and raises an UnhandledException</summary>
   --  <parameter name="E">The Exception thrown</parameter>

   procedure Handled_Exception;

   procedure Raise_Exception (E : Ada.Exceptions.Exception_Id; Message : String := "");
   procedure Reraise_Exception (E : Ada.Exceptions.Exception_Occurrence; Message : String := "");


private
   type CExceptionMsgs is new Ada.Finalization.Controlled with
      record
         iMessageLength : Natural;
         sMessage : string(1 .. 1_000);
         pxNextExceptionMsg : pCExceptionMsgs;
      end record;

   procedure Finalize(this : in out CExceptionMsgs);

   procedure Add_Msg(this : in out CExceptionMsgs; Message : String := "");
   procedure Print_Msg(this : in CExceptionMsgs; iCount : in integer);
   procedure Save_Exception (Message : String := "");

end Exception_Handling;
