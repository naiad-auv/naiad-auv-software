with Ada.Real_Time;
with Ada.Text_IO;

package body Common_Tasks is

    task body Task_One is
        use Ada.Real_Time;
        i: Integer := 1;

        Cycle_Time : Positive := 500000;
        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_Time.Microseconds(Cycle_Time);
    begin
        Ada.Text_IO.Put_Line("Task_One - Start");
        Next_Period := Ada.Real_Time.Clock + Period;
        loop
            delay until Next_Period;

            Ada.Text_IO.Put_Line("Task_One - " & Integer'Image(i));

            Next_Period := Next_Period + Period;
            i := i + 1;
            exit when i = 6;
        end loop;
        Ada.Text_IO.Put_Line("Task_One - End");
    end Task_One;

end Common_Tasks;
