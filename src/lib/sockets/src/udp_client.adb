with Ada.Text_IO;
with Sockets;

procedure UDP_Client is
begin
    Ada.Text_IO.Put_Line("DEBUG: UDP_Client procedure - Started");
    Sockets.Send_UDP_Message;
    Ada.Text_IO.Put_Line("DEBUG: UDP_Client procedure - Finished");
end UDP_Client;
