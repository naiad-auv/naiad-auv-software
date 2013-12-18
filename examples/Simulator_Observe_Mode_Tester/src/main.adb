with TCPCANWrapper;
with TCPWrapper;
with CAN_Defs;
with Can_Float_Conversions;
with math.matrices;use Math.Matrices;
with math.Vectors;
with ada.Text_IO; use ada.Text_IO;
with ada.Float_Text_IO; use ada.Float_Text_IO;
with CAN_Convertions_Matrix;
with math.Angles;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
   xMessage : CAN_Defs.CAN_Message;

   xRotationMatrix : math.Matrices.CMatrix;
   c : character;
   procedure send_position is
      fX : float;
      fY : float;
      fZ : float;
   begin
      ada.Text_IO.Put_Line("Cordinate X position: ");
      Get(fX);
      ada.Text_IO.Put_Line("Cordinate Y position: ");
      Get(fY);
      ada.Text_IO.Put_Line("Cordinate Z position: ");
      Get(fZ);
      xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_POSITION_ID;
      xMessage.Len := 1;
      Can_Float_Conversions.Vector_To_Message(fX        => fX,
                                              fY        => fY,
                                              fZ        => fZ,
                                              b8Message => xMessage.Data,
                                              fMax      => 500.0);
      xPacket.set_Message_to_Send(xMessage => xMessage);
      xConnection.Send_Packet(xPacket);
   end send_position;

   procedure send_orientation is
      fX : float;
      fY : float;
      fZ : float;
   begin
      ada.Text_IO.Put_Line("Rotation X position: ");
      Get(fX);
      ada.Text_IO.Put_Line("Rotation Y position: ");
      Get(fY);
      ada.Text_IO.Put_Line("Rotation Z position: ");
      Get(fZ);
      xMessage.ID := CAN_Defs.MSG_SENSOR_FUSION_ORIENTATION_ID;
      xMessage.Len := 1;
      xRotationMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(math.Angles.TAngle(fX))*math.Matrices.xCreate_Rotation_Around_Y_Axis(math.Angles.TAngle(fY))*math.Matrices.xCreate_Rotation_Around_Z_Axis(math.Angles.TAngle(fZ));
      xMessage.Data := CAN_Convertions_Matrix.Create_Can_Message_From_Matrix(xMatrix => xRotationMatrix);
      xPacket.set_Message_to_Send(xMessage => xMessage);
      xConnection.Send_Packet(xPacket);
   end send_orientation;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);

   xMessage.Data := CAN_Convertions_Matrix.Create_Can_Message_From_Matrix(xMatrix => xRotationMatrix);
   xConnection := TCPWrapper.xStart_Listening(iPort    => 1337);
   while not bConnected loop
      xConnection.bIs_Connected(bConnected);
      delay(0.1);
   end loop;



   loop
      ada.Text_IO.Put_Line("What information do you wish to send? p = position, o = orientation");
      ada.Text_IO.Get(c);
      if c='p' then
         send_position;
      end if;
      if c='o' then
         send_orientation;
      end if;
      if c='x' then
         exit;
      end if;
   end loop;


   delay(3.0);
   xConnection.Close_Connection;

end Main;
