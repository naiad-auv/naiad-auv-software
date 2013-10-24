with GNAT.Sockets; use GNAT.Sockets;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.Streams; use Ada.Streams;
with Sockets;

procedure udptest is
    Address  : Sock_Addr_Type;
    Socket   : Socket_Type;
    Kahnung  : Ada.Streams.Stream_Element_Array := (1, 56, 3, 4);
    Last     : Ada.Streams.Stream_Element_Offset;

begin
    Address.Addr :=  GNAT.Sockets.Addresses(
                                GNAT.Sockets.Get_Host_By_Name(
                                    GNAT.Sockets.Host_Name), 1);
    Address.Port := 50000;

    Initialize (Process_Blocking_IO => False);

    Create_Socket (Socket, Family_Inet, Socket_Datagram);
    Send_Socket (Socket, Kahnung, Last, Address);
    Receive_Socket (Socket, Kahnung, Last);

    Close_Socket(Socket);
    Finalize;
end udptest;
