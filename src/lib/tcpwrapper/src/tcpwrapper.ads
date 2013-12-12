with GNAT.Sockets;

package TCPWrapper is
   type CTCPPacket is tagged private;
   type CTCPConnection is tagged private;

   procedure iBytes_Available_For_Reading(this : in out CTCPConnection; iBytesAvail : out integer);
   function xConnect_To(sAddress : in string; iPort : in integer; dTimeout : in Duration := GNAT.Sockets.Forever) return CTCPConnection;

   -- leave sAddress empty to allow any IP to connect, leave iPort to 0 to allow any port
   function xStart_Listening(sAddress : in string := ""; iPort : in integer := 0) return CTCPConnection;
   procedure bIs_Connected(this : in out CTCPConnection; bResult : out boolean);
   procedure xReceive_Packet(this : in out CTCPConnection; xPacket : in out CTCPPacket'class);
   procedure Send_Packet(this : in out CTCPConnection; xPacket : in CTCPPacket'class);

   procedure Close_Connection(this : in out CTCPConnection);

private

   type CTCPPacket is tagged
      record
         iSize : Positive;
         iType : integer;
      end record;

   procedure xRead_Custom_Packet(this : in out CTCPPacket'class; pStream : GNAT.Sockets.Stream_Access) is null;
   procedure xWrite_Custom_Packet(this : in CTCPPacket'class; pStream : GNAT.Sockets.Stream_Access) is null;


   type CTCPConnection is tagged
      record
         bConnected : boolean := false;
         tiSocket : GNAT.Sockets.Socket_Type := GNAT.Sockets.No_Socket;
         tRemote_Address : GNAT.Sockets.Sock_Addr_Type;
         pIO_Stream : GNAT.Sockets.Stream_Access;
      end record;

end TCPWrapper;
