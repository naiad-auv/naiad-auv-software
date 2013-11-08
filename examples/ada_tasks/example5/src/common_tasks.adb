with Ada.Real_Time;
with Ada.Text_IO;

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
    -- pp. 440 - 441, ISBN: 978-0-521-86697-2
    task body Cyclic is
        use Ada.Real_Time;
        i: Integer := 1;
        Old_Value : Integer;

        Seconds_Since_Epoch : Ada.Real_Time.Seconds_Count;
        Fractional_Time: Ada.Real_Time.Time_Span;

        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task type cyclic - Start, ID: "
                                & Integer'Image(Task_ID));
        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;

            Old_Value := My_Data.Read;
            My_Data.Increment(Increment_By);

            Ada.Real_Time.Split(Next_Period, Seconds_Since_Epoch,
                                    Fractional_Time);

            Ada.Text_IO.Put_Line("Task"
                                & Integer'Image(Task_ID)
                                & " -"
                                & Integer'Image(Old_Value)
                                & " +"
                                & Integer'Image(Increment_By)
                                & " ="
                                & Integer'Image(My_Data.Read)
                                & " - ("
                                    & Ada.Real_Time.Seconds_Count'Image(
                                        Seconds_Since_Epoch) &
                                    " +" &
                                    Duration'Image(
                                        Ada.Real_Time.To_Duration(
                                            Fractional_Time)) & ")");


            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task type cyclic - End, ID:"
                                & Integer'Image(Task_ID));
    end Cyclic;

    C1: Cyclic(20, 200, 1, 3);
    C2: Cyclic(15, 300, 2, 5);

end Common_Tasks;
