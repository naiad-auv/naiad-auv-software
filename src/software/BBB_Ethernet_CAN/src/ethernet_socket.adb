---------------------------------------------------------------------------
-- This code is used to send and receive CAN messages over a TCP connection
-- with GNAT.Sockets

-- Written by Kim Nordlöf for the Naiad AUV project
---------------------------------------------------------------------------

with GNAT.Sockets;
with CAN_Link_Utils;
with Interfaces;
with Ada.Exceptions;
with CAN_Defs;
with Ada.Text_IO;

package body Ethernet_Socket is

   Server : GNAT.Sockets.Sock_Addr_Type;
   --Socket : GNAT.Sockets.Socket_Type;
   Serv : GNAT.Sockets.Socket_Type;
   Channel : GNAT.Sockets.Stream_Access;

   Selector : GNAT.Sockets.Selector_Type;
   Rset : GNAT.Sockets.Socket_Set_Type;
   Wset : GNAT.Sockets.Socket_Set_Type;
   Status : GNAT.Sockets.Selector_Status;


   function Send_ID(Socket : GNAT.Sockets.Socket_Type; id : Character) return Integer is
      sBuffer : String (1 .. 1);
   begin
      sBuffer(1) := id;
      Ada.Text_IO.Put_line ( "Sending ID... " ) ;
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Wset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 5.0);

      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Wset, Socket) then
            Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
            Ada.Text_IO.Put_line (id'Img) ;
            String'Write(Channel, sBuffer);
            Ada.Text_IO.Put_line ( "ID sent... " ) ;
         end if;
         GNAT.Sockets.Close_Selector(Selector);
         return 0;
      WHEN GNAT.Sockets.Expired =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         return -2;
      WHEN GNAT.Sockets.Aborted =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         return -1;
      END CASE;

   exception
      when E : others =>
         GNAT.Sockets.Close_Selector(Selector);
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
         return -2;

   end Send_ID;


   function Receive_ID(Socket : GNAT.Sockets.Socket_Type) return Character is
      sBuffer : String(1 .. 1);
   begin
      Ada.Text_IO.Put_line ( "Reading ID Ack... " ) ;
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Rset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 5.0);

      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Rset, Socket) then
            Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
            Character'Read ( Channel, sBuffer ( 1 ) ) ;
            Ada.Text_IO.Put_line ( "ID Ack Received... " ) ;
            GNAT.Sockets.Close_Selector(Selector);
            return sBuffer(1);
