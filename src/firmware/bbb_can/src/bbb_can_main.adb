

---------------------------------------------------------------------------
-- This code tests the communication between the BeagleBone Black (BBB) and
-- the CAN-link.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-28

-- TODO: hardware testing

---------------------------------------------------------------------------
with Ada.Command_line;
with Ada.Text_IO;
with GNAT.Serial_Communications;

with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
with BBB_CAN;


procedure BBB_CAN_main is
   pragma Suppress (All_Checks);


   msg : AVR.AT90CAN128.CAN.CAN_Message;

   bMsg : Boolean;
   bOk  : Boolean;



begin

   if Ada.Command_line.Argument_Count /= 2 then
      Ada.Text_IO.Put_Line("Please provide two arbuments, the name of the serial port (excluding '/dev/') and the baudrate (9600, 38400, 57600 or 115200)");
      return;
   else
      declare
         sPort : String := Ada.Command_line.Argument(1);
         baud : GNAT.Serial_Communications.Data_Rate;
      begin
         if Ada.Command_line.Argument(2) = "9600" then
            baud := GNAT.Serial_Communications.B9600;
         elsif Ada.Command_line.Argument(2) = "38400" then
            baud := GNAT.Serial_Communications.B38400;
         elsif Ada.Command_line.Argument(2) = "57600" then
            baud := GNAT.Serial_Communications.B57600;
         elsif Ada.Command_line.Argument(2) = "115200" then
            baud := GNAT.Serial_Communications.B115200;
         else
            Ada.Text_IO.Put_Line("ERROR: Incorrect baudrate!");
            return;
         end if;
         BBB_CAN.Init(sPort, baud);
      end;
   end if;

   msg.ID := (10, false);
   msg.Len := 3;
   msg.Data := (1, 1, 1, 1, 1, 1, 1, 1);
   BBB_CAN.Send(msg);

   loop
      delay(0.1);

      BBB_CAN.Get(msg, bMsg, bOk);

      if bMsg then
         if Integer(msg.ID.Identifier) = 15 then
            msg.ID.Identifier := AVR.AT90CAN128.CAN.CAN_Identifier(16);
            BBB_CAN.Send(msg);
         end if;
      end if;

   end loop;


end BBB_CAN_main;
