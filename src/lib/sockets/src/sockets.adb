with GNAT.Sockets;
with Ada.Text_IO;
with Ada.Streams;

package body Sockets is
    CRLF : constant String := ASCII.CR & ASCII.LF;
    PORT : constant GNAT.Sockets.Port_Type := 20041;

    procedure Send_UDP_Message is
        Remote_Address: GNAT.Sockets.Sock_Addr_Type;
        Socket  : GNAT.Sockets.Socket_Type;
        Channel : GNAT.Sockets.Stream_Access;
    begin
        Ada.Text_IO.Put_Line("DEBUG: Listen_On_Socket - Started");

        Remote_Address.Addr :=  GNAT.Sockets.Addresses(
                                    GNAT.Sockets.Get_Host_By_Name(
                                        GNAT.Sockets.Host_Name), 1);
        Remote_Address.Port := PORT;

        GNAT.Sockets.Create_Socket(Socket);
        GNAT.Sockets.Set_Socket_Option(Socket,
                                        GNAT.Sockets.Socket_Level,
                                        (GNAT.Sockets.Reuse_address, True));

        GNAT.Sockets.Connect_Socket(Socket, Remote_Address);
        Channel := GNAT.Sockets.Stream(Socket);

        delay 1.0;

        String'Output (Channel, CRLF & "Message from Client to Server" & CRLF & CRLF);
        Ada.Text_IO.Put_Line(String'Input(Channel));
        GNAT.Sockets.Close_Socket(Socket);

        Ada.Text_IO.Put_Line("DEBUG: Send_UDP_Message - Finished");
    end Send_UDP_Message;


    procedure Listen_On_Socket is
        Address : GNAT.Sockets.Sock_Addr_Type;
        Socket  : GNAT.Sockets.Socket_Type;
        Server  : GNAT.Sockets.Socket_Type;
        Stream_Access : GNAT.Sockets.Stream_Access;
    begin
        Ada.Text_IO.Put_Line("DEBUG: Listen_On_Socket - Started");

        Address.Addr := GNAT.Sockets.Addresses(
                            GNAT.Sockets.Get_Host_By_Name(
                                GNAT.Sockets.Host_Name), 1);
        Address.Port := PORT;

        GNAT.Sockets.Create_Socket(Server);
        GNAT.Sockets.Set_Socket_Option(Server,
                                        GNAT.Sockets.Socket_Level,
                                        (GNAT.Sockets.Reuse_address, True));

        GNAT.Sockets.Bind_Socket(Server, Address);
        GNAT.Sockets.Listen_Socket(Server);
        GNAT.Sockets.Accept_Socket(Server, Socket, Address);
        Stream_Access := GNAT.Sockets.Stream(Socket);

        declare
            Message : String := String'Input(Stream_Access);
        begin
            Ada.Text_IO.Put_Line(Message);
            delay 1.0;
            String'Output(Stream_Access, CRLF & "Message from Server back to Client" & CRLF );
            String'Output(Stream_Access, Message);
        end;

        GNAT.Sockets.Close_Socket(Server);
        GNAT.Sockets.Close_Socket(Socket);

        Ada.Text_IO.Put_Line("DEBUG: Listen_On_Socket - Finished");
    end Listen_On_Socket;


end Sockets;
