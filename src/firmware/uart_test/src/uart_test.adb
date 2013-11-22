
with UartWrapper;

package body Uart_Test is


   procedure init is
      pxUart : UartWrapper.pCUartHandler;
   begin
      pxUart := UartWrapper.pxCreate("/dev/ttyACM1", UartWrapper.B115200, 0.2, 200, 1);
   end init;

end Uart_Test;
