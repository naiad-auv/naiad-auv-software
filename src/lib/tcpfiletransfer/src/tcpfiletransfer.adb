package body TCPFileTransfer is

   -------------------------
   -- xRead_Custom_Packet --
   -------------------------

   overriding procedure xRead_Custom_Packet
     (this : in out CFileTransferPacket;
      pStream : GNAT.Sockets.Stream_Access)
   is
   begin
      TFileSize'Read(pStream, this.tSize);
   end xRead_Custom_Packet;

   --------------------------
   -- xWrite_Custom_Packet --
   --------------------------

   overriding procedure xWrite_Custom_Packet
     (this : in CFileTransferPacket;
      pStream : GNAT.Sockets.Stream_Access)
   is
   begin
      TFileSize'Write(pStream, this.tSize);
   end xWrite_Custom_Packet;

   ------------------------
   -- iGet_Size_In_Bytes --
   ------------------------

   function iGet_Size_In_Bytes
     (this : in CFileTransferPacket)
      return integer
   is
   begin
      return TCPWrapper.iGet_Size_In_Bytes(TCPWrapper.CTCPPacket(this)) + 4;
   end iGet_Size_In_Bytes;

   procedure Receive_File(this : in CFileTransferPacket; xConnection : in TCPWrapper.CTCPConnection; sFileDestination : in string) is

      procedure Receive_Bytes_And_Write_To_File(pSocket : in GNAT.Sockets.Socket_Type; xFileAccess : in Ada.Streams.Stream_IO.Stream_Access; tPos : in out TFileSize; iBytesToRead : in Positive) is
         type ByteArray is array(1 .. iBytesToRead) of Byte;
         xRawData : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(iBytesToRead));
         iLastOffset : Ada.Streams.Stream_Element_Offset;
         tByteArray : ByteArray;
         for tByteArray'Address use xRawData'Address;
      begin
         GNAT.Sockets.Receive_Socket(pSocket, xRawData, iLastOffset);
         ByteArray'Write(xFileAccess, tByteArray);
         tPos := tPos - TFileSize(iBytesToRead);
      end Receive_Bytes_And_Write_To_File;

      tPosition : TFileSize := this.tSize;
      xFileStreamAccess : Ada.Streams.Stream_IO.Stream_Access;
      xFileOutput : Ada.Streams.Stream_IO.File_Type;
      iReadBytes : integer;
   begin

      Ada.Streams.Stream_IO.Create(File => xFileOutput,
                                   Mode => Ada.Streams.Stream_IO.Out_File,
                                   Name => sFileDestination);
      xFileStreamAccess := Ada.Streams.Stream_IO.Stream(File => xFileOutput);

      while tPosition > 0 loop
         iReadBytes := xConnection.iBytes_Available_For_Reading;
         if iReadBytes > 0 then
            if iReadBytes > Integer(tPosition) then
               Receive_Bytes_And_Write_To_File(pSocket      => xConnection.pGet_Socket,
                                               xFileAccess  => xFileStreamAccess,
                                               tPos         => tPosition,
                                               iBytesToRead => Integer(tPosition));
            else
               Receive_Bytes_And_Write_To_File(pSocket      => xConnection.pGet_Socket,
                                               xFileAccess  => xFileStreamAccess,
                                               tPos         => tPosition,
                                               iBytesToRead => iReadBytes);
            end if;
         end if;
      end loop;

      Ada.Streams.Stream_IO.Close(xFileOutput);
   end Receive_File;

   procedure Send_File (this : in out CFileTransferPacket; xConnection : in out TCPWrapper.CTCPConnection; sFileSource : in string) is

      procedure Read_Bytes_From_File_And_Send(pSocket : in GNAT.Sockets.Socket_Type; iBytesToSend : in Positive) is
         type ByteArray is array(1 .. iBytesToSend) of Byte;
         xRawData : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(iBytesToSend));
         iLastOffset : Ada.Streams.Stream_Element_Offset;
         tByteArray : ByteArray;
         xFileInput : Ada.Streams.Stream_IO.File_Type;
         xFileAccess : Ada.Streams.Stream_IO.Stream_Access;
         for xRawData'Address use tByteArray'Address;
      begin
         Ada.Streams.Stream_IO.Open(File => xFileInput,
                                    Mode => Ada.Streams.Stream_IO.In_File,
                                    Name => sFileSource);
         xFileAccess := Ada.Streams.Stream_IO.Stream(xFileInput);
         ByteArray'Read(xFileAccess, tByteArray);
         GNAT.Sockets.Send_Socket(pSocket, xRawData, iLastOffset);
         Ada.Streams.Stream_IO.Close(xFileInput);
      end Read_Bytes_From_File_And_Send;

      package Byte_IO is new Ada.Sequential_IO(Byte);
      tPosition : TFileSize := this.tSize;
      xFileInput : Byte_IO.File_Type;
      bByteRead  : Byte;
   begin


      -- Figure out the file size
      this.tSize := 0;
      Byte_IO.Open (xFileInput, Byte_IO.In_File, sFileSource);
      while not Byte_IO.End_Of_File(xFileInput) loop
         Byte_IO.Read(xFileInput, bByteRead);
         this.tSize := this.tSize + 1;
      end loop;
      Byte_IO.Close(xFileInput);

      this.Set_Type(TCPWrapper.PACKET_FILE_TRANSFER);
      xConnection.Send_Packet(this);

      Byte_IO.Open (xFileInput, Byte_IO.In_File, sFileSource);


      tPosition := this.tSize;
      while tPosition > 0 loop
         Byte_IO.Read(xFileInput, bByteRead);
         Byte'Write(xConnection.pGet_Stream, bByteRead);
         tPosition := tPosition - 1;
      end loop;

      Byte_IO.Close(xFileInput);

   end Send_File;

   procedure Initialize(this : in out CFileTransferPacket) is
   begin
      this.Set_Type(TCPWrapper.PACKET_FILE_TRANSFER);
   end Initialize;


end TCPFileTransfer;
