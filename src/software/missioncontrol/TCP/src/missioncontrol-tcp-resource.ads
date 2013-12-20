with TCPWrapper;
with TCPFileTransfer;

package MissionControl.TCP.Resource is

   protected TCP_Resource is
      procedure Query_Mission_Receiving;
      procedure Listen;
      procedure bConnected (bResult : out boolean);
      procedure bMissionUpdateReceived (bResult : out boolean);

   private
      xTCPConnection : TCPWrapper.CTCPConnection;
      bMissionUpdate : boolean := false;
   end TCP_Resource;

end MissionControl.TCP.Resource;
