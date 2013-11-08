with Ada.Exceptions;

package Exception_Handling is

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

   type EExceptions is (EUnhandledException, ENullPointer, ENotUnitQuaternion,
                        ESingularMatrix, ENoIntersectionBetweenPlanes, EDivisionByZero,
                        EIndexOutOfBounds, EUnknownMotionComponent, EBufferOverflow,
                        EUnknownException, EUndefinedPlane);

   type TException is
      record
         ActualException : Ada.Exceptions.Exception_Id;
         sExceptionName : string(1 .. 30);
      end record;

   type TExceptionArray is array (EUnhandledException .. EUndefinedPlane) of TException;

   txExceptions : TExceptionArray := (EUnhandledException => TException'(ActualException => UnhandledException'Identity,
                                                                         sExceptionName => "UnhandledException            "),

                                      ENullPointer => TException'(ActualException => NullPointer'Identity,
                                                                  sExceptionName  => "NullPointer                   "),

                                      ENotUnitQuaternion => TException'(ActualException => NotUnitQuaternion'Identity,
                                                                        sExceptionName  => "NotUnitQuaternion             "),

                                      ESingularMatrix => TException'(ActualException => SingularMatrix'Identity,
                                                                  sExceptionName  => "SingularMatrix                "),

                                      ENoIntersectionBetweenPlanes => TException'(ActualException => NoIntersectionBetweenPlanes'Identity,
                                                                  sExceptionName  => "NoIntersectionBetweenPlanes   "),

                                      EDivisionByZero => TException'(ActualException => DivisionByZero'Identity,
                                                                  sExceptionName  => "DivisionByZero                "),

                                      EIndexOutOfBounds => TException'(ActualException => IndexOutOfBounds'Identity,
                                                                  sExceptionName  => "IndexOutOfBounds              "),

                                      EUnknownMotionComponent => TException'(ActualException => UnknownMotionComponent'Identity,
                                                                  sExceptionName  => "UnknownMotionComponent        "),

                                      EBufferOverflow => TException'(ActualException => BufferOverflow'Identity,
                                                                  sExceptionName  => "BufferOverflow                "),

                                      EUnknownException => TException'(ActualException => UnknownException'Identity,
                                                                  sExceptionName  => "UnknownException              "),

                                      EUndefinedPlane => TException'(ActualException => UndefinedPlane'Identity,
                                                                  sExceptionName  => "UndefinedPlane                ")
                                     );


   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Id);
   --  <summary>Handles the exception E, prints a stacktrace and raises an UnhandledException</summary>
   --  <parameter name="E">The Exception thrown</parameter>



   procedure Handled_Exception;

   procedure Raise_Exception (E : Ada.Exceptions.Exception_Id; Message : String := "");


private

   MaxMessageLength : constant := 1_000;

   type TExceptionMsg is
      record
         iMessageLength : Natural;
         sMessage : string(1 .. MaxMessageLength);
      end record;

   MaxExceptionMsgs : constant := 1_000;
   type TExceptionMsgArray is array(1 .. MaxExceptionMsgs) of TExceptionMsg;
   xUnhandledExceptionMsgList : TExceptionMsgArray;

   procedure Add_Msg (iIndex : Positive; Message : String := "");
   procedure Print_Msg(iIndex : in Positive);
   procedure Save_Exception (Message : String := "");
   function sGet_Exception_Name(E : in Ada.Exceptions.Exception_Id) return String;
end Exception_Handling;
