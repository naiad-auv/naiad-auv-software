-- Example from Concurrent and Real-Time Programming in Ada
-- Alan burns and Andy Wellings
pragma Profile(Ravenscar);

with Ada.Text_IO;
with Ada.Real_Time;

procedure Main is
    use Ada.Real_Time;

    task type Cyclic(Pri: System.Priority; Cycle_Time: Positive) is
        pragma Priority(Pri);
    end Cyclic;

    task body Cyclic is
        Next_Period : Ada.Real_Time.Time;
        Period : constant Ada.Real_Time.Time_Span :=
                            Ada.Real_time.Microseconds(Cycle_Time);
    begin
        Next_Period := Ada.Real_time.Clock + Period;
        loop
            delay until Next_Period;
            Ada.Text_IO.Put_Line("Next run");

            Next_Period := Next_Period + Period;
        end loop;
    end Cyclic;

    -- Declaration of tasks
    C1: Cyclic(20,200);
    C1: Cyclic(15,100);
begin
    -- Insert code here.
    null;
end Main;
