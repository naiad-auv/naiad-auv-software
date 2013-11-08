with System;

package Common_Tasks is

    -- Example partly from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 440 - 441, ISBN: 978-0-521-86697-2
    task type Cyclic(Pri : System.Priority;
                        Cycle_Time : Positive;
                        Task_ID : Positive;
                        Increment_By : Positive) is
        pragma Priority(Pri);
    end Cyclic;

    -- Example from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 131 - 132, ISBN: 978-0-521-86697-2
    protected type Shared_Integer(Initial_Value : Integer) is
        function Read return Integer;
        procedure Write(New_Value : Integer);
        procedure Increment(By : Integer);
    private
        The_Data : Integer := Initial_Value;
    end Shared_Integer;

    My_Data : Shared_Integer(42);

end Common_Tasks;
