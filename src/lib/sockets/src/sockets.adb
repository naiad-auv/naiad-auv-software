with GNAT.Sockets;
-- use GNAT.Sockets;
with Ada.Text_IO;
with Ada.Streams;

package body Sockets is

    procedure Send_UDP_Message is
        Client  : GNAT.Sockets.Socket_Type;
        Address  : GNAT.Sockets.Sock_Addr_Type;
        -- Socket   : GNAT.Sockets.Socket_Type;
        Channel  : GNAT.Sockets.Stream_Access;
        CRLF : constant String := ASCII.CR & ASCII.LF;
        -- Offset : Ada.Streams.Stream_Element_Count;
        -- Data : Ada.Streams.Stream_Element_Array (1 .. 256);

    begin
        Ada.Text_IO.Put_Line("Send_UDP_Message - Started");
        GNAT.Sockets.Initialize;
        GNAT.Sockets.Create_Socket(Client);
        Address.Addr := GNAT.Sockets.Inet_Addr("127.0.0.1");
        Address.Port := 50000;

        Channel := GNAT.Sockets.Stream (Client);

        String'Output (Channel, "Awesome!");
--         --Ada.Text_IO.Put_Line(String'Input (Channel));
        GNAT.Sockets.Close_Socket(Client);

       -- String'Write (Channel, "Test message" & CRLF & CRLF);
        -- GNAT.Sockets.Close_Socket(Client);
--         Address.Addr := GNAT.Sockets.Addresses(
--             GNAT.Sockets.Get_Host_By_Name (GNAT.Sockets.Host_Name), 1);
--         Address.Port := Port;
--
--         GNAT.Sockets.Create_Socket(Socket);
--
--         GNAT.Sockets.Set_Socket_Option(Socket, GNAT.Sockets.Socket_Level,
--             (GNAT.Sockets.Reuse_address, True));
--
--         GNAT.Sockets.Connect_Socket(Socket, Address);
--
--     --     GNAT.Sockets.Bind_Socket(Server, Address);
--     --     GNAT.Sockets.Listen_Socket(Server);
--     --     GNAT.Sockets.Accept_Socket(Server, Socket, Address);
--
--         Channel := GNAT.Sockets.Stream(Socket);
--         String'Output (Channel, "Awesome!");
--         --Ada.Text_IO.Put_Line(String'Input (Channel));
--         GNAT.Sockets.Close_Socket(Socket);
--     --
--     --     declare
--     --         Message : String := String'Input(Channel);
--     --     begin
--     --         Ada.Text_IO.Put_Line(Message);
--     --         String'Output(Channel, Message);
--     --     end;
--     --
--     --     GNAT.Sockets.Close_Socket(Server);
--     --     -- GNAT.Sockets.Close_Socket(Socket);
--     --
--         Ada.Text_IO.Put_Line(Port);
         Ada.Text_IO.Put_Line("Send_UDP_Message - Finished");
        -- return "Test string";
    end Send_UDP_Message;
end Sockets;
