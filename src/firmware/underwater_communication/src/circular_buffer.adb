package body Circular_Buffer is
   type Buffer_Type is array (Integer range <>) of Element_T;

   buffer 	: Buffer_Type(1..Buffer_Size);
   pRead 	: Circular_Pointer;
   pWrite 	: Circular_Pointer;

   function Insert(e : in Element_T) return Boolean is
   begin
      return false;
   end Insert;

   function Remove(e : out Element_T) return Boolean is
   begin
      return false;
   end Remove;

   function isFull return Boolean is
   begin
      return false;
   end isFull;

   function isEmpty return Boolean is
   begin
      return false;
   end isEmpty;

end Circular_Buffer;
