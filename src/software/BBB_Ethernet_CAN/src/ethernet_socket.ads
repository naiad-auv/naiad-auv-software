---------------------------------------------------------------------------
-- This code is used to send and receive CAN messages over a TCP connection
-- with GNAT.Sockets

-- Written by Kim Nordlöf for the Naiad AUV project
---------------------------------------------------------------------------

with CAN_Link_Utils;
with GNAT.Sockets;
with CAN_Defs;

package Ethernet_Socket is

   SOCKET_READ_SUCCESS : constant Integer := 0;
   SOCKET_CLIENT_DISCONNECTED : constant Integer := -3;

   function Receive_ID(Socket : GNAT.Sockets.Socket_Type) return Character;
   function Send_ID(Socket : GNAT.Sockets.Socket_Type; id : Character) return Integer;

   procedure Check_Connection(Socket : in out GNAT.Sockets.Socket_Type);

   procedure Init_Connection(sHost_Name : String; Port : GNAT.Sockets.Port_Type; Socket : in out GNAT.Sockets.Socket_Type);

   procedure Establish_Connection_As_Server(Socket : in out GNAT.Sockets.Socket_Type);


   procedure Close_Connection(Socket : in out GNAT.Sockets.Socket_Type);


   function Send_CAN_As_Server (msg : CAN_Defs.CAN_Message;
                                Socket : in out GNAT.Sockets.Socket_Type)
                                return Integer;


   function Receive_CAN_As_Server(msg : out CAN_Defs.CAN_Message;
                                  Socket : in out GNAT.Sockets.Socket_Type)
                                  return Integer;


end Ethernet_Socket;
