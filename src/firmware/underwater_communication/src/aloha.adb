with Circular_Buffer;
with AVR.AT90CAN128.CAN;

package body Aloha is

   type circular_p is mod 2 ** 5;
   BUFFER_SIZE : constant Integer := circular_p'Modulus/2;

   function Less(Left, Right : AVR.AT90CAN128.CAN.CAN_ID) return Boolean is
      use type AVR.AT90CAN128.CAN.CAN_ID;
   begin
      return Left < Right;
   end Less;

   package TX_PAY is new Circular_Buffer(Buffer_Size => BUFFER_SIZE, Circular_Pointer => circular_p, Element_T => Frame_ACK, Compare => Less);
   package RX_PAY is new Circular_Buffer(Buffer_Size => BUFFER_SIZE, Circular_Pointer => circular_p, Element_T => Frame_PAY, Compare => Less);

   procedure dummy is
      item : Frame_ACK;
   begin
      null;
   end dummy;
end;
