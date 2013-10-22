with Ada.Text_IO;
with Sockets;

procedure Server is
begin
    Ada.Text_IO.Put_Line("Server procedure - Started.");
    Sockets.Listen_On_Socket;
    Ada.Text_IO.Put_Line("Server procedure - Finished.");
end Server;
