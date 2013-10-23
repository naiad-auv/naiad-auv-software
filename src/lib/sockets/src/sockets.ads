with GNAT.Sockets;

package Sockets is

    type Socket_Type is tagged
        record
            Address : String(1 .. 255);
        end record;

    subtype Port_Type is Positive range 1 .. 65535;

    type Datagram_Socket_Type is new Socket_Type with
        record
            Port : Port_Type;
        end record;

    procedure Send_UDP_Message;
    procedure Listen_On_Socket;
end Sockets;
