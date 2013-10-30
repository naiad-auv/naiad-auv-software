-- Use this file to manually test/debug the functionality in Sockets.Tcp
-- This is NOT a unit test file.


with Sockets.Tcp;
with Ada.Text_IO;

procedure Main is
begin
    Ada.Text_IO.Put_Line("Test main file.");
    Sockets.Tcp.Run;
end Main;
