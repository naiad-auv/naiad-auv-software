---------------------------------------------------------------------------
-- This code is used to send and receive CAN messages over a TCP connection
-- with GNAT.Sockets

-- Written by Kim Nordlöf for the Naiad AUV project
---------------------------------------------------------------------------

with Ada.Text_IO;
with GNAT.Sockets;
with Interfaces;
with CAN_Link_Utils;
with Ada.Exceptions;
with Interfaces.C;

package body Ethernet_Socket is

   Server : GNAT.Sockets.Sock_Addr_Type;
   Socket : GNAT.Sockets.Socket_Type;
   Serv : GNAT.Sockets.Socket_Type;
   Channel : GNAT.Sockets.Stream_Access;

   Selector : GNAT.Sockets.Selector_Type;
   Rset : GNAT.Sockets.Socket_Set_Type;
   Wset : GNAT.Sockets.Socket_Set_Type;
   Status : GNAT.Sockets.Selector_Status;

   ID : constant String(1 ..1) := "C";

   procedure Server_Init is

   begin
      Ada.Text_IO.Put_line (GNAT.Sockets.Image(Socket)) ;

      Server.Addr := GNAT.Sockets.Addresses ( GNAT.Sockets.Get_Host_By_Name ( "127.0.0.1" ), 1 ) ;
      Server.Port := 80;
      GNAT.Sockets.Create_Socket(Serv);
      Ada.Text_IO.Put_line (GNAT.Sockets.Image(Socket)) ;
      Ada.Text_IO.Put_line ( "Binding... " ) ;

      GNAT.Sockets.Bind_Socket(Serv, Server);

      Ada.Text_IO.Put_line (GNAT.Sockets.Image(Socket)) ;

   end Server_Init;

   procedure Check_Connection is

   begin


      Ada.Text_IO.Put_line ("- - -") ;
      Ada.Text_IO.Put_line ("PEER: " & GNAT.Sockets.Image(GNAT.Sockets.Get_Peer_Name(Socket) ) );
      Ada.Text_IO.Put_line ("- - -") ;

   end Check_Connection;


   procedure Establish_Connection2 is

   begin

      Ada.Text_IO.Put_line ( "Connecting... " ) ;
--        Server.Addr := GNAT.Sockets.Addresses ( GNAT.Sockets.Get_Host_By_Name ( "127.0.0.1" ), 1 ) ;
--        Server.Port := 80;
--        GNAT.Sockets.Create_Socket(Serv);
--        Ada.Text_IO.Put_line ( "Binding... " ) ;
--
--        GNAT.Sockets.Bind_Socket(Serv, Server);

      Ada.Text_IO.Put_line ( "Listening... " ) ;
      GNAT.Sockets.Listen_Socket(Serv);

      Ada.Text_IO.Put_line ( "Accepting... " ) ;
      GNAT.Sockets.Accept_Socket(Serv, Socket, Server);

      Check_Connection;
      Ada.Text_IO.Put_line ( "Streaming... " ) ;
      Channel := GNAT.Sockets.Stream( Socket );

      Ada.Text_IO.Put_line ( "Connection established... " ) ;

      Check_Connection;
   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));

   end Establish_Connection2;

   function Identify return Integer is
   begin
      if(Send_ID = 0) then
         if(Receive_ID = 0) then
            return 0;
         else
            return -1;
         end if;
      else
         return -1;
      end if;
--     exception
--        when E : others =>
--           GNAT.Sockets.Close_Selector(Selector);
--           Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
--           return -2;
   end Identify;

   function Send_ID return Integer is
   begin
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
            Ada.Text_IO.Put_line (ID ) ;
            String'Write(Channel, ID);
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

   function Receive_ID return Integer is
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
            Ada.Text_IO.Put_line ( "sBuffer: " & sBuffer(1)'Img) ;
            Ada.Text_IO.Put_line ( "ID: " & ID(1)'Img) ;
            if ( sbuffer(1) = ID(1) ) then
               Ada.Text_Io.Put_Line("Passed ID check");
               GNAT.Sockets.Close_Selector(Selector);
               return 0;
            else
               Ada.Text_Io.Put_Line("Failed ID check");
               GNAT.Sockets.Close_Selector(Selector);
               return -1;
            end if;

         end if;
         Ada.Text_Io.Put_Line("Socket is not part of set");
         return -1;
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
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
         GNAT.Sockets.Close_Selector(Selector);
         return -2;

   end Receive_ID;


   procedure Establish_Connection(sHost_Name : String; Port : GNAT.Sockets.Port_Type) is
   begin
      Ada.Text_IO.Put_line ( "Connecting... " ) ;
      Server.Addr := GNAT.Sockets.Addresses ( GNAT.Sockets.Get_Host_By_Name ( sHost_Name ), 1 ) ;

      Server.Port := Port ;
      GNAT.Sockets.Create_Socket(Socket);

      GNAT.Sockets.Set_Socket_Option(Socket => Socket,
                                     Level  => GNAT.Sockets.Socket_Level,
                                     Option => (GNAT.Sockets.Keep_Alive, True));
      GNAT.Sockets.Connect_Socket(Socket, Server);
      Channel := GNAT.Sockets.Stream( Socket );

      if(Identify = 0) then
         Ada.Text_IO.Put_line ( "Connection established... " ) ;
      else
         Ada.Text_IO.Put_line ( "Connection was not identified... " ) ;
      end if;


   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));

   end Establish_Connection;

   procedure Close_Connection is
   begin
      Check_Connection;
      Ada.Text_IO.Put_line (GNAT.Sockets.Image(Socket)) ;
      GNAT.Sockets.Shutdown_Socket(Socket);
      Ada.Text_IO.Put_line ( "Connection closed... " ) ;
      GNAT.Sockets.Close_Socket(Socket);
      Ada.Text_IO.Put_line (GNAT.Sockets.Image(Socket)) ;
      Check_Connection;
   end Close_Connection;


   function Send_CAN (msg : CAN_Defs.CAN_Message) return Integer is

      sBuffer : String ( 1..13 ) ;
