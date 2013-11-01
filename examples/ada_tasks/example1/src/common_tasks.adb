pragma Profile(Ravenscar);

with Ada.Text_IO;

package body Common_Tasks is

    -- Task body
    task body Task_One is
        i: Integer := 1;
    begin
        Ada.Text_IO.Put_Line("Task_One - Start");
        loop
            Ada.Text_IO.Put_Line("Task_One - " & Integer'Image(i));
            i := 1 + i;
            exit when i = 10;
        end loop;
        Ada.Text_IO.Put_Line("Task_One - End");
    end Task_One;

end Common_Tasks;
