with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
with Interfaces;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

package SEND_bytes is
   type TMotorByteArray is array(1..8) of Interfaces.Integer_8;
   type Byte_I_8 is array (AVR.AT90CAN128.DLC_Type range 1..8) of Interfaces.Integer_8;
   type Byte8 is array (AVR.AT90CAN128.DLC_Type range 1..8) of interfaces.Unsigned_8;
   function TMBAsendByteToMotor(CANmsgLength: AVR.AT90CAN128.DLC_Type; motorData: Byte_I_8) return TMotorByteArray;
   procedure Command_Motor (this : in Interfaces.Unsigned_8; UT : out Interfaces.Unsigned_16);
   procedure Initialize_PWM(UT : out boolean);
   function Signed_8ToUnsigned_8 (iThis : in Interfaces.Integer_8) return Interfaces.Unsigned_8 ;
   procedure Stop_Motor(UT:out boolean);
end SEND_bytes;
