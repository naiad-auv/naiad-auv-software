with AVR.AT90CAN128;
with AVR.AT90CAN128.INTERRUPT;
with AVR.AT90CAN128.SPI;

package body gyroController is

   Waiting : Integer := 0;
   pragma Volatile (Waiting);

   procedure INT3_Interrupt;
   pragma Machine_Attribute (INT3_Interrupt, "signal");
   pragma Export (C, INT3_Interrupt, AVR.AT90CAN128.Vector_Int3);

   procedure INT3_Interrupt is
   begin
      Data_ready := AVR.AT90CAN128.PORTD.Bit_3;
      if Data_ready = False and isStarted = True then
         read_gyro;
      end if;
   end INT3_Interrupt;

   procedure Timer;
   pragma Machine_Attribute (Timer, "signal");
   pragma Export (C, Timer, AVR.AT90CAN128.Vector_Timer1_CompA);

   procedure Timer is
   begin
      if Waiting > 0 then
         Waiting := Waiting - 1;
      end if;
   end Timer;

   procedure micro_delay (duration : Natural) is
   begin
      Waiting := duration;
      while Waiting /= 0 loop
         null;
      end loop;
   end micro_delay;

   procedure init_ext_interrupt is
   begin
      AVR.AT90CAN128.DDRD.Bit_3 := False;

      AVR.AT90CAN128.INTERRUPT.disableInterrupt;

      AVR.AT90CAN128.EIMSK := (others => False);

      AVR.AT90CAN128.EICRA.Bit_7 := False;
      AVR.AT90CAN128.EICRA.Bit_6 := True;

      AVR.AT90CAN128.EIFR := (others => False);
      AVR.AT90CAN128.EIMSK.Bit_3 := True;
      AVR.AT90CAN128.INTERRUPT.enableInterrupt;

   end init_ext_interrupt;

   procedure init_timer is
      use AVR.AT90CAN128;
   begin
      AVR.AT90CAN128.INTERRUPT.disableInterrupt;
      -- Using Timer 1 for Tick
      TCCR1A := (others => False);
      TCCR1B := (Bit_3 => True, Bit_1 => True, others => False);
      TCCR1C := (Bit_7 => True, others => False);
      OCR1A := 20;
      TCNT1 := 0;
      TIMSK1 := (Bit_1 => true, others => False) ;      --Timer 1 Interrupt
      AVR.AT90CAN128.INTERRUPT.enableInterrupt;
   end init_timer;

   procedure write_register (start : reg; wdata : Interfaces.Unsigned_8) is
      use AVR.AT90CAN128.SPI;
      use Interfaces;
   begin
      writeSPI(WRITE_REG + Interfaces.Unsigned_8(start));
      writeSPI(0);
      writeSPI(wdata);
   end write_register;

   function read_register(start : reg) return Interfaces.Unsigned_8 is
      rdata : Interfaces.Unsigned_8;
      use AVR.AT90CAN128.SPI;
      use Interfaces;
   begin
      writeSPI(READ_REG + Interfaces.Unsigned_8(start));
      writeSPI(0);
      micro_delay(1);
      rdata := readSPI;
      return rdata;
   end read_register;

   procedure calibrate is
   begin
      AVR.AT90CAN128.SPI.writeSPI(CALIBRATE_CMD);
   end calibrate;

   procedure read_gyro is
      rval : gyro_val;
   begin
      for i in 1 .. 3 loop
         rval(i) := AVR.AT90CAN128.SPI.readSPI;
      end loop;

      gyro := rval;
   end read_gyro;

   function get_yaw return gyro_val is
      ret : gyro_val;
   begin
      AVR.AT90CAN128.INTERRUPT.disableInterrupt;
      ret := gyro;
      AVR.AT90CAN128.INTERRUPT.enableInterrupt;
      Data_ready := AVR.AT90CAN128.PORTD.Bit_3;
      return ret;
   end get_yaw;


   procedure init is
   begin
      init_timer;
      init_ext_interrupt;
      AVR.AT90CAN128.SPI.Init(Clock_Divisor => AVR.AT90CAN128.SPI.By_16,
                              Clock_Mode    => AVR.AT90CAN128.SPI.Setup_Rising_Sample_Falling,
                              isMaster      => True,
                              MSB_First     => True,
                              Use_SS_Pin    => True);
      write_register( 0 , 16#01#);
      write_register( 16#03# , 16#00#);
      calibrate;
   end init;

   procedure start is
   begin
      while Data_ready /= False loop
         null;
      end loop;
      AVR.AT90CAN128.SPI.writeSPI(RDATAC_CMD);
      micro_delay(1);
      read_gyro;
      isStarted := True;
   end start;


end gyroController;
