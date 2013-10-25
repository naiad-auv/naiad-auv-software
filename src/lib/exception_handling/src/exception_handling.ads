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

   ParallelPlanes : exception;
   --  <summary>Parallel planes exception, thrown by operations not permitted with two parallel planes. I.e when trying to find a instersection vector between two planes</summary>

   DivisionByZero : exception;
   --  <summary>Division by zero exception, thrown by functions where the passed divident is 0</summary>

   IndexOutOfBounds : exception;
   --  <summary>Index out of bounds exception, thrown by functions where an index of i.e and array is out of the bounds of the array</summary>

   UnknownMotionComponent : exception;
   --  <summary>Unkown motion component exception, thrown when a user tries to update the PID scalings of an undefined component</summary>

   procedure Unhandled_Exception (E : in Ada.Exceptions.Exception_Occurrence);
   --  <summary>Handles the exception E, prints a stacktrace and raises an UnhandledException</summary>
   --  <parameter name="E">The Exception thrown</parameter>

end Exception_Handling;
