generic
   Buffer_Size : Positive;
   type Element_T is private;
   type Circular_Pointer is mod <>;
package Circular_Buffer is
   function Insert (e : in Element_T) return Boolean ;
   function Remove (e : out Element_T) return Boolean;
   function isEmpty return Boolean;
   function isFull return Boolean;

end Circular_Buffer;
