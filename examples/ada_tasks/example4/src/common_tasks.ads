with System;

package Common_Tasks is

    -- Example from "Concurrent and Real-Time Programming
    -- in Ada by Alan Burns and Andy Wellings
    -- pp. 440 - 441, ISBN: 978-0-521-86697-2
    task type Cyclic(Pri : System.Priority;
                        Cycle_Time : Positive;
                        Task_ID : Positive) is
        pragma Priority(Pri);
    end Cyclic;

end Common_Tasks;
