with Ethernet_Socket;
with CAN_Link_Utils;
with Interfaces;
with GNAT.Serial_Communications;
with BBB_CAN;
with CAN_Defs; use CAN_Defs;
with GNAT.Sockets;
with UartWrapper;
with Ada.Text_IO;
with Ada.Exceptions;
with Ada.Calendar;
use Interfaces;


procedure Main is

   MODE_CLIENT : constant Character := 'C';
   MODE_SIMULATOR : constant Character := 'S';

   msg : CAN_Defs.CAN_Message;
   iCheck : Integer;
   bMsg : Boolean;
   bOk : Boolean;

   Socket_PC1 : GNAT.Sockets.Socket_Type;

   counter : Interfaces.Unsigned_8;

   procedure process_client is
      read_status : Integer;
   begin

      loop
         read_status := Ethernet_Socket.Receive_CAN_As_Server(msg, Socket_PC1);
         exit when read_status = Ethernet_Socket.SOCKET_CLIENT_DISCONNECTED;

         if read_status = Ethernet_Socket.SOCKET_READ_SUCCESS then
            Ada.Text_IO.Put_Line("client -> beaglebone: " & msg.ID.Identifier'Img & ", " & msg.ID.isExtended'Img);


            Ada.Text_IO.Put_Line("msg from SOCKET {");
            Ada.Text_IO.Put_Line( CAN_Defs.CAN_Identifier'Image(msg.ID.Identifier) );
            Ada.Text_IO.Put_Line( Boolean'Image(msg.ID.isExtended) );
            Ada.Text_IO.Put_Line( CAN_Defs.DLC_Type'Image(msg.Len) );
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(1) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(2) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(3) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(4) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(5) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(6) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(7) ));
            Ada.Text_IO.Put_Line( Interfaces.Unsigned_8'Image(msg.Data(8) ));
            Ada.Text_IO.Put_Line("}");

            msg.ID.isExtended := FALSE;
            Ada.Text_IO.Put_Line("beaglebone -> bootloader: " & msg.ID.Identifier'Img & ", " & msg.ID.isExtended'Img);
            BBB_CAN.Send(msg);
         end if;

         BBB_CAN.Get(msg, bMsg, bOk);

         if bMsg then
            if( msg.Data(2) < 15 ) then
               Ada.Text_IO.Put_Line("beaglebone -> client: " & msg.ID.Identifier'Img & ", " & msg.ID.isExtended'Img);
               iCheck := Ethernet_Socket.Send_CAN_As_Server(msg, Socket_PC1);
            end if;
         end if;

         delay duration(0.0005);
      end loop;

   exception
      when E : others =>
         Ada.Text_IO.Put_Line("process_client: " & Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
   end process_client;

   procedure process_simulator is
      read_status : Integer;
   begin
      loop

         Ada.Text_IO.Put_Line("I am the simulator!!");
         read_status := Ethernet_Socket.Receive_CAN_As_Server(msg, Socket_PC1);
         exit when read_status = Ethernet_Socket.SOCKET_CLIENT_DISCONNECTED;

         delay duration(1);
      end loop;
   end process_simulator;

   read_mode : Character;
   result : Integer;

begin
   Ethernet_Socket.Init_Connection("192.168.1.43", 5555, Socket_PC1);
   BBB_CAN.Init("ttyO4", UartWrapper.B115200);

   bMsg := False;
   bOk := False;
   counter := 0;

   loop
      Ada.Text_IO.Put_Line("waiting for client to connect...");

      Ethernet_Socket.Establish_Connection_As_Server(Socket_PC1);
      read_mode := Ethernet_Socket.Receive_ID(Socket_PC1);
      case read_mode is
         when MODE_CLIENT =>
            result := Ethernet_Socket.Send_ID(Socket_PC1, read_mode);
            process_client;
         when MODE_SIMULATOR =>
            result := Ethernet_Socket.Send_ID(Socket_PC1, read_mode);
            process_simulator;
         when others =>
            null;
      end case;

   end loop;

end Main;
