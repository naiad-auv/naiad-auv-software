with TCPCANWrapper;
with TCPWrapper;
with CAN_Defs;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);
   xPacket.set_Message_to_Send(xMessage => CAN_defs.MSG_SIMULATION_MODE_ACTIVE);
   xConnection := TCPWrapper.xStart_Listening(sAddress => "127.0.0.1",
                                              iPort    => 1337);
   while not bConnected loop
      xConnection.bIs_Connected(bConnected);
      delay(0.1);
   end loop;

   xConnection.Send_Packet(xPacket);
     xConnection.Send_Packet(xPacket);
--   xConnection.Send_Packet(xPacket);
--     xConnection.Send_Packet(xPacket);
   delay(3.0);
   xConnection.Close_Connection;

end Main;
