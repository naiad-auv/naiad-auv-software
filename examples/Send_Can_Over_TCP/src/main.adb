with TCPCANWrapper;
with TCPWrapper;
with CAN_Defs;
with Can_Float_Conversions;
with math.matrices;
with ada.Text_IO;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
   xMessageX : CAN_Defs.CAN_Message;
   xMessageY : CAN_Defs.CAN_Message;
   xMessageZ : CAN_Defs.CAN_Message;
   xNonCompleteOrientationMatrix : math.matrices.TMAtrix;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);

   xMessageX.ID := CAN_Defs.MSG_Sim_Orientation_X_Vector_ID;
   xMessageY.ID := CAN_Defs.MSG_Sim_Orientation_Y_Vector_ID;
   xMessageZ.ID := CAN_Defs.MSG_Sim_Orientation_Z_Vector_ID;

   xMessageX.Len := 1;
   xMessageY.Len := 1;
   xMessageZ.Len := 1;

   xNonCompleteOrientationMatrix := ((0.67,0.51,0.62),(0.13,0.81,0.43),(0.78,0.13,0.64));
   for i in 1..3 loop
      for j in 1..3 loop
         ada.Text_IO.put(xNonCompleteOrientationMatrix(i,j)'img);
      end loop;
      ada.Text_IO.New_Line;
   end loop;

   Can_Float_Conversions.Vector_To_Message(fX        => xNonCompleteOrientationMatrix(1,1),
                                           fY        => xNonCompleteOrientationMatrix(2,1),
                                           fZ        => xNonCompleteOrientationMatrix(3,1),
                                           b8Message => xMessageX.Data,
                                           fMax      => 1.0);

   Can_Float_Conversions.Vector_To_Message(fX        => xNonCompleteOrientationMatrix(1,2),
                                           fY        => xNonCompleteOrientationMatrix(2,2),
                                           fZ        => xNonCompleteOrientationMatrix(3,2),
                                           b8Message => xMessageY.Data,
                                           fMax      => 1.0);

   Can_Float_Conversions.Vector_To_Message(fX        => xNonCompleteOrientationMatrix(1,3),
                                           fY        => xNonCompleteOrientationMatrix(2,3),
                                           fZ        => xNonCompleteOrientationMatrix(3,3),
                                           b8Message => xMessageZ.Data,
                                           fMax      => 1.0);

   xConnection := TCPWrapper.xStart_Listening(iPort    => 1337);
   while not bConnected loop
      xConnection.bIs_Connected(bConnected);
      delay(0.1);
   end loop;

   xPacket.set_Message_to_Send(xMessage => xMessageX);
   xConnection.Send_Packet(xPacket);
   xPacket.set_Message_to_Send(xMessage => xMessageY);
   xConnection.Send_Packet(xPacket);
   xPacket.set_Message_to_Send(xMessage => xMessageZ);
   xConnection.Send_Packet(xPacket);



--     xConnection.Send_Packet(xPacket);
--   xConnection.Send_Packet(xPacket);
--     xConnection.Send_Packet(xPacket);
   delay(3.0);
   xConnection.Close_Connection;

end Main;
