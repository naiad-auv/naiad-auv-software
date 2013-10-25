with Ada.Text_IO;
with Sockets;

procedure Server is
begin
    Ada.Text_IO.Put_Line("DEBUG: UDP Server procedure - Started");
    Sockets.Listen_On_UDP_Socket;
    Ada.Text_IO.Put_Line("DEBUG: UDP Server procedure - Finished");
end Server;
