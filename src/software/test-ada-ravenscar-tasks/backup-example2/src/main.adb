with Ada.Text_IO;

procedure Main is
    subtype Value is String(1 .. 10);

    -- Protected object specification
    protected type Protected_Data_Type is
        procedure write (Task_ID: Value);
    private
        Barrier : Boolean := False;
    end Protected_Data_Type;

    Protected_Data : Protected_Data_Type;

    -- Protected object declaration
    protected body Protected_Data_Type is
        procedure Write (Task_ID: Value) is
        begin
            Ada.Text_IO.Put_Line("Task that has access to this Protected object: " & Task_ID);
        end Write;
    end Protected_Data_Type;

    -- Task type defintion
    task type Awesome_Task(ID : Positive) is
    end Awesome_Task;

    task body Awesome_Task is
        i: Integer := 1;
    begin
        loop
            Ada.Text_IO.Put_Line("Awesome Task" & Integer'Image(ID));
            i := 1 + i;
            exit when i = 10;
        end loop;
    end Awesome_Task;

    T1 : Awesome_Task(1);
    T2 : Awesome_Task(2);
    T3 : Awesome_Task(3);

begin
    -- Insert code here.
    -- Wait for threads to terminate.
    null;
end Main;
