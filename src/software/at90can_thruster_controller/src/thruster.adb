with AVR.AT90CAN128;
with Ada.Unchecked_Conversion;

package body thruster is
   use type Interfaces.Integer_8 ;
   use type Interfaces.Unsigned_8 ;
   use type Interfaces.Unsigned_16 ;

   function U_8_To_I_8 is
     new Ada.Unchecked_Conversion (Source => Interfaces.Unsigned_8,
                                   Target => Interfaces.Integer_8);

   function Signed_8ToUnsigned_8 ( iThis: in Interfaces.Integer_8) return Interfaces.Unsigned_8 is
      type Unsigned_I_8 is mod 2 ** 16 ;
   begin
      return Interfaces.Unsigned_8 ( Unsigned_I_8 ( iThis + 127 + 1 ) ) ;
   end Signed_8ToUnsigned_8;

   procedure Command_Motor ( this : in Interfaces.Unsigned_16 ; UT : out Interfaces.Unsigned_16 ) is
      Mot : Interfaces.Unsigned_16 ;
   begin
      Mot :=  this  + 255 ;
      UT := Mot;
      AVR.AT90CAN128.OCR1A:=Mot;
   end Command_Motor;

   procedure Initialize_PWM ( UT : out Interfaces.Unsigned_16 )  is
   begin
      AVR.AT90CAN128.DDRB.Bit_5 := true;
      AVR.AT90CAN128.TCCR1A := 16#82#;
      AVr.AT90CAN128.TCCR1B := 16#1B#;
      AVR.AT90CAN128.TCNT1 := 0;
      AVR.AT90CAN128.ICR1 := 4095;
      AVR.AT90CAN128.OCR1A := 377;
      UT := AVR.AT90CAN128.OCR1A;
   end Initialize_PWM;

   procedure Stop_Motor ( UT : out boolean ) is
   begin
      UT:=FALSE;
      AVR.AT90CAN128.DDRA.Bit_5:=FALSE;
      UT:=TRUE;
   end Stop_Motor;

  function TMBAsendByteToMotor(CANmsgLength: CAN_Defs.DLC_Type; motorData: Thruster.Byte_I_8) return Thruster.TMotorByteArray is
       TMBAByteForMotor : Thruster.TMotorByteArray;
       use type CAN_Defs.DLC_Type;
       iIndex :  CAN_Defs.DLC_Type := 1;
   begin
      for iIndexOfCANArray in 1..8 loop
         TMBAByteForMotor(iIndexOfCANArray) := motorData(iIndex);
         if iIndex /= 8 then
            iIndex := iIndex + 1;
         end if;
      end loop;
      return TMBAByteForMotor;
   end TMBAsendByteToMotor;
end thruster;
