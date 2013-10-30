-- Use this file to manually test/debug the functionality in Sockets.Tcp
-- This is NOT a unit test file.
pragma Profile (Ravenscar);

with Sockets.Tcp;
with Ada.Text_IO;

procedure Sockets_Tcp_Main is
begin
    Ada.Text_IO.Put_Line("Test main file.");
    Sockets.Tcp.Run;
end Sockets_Tcp_Main;