--        sBufferHead : String ( 1..8 ) ;
--        sBufferData : String ( 1..8 ) ;
   begin
      Ada.Text_IO.Put_line ( "Sending message... " ) ;
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Wset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 0.5);

      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Wset, Socket) then
            Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
            CAN_Link_Utils.Message_To_Bytes(sBuffer, msg);

--              Ada.Text_IO.Put_line (CAN_Link_Utils.CAN_Identifier'Image(msg.ID.Identifier) ) ;
--              Ada.Text_IO.Put_line (Boolean'Image(msg.ID.isExtended) ) ;
--              Ada.Text_IO.Put_line (CAN_Link_Utils.DLC_Type'Image(msg.Len) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(1)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(2)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(3)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(4)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(5)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(6)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(7)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(8)) ) ;

            Ada.Text_IO.Put_line (sBuffer ) ;

            String'Write(Channel, sBuffer);
            Ada.Text_IO.Put_line ( "Message sent... " ) ;
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

   end Send_CAN;

   procedure Receive_CAN(msg : out CAN_Defs.CAN_Message; iStatus : out Integer) is

      sBuffer : String ( 1..13 ) ;
      sBufferHead : String ( 1..5 ) ;
      sBufferData : String ( 1..8 ) ;
      nByte_Count : Natural ;
      u8Check : Interfaces.Unsigned_8;

   begin
      Ada.Text_IO.Put_line ( "Reading message... " ) ;
      GNAT.Sockets.Create_Selector(Selector);
      GNAT.Sockets.Empty(Rset);
      GNAT.Sockets.Empty(Wset);
      GNAT.Sockets.Set(Rset, Socket);
      GNAT.Sockets.Check_Selector(Selector, Rset, Wset, Status, 2.5);

      CASE Status IS
      WHEN GNAT.Sockets.Completed =>
         if GNAT.Sockets.Is_Set(Rset, Socket) then
            Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
            nByte_Count := 0 ;
            for Index in sBuffer'Range loop
--                 Ada.Text_IO.Put_line ( "BYTE " & Natural'Image(Index) ) ;
               nByte_Count := nByte_Count + 1 ;
               Character'Read ( Channel, sBuffer ( nByte_Count ) ) ;
--                 Ada.Text_IO.Put_line ( Character'Image( sBuffer(nByte_Count) ) ) ;
            end loop ;
            sBufferHead := sBuffer(1 .. 5);
            sBufferData := sBuffer(6 .. 13);

--              Ada.Text_IO.Put_line ( "Transforming message... " ) ;
--              CAN_Link_Utils.Bytes_To_Message_Header(sBuffer(1 .. 8), msg, u8Check);
--              CAN_Link_Utils.Bytes_To_Message_Data(sBuffer(9 .. 16), msg, u8Check);

            CAN_Link_Utils.Bytes_To_Message_Header(sBufferHead, msg, u8Check);
            CAN_Link_Utils.Bytes_To_Message_Data(sBufferData, msg, u8Check);
            Ada.Text_IO.Put_line ( "Message received... " ) ;
--              Ada.Text_IO.Put_line (CAN_Link_Utils.CAN_Identifier'Image(msg.ID.Identifier) ) ;
--              Ada.Text_IO.Put_line (Boolean'Image(msg.ID.isExtended) ) ;
--              Ada.Text_IO.Put_line (CAN_Link_Utils.DLC_Type'Image(msg.Len) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(1)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(2)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(3)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(4)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(5)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(6)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(7)) ) ;
--              Ada.Text_IO.Put_line (Interfaces.Unsigned_8'Image(msg.Data(8)) ) ;
         end if;
         GNAT.Sockets.Close_Selector(Selector);
         iStatus := 0;
         return;
      WHEN GNAT.Sockets.Expired =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         iStatus := -2;
	 return;
      WHEN GNAT.Sockets.Aborted =>
         Ada.Text_Io.Put_Line("SelectorStatus: " & GNAT.Sockets.Selector_Status'Image(Status));
         GNAT.Sockets.Close_Selector(Selector);
         iStatus := -1;
         return;
      END CASE;

   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
         GNAT.Sockets.Close_Selector(Selector);
         iStatus := -2;
         return;

   end Receive_CAN;

end Ethernet_Socket;
