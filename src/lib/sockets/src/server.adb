with Ada.Text_IO;
with Sockets;

procedure Server is
begin
    Ada.Text_IO.Put_Line("Server procedure - Started.");
    -- Sockets.Send_UDP_Message;
    Ada.Text_IO.Put_Line("Server procedure - Finished.");
end Server;
