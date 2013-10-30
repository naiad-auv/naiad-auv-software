-- Use this file to manually test/debug the functionality in
-- Sockets.Tcp.Listener package.
--
-- This is NOT a unit test file.
pragma Profile (Ravenscar);

with Sockets.Tcp.Listener;
with Ada.Text_IO;

procedure Sockets_Tcp_Listener_Main is
begin
    Ada.Text_IO.Put_Line("Started debugging Sockets.Tcp.Listener package.");
    Sockets.Tcp.Listener.Task1;
    Ada.Text_IO.Put_Line("Finished debugging Sockets.Tcp.Listener package.");
end Sockets_Tcp_Listener_Main;
