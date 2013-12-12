-- Written by Cezar Chiru for project Naiad on 2013 - 11 - 22

with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.USART;
with Ada.Unchecked_Conversion;
with Interfaces;

package body TEMP_SENSOR_1WIRE is

   -- Read_temp procedure will return the temperature of the DS18B20 sensor
   -- the returned value is an Unsigned_8 type and if the value is greater than
   -- 128 then the value will be negative otherwise positive, so for example the
   -- value 129 will represent -1 degrees Celsius and the value 139 will represent
   -- (-10) degress Celsius and so on. The maximum values that the temp sensor can
   -- measure are -55 degrees Celsius --> +125 degrees C.
   -- If the returned value is 16#FF# then the conversion failed for some reason.

   procedure Read_temp(Temp_C : out Interfaces.Unsigned_8 ) is
      bool : boolean;
      buf : String (1..10);
      Num: integer;
      low_8,high_8 : Interfaces.Unsigned_8;
      Temp,Temperature,TEMP_c1 :Interfaces.Unsigned_8 :=0 ;
      sign_t : boolean;
      low_byte, high_byte : Interfaces.Unsigned_8;
      low,high: interfaces.Unsigned_8;
      use interfaces;

      function char_U8 is
        new Ada.Unchecked_Conversion (Source => character,
                                      Target => Interfaces.Unsigned_8);

   begin
      avr.at90can128.USART.Init(avr.at90can128.USART.USART1,avr.at90can128.USART.BAUD9600);
      bool := avr.AT90CAN128.USART.Put(Character'Val(16#E3#) ,Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#C1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#E1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#CC#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#44#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#E3#),Port => avr.at90can128.USART.USART1);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#C1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#C1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#E1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#CC#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#BE#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      for i in Integer range 1..2 loop
         bool := avr.AT90CAN128.USART.Put( Character'Val(16#FF#),Port => avr.at90can128.USART.USART1);
      end loop;
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#E3#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(10);
      bool := avr.AT90CAN128.USART.Put( Character'Val(16#C1#),Port => avr.at90can128.USART.USART1);
      avr.AT90CAN128.CLOCK.Delay_ms(50);
      avr.AT90CAN128.USART.Read(Buffer => BUF,Port => avr.AT90CAN128.USART.USART1,Size => 10, Num => Num);
      avr.AT90CAN128.CLOCK.Delay_ms(1000);

      if Num=10 then
         low_byte:= char_U8 ( Buf ( 8 ) );
         high_Byte:= char_U8 ( Buf ( 9 ) );

         if high_byte < 8 then
            sign_t := FALSE; -- positive temp
            Temp := Interfaces.Shift_Right ( low_bYTE , 4 );
            Temp_C1 := high_byte * 16 + Temp;
            Temp_C := temp_c1;
            if Temp_C=85 then
               Temp_C:=16#FF#;
            end if;
         else
            sign_t := TRUE; -- negative temp
            low_byte := 16#FF# - low_byte ;
            low_8 := Interfaces.Shift_Right ( low , 4 );
            high_8 := Interfaces.Shift_Left ( high_byte , 5 );
            high_byte := Interfaces.Shift_Right ( high_8 , 5 );
            Temp_C1 := high_byte * 16 + low_8 + 128;
            Temp_C :=Temp_C1;
            if Temp_C=85 then
               Temp_C:=16#FF#;
            end if;

         end if;
      else
         Temp_C := 16#FF#;
      end if;
   end Read_temp;

end TEMP_SENSOR_1WIRE;
