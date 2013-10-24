with Ada.Exceptions;

package Exception_Handling is


   UnhandledException : exception;
   NullPointer : exception;
   NotUnitQuaternion : exception;
   SingularMatrix : exception;
   ParallelPlanes : exception;
   DivisionByZero : exception;
   IndexOutOfBounds : exception;
   UnknownMotionComponent : exception;


   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Occurrence);

end Exception_Handling;
