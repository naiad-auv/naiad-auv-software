with Interfaces;
with CAN_Defs;

package Thruster is
   type TMotorByteArray is array(1..8) of Interfaces.Integer_8;
   type Byte_I_8 is array (CAN_Defs.DLC_Type range 1..8) of Interfaces.Integer_8;
   type Byte8 is array (CAN_Defs.DLC_Type range 1..8) of interfaces.Unsigned_8;
   function TMBAsendByteToMotor(CANmsgLength: CAN_Defs.DLC_Type; motorData: Byte_I_8) return TMotorByteArray;
   procedure Command_Motor (this : in Interfaces.Unsigned_16; UT : out Interfaces.Unsigned_16);
   procedure Initialize_PWM(UT : out Interfaces.Unsigned_16);
   function Signed_8ToUnsigned_8 (iThis : in Interfaces.Integer_8) return Interfaces.Unsigned_8 ;
   procedure Stop_Motor(UT:out boolean);
end Thruster;
