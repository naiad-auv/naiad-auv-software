-- Use this file to manually test/debug the functionality in
-- Sockets.Tcp.Listener
--
-- This is NOT a unit test file.


with Sockets.Tcp.Listener;
with Ada.Text_IO;

procedure Main is
begin
    Ada.Text_IO.Put_Line("Test main file.");
    Sockets.Tcp.Listener.Run;
end Main;
