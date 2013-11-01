with Ada.Real_Time;
with Ada.Text_IO;

package body Common_Tasks is

    -- Task Two
    task body Task_One is
        use Ada.Real_Time;

        i: Integer := 1;

        Seconds_Since_Epoch : Ada.Real_Time.Seconds_Count;
        Fractional_Time: Ada.Real_Time.Time_Span;

        Cycle_Time : Positive := 500000;
        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task_One - Start");
        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;

            Ada.Real_Time.Split(Next_Period, Seconds_Since_Epoch,
                                    Fractional_Time);

            Ada.Text_IO.Put_Line("Task_One - " &
                                    Ada.Real_Time.Seconds_Count'Image(
                                        Seconds_Since_Epoch) &
                                    " +" &
                                    Duration'Image(
                                        Ada.Real_Time.To_Duration(
                                            Fractional_Time)));

            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task_One - End");
    end Task_One;

    -- Task Two
    task body Task_Two is
        use Ada.Real_Time;

        i: Integer := 1;

        Seconds_Since_Epoch : Ada.Real_Time.Seconds_Count;
        Fractional_Time: Ada.Real_Time.Time_Span;

        Cycle_Time : Positive := 250000;
        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task_Two - Start");
        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;

            Ada.Real_Time.Split(Next_Period, Seconds_Since_Epoch,
                                    Fractional_Time);

            Ada.Text_IO.Put_Line("Task_Two - " &
                                    Ada.Real_Time.Seconds_Count'Image(
                                        Seconds_Since_Epoch) &
                                    " +" &
                                    Duration'Image(
                                        Ada.Real_Time.To_Duration(
                                            Fractional_Time)));

            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task_Two - End");
    end Task_Two;

end Common_Tasks;