--              if ( sbuffer(1) = ID(1) ) then
--                 Ada.Text_Io.Put_Line("Passed ID check");
--                 GNAT.Sockets.Close_Selector(Selector);
--                 return 0;
--              else
--                 Ada.Text_Io.Put_Line("Failed ID check");
--                 GNAT.Sockets.Close_Selector(Selector);
--                 return -1;
--              end if;
         end if;

         return '0';
      WHEN GNAT.Sockets.Expired =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         return '0';
      WHEN GNAT.Sockets.Aborted =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         return '0';
      END CASE;

   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
         GNAT.Sockets.Close_Selector(Selector);
         return '0';

   end Receive_ID;

   procedure Check_Connection(Socket : in out GNAT.Sockets.Socket_Type) is
   begin
      Ada.Text_IO.Put_Line("PEER: " & GNAT.Sockets.Image(GNAT.Sockets.Get_Peer_Name(Serv) ) );
      Ada.Text_IO.Put_Line("PEER: " & GNAT.Sockets.Image(GNAT.Sockets.Get_Peer_Name(Socket) ) );


   end Check_Connection;


   procedure Init_Connection(sHost_Name : String;
                             Port : GNAT.Sockets.Port_Type;
                             Socket : in out GNAT.Sockets.Socket_Type) is
   begin
      Server.Addr := GNAT.Sockets.Addresses ( GNAT.Sockets.Get_Host_By_Name ( sHost_Name ), 1 ) ;
      Server.Port := Port;
      GNAT.Sockets.Create_Socket(Serv);
      GNAT.Sockets.Set_Socket_Option(Socket => Serv,
                                     Level => GNAT.Sockets.Socket_Level,
                                     Option => (GNAT.Sockets.Keep_Alive, True));

      GNAT.Sockets.Set_Socket_Option(Socket => Serv,
                                     Level => GNAT.Sockets.Socket_Level,
                                     Option => (GNAT.Sockets.Reuse_Address, True));

      GNAT.Sockets.Bind_Socket(Serv, Server);
   exception
      when E : others =>
         --null;
         Ada.Text_IO.Put_Line("From init: " & Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
   end Init_Connection;

   procedure Establish_Connection_As_Server (Socket : in out GNAT.Sockets.Socket_Type) is
   begin
      GNAT.Sockets.Listen_Socket(Serv);
      GNAT.Sockets.Accept_Socket(Serv, Socket, Server);
      Channel := GNAT.Sockets.Stream( Socket );

   exception
      when E : others =>
         --null;
         Ada.Text_IO.Put_Line("From establish: " & Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
   end Establish_Connection_As_Server;

   procedure Close_Connection(Socket : in out GNAT.Sockets.Socket_Type) is
   begin
      GNAT.Sockets.Shutdown_Socket(Socket);
      GNAT.Sockets.Close_Socket(Socket);
   end Close_Connection;

   function Send_CAN_As_Server (msg : CAN_Defs.CAN_Message; Socket : in out GNAT.Sockets.Socket_Type) return Integer is
      sBuffer : String ( 1..13 ) ;
      Channel : GNAT.Sockets.Stream_Access;
   begin
      Channel := GNAT.Sockets.Stream( Socket );
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Wset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 2.0);
      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Wset, Socket) then
            CAN_Link_Utils.Message_To_Bytes(sBuffer, msg);
            String'Write(Channel, sBuffer);
         end if;
         GNAT.Sockets.Close_Selector(Selector);
         return 0;

      WHEN GNAT.Sockets.Expired =>
         GNAT.Sockets.Close_Selector(Selector);
         return -2;
      WHEN GNAT.Sockets.Aborted =>
         GNAT.Sockets.Close_Selector(Selector);
         return -1;

      END CASE;

   exception
      when E : others =>
         GNAT.Sockets.Close_Selector(Selector);
         return -2;

   end Send_CAN_As_Server;

   function Receive_CAN_As_Server(msg : out CAN_Defs.CAN_Message; Socket : in out GNAT.Sockets.Socket_Type) return Integer is
      sBuffer : String ( 1..13 ) ;
      nByte_Count : Natural ;
      u8Check : Interfaces.Unsigned_8;
      Channel : GNAT.Sockets.Stream_Access;
      sBufferHead : String (1..5);
      sBufferData : String (1..8);
   begin
      Channel := GNAT.Sockets.Stream( Socket );
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Rset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 0.0);
      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Rset, Socket) then
            nByte_Count := 0 ;
            for Index in sBuffer'Range loop
               nByte_Count := nByte_Count + 1 ;
               Character'Read ( Channel, sBuffer ( nByte_Count ) ) ;
            end loop ;

            sBufferHead := sBuffer(1..5);
            sBufferData := sBuffer(6..13);

            CAN_Link_Utils.Bytes_To_Message_Header(sBufferHead, msg, u8Check);
            CAN_Link_Utils.Bytes_To_Message_Data(sBufferData, msg, u8Check);

         end if;
         GNAT.Sockets.Close_Selector(Selector);
         return 0;

      WHEN GNAT.Sockets.Expired =>
         GNAT.Sockets.Close_Selector(Selector);
         return -2;
      WHEN GNAT.Sockets.Aborted =>
         GNAT.Sockets.Close_Selector(Selector);
         return -1;
      END CASE;

   exception
      when E : others =>
         GNAT.Sockets.Close_Selector(Selector);
         return SOCKET_CLIENT_DISCONNECTED;
   end Receive_CAN_As_Server;

end Ethernet_Socket;
