with AVR.AT90CAN128.INTERRUPT;

package body AVR.AT90CAN128.BOOTLOADER is

   procedure switch_to_bootloader is
   begin
      AVR.AT90CAN128.INTERRUPT.disableInterrupt;
      while AVR.AT90CAN128.EECR.EEWE loop
         null;
      end loop;
      AVR.AT90CAN128.EEARH := 0;
      AVR.AT90CAN128.EEARL := 0;
      AVR.AT90CAN128.EEDR := 16#FF#;
      AVR.AT90CAN128.EECR.EEMWE := True;
      AVR.AT90CAN128.EECR.EEWE := True;

      AVR.AT90CAN128.WDTCR.WDCE := True;
      AVR.AT90CAN128.WDTCR.WDP := 0;
      AVR.AT90CAN128.WDTCR.WDCE := True;
      AVR.AT90CAN128.WDTCR.WDE := True;
   end switch_to_bootloader;

end AVR.AT90CAN128.BOOTLOADER;
