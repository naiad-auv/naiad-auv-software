with Ada.Streams.Stream_IO;
with GNAT.Sockets;

package TCPWrapper is
   type CTCPPacket is abstract tagged private;
   type CTCPConnection is tagged private;

   type EPacketType is (PACKET_NULL,
                        PACKET_CAN,
                        PACKET_FILE_TRANSFER_START);
   for EPacketType'Size use 8;

   function xConnect_To(sAddress : in string; iPort : in integer; dTimeout : in Duration := GNAT.Sockets.Forever) return CTCPConnection;
   function xStart_Listening(sAddress : in string := ""; iPort : in integer) return CTCPConnection; -- leave sAddress empty to allow any IP to connect
   procedure Close_Connection(this : in out CTCPConnection);
   function pGet_Stream(this : in CTCPConnection) return GNAT.Sockets.Stream_Access;

   function iBytes_Available_For_Reading (this : in CTCPConnection) return integer;
   procedure bIs_Connected(this : in out CTCPConnection; bResult : out boolean);

   function eGet_Next_Packet_Type (this : in CTCPConnection) return EPacketType;
   procedure Receive_Packet(this : in out CTCPConnection; xPacket : in out CTCPPacket'class; bSuccess : out boolean);
   procedure Send_Packet(this : in out CTCPConnection; xPacket : in CTCPPacket'class);


   -- These three subprograms should ALL be overridden in inheriting types
   procedure xRead_Custom_Packet(this : in out CTCPPacket; pStream : GNAT.Sockets.Stream_Access) is abstract;
   procedure xWrite_Custom_Packet(this : in CTCPPacket; pStream : GNAT.Sockets.Stream_Access) is abstract;
   function iGet_Size_In_Bytes(this : in CTCPPacket) return integer;


   procedure Set_Type(this : in out CTCPPacket; eType : in EPacketType);

   function pGet_Socket(this : in CTCPConnection) return GNAT.Sockets.Socket_Type;


private

   type CTCPPacket is abstract tagged
      record
         eType : EPacketType;
      end record;


   type CTCPConnection is tagged
      record
         bConnected : boolean := false;
         tiSocket : GNAT.Sockets.Socket_Type := GNAT.Sockets.No_Socket;
         tRemote_Address : GNAT.Sockets.Sock_Addr_Type;
         pIO_Stream : GNAT.Sockets.Stream_Access;
      end record;

end TCPWrapper;
