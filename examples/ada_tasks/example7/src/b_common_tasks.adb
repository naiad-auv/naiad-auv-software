with Ada.Real_Time;
with Ada.Text_IO;
with GNAT.Sockets;
with Ada.Streams;

package body B_Common_Tasks is
    CRLF : constant String := ASCII.CR & ASCII.LF;
    Tmp : Ada.Streams.Stream_Element_Array (1 .. 65535);
    LISTEN_ON_ADDRESS : constant String := "127.0.0.1";
    LISTEN_ON_PORT : constant GNAT.Sockets.Port_Type := 35000;
    SEND_TO_ADDRESS : constant String := "127.0.0.1";
    SEND_TO_PORT: constant GNAT.Sockets.Port_Type := 30000;

    ------------------
    -- Read_Request --
    ------------------

    -- function Read_Request originally written by Simon Wright from
    -- https://groups.google.com/forum/#!topic/comp.lang.ada/j23Fv-uvNX8
    function Read_Request (From : GNAT.Sockets.Socket_Type) return Natural is
        use Ada.Streams;
        use Standard.ASCII;
        Last : Ada.Streams.Stream_Element_Offset := Tmp'First - 1;
        Next : Ada.Streams.Stream_Element_Offset;
        Termination : constant Ada.Streams.Stream_Element_Array :=
            (Character'Pos (CR),
            Character'Pos (LF),
            Character'Pos (CR),
            Character'Pos (LF));
        Socket_Stream_Access : GNAT.Sockets.Stream_Access := GNAT.Sockets.Stream (From);
    begin
    --  We need to read the whole request from the client. Of course
    --  we don't know how long it is. We can't just issue an
    --  Ada.Streams.Read for a large buffer, because the client may
    --  not have sent that much and if she hasn't we'll block until
    --  she gives up and closes the socket. So we read a character
    --  at a time until we've got the CR/LF/CR/LF which terminates
    --  the line.
    loop
        Ada.Streams.Read (Stream => Socket_Stream_Access.all,
                        Item => Tmp (Last + 1 .. Last + 1),
                        Last => Next);
        exit when Next = Last;

        -- Ada.Text_IO.Put(Tmp(Last));

        Last := Last + 1;
        exit when Last >= Termination'Length
        and then Tmp (Last - 3 .. Last) = Termination;
        exit when Last = Tmp'Last;
    end loop;

        --Free_Stream(S);
        return Natural(Last);
    end Read_Request;

    -----------------
    -- Get_Message --
    -----------------
    function Get_Message (N : Natural) return String is
        Result : String (1 .. N);
        for Result'Address use Tmp'Address;

    begin
        return Result;
    end Get_Message;

    --------------------
    -- Mangle_Message --
    --------------------
    -- TODO: Define how to mangle all messages.
    -- Before transmitting a message the message must be scanned for CRLF/CRLF
    -- combination and if it detects one...pad it somehow. The step must be to
    -- add CRLF/CRLF to the end.
    --
    -- The receiving end must then parse the entire message until it detects
    -- the CRLF/CRLF.

    -- Example from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 131 - 132, ISBN: 978-0-521-86697-2
    protected body Shared_Integer is
        function Read return Integer is
        begin
            return The_Data;
        end Read;

        procedure Write(New_Value : Integer) is
        begin
            The_Data := New_Value;
        end Write;
    end Shared_Integer;

    -- Example partly from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 441 - 442, ISBN: 978-0-521-86697-2
    protected body Epoch is
        procedure Get_Start_Time(Time : out Ada.Real_Time.Time) is
        begin
            if First then
                First := False;
                Start := Ada.Real_Time.Clock;
            end if;
            Time := Start;
        end Get_Start_Time;
    end Epoch;

    -- Tcp_Send
    task body Tcp_Sender_Type is
        use Ada.Real_Time;
        i: Integer := 1;

        Remote_Address  : GNAT.Sockets.Sock_Addr_Type;
        Socket          : GNAT.Sockets.Socket_Type;
        Stream_Access   : GNAT.Sockets.Stream_Access;
        --Message_Length  : Natural;

        Epoch_Time_Seconds: Ada.Real_Time.Seconds_Count;
        Epoch_Time_Fractional_Time: Ada.Real_Time.Time_Span;

        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task Tcp_Send - Start");
        Epoch.Get_Start_Time(Next_Period);

        Ada.Real_Time.Split(Next_Period, Epoch_Time_Seconds,
                                    Epoch_Time_Fractional_Time);
        Ada.Text_IO.Put_Line("Task Tcp_Send - Epoch:"
                                & Ada.Real_Time.Seconds_Count'Image(
                                    Epoch_Time_Seconds) &
                                " +" &
                                Duration'Image(
                                    Ada.Real_Time.To_Duration(
                                        Epoch_Time_Fractional_Time)) & ")");

        Remote_Address.Addr :=  GNAT.Sockets.Addresses(
                                      GNAT.Sockets.Get_Host_By_Name(
                                          SEND_TO_ADDRESS), 1);
        Remote_Address.Port := SEND_TO_PORT;

        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;
            -------------------------------------------------------------------
            -- Do Actual Work
            -------------------------------------------------------------------
            GNAT.Sockets.Initialize;
            GNAT.Sockets.Create_Socket(Socket);

            GNAT.Sockets.Set_Socket_Option(Socket,
                                            GNAT.Sockets.Socket_Level,
                                            (GNAT.Sockets.Reuse_address, True));

            GNAT.Sockets.Connect_Socket(Socket, Remote_Address);
            Stream_Access := GNAT.Sockets.Stream(Socket);

            -- Send first message, Client to Server
            String'Write (Stream_Access, "This is the first message from Client to Server" & CRLF & CRLF);

            GNAT.Sockets.Close_Socket(Socket);
            GNAT.Sockets.Finalize;
            -------------------------------------------------------------------
            -- End Actual Work
            -------------------------------------------------------------------

            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task Tcp_Send - End");
    end Tcp_Sender_Type;

    -- Tcp_Listener_Type
    task body Tcp_Listener_Type is
        use Ada.Real_Time;
        use type GNAT.Sockets.Selector_Status;

        i: Integer := 1;

        Epoch_Time_Seconds: Ada.Real_Time.Seconds_Count;
        Epoch_Time_Fractional_Time: Ada.Real_Time.Time_Span;

        Epoch_Time : Ada.Real_Time.Time;

        Listener_Socket  : GNAT.Sockets.Socket_Type;
        Listener_Address : constant GNAT.Sockets.Sock_Addr_Type := (
         Family => GNAT.Sockets.Family_Inet,
         Addr   => GNAT.Sockets.Inet_Addr (LISTEN_ON_ADDRESS),
         Port   => LISTEN_ON_PORT
        );
        Client_Socket   : GNAT.Sockets.Socket_Type;
        Client_Address  : GNAT.Sockets.Sock_Addr_Type;
        Selector_Status : GNAT.Sockets.Selector_Status;
        Message_Length  : Natural;
    begin
        Ada.Text_IO.Put_Line("Task Tcp_Listener - Start");
        Epoch.Get_Start_Time(Epoch_Time);

        Ada.Real_Time.Split(Epoch_Time, Epoch_Time_Seconds,
                                    Epoch_Time_Fractional_Time);
        Ada.Text_IO.Put_Line("Task Tcp_Listener - Epoch:"
                                & Ada.Real_Time.Seconds_Count'Image(
                                    Epoch_Time_Seconds) &
                                " +" &
                                Duration'Image(
                                    Ada.Real_Time.To_Duration(
                                        Epoch_Time_Fractional_Time)) & ")");

        --------------------------------------------------------------------
        -- Do Actual Work
        --------------------------------------------------------------------
        GNAT.Sockets.Create_Socket (Listener_Socket);
        GNAT.Sockets.Set_Socket_Option (
            Socket => Listener_Socket,
            Level  => GNAT.Sockets.Socket_Level,
            Option => (
                Name    => GNAT.Sockets.Reuse_Address,
                Enabled => True
            )
        );

        GNAT.Sockets.Bind_Socket (
            Socket  => Listener_Socket,
            Address => Listener_Address
        );

        GNAT.Sockets.Listen_Socket (Listener_Socket);
        Ada.Text_IO.Put_Line (
            "Listening on " & GNAT.Sockets.Image (Listener_Address)
        );

        loop
            GNAT.Sockets.Accept_Socket (
                Server   => Listener_Socket,
                Socket   => Client_Socket,
                Address  => Client_Address,
                Timeout  => GNAT.Sockets.Forever,
                --Selector => S.Accepting_Selector'Access,
                Status   => Selector_Status
            );

            if Selector_Status = GNAT.Sockets.Completed then
                Message_Length := Read_Request(Client_Socket);

                declare
                    Message : String(1 .. Message_Length) := Get_Message(Message_Length);
                begin
                    Ada.Text_IO.Put_Line(Message);
                end;
                Ada.Text_IO.Put_Line (
                    "Client from " & GNAT.Sockets.Image (Client_Address)
                );
                GNAT.Sockets.Close_Socket (Client_Socket);
            end if;

            i := i + 1;
            exit when i = 6;
        end loop;
        --------------------------------------------------------------------
        -- End Actual Work
        --------------------------------------------------------------------
        GNAT.Sockets.Close_Socket (Listener_Socket);
        Ada.Text_IO.Put_Line("Task Tcp_Listener - End");
    end Tcp_Listener_Type;

    Tcp_Sender : Tcp_Sender_Type(20, 1000000, 1, 3);
    Tcp_Listener: Tcp_Listener_Type(1);

end B_Common_Tasks;
