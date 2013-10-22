with Ada.Text_IO;
with Sockets;

procedure Client is
begin
    Ada.Text_IO.Put_Line("DEBUG: Client procedure - Started");
    Sockets.Send_UDP_Message;
    Ada.Text_IO.Put_Line("DEBUG: Client procedure - Finished");
end Client;
