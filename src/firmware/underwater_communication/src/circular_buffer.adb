package body Circular_Buffer is

   type Buffer_Type is array (Circular_Pointer range <>) of Element_T;

   buffer 	: Buffer_Type(Circular_Pointer(1)..Circular_Pointer(Buffer_Size));
   cpRead 	: Circular_Pointer;
   cpWrite 	: Circular_Pointer;

   pragma Volatile(cpRead);
   pragma Volatile(cpWrite);

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

   function getSize return Integer is
   begin
      return abs(Integer(cpWrite - cpRead));
   end getSize;

   function Write(msg : in Element_T) return Boolean is
      Pos : Circular_Pointer;
   begin

      if getSize < Buffer_Size then
         Pos := cpWrite;
         buffer(Pos mod Circular_Pointer(Buffer_Size)) := Msg;
         Pos := Pos + 1;
         cpWrite := Pos;
         return True;

      end if;

      return False;

   end Write;

   function getHighestPriorityMsg return Circular_Pointer is
      ret : Circular_Pointer := cpRead;
      prio : CAN_ID := CAN_ID'Last;
      counter : Circular_Pointer;
   begin
      counter := cpRead;
      while counter /= cpWrite loop
         if buffer(counter mod Circular_Pointer(Buffer_Size)).ID < prio then
            prio := buffer(counter mod Circular_Pointer(Buffer_Size)).ID;
            ret := counter;
         end if;
         counter := counter + 1;
      end loop;
      return ret;
   end getHighestPriorityMsg;

end Circular_Buffer;
