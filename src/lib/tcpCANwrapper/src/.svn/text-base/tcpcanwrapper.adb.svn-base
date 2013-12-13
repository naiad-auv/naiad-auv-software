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
   end xWrite_Custom_Packet;


   function iGet_Size(this : in CTCPCANPacket) return positive is
   begin
      return (this.xCANMessage'Size + integer'Size +integer'size)/8;
   end iGet_Size;

   function sGet_String(this : in CTCPCANPacket) return String is
   begin
      return this.xCANMessage.ID.Identifier'Img;
   end sGet_String;

   procedure set_Message_to_Send(this : in out CTCPCANPacket; xMessage : CAN_Defs.CAN_Message) is
   begin
      this.xCANMessage := xMessage;
   end set_Message_to_Send;



end TCPCANWrapper;
