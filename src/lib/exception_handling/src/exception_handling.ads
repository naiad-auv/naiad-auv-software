with Ada.Exceptions;

package Exception_Handling is

   type E
   type TException;
   Unhandled_Exception : TException;
   Null_Pointer : TException;
   Not_Unit_Quaternion : TException;
   Singular_Matrix : TException;
   Parallel_Planes : TException;
   Division_By_Zero : TException;
   Index_Out_Of_Bounds : TException;



   function Get_Name(E : exception) return string;
   procedure Unhandled_Exception (E : in exception);

end Exception_Handling;
