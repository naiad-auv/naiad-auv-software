with TCPWrapper; use TCPWrapper;
with CAN_Defs;
with CAN_Utils;
with GNAT; use GNAT;
with GNAT.Sockets;
package TCPCANWrapper is

   type CTCPCANPacket is new TCPWrapper.CTCPPacket with private;

   overriding
   function iGet_Size_In_Bytes(this : in CTCPCANPacket) return integer;
   function sGet_String(this : in CTCPCANPacket) return String;
   function xReturn_Message(this : in CTCPCANPacket) return CAN_Defs.CAN_Message;
   procedure set_Message_to_Send(this : in out CTCPCANPacket; xMessage : CAN_Defs.CAN_Message);
   procedure Set(this : in out CTCPCANPacket);

private

   overriding
   procedure xRead_Custom_Packet(this : in out CTCPCANPacket; pStream : GNAT.Sockets.Stream_Access);
   overriding
   procedure xWrite_Custom_Packet(this : in CTCPCANPacket; pStream : GNAT.Sockets.Stream_Access);

   type CTCPCANPacket is new TCPWrapper.CTCPPacket with
      record
         xCANMessage : CAN_Defs.CAN_Message := CAN_Defs.MSG_KILL_SWITCH_ACTIVE;
      end record;

end TCPCANWrapper;
