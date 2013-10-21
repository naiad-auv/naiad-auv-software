with Circular_Buffer;

package body Aloha is

   type circular_p is mod 2 ** 5;
   BUFFER_SIZE : constant Integer := circular_p'Modulus/2;

   package TX_PAY is new Circular_Buffer(Buffer_Size => BUFFER_SIZE, Circular_Pointer => circular_p, Element_T => Frame_ACK);
   package RX_PAY is new Circular_Buffer(Buffer_Size => BUFFER_SIZE, Circular_Pointer => circular_p, Element_T => Frame_PAY);

   procedure dummy is

      item : Frame_ACK;
   begin
      if(TX_PAY.Remove(item)) then
         null;
      end if;


   end dummy;
end;
