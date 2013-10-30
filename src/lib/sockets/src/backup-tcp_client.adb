with Ada.Text_IO;
with Sockets;

procedure TCP_Client is
begin
    Ada.Text_IO.Put_Line("DEBUG: TCP Client procedure - Started");
    Sockets.Send_TCP_Message;
    Ada.Text_IO.Put_Line("DEBUG: TCP Client procedure - Finished");
end TCP_Client;
