with Ada.Text_IO;

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
         this.bConnected := false;
      end if;
   end Close_Connection;

   function pGet_Stream(this : in CTCPConnection) return GNAT.Sockets.Stream_Access is
   begin
      return this.pIO_Stream;
   end pGet_Stream;



   function xStart_Listening(sAddress : in string := ""; iPort : in integer) return CTCPConnection is
      xNewTCPConnection : CTCPConnection;
      Remote_Address  : GNAT.Sockets.Sock_Addr_Type := (Family => GNAT.Sockets.Family_Inet,
                                                        Addr => GNAT.Sockets.Any_Inet_Addr,
                                                        Port => GNAT.Sockets.Port_Type(iPort));
      Listener_Socket : GNAT.Sockets.Socket_Type;
   begin
      if sAddress'Length > 0 then
         Remote_Address.Addr := GNAT.Sockets.Inet_Addr(sAddress);
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


   function eGet_Next_Packet_Type (this : in CTCPConnection) return EPacketType is
      bNextByte : Ada.Streams.Stream_Element_Array(1 .. 1);
      eType : EPacketType;
      for eType'Address use bNextByte'Address;
      xOffset : Ada.Streams.Stream_Element_Offset := bNextByte'Last;
   begin
      if this.iBytes_Available_For_Reading > 0 then
         GNAT.Sockets.Receive_Socket(Socket => this.tiSocket,
                                     Item   => bNextByte,
                                     Last   => xOffset,
                                     Flags  => GNAT.Sockets.Peek_At_Incoming_Data);
         return eType;
      end if;
      return PACKET_NULL;
   end eGet_Next_Packet_Type;


   function iBytes_Available_For_Reading(this : in CTCPConnection) return integer is
      use GNAT.Sockets;
      Socket_Is_Not_Initialized : exception;
      Request_Bytes_To_Read : GNAT.Sockets.Request_Type := (GNAT.Sockets.N_Bytes_To_Read, 0);
   begin
      if this.tiSocket = GNAT.Sockets.No_Socket then
         raise Socket_Is_Not_Initialized;
      end if;

      GNAT.Sockets.Control_Socket(Socket  => this.tiSocket,
                                  Request => Request_Bytes_To_Read);
      return Request_Bytes_To_Read.Size;
   exception
      when Socket_Is_Not_Initialized =>
         Ada.Text_IO.Put_Line("Error: Socket not initialized.");
         return 0;
   end iBytes_Available_For_Reading;


   function iGet_Size_In_Bytes(this : in CTCPPacket) return integer is
   begin
      return 1;
   end;

   function pGet_Socket(this : in CTCPConnection) return GNAT.Sockets.Socket_Type is
   begin
      return this.tiSocket;
   end pGet_Socket;


   procedure Send_Packet(this : in out CTCPConnection; xPacket : in CTCPPacket'class) is
   begin
      EPacketType'Write(this.pIO_Stream, xPacket.eType);
      xPacket.xWrite_Custom_Packet(pStream => this.pIO_Stream);
   end Send_Packet;



   procedure Receive_Packet(this : in out CTCPConnection; xPacket : in out CTCPPacket'class; bSuccess : out boolean) is
   begin
      Ada.Text_IO.Put_Line("Type: " & this.eGet_Next_Packet_Type'Img);
      Ada.Text_IO.Put_Line("Wanted type: " & xPacket.eType'Img);
      if this.eGet_Next_Packet_Type = xPacket.eType and then this.iBytes_Available_For_Reading >= xPacket.iGet_Size_In_Bytes then
         EPacketType'Read(this.pIO_Stream, xPacket.eType);
         xPacket.xRead_Custom_Packet(pStream => this.pIO_Stream);
         bSuccess := true;
      else
         bSuccess := false;
      end if;
   end Receive_Packet;


   procedure Set_Type(this : in out CTCPPacket; eType : in EPacketType) is
   begin
      this.eType := eType;
   end Set_Type;

   procedure Initialize(this : in out CTCPPacket) is
   begin
      this.eType := PACKET_NULL;
   end Initialize;

   procedure Finalize(this : in out CTCPPacket) is
   begin
      null;
   end Finalize;

   procedure Adjust(this : in out CTCPPacket) is
   begin
      null;
   end Adjust;


end TCPWrapper;
