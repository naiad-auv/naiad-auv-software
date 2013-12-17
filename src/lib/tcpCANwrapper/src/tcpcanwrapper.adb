with Ada.Text_IO;
with Ada.Streams;

package body TCPCANWrapper is

   -------------------------
   -- xRead_Custom_Packet --
   -------------------------

   overriding procedure xRead_Custom_Packet (this : in out CTCPCANPacket; pStream : GNAT.Sockets.Stream_Access) is
   begin
      CAN_Defs.CAN_Message'Read(pStream, this.xCANMessage);
   end xRead_Custom_Packet;

   --------------------------
   -- xWrite_Custom_Packet --
   --------------------------

   overriding procedure xWrite_Custom_Packet (this : in CTCPCANPacket; pStream : GNAT.Sockets.Stream_Access) is
   begin
      CAN_Defs.CAN_Message'Write(pStream, this.xCANMessage);

      --CTCPCANPacket'Write(pStream, this);
   end xWrite_Custom_Packet;


   function iGet_Size_In_Bytes(this : in CTCPCANPacket) return integer is
   begin
      return  iGet_Size_In_Bytes(TCPWrapper.CTCPPacket(this)) + 14;
   end iGet_Size_In_Bytes;

   function sGet_String(this : in CTCPCANPacket) return String is
   begin
      return this.xCANMessage.ID.Identifier'Img;
   end sGet_String;

   procedure set_Message_to_Send(this : in out CTCPCANPacket; xMessage : CAN_Defs.CAN_Message) is
   begin
      this.xCANMessage := xMessage;
   end set_Message_to_Send;

   procedure Set(this : in out CTCPCANPacket) is
   begin
      this.xCANMessage := CAN_Defs.MSG_TORPEDO_RIGHT;
      this.Set_Type(TCPWrapper.PACKET_CAN);
   end Set;

   function xReturn_Message(this : in CTCPCANPacket) return CAN_Defs.CAN_Message is
   begin
      return this.xCANMessage;
   end xReturn_Message;


end TCPCANWrapper;
