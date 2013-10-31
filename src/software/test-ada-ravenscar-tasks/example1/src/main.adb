pragma Profile(Ravenscar);

with Ada.Text_IO;

procedure Main is

    task type Awesome_Task;

    -- Task body
    task body Awesome_Task is
        i: Integer := 1;
    begin
        loop
            Ada.Text_IO.Put_Line("Awesome Task Example 1");
            i := 1 + i;
            exit when i = 10;
        end loop;
    end Awesome_Task;

begin
    -- Insert code here.
    -- Wait for threads to terminate.
    null;
end Main;
