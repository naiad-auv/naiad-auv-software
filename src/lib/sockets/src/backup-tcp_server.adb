with Ada.Text_IO;
with Sockets;

procedure TCP_Server is
begin
    Ada.Text_IO.Put_Line("DEBUG: TCP Server procedure - Started");
    Sockets.Listen_On_TCP_Socket;
    Ada.Text_IO.Put_Line("DEBUG: TCP Server procedure - Finished");
end TCP_Server;
