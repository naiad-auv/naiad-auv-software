package body TCPWrapper is

   function xConnect_To(sAddress : in string; iPort : in integer; dTimeout : in Duration := GNAT.Sockets.Forever) return CTCPConnection is
      use GNAT.Sockets;
      xNewTCPConnection : CTCPConnection;
      Remote_Address  : GNAT.Sockets.Sock_Addr_Type := (Family => GNAT.Sockets.Family_Inet,
                                                        Addr => GNAT.Sockets.Inet_Addr(sAddress),
                                                        Port => GNAT.Sockets.Port_Type(iPort));
      Socket          : GNAT.Sockets.Socket_Type;
      Sel_Status : GNAT.Sockets.Selector_Status;
   begin
      GNAT.Sockets.Create_Socket(Socket);
      GNAT.Sockets.Set_Socket_Option(Socket,
                                     GNAT.Sockets.Socket_Level,
                                     (GNAT.Sockets.Reuse_address, True));
      GNAT.Sockets.Connect_Socket(Socket   => Socket,
                                  Server   => Remote_Address,
                                  Timeout  => dTimeout,
                                  Status   => Sel_Status);
      xNewTCPConnection.tiSocket := Socket;
      if Sel_Status = GNAT.Sockets.Completed then
         xNewTCPConnection.bConnected := true;
         xNewTCPConnection.pIO_Stream := GNAT.Sockets.Stream(xNewTCPConnection.tiSocket);
      else
         xNewTCPConnection.bConnected := false;
      end if;
      return xNewTCPConnection;
   end xConnect_To;

   procedure Close_Connection(this : in out CTCPConnection) is
   begin
      if this.bConnected then
         GNAT.Sockets.Close_Socket(this.tiSocket);
         this.tiSocket := GNAT.Sockets.No_Socket;
      end if;
   end Close_Connection;



   function xStart_Listening(sAddress : in string := ""; iPort : in integer := 0) return CTCPConnection is
      xNewTCPConnection : CTCPConnection;
      Remote_Address  : GNAT.Sockets.Sock_Addr_Type := (Family => GNAT.Sockets.Family_Inet,
                                                        Addr => GNAT.Sockets.Any_Inet_Addr,
                                                        Port => GNAT.Sockets.Any_Port);
      Listener_Socket : GNAT.Sockets.Socket_Type;
   begin
      if sAddress'Length > 0 then
         Remote_Address.Addr := GNAT.Sockets.Inet_Addr(sAddress);
      end if;
      if iPort > 0 then
         Remote_Address.Port := GNAT.Sockets.Port_Type(iPort);
      end if;

      GNAT.Sockets.Create_Socket(Listener_Socket);
      GNAT.Sockets.Set_Socket_Option (Socket => Listener_Socket,
                                      Option => (Name    => GNAT.Sockets.Reuse_Address,
                                                 Enabled => True));
      GNAT.Sockets.Bind_Socket(Listener_Socket, Remote_Address);
      GNAT.Sockets.Listen_Socket(Listener_Socket);

      xNewTCPConnection.tiSocket := Listener_Socket;
      xNewTCPConnection.tRemote_Address := Remote_Address;
      return xNewTCPConnection;
   end xStart_Listening;


   procedure bIs_Connected(this : in out CTCPConnection; bResult : out boolean) is
      use GNAT.Sockets;
      Socket : GNAT.Sockets.Socket_Type;
      Sel_Status : GNAT.Sockets.Selector_Status;
   begin
      if not this.bConnected and then this.tiSocket /= GNAT.Sockets.No_Socket then
         GNAT.Sockets.Accept_Socket(Server   => this.tiSocket,
                                    Socket   => Socket,
                                    Address  => this.tRemote_Address,
                                    Timeout  => GNAT.Sockets.Immediate,
                                    Status   => Sel_Status);

         if Sel_Status = GNAT.Sockets.Completed then
            GNAT.Sockets.Close_Socket(this.tiSocket);
            this.tiSocket := Socket;
            this.pIO_Stream := GNAT.Sockets.Stream(this.tiSocket);
            this.bConnected := true;
         end if;
      end if;
      bResult := this.bConnected;
   end bIs_Connected;


   procedure iBytes_Available_For_Reading(this : in out CTCPConnection; iBytesAvail : out integer) is
      use GNAT.Sockets;
      Socket_Is_Not_Initialized : exception;
      Request_Bytes_To_Read : GNAT.Sockets.Request_Type := (GNAT.Sockets.N_Bytes_To_Read, 0);
   begin
      if this.tiSocket = GNAT.Sockets.No_Socket then
         raise Socket_Is_Not_Initialized;
      end if;

      GNAT.Sockets.Control_Socket(Socket  => this.tiSocket,
                                  Request => Request_Bytes_To_Read);
      iBytesAvail := Request_Bytes_To_Read.Size;
   end iBytes_Available_For_Reading;


   procedure Send_Packet(this : in out CTCPConnection; xPacket : in CTCPPacket'class) is
   begin
      Integer'Write(this.pIO_Stream, xPacket.iSize);
      Integer'Write(this.pIO_Stream, xPacket.iType);
      xPacket.xWrite_Custom_Packet(pStream => this.pIO_Stream);
   end Send_Packet;



   procedure xReceive_Packet(this : in out CTCPConnection; xPacket : in out CTCPPacket'class) is
      iBytes : integer;
      iType : integer;
   begin
      this.iBytes_Available_For_Reading(iBytesAvail => iBytes);
      if iBytes >= xPacket.iSize then
         Integer'Read(this.pIO_Stream, iBytes);
         if iBytes = xPacket.iSize then
            Integer'Read(this.pIO_Stream, iType);
            if iType = xPacket.iType then
               xPacket.xRead_Custom_Packet(this.pIO_Stream);
            else
               -- Didn't recognize the packet, empty the buffer
               declare
                  sThrowAwayPacket : string(1 .. iBytes);
               begin
                  String'Read(this.pIO_Stream, sThrowAwayPacket);
               end;
            end if;
         end if;
      end if;
   end xReceive_Packet;

end TCPWrapper;
