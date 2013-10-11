with AVR.AT90CAN128 ;
with AVR.AT90CAN128.CAN ;
with Interfaces ;
with Ada.Text_IO ;
with Ada.Integer_Text_IO ;

package body SEND_bytes is
   use type Interfaces.Integer_8 ;
   use type Interfaces.Unsigned_8 ;
   use type Interfaces.Unsigned_16 ;
   function Signed_8ToUnsigned_8 ( iThis: in Interfaces.Integer_8) return Interfaces.Unsigned_8 is
      type Unsigned_I_8 is mod 2 ** 16 ;
   begin
      return Interfaces.Unsigned_8 ( Unsigned_I_8 ( iThis + 127 + 1 ) ) ;
   end Signed_8ToUnsigned_8;

   procedure Command_Motor ( this : in Interfaces.Unsigned_8 ; UT : out Interfaces.Unsigned_16 ) is
      Mot : Interfaces.Unsigned_16 ;
   begin
      Mot := interfaces.Unsigned_16 ( this ) + 255 ;
      Ada.Text_IO.Put_Line ( "OCR1A value is :" & Interfaces.Unsigned_16'Image ( Mot ) );
      UT := Mot;
   end Command_Motor;


   procedure Initialize_PWM ( UT : out boolean )  is
   begin
      UT := FALSE;
      -- DDRB.Bit_5 := true;
      -- TCCR1a.Bit_7 := true;
      -- TCCR1a.Bit_6 := true;
      -- TCCR1a.Bit_5 := false;
      -- TCCR1a.Bit_4 := false;
      -- TCCR1a.Bit_3 := false;
      -- TCCR1a.Bit_2 := false;
      -- TCCR1a.Bit_1 := true;
      -- TCCR1a.Bit_0 := true;
      -- TCCR1B.Bit_7:=false;
      -- TCCR1B.Bit_6:=false;
      -- TCCR1B.Bit_5:=false;
      -- TCCR1B.Bit_4:=false;
      -- TCCR1B.Bit_3:=true;
      -- TCCR1B.Bit_2:=false;
      -- TCCR1B.Bit_1:=true;
      -- TCCR1B.Bit_0:=true;
      -- TCNT1 := 0;
      Ada.Text_IO.Put("PWM initialised");
      Ada.Text_IO.New_Line;
      UT := TRUE;
   end Initialize_PWM;

   procedure Stop_Motor ( UT : out boolean ) is
   begin
      UT:=FALSE;
      -- DDRA.Bit_5:=0;
      UT:=TRUE;
   end Stop_Motor;


   function TMBAsendByteToMotor(CANmsgLength: AVR.AT90CAN128.DLC_Type; motorData: SEND_bytes.Byte_I_8) return SEND_bytes.TMotorByteArray is

      TMBAByteForMotor : SEND_bytes.TMotorByteArray;
      use type AVR.AT90CAN128.DLC_Type;
      iIndex :  AVR.AT90CAN128.DLC_Type := 1;
   begin
      for iIndexOfCANArray in 1..8 loop
         TMBAByteForMotor(iIndexOfCANArray) := motorData(iIndex);
         if iIndex /= 8 then
            iIndex := iIndex + 1;
         end if;
      end loop;
      return TMBAByteForMotor;
   end TMBAsendByteToMotor;


end SEND_bytes;
