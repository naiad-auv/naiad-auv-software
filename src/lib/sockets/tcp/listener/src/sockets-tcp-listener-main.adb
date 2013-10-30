-- Use this file to manually test/debug the functionality in
-- Sockets.Tcp.Listener package.
--
-- This is NOT a unit test file.

with Sockets.Tcp.Listener;
with Ada.Text_IO;

procedure Main is
begin
    Ada.Text_IO.Put_Line("Started debugging Sockets.Tcp.Listener package.");
    Sockets.Tcp.Listener.Run;
end Main;
