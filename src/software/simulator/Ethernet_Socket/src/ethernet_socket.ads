---------------------------------------------------------------------------
-- This code is used to send and receive CAN messages over a TCP connection
-- with GNAT.Sockets

-- Written by Kim Nordlöf for the Naiad AUV project
---------------------------------------------------------------------------

with CAN_Link_Utils;
with Interfaces;
with GNAT.Sockets;
with CAN_Defs;

package Ethernet_Socket is

   function Send_ID return Integer;

   function Receive_ID return Integer;

   procedure Server_Init;

   procedure Check_Connection;

   procedure Establish_Connection2;

   --procedure Establish_Connection;
   procedure Establish_Connection(sHost_Name : String; Port : GNAT.Sockets.Port_Type);

   procedure Close_Connection;

   function Send_CAN (msg : CAN_Defs.CAN_Message) return Integer;

   --function Send_CAN2 (msg : String) return Integer;


   function Receive_CAN(msg : out CAN_Defs.CAN_Message) return Integer;


end Ethernet_Socket;
