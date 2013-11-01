pragma Profile(Ravenscar);

procedure Main is

    task type Task_One;

    task body Task_One is
        i: Integer := 1;
    begin
        loop
            i := 1 + i;
            exit when i = 10;
        end loop;
    end Task_One;

begin
    -- Insert code here.
    null;
end Main;
