with Ada.Text_IO;

package body Sockets.Tcp.Listener is

        task body Task1 is
        i: Integer := 1;
        begin
            loop
                    Ada.Text_IO.Put_Line("DEBUG: Loop message..");
                    i := i + 1;
                    exit when i = 10;
            end loop;
            Ada.Text_IO.Put_Line("DEBUG: Starting Tcp.Listener..");
            Ada.Text_IO.Put_Line("DEBUG: Stopping Tcp.Listener..");
        end task1;

end Sockets.Tcp.Listener;
