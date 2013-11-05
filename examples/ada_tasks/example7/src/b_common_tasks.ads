with Ada.Real_Time;
with System;

package B_Common_Tasks is

    task type Tcp_Sender_Type(Pri : System.Priority;
                        Cycle_Time : Positive;
                        Task_ID : Positive;
                        Increment_By : Positive) is
        pragma Priority(Pri);
    end Tcp_Sender_Type;

    task type Tcp_Listener_Type(Task_ID : Positive) is
    end Tcp_Listener_Type;
    -- Example partly from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 440 - 441, ISBN: 978-0-521-86697-2
--    task type Cyclic(Pri : System.Priority;
--                        Cycle_Time : Positive;
--                        Task_ID : Positive;
--                        Increment_By : Positive) is
--        pragma Priority(Pri);
--    end Cyclic;

    -- Example partly from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 441 - 442, ISBN: 978-0-521-86697-2
    protected Epoch is
        procedure Get_Start_Time(Time : out Ada.Real_Time.Time);
    private
        pragma Priority(System.Priority'Last);
        Start : Ada.Real_Time.Time;
        First : Boolean := True;
    end Epoch;

    -- Example from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 131 - 132, ISBN: 978-0-521-86697-2
    protected type Shared_Integer(Initial_Value : Integer) is
        function Read return Integer;
        procedure Write(New_Value : Integer);
    private
        The_Data : Integer := Initial_Value;
    end Shared_Integer;

    Tcp_Input_Data : Shared_Integer(0);
    Tcp_Output_Data : Shared_Integer(0);

end B_Common_Tasks;
