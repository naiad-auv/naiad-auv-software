--------------------------------------------------------------------------
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-09

--  TODO: Hardware testing....
--------------------------------------------------------------------------

with AVR.AT90CAN128.CAN;

with Can_Float_Conversions;
with Str2Float;

with AT90CAN_Ins_Controller_Utils;

with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.Digital_IO;

package body AT90CAN_Ins_Controller is

   pragma Suppress (All_Checks);

   bImuInterrupt : boolean := false;

   procedure Init(port : AVR.AT90CAN128.USART.USARTID; canBaud_Rate : Can_Defs.Baud_Rate; bUseExtendedID : Boolean) is
      tempMSG : CAN_Defs.CAN_Message;
   begin

      usart_port := port;

      AVR.AT90CAN128.CAN.Can_Init(canBaud_Rate);

      AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(0,(CAN_Defs.MSG_SIMULATION_MODE_ID.Identifier, bUseExtendedID),
                                             (536870911, bUseExtendedID));


      tempMSG.ID := (1, false);
      tempMSG.Len := 8;
      tempMSG.Data := (1, 2, 3, 4, 5, 6, 7, 8);

      AVR.AT90CAN128.CAN.Can_Send(tempMSG);

      bExtendedIds := bUseExtendedID;

      AVR.AT90CAN128.CLOCK.Delay_ms(1000);

      AT90CAN_Ins_Controller_Utils.Init_Uart(port, AVR.AT90CAN128.USART.BAUD115200);

      AT90CAN_Ins_Controller_Utils.Communication_Protocol_Control(usart_port);
      AT90CAN_Ins_Controller_Utils.Async_Data_Output_Type_Register_Off(usart_port);
      AT90CAN_Ins_Controller_Utils.Async_Data_Output_Frequency_Register(usart_port);
      AT90CAN_Ins_Controller_Utils.Synchronization_Control(usart_port);
      AT90CAN_Ins_Controller_Utils.VPE_Basic_Control(usart_port);
      AT90CAN_Ins_Controller_Utils.Async_Data_Output_Type_Register(usart_port);

      --the default 115.2 kBaud is not enough for 200 Hz output rate:
   --   Ins_Controller_Utils.Serial_Baud_Rate_Register(usart_port);

      --   Ins_Controller_Utils.Init_Uart(port, AVR.AT90CAN128.USART.BAUD230400);

      tempMSG.ID := (11, false);
      AVR.AT90CAN128.CAN.Can_Send(tempMSG);

      AVR.AT90CAN128.USART.Flush_Receive_Buffer(usart_port);

      tempMSG.ID := (12, false);
      AVR.AT90CAN128.CAN.Can_Send(tempMSG);

--        AVR.AT90CAN128.CLOCK.Delay_ms(1000);

      AT90CAN_Ins_Controller_Utils.Init_Interrupts;

      tempMSG.ID := (13, false);
      AVR.AT90CAN128.CAN.Can_Send(tempMSG);

   end Init;

   procedure Imu_Interrupt is
   begin
      bImuInterrupt := true;
   end Imu_Interrupt;


   procedure Update is
         --this function assumes the format +1235.156
      function Read_Next_Float return float is
         sTemp : String(1..1);
         iCharsRead : Integer;
         sBuffer : String(1..20);
         i : Integer := 0;
      begin
         loop
            AT90CAN_Ins_Controller_Utils.Read(sTemp, 1, iCharsRead, usart_port);

            if iCharsRead = 1 then
               exit when sTemp(1) = ',' or sTemp(1) = '*';

               i := i + 1;
               sBuffer(i) := sTemp(1);
            end if;
         end loop;

         declare
            sValue : String(1..i);
         begin
            for j in sValue'Range loop
               sValue(j) := sBuffer(j);
            end loop;

            --return Float'Value(sBuffer);
            return Str2Float.fStr2Float(sValue); --this function assumes the format +1235.156
         end;
      end Read_Next_Float;

      fXAccelerationNew : float := 0.0;
      fYAccelerationNew : float := 0.0;
      fZAccelerationNew : float := 0.0;

      msg : Can_Defs.CAN_Message;

      fGyroYaw : float := 0.0;
      fYaw, fPitch, fRoll : float;

   begin

      if  bImuInterrupt then
         bImuInterrupt := false;



         msg.ID := (3, false);
         msg.Len := 7;
         msg.Data  := (0, 0, 0, 0, 0, 0, 0, 0);
         AVR.AT90CAN128.CAN.Can_Send(msg);


         AT90CAN_Ins_Controller_Utils.Start_Message("VNYBA,", usart_port);

         msg.ID := (4, false);
         AVR.AT90CAN128.CAN.Can_Send(msg);


         fYaw 	:= Read_Next_Float;

         msg.ID := (5, false);
         AVR.AT90CAN128.CAN.Can_Send(msg);

         fPitch 	:= Read_Next_Float;
         fRoll 	:= Read_Next_Float;

         fXAccelerationNew := Read_Next_Float;
         fYAccelerationNew := Read_Next_Float;
         fZAccelerationNew := Read_Next_Float;

         msg.ID := (6, false);
         AVR.AT90CAN128.CAN.Can_Send(msg);

         AVR.AT90CAN128.USART.Flush_Receive_Buffer(usart_port);

         msg.ID := (7, false);
         AVR.AT90CAN128.CAN.Can_Send(msg);

         if not bSimulationMode then

            msg.ID := (8, false);
            AVR.AT90CAN128.CAN.Can_Send(msg);

            msg.ID := (CAN_Defs.MSG_IMU_ORIENTATION_ID.Identifier, bExtendedIds);
            Can_Float_Conversions.Orientation_To_Message(fYaw, fPitch, fRoll, msg.Data);
            msg.Len := 8;
            AVR.AT90CAN128.CAN.Can_Send(msg);

--              msg.ID := (CAN_Defs.MSG_GYRO_YAW_ID.Identifier, bExtendedIds);
--              Can_Float_Conversions.GyroReading_To_Message(fGyroYaw, msg.Data);
--              msg.Len := 3;
--              AVR.AT90CAN128.CAN.Can_Send(msg);

            msg.ID := (CAN_Defs.MSG_IMU_ACCELERATION_ID.Identifier, bExtendedIds);
            Can_Float_Conversions.Acceleration_To_Message(fXAccelerationNew, fYAccelerationNew, fZAccelerationNew, msg.Data);
            msg.Len := 8;
            AVR.AT90CAN128.CAN.Can_Send(msg);
         end if;
      end if;
   end Update;

   procedure SimulationModeOn is
   begin
      bSimulationMode := true;
   end SimulationModeOn;

   procedure SimulationModeOff is
   begin
      bSimulationMode := false;
   end SimulationModeOff;

end AT90CAN_Ins_Controller;
