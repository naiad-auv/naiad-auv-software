with TCPWrapper;
with GNAT.Sockets;
with Ada.Text_IO;
with Ada.Streams;
with Ada.Streams.Stream_IO;
with Ada.Sequential_IO;

package TCPFileTransfer is

   type Byte is mod 2 ** 8;
   for Byte'Size use 8;

   type TFileSize is mod 2 ** 32;
   for TFileSize'Size use 32;

   type CFileTransferPacket is new TCPWrapper.CTCPPacket with private;


   function iGet_Size_In_Bytes(this : in CFileTransferPacket) return integer;
   procedure Receive_File (this : in CFileTransferPacket; xConnection : in TCPWrapper.CTCPConnection; sFileDestination : in string);
   procedure Send_File (this : in out CFileTransferPacket; xConnection : in out TCPWrapper.CTCPConnection; sFileSource : in string);


private

   overriding
   procedure xRead_Custom_Packet(this : in out CFileTransferPacket; pStream : GNAT.Sockets.Stream_Access);
   overriding
   procedure xWrite_Custom_Packet(this : in CFileTransferPacket; pStream : GNAT.Sockets.Stream_Access);

   type CFileTransferPacket is new TCPWrapper.CTCPPacket with
      record
         tSize : TFileSize;
      end record;

   overriding
   procedure Initialize(this : in out CFileTransferPacket);


end TCPFileTransfer;
