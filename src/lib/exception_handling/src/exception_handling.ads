with Ada.Exceptions;

package Exception_Handling is

   type EExceptions is (Unhandled_Exception,
                        Null_Pointer,
                        Not_Unit_Quaternion,
                        Singular_Matrix,
                        Parallel_Planes,
                        Division_By_Zero,
                        Index_Out_Of_Bounds);

   type TException is new EExceptions;



   function Get_Name(E : in TException) return string;
   procedure Unhandled_Exception (E : in TException);

end Exception_Handling;
