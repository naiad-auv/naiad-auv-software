with Ada.Text_IO;
with Sockets;

procedure UDP_Server is
begin
    Ada.Text_IO.Put_Line("DEBUG: UDP_Server procedure - Started");
    Sockets.Listen_On_UDP_Socket;
    Ada.Text_IO.Put_Line("DEBUG: UDP_Server procedure - Finished");
end UDP_Server;
