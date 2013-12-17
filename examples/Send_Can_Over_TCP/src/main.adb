with TCPCANWrapper;
with TCPWrapper;
with CAN_Defs;
with Can_Float_Conversions;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
   xMessage : CAN_Defs.CAN_Message;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);
   xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_POSITION_ID;
   xMessage.Len := 1;
   Can_Float_Conversions.Acceleration_To_Message(fAccX            => 12.4,
                                                 fAccY            => 0.0,
                                                 fAccZ            => 0.0,
                                                 b8Message        => xMessage.Data,
                                                 fAccelerationMax => 500.0);
   xPacket.set_Message_to_Send(xMessage => xMessage);
   xConnection := TCPWrapper.xStart_Listening(iPort    => 1337);
   while not bConnected loop
      xConnection.bIs_Connected(bConnected);
      delay(0.1);
   end loop;

   xConnection.Send_Packet(xPacket);
   xConnection.Send_Packet(xPacket);
   xConnection.Send_Packet(xPacket);
   xConnection.Send_Packet(xPacket);
--     xConnection.Send_Packet(xPacket);
--   xConnection.Send_Packet(xPacket);
--     xConnection.Send_Packet(xPacket);
   delay(3.0);
   xConnection.Close_Connection;

end Main;
