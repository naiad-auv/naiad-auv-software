with System.Machine_Code;

package body AVR.AT90CAN128.INTERRUPT is

   procedure enableInterrupt is
   begin
      --System.Machine_Code.Asm ("sei", Volatile => True);
	  null;
   end enableInterrupt;

   procedure disableInterrupt is
   begin
      System.Machine_Code.Asm ("cli", Volatile => True);
   end disableInterrupt;

end AVR.AT90CAN128.INTERRUPT;
