pragma Profile(Ravenscar);

with Ada.Text_IO;

procedure Main is

    -- Task type defintion
    task type Awesome_Task(ID : Positive) is
    end Awesome_Task;

    -- Task body
    task body Awesome_Task is
        i: Integer := 1;
    begin
        loop
            Ada.Text_IO.Put_Line("Awesome Task" & Integer'Image(ID));
            i := 1 + i;
            exit when i = 10;
        end loop;
    end Awesome_Task;

    -- Declare and initialise the tasks.
    T1 : Awesome_Task(1);
    T2 : Awesome_Task(2);
    T3 : Awesome_Task(3);

begin
    -- Insert code here.
    -- Wait for threads to terminate.
    null;
end Main;
