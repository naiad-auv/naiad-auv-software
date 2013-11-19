
package AVR.AT90CAN128.SPI is

   DDR_SCK 	: Boolean renames DDRB.Bit_1;
   DDR_MISO 	: Boolean renames DDRB.Bit_3;
   DDR_MOSI	: Boolean renames DDRB.Bit_2;
   DDR_SS	: Boolean renames DDRB.Bit_0;
   SS		: Boolean renames PORTB.Bit_0;

   type Clock_Mode_Type is
     (
      Sample_Rising_Setup_Falling,
      Sample_Falling_Setup_Rising,
      Setup_Rising_Sample_Falling,
      Setup_Falling_Sample_Rising
     );

   type Clock_Divisor_Type is
     (
      By_2,
      By_4,
      By_8,
      By_16,
      By_32,
      By_64,
      By_64_2X,
      By_128
     );

    procedure Init
     (
      Clock_Divisor :	in      Clock_Divisor_Type;
      Clock_Mode :	in      Clock_Mode_Type;
      isMaster	:	in 	Boolean;
      MSB_First :	in      Boolean;    -- LSB or MSB First
      Use_SS_Pin :	in      Boolean     -- Use SS to select slave
     );

   procedure SPI_IO (Buffer : in out Interfaces.Unsigned_8);

   function readSPI return Interfaces.Unsigned_8;

   procedure writeSPI (Buffer : in Interfaces.Unsigned_8);

   procedure enableDevice (Enable : Boolean);

   procedure selectSlave (activate : Boolean);

private

   Config_Clock_Divisor	:	Clock_Divisor_Type := By_128;
   Config_Clock_Mode	:	Clock_Mode_Type := Sample_Rising_Setup_Falling;
   Config_MSB_First	:	Boolean := True;
   Config_SS_Pin	:       Boolean := True;
   Config_Master	:	Boolean := True;

end AVR.AT90CAN128.SPI;


