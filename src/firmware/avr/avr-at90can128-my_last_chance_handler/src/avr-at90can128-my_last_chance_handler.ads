
with System;

package AVR.AT90CAN128.My_Last_Chance_Handler is

    procedure Last_Chance_Handler
       (Source_Location : System.Address; Line : Integer);
     pragma Export (C, Last_Chance_Handler,
                    "__gnat_last_chance_handler");

end AVR.AT90CAN128.My_Last_Chance_Handler;


