
---------------------------------------------------------------------------
-- This code is for the CAN-card dealing with the INS-card and the IMU.

-- Here is the vector algebra explaining what we're doing with IMU data.


--  AUV global space (coordinate system)
--  	z    y
--  	|   /
--  	|  /
--  	| /
--  	|/_____ x
--
--
--  IMU global space (coordinate system)
--  	     x
--  	    /
--  	   /
--  	  /
--  	 /_____ y
--  	|
--  	|
--  	|
--  	|z
--
--
--  Transformation from AUV global space to IMU global space:
--  	 _			       _
--  T =	|	0	1	0 	|
--  	|				|
--  	|	1	0	0	|
--  	|				|
--  	|	0	0	-1	|
--  	 ¯			       ¯
--
--  Transformation from IMU global space to AUV global space:
--  		 _			       _
--  T^-1 =	|	0	1	0 	|
--  		|				|
--  		|	1	0	0	|
--  		|				|
--  		|	0	0	-1	|
--  		 ¯			       ¯
--
--
--  Orientation is delivered from IMU in IMU global space, let's call it Oimu.
--  		 _			       _
--  Oimu =	|	xa	ya	za 	|
--  		|				|
--  		|	xb	yb	zb	|
--  		|				|
--  		|	xc	yc	zc	|
--  		 ¯			       ¯
--
--
--  We need to describe it in AUV global space. So first we take the starting
--  orientation in AUV global space (the identity matrix) and bring it to IMU
--  global space by multiplying with T. Then we rotate the result with the rotation
--  matrix describing the orientation (Oimu) in IMU global space. Then we bring
--  the result back to AUV global space by multiplying with T^-1.
--
--
--  Oauv = T^-1 * O * T * I =
--   _			       _  _			       _  _			       _  _			       _
--  |	0	1	0 	||	xa	ya	za 	||	0	1	0 	||	1	0	0 	|
--  |				||				||				||				|
--  |	1	0	0	||	xb	yb	zb	||	1	0	0	||	0	1	0	|
--  |				||				||				||				|
--  |	0	0	-1	||	xc	yc	zc	||	0	0	-1	||	0	0	1	|
--   ¯			       ¯  ¯			       ¯  ¯			       ¯  ¯			       ¯
--  = 	 _			       _
--  	|	yb	xb	-zb 	|
--  	|				|
--  	|	ya	xa	-za	|
--  	|				|
--  	|	-yc	-xc	zc	|
--  	 ¯			       ¯
--
--  Oauv is now the orientation matrix for the AUV in AUV global space.
--------------------------------------------------------------

with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;
with Board_and_Mode_Defs;
with Interfaces;
with Ada.Unchecked_Conversion;

package AT90CAN_Usart_To_Can is

   procedure Main_Loop;

   procedure Hardware_Init;

private
   type uint15 is mod 2 ** 15;
   type uint2 is mod 2;

   type CANDataRecord is
      record
         One : Interfaces.Unsigned_8;
         Two : Interfaces.Unsigned_8;
         Three : Interfaces.Unsigned_8;
         Four : Interfaces.Unsigned_8;
         Five : Interfaces.Unsigned_8;
         Six : Interfaces.Unsigned_8;
         Seven : Interfaces.Unsigned_8;
         Eight : Interfaces.Unsigned_8;
      end record;

   type OrientationRecord is
      record
         XVectorX : uint15;
         XVectorY : uint15;
         YVectorX : uint15;
         YVectorY : uint15;
         XVectorZ : uint2;
         YVectorZ : uint2;
         DummyBitX : uint2;
         DummyBitY : uint2;
      end record;
   for OrientationRecord use record
      XVectorX at 0 range 0 .. 14;
      XVectorY at 0 range 15 .. 29;
      YVectorX at 0 range 30 .. 44;
      YVectorY at 0 range 45 .. 59;
      XVectorZ at 0 range 60 .. 60;
      YVectorZ at 0 range 61 .. 61;
      DummyBitX at 0 range 62 .. 62;
      DummyBitY at 0 range 63 .. 63;
   end record;

   function OrientationRecord_To_CANDataRecord is new Ada.Unchecked_Conversion(Source => OrientationRecord,
                                                                               Target => CANDataRecord);

   type f_array is array (Natural range <>) of float;
   type f_matrix is array (1 .. 3, 1 .. 3) of float;

   FIRST_QUAT_INDEX : constant integer := 8;
   SECOND_QUAT_INDEX : constant integer := 18;
   THIRD_QUAT_INDEX : constant integer := 28;
   FOURTH_QUAT_INDEX : constant integer := 38;
   QUAT_LENGTH : constant integer := 8;

   MESSAGE_BUFFER_SIZE : constant integer := 49;
   sMessageBuffer : string(1 .. MESSAGE_BUFFER_SIZE) := (others => ' ');
   iMessageBufferPosition : integer := sMessageBuffer'First;

   faQuaternion : f_array(1 .. 4) := (others => 0.0);
   fmNaiadOrientation : f_matrix := (others => (others => 0.0));
   fmIMUOrientation : f_matrix := (others => (others => 0.0));

   iMessageState : integer := 0;

   bTransmissionLED : boolean := false;
   bAliveLED : boolean := false;

   INS_BOARD	: constant Board_and_Mode_Defs.Boards		:= Board_and_Mode_Defs.INS_CONTROLLER;


   -- USART1 is used for the communication between the CAN Router and BBB
   USART_PORT       : constant AVR.AT90CAN128.USART.USARTID    := AVR.AT90CAN128.USART.USART0;

   procedure Usart_Write(sBuffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         iSize   : Positive);
   procedure Usart_Read(sBuffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        iSize   : Positive; iNumber : out integer);

   procedure Handle_Can;
   procedure Handle_Uart;

   procedure Init_Transmission_LED;
   procedure Init_Alive_LED;
   procedure Flip_Transmission_LED;
   procedure Flip_Alive_LED;

   procedure Send_Vectors;
   procedure Send_CAN_String_Message(sData : in string; iFirst : in integer; iLast : in integer);
   function cGet_Char_From_Hex (sHex : in string; iFirst : in integer; iSecond : in integer) return character;
   function cGet_Checksum(sStr : in string) return character;
   function fGet_Value_From_String(sMessageData : in string; iStartPos : in integer; iEndPos : in integer) return float;

end AT90CAN_Usart_To_Can;
