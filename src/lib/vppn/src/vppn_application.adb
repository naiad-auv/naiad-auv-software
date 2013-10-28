With Ada.Text_IO;
With Sockets;

procedure Vppn_Application is

begin
    Ada.Text_IO.Put_Line("Test build");
    Sockets.Listen_On_TCP_Socket;
end Vppn_Application;
