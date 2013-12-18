with TCPCANWrapper;
with TCPWrapper;
with CAN_Defs;
with Can_Float_Conversions;
with math.matrices;use Math.Matrices;
with math.Vectors;
with ada.Text_IO;
with CAN_Convertions_Matrix;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
   xMessage : CAN_Defs.CAN_Message;

   xRotationMatrix : math.Matrices.CMatrix;
   xNonCompleteOrientationMatrix : math.Matrices.TMatrix;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);

   xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_ORIENTATION_ID;

   xMessage.Len := 1;


   xRotationMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(25.1)*math.Matrices.xCreate_Rotation_Around_Y_Axis(21.8)*math.Matrices.xCreate_Rotation_Around_Z_Axis(31.7);


   xNonCompleteOrientationMatrix := math.Matrices.tfGet_Raw_Matrix(xRotationMatrix);
   for i in 1..3 loop
      for j in 1..3 loop
         ada.Text_IO.put(xNonCompleteOrientationMatrix(i,j)'img);
      end loop;
      ada.Text_IO.New_Line;
   end loop;


   xMessage.Data := CAN_Convertions_Matrix.Create_Can_Message_From_Matrix(xMatrix => xRotationMatrix);
   xConnection := TCPWrapper.xStart_Listening(iPort    => 1337);
   while not bConnected loop
      xConnection.bIs_Connected(bConnected);
      delay(0.1);
   end loop;

   xPacket.set_Message_to_Send(xMessage => xMessage);
   xConnection.Send_Packet(xPacket);




--     xConnection.Send_Packet(xPacket);
--   xConnection.Send_Packet(xPacket);
--     xConnection.Send_Packet(xPacket);
   delay(3.0);
   xConnection.Close_Connection;

end Main;
