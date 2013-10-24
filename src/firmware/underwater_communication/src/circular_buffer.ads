generic
   Buffer_Size : Positive;
   type Element_T is private;
   type Circular_Pointer is mod <>;
   with function Compare (Left, Right : Element_T) return Boolean is <>;
package Circular_Buffer is

   function Insert (e : in Element_T) return Boolean ;

   function Remove (e : out Element_T) return Boolean;

   function isEmpty return Boolean;

   function isFull return Boolean;

   function getSize return Integer;

   function Write(msg : in Element_T) return Boolean;

   function getHighestPriorityMsg return Circular_Pointer;

   --read

   --peak

end Circular_Buffer;
