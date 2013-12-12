with interfaces;
with AVR.AT90CAN128.INTERRUPT;

package body AVR.AT90CAN128.SPI is

   procedure selectSlave (activate : Boolean) is
   begin
      SS := activate xor True;
   end selectSlave;

   procedure configDevice is
      begin

      SPCR.MSTR := False;

      DDR_SCK  := False;
      DDR_MISO := False;
      DDR_MOSI := False;
      DDR_SS   := False;

      if Config_SS_Pin then
         SS := True;
         DDR_SS  := True;
      end if;

      case Config_Clock_Mode is
         when Sample_Rising_Setup_Falling =>
            SPCR.CPOL := False;
            SPCR.CPHA := False;
         when Setup_Rising_Sample_Falling =>
            SPCR.CPOL := False;
            SPCR.CPHA := True;
         when Sample_Falling_Setup_Rising =>
            SPCR.CPOL := True;
            SPCR.CPHA := False;
         when Setup_Falling_Sample_Rising =>
            SPCR.CPOL := True;
            SPCR.CPHA := True;
      end case;


      case Config_Clock_Divisor is
         when By_2 =>
            SPSR.SPI2X := True;
            SPCR.SPR1 := False;
            SPCR.SPR0 := False;
         when By_4 =>
            SPSR.SPI2X := False;
            SPCR.SPR1 := False;
            SPCR.SPR0 := False;
         when By_8 =>
            SPSR.SPI2X := True;
            SPCR.SPR1 := False;
            SPCR.SPR0 := True;
         when By_16 =>
            SPSR.SPI2X := False;
            SPCR.SPR1 := False;
            SPCR.SPR0 := True;
         when By_32 =>
            SPSR.SPI2X := True;
            SPCR.SPR1 := True;
            SPCR.SPR0 := False;
         when By_64 =>
            SPSR.SPI2X := False;
            SPCR.SPR1 := True;
            SPCR.SPR0 := False;
         when By_128 =>
            SPSR.SPI2X := False;
            SPCR.SPR1 := True;
            SPCR.SPR0 := True;
         when By_64_2X =>
            SPSR.SPI2X := True;
            SPCR.SPR1 := True;
            SPCR.SPR0 := True;
      end case;

      SPCR.DORD := Config_MSB_First xor True;

   end configDevice;

   procedure enableDevice (Enable : Boolean) is
   begin

      if Enable then
         SPCR.MSTR := Config_Master;

         if Config_Master then
            if Config_SS_Pin then
               SS := True;
               DDR_SS  := True;
            end if;
            DDR_SCK  := True;
            DDR_MOSI := True;
            SPCR.SPIE := False;
         else
            DDR_MISO := True;
            SPCR.SPIE := True;
         end if;
      else
         if Config_SS_Pin then
            SS := True;
            DDR_SS  := True;
         end if;
         SPCR.SPIE := False;
      end if;

      SPCR.SPE := Enable;

   end enableDevice;

   procedure Init (
      Clock_Divisor :	in      Clock_Divisor_Type;
      Clock_Mode :	in      Clock_Mode_Type;
      isMaster	:	in 	Boolean;
      MSB_First :	in      Boolean ;
      Use_SS_Pin :	in      Boolean) is

      begin
      Interrupt.disableInterrupt;

      Config_Clock_Divisor	:= Clock_Divisor;
      Config_Clock_Mode		:= Clock_Mode;
      Config_MSB_First		:= MSB_First;
      Config_SS_Pin		:= Use_SS_Pin;
      Config_Master		:= isMaster;

      enableDevice(False);

      configDevice;

      enableDevice(True);

      Interrupt.enableInterrupt;

   end Init;

   procedure waitForSPIF is
   begin
      loop
         exit when SPSR.SPIF;
      end loop;
   end waitForSPIF;

   procedure masterSPI_IO (Buffer : in out Interfaces.Unsigned_8) is
   begin
      SPDR := Buffer;
      waitForSPIF;
      Buffer := SPDR;
   end masterSPI_IO;

   procedure slaveSPI_IO (Buffer : in out Interfaces.Unsigned_8) is
      tmp : Interfaces.Unsigned_8;
   begin
      waitForSPIF;
      tmp := SPDR;
      SPDR := Buffer;
      Buffer := tmp;
   end slaveSPI_IO;

   procedure SPI_IO (Buffer : in out Interfaces.Unsigned_8) is
   begin
      if Config_Master then
         masterSPI_IO (Buffer);
      else
         slaveSPI_IO (Buffer);
      end if;
   end SPI_IO;

   function readSPI return Interfaces.Unsigned_8 is
      tmp : Interfaces.Unsigned_8 := 0;
   begin
      SPI_IO (tmp);
      return tmp;
   end readSPI;

   procedure writeSPI (Buffer : in Interfaces.Unsigned_8) is
      tmp : Interfaces.Unsigned_8 := Buffer;
   begin
      SPI_IO (tmp);
   end writeSPI;


end AVR.AT90CAN128.SPI;


