package body MissionControl.TCP.Resource is

   protected body TCP_Resource is
      procedure Query_Mission_Receiving is
         xPacket : TCPFileTransfer.CFileTransferPacket;
         bSuccess : boolean;
      begin
         if xTCPConnection.iBytes_Available_For_Reading > 0 then
            xTCPConnection.Receive_Packet(xPacket, bSuccess);
            if bSuccess then
               xPacket.Receive_File(xConnection      => xTCPConnection,
                                    sFileDestination => "./mission.byte");
               bMissionUpdate := true;
            end if;
         end if;
      end Query_Mission_Receiving;

      procedure Listen is
      begin
         xTCPConnection := TCPWrapper.xStart_Listening(iPort => 1337);
      end Listen;

      procedure bConnected (bResult : out boolean) is
      begin
         xTCPConnection.bIs_Connected(bResult);
      end bConnected;

      procedure bMissionUpdateReceived (bResult : out boolean) is
      begin
         bResult := bMissionUpdate;
         bMissionUpdate := false;
      end bMissionUpdateReceived;
   end TCP_Resource;

end MissionControl.TCP.Resource;
