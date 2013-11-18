
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

with AVR.AT90CAN128.INTERRUPT;

package body Imu_Handler is

   pragma Suppress (All_Checks);


   procedure Write(sData : String; iSize : Integer) is
      iTemp : Integer;
   begin
      iTemp := AVR.AT90CAN128.USART.Write(Buffer => sData,Port => usart_port, Size => iSize);
   end Write;


   procedure Send_Command(sCommand : String) is
   begin
      Write("$" & sCommand & "*" & sChecksum(sCommand, sCommand'Length), sCommand'Length + 3);
   end Send_Command;



   function sChecksum(sData : String; iSize : Integer) return String is
      u8Xor : Interfaces.Unsigned_8 := 0;
      sRet : String(1..1);

      use Interfaces;
   begin
      for i in 1..iSize loop
         u8Xor := u8Xor xor Interfaces.Unsigned_8(Character'Pos(sData(i)));
      end loop;

      sRet(1) := Character'Val(Integer(u8Xor));
      return sRet;
   end sChecksum;

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


   begin
      Init_Uart(port);

      --All commands start with a dollar sign, followed by a five character command, a comma,
      --command specific parameters, an asterisk, a checksum, and a newline character
      -- $VNRRG,11*73

      Communication_Protocol_Control;
      Async_Data_Output_Frequency_Register;
      Synchronization_Control;
      VPE_Basic_Control;

      Init_Interrupts;

      AVR.AT90CAN128.CLOCK.Delay_ms(10);
      AVR.AT90CAN128.USART.Flush_Receive_Buffer(;

   end Init;


   function Get_IMU_Data return Interfaces.Unsigned_16 is
   begin
      return Interfaces.Unsigned_16(0);
   end Get_IMU_Data;

   procedure Imu_Interrupt is
   begin
     null;
   end Imu_Interrupt;

end Imu_Handler;
