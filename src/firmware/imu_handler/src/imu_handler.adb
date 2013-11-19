
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

with AVR.AT90CAN128.INTERRUPT;
with AVR.AT90CAN128.CLOCK;
with My_Memcpy;

package body Imu_Handler is

   pragma Suppress (All_Checks);


   procedure Write(sData : String; iSize : Integer) is
      iTemp : Integer;
   begin
      iTemp := AVR.AT90CAN128.USART.Write(Buffer => sData,Port => usart_port, Size => iSize);
   end Write;

   procedure Read(sData : out String; iSize : Integer; iCharsRead : out Integer) is
   begin
      AVR.AT90CAN128.USART.Read(sData, usart_port, iSize, iCharsRead);
   end Read;

   procedure sChecksum(sData : String; iSize : Integer; sStr : out String) is
      u8Xor : Interfaces.Unsigned_8 := 0;

      use Interfaces;
   begin
      for i in 1..iSize loop
         u8Xor := u8Xor xor Interfaces.Unsigned_8(Character'Pos(sData(i)));
      end loop;

      sStr(1) := Character'Val(Integer(u8Xor));
   end sChecksum;

   procedure Send_Command(sCommand : String) is
      sCheckSumStr : String(1..1);
   begin
      sChecksum(sCommand, sCommand'Length, sCheckSumStr);
      Write("$" & sCommand & "*" & sCheckSumStr & Character'Val(10), sCommand'Length + 3);
   end Send_Command;

   procedure Init(port : AVR.AT90CAN128.USART.USARTID) is

      procedure Init_Uart(port : AVR.AT90CAN128.USART.USARTID) is
      begin
         usart_port := port;

         AVR.AT90CAN128.USART.Init(usart_port, AVR.AT90CAN128.USART.BAUD115200);
      end Init_Uart;

      procedure Init_Interrupts is
      begin
         AVR.AT90CAN128.DDRD.Bit_2 := False;
         AVR.AT90CAN128.INTERRUPT.disableInterrupt;

         AVR.AT90CAN128.EIMSK := (others => False);

         AVR.AT90CAN128.EICRA.Bit_5 := False;
         AVR.AT90CAN128.EICRA.Bit_4 := True;

         AVR.AT90CAN128.EIFR := (others => False);
         AVR.AT90CAN128.EIMSK.Bit_2 := True;
         AVR.AT90CAN128.INTERRUPT.enableInterrupt;

      end Init_Interrupts;

      procedure Communication_Protocol_Control is
      begin
         -- 7.31 Communication Protocol Control:
         -- SerialCount = off
         -- SerialStatus  = off
         -- SPICount = off
         -- SerialChecksum = 0 (off)
         -- spi checksum = off
         --ErrorMode = off
         Send_Command("VNWRG,30,0,0,0,0,0,0,1");
      end Communication_Protocol_Control;

      procedure Async_Data_Output_Frequency_Register is
      begin
         --Async Data Output Frequency Register
         Send_Command("VNWRG,07,200");
      end Async_Data_Output_Frequency_Register;

      procedure Synchronization_Control is
      begin
         -- SyncInMode = COUNT
         --SyncInEdge = 0 rising edge
         --SyncInSkipFactor = 1
         --RESERVED
         --Set SyncOutMode to AHRS = "Trigger when attitude measurements are available"
         --Set SyncOutPolarity to IMU = Positive pulse
         --SyncOutSkipFactor = 1
         -- Async Data Output Frequency = 200 Hz
         Send_Command("VNWRG,20,3,0,1,0,3,1,1,500000,0");
      end Synchronization_Control;


      procedure VPE_Basic_Control is
      begin
         -- Enable the Vector Processing Engine (VPE).
         -- Indoor Heading
         -- Filtering Mode off
         -- Tuning Mode off
         Send_Command("VNWRG,35,1,2,0,0");
      end VPE_Basic_Control;

      procedure Async_Data_Output_Type_Register is
      begin
         --Async Data Output Type Register
         -- use Yaw, Pitch, Roll, Body True Acceleration, and Angular Rates
         Send_Command("VNWRG,06,16");
      end Async_Data_Output_Type_Register;

   begin
      Init_Uart(port);

      --All commands start with a dollar sign, followed by a five character command, a comma,
      --command specific parameters, an asterisk, a checksum, and a newline character
      -- $VNRRG,11*73

      Communication_Protocol_Control;
      Async_Data_Output_Frequency_Register;
      Synchronization_Control;
      VPE_Basic_Control;
      Async_Data_Output_Type_Register;

      Init_Interrupts;

      AVR.AT90CAN128.CLOCK.Delay_ms(10);
      AVR.AT90CAN128.USART.Flush_Receive_Buffer(usart_port);

   end Init;


   function Get_IMU_Data return Interfaces.Unsigned_16 is
   begin
      return Interfaces.Unsigned_16(0);
   end Get_IMU_Data;

   procedure Imu_Interrupt is

      function Read_Next_Float return float is
         sTemp : String(1..1);
         iCharsRead : Integer;
         sBuffer : String(1..10);
         i : Integer := 0;
      begin
         loop
            Read(sTemp, 1, iCharsRead);
            if iCharsRead = 1 then
               i := i + 1:
               sBuffer(i) := sTemp(1);
            end loop;
            exit when sBuffer(i) = ',';
         end loop;



      end Read_Next_Float;


      sBuffer : String(1..100);
      sTempString : String(1..100);

      iTemp : Integer;
      iCharsTotal : Integer := 0;
      iCharsRead : Integer := 0;

   begin
      sBuffer(1) := ' ';

      --goes to the start of the message:
      while sBuffer(1) /= '$' loop
         Read(sBuffer, 1, iTemp);
      end loop;

      -- read the "VNRRG,239,"
      while iCharsTotal < 10 loop
         Read(sTempString, 10 - iCharsTotal, iCharsRead);

         for i in 1..iCharsRead loop
            sBuffer(iCharsTotal + i) := sTempString(i);
         end loop;

         iCharsTotal := iCharsTotal + iCharsRead;
      end loop;




   end Imu_Interrupt;

end Imu_Handler;
