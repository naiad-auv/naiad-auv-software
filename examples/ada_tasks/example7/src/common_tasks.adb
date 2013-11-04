with Ada.Real_Time;
with Ada.Text_IO;
with GNAT.Sockets;

package body Common_Tasks is

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

        procedure Increment(By : Integer) is
        begin
            The_Data := The_Data + By;
        end Increment;
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

--        Seconds_Since_Epoch : Ada.Real_Time.Seconds_Count;
--        Fractional_Time: Ada.Real_Time.Time_Span;
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

        --------------------------------------------------------------------
        -- Do Actual Work
        --------------------------------------------------------------------

        --------------------------------------------------------------------
        -- End Actual Work
        --------------------------------------------------------------------

        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;
            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task Tcp_Send - End");

    end Tcp_Sender_Type;

    -- Tcp_Listener_Type
    task body Tcp_Listener_Type is
        use Ada.Real_Time;
        i: Integer := 1;

--        Seconds_Since_Epoch : Ada.Real_Time.Seconds_Count;
--        Fractional_Time: Ada.Real_Time.Time_Span;
        Epoch_Time_Seconds: Ada.Real_Time.Seconds_Count;
        Epoch_Time_Fractional_Time: Ada.Real_Time.Time_Span;

        Next_Period : Ada.Real_Time.Time;
--        Period : constant Ada.Real_Time.Time_Span :=
--                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task Tcp_Listener - Start");
        Epoch.Get_Start_Time(Next_Period);

        Ada.Real_Time.Split(Next_Period, Epoch_Time_Seconds,
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

        --------------------------------------------------------------------
        -- End Actual Work
        --------------------------------------------------------------------

--        Next_Period := Ada.Real_Time.Clock + Period;
        loop
--            delay until Next_Period;
--            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task Tcp_Listener - End");

    end Tcp_Listener_Type;

    Tcp_Sender : Tcp_Sender_Type(20, 200, 1, 3);
    Tcp_Listener: Tcp_Listener_Type(1);

end Common_Tasks;
