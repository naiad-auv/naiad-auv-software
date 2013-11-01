with Ada.Text_IO;
separate(Client.Subclient)
task body Agent is
    i: Integer := 1;
begin
    loop
        Ada.Text_IO.Put_Line("Test - Subclient");
        i := 1 + i;
        exit when i = 10;
    end loop;
end Agent;
