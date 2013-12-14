with TCPCANWrapper;
with TCPWrapper;
with Ada;
with ada.Text_IO;
procedure Main is
   xConnection : TCPWrapper.CTCPConnection;
   xPacket : TCPCANWrapper.CTCPCANPacket;
   bConnected : boolean := false;
   bSuccess : boolean := false;
   iBytes : integer;
begin
   xPacket.Set_Type(TCPWrapper.PACKET_CAN);
   ada.Text_IO.Put_Line("Test1");
   while bConnected = false loop
      ada.Text_IO.Put_Line("Test1.5");
      xConnection := TCPWrapper.xConnect_To(sAddress => "127.0.0.140",
                                            iPort    => 1337);
      ada.Text_IO.Put_Line("Test2");
      xConnection.bIs_Connected(bResult => bConnected);
      delay(0.1);
   end loop;
      ada.Text_IO.Put_Line("Test3");
   loop
      delay(0.1);
      iBytes := xConnection.iBytes_Available_For_Reading;
      ada.Text_IO.Put_Line("Antal bytes: " &iBytes'img);
      if iBytes > 30 then
         xConnection.Receive_Packet(xPacket  => xPacket,
                                    bSuccess => bSuccess);
         ada.Text_IO.Put_Line(xPacket.sGet_String);
      end if;

   end loop;

end Main;
