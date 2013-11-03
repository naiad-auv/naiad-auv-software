with System;

package Common_Tasks is

    task type Cyclic(Pri : System.Priority;
                        Cycle_Time : Positive;
                        Task_ID : Positive) is
        pragma Priority(Pri);
    end Cyclic;

end Common_Tasks;
