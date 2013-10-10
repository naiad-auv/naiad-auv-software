with Interfaces; use Interfaces;
with System;

package AVR.AT90CAN128 is
   type General_Register is record
      Bit_7 : Boolean;
      Bit_6 : Boolean;
      Bit_5 : Boolean;
      Bit_4 : Boolean;
      Bit_3 : Boolean;
      Bit_2 : Boolean;
      Bit_1 : Boolean;
      Bit_0 : Boolean;
   end record;

   for General_Register use record
      Bit_7 at 0 range 7 .. 7;
      Bit_6 at 0 range 6 .. 6;
      Bit_5 at 0 range 5 .. 5;
      Bit_4 at 0 range 4 .. 4;
      Bit_3 at 0 range 3 .. 3;
      Bit_2 at 0 range 2 .. 2;
      Bit_1 at 0 range 1 .. 1;
      Bit_0 at 0 range 0 .. 0;
   end record;
   for General_Register'Size use 8;

   SREG : General_Register;
   for SREG'Address use System'To_Address (16#5F#);
   pragma Volatile (SREG);

   PINA : General_Register;
   for PINA'Address use System'To_Address (16#20#);
   pragma Volatile (PINA);

   DDRA : General_Register;
   for DDRA'Address use System'To_Address (16#21#);
   pragma Volatile (DDRA);

   PORTA : General_Register;
   for PORTA'Address use System'To_Address (16#22#);
   pragma Volatile (PORTA);

   PINB : General_Register;
   for PINB'Address use System'To_Address (16#23#);
   pragma Volatile (PINB);

   DDRB : General_Register;
   for DDRB'Address use System'To_Address (16#24#);
   pragma Volatile (DDRB);

   PORTB : General_Register;
   for PORTB'Address use System'To_Address (16#25#);
   pragma Volatile (PORTB);

   PINC : General_Register;
   for PINC'Address use System'To_Address (16#26#);
   pragma Volatile (PINC);

   DDRC : General_Register;
   for DDRC'Address use System'To_Address (16#27#);
   pragma Volatile (DDRC);

   PORTC : General_Register;
   for PORTC'Address use System'To_Address (16#28#);
   pragma Volatile (PORTC);

   PIND : General_Register;
   for PIND'Address use System'To_Address (16#29#);
   pragma Volatile (PIND);

   DDRD : General_Register;
   for DDRD'Address use System'To_Address (16#2A#);
   pragma Volatile (DDRD);

   PORTD : General_Register;
   for PORTD'Address use System'To_Address (16#2B#);
   pragma Volatile (PORTD);

   PINE : General_Register;
   for PINE'Address use System'To_Address (16#2C#);
   pragma Volatile (PINE);

   DDRE : General_Register;
   for DDRE'Address use System'To_Address (16#2D#);
   pragma Volatile (DDRE);

   PORTE : General_Register;
   for PORTE'Address use System'To_Address (16#2E#);
   pragma Volatile (PORTE);

   PINF : General_Register;
   for PINF'Address use System'To_Address (16#2F#);
   pragma Volatile (PINF);

   DDRF : General_Register;
   for DDRF'Address use System'To_Address (16#30#);
   pragma Volatile (DDRF);

   PORTF : General_Register;
   for PORTF'Address use System'To_Address (16#31#);
   pragma Volatile (PORTF);

   PING : General_Register;
   for PING'Address use System'To_Address (16#32#);
   pragma Volatile (PING);

   DDRG : General_Register;
   for DDRG'Address use System'To_Address (16#33#);
   pragma Volatile (DDRG);

   PORTG : General_Register;
   for PORTG'Address use System'To_Address (16#34#);
   pragma Volatile (PORTG);

   type Int_Level is (Low, Change_or_Reserved, Falling, Rising);
   for Int_Level'Size use 2;

   type External_Interrupt_Control is record
      Int_3 : Int_Level;
      Int_2 : Int_Level;
      Int_1 : Int_Level;
      Int_0 : Int_Level;
   end record;

   for External_Interrupt_Control use record
      Int_3 at 0 range 6 .. 7;
      Int_2 at 0 range 4 .. 5;
      Int_1 at 0 range 2 .. 3;
      Int_0 at 0 range 0 .. 1;
   end record;
   for External_Interrupt_Control'Size use 8;

--     EICRA : External_Interrupt_Control;
--     for EICRA'Address use System'To_Address (16#69#);

   EICRA : General_Register;
   for EICRA'Address use System'To_Address (16#69#);

--     EICRB : External_Interrupt_Control;
--     for EICRB'Address use System'To_Address (16#6A#);

   EICRB : General_Register;
   for EICRB'Address use System'To_Address (16#6A#);

   EIMSK : General_Register;
   for EIMSK'Address use System'To_Address (16#3D#);

   EIFR : General_Register;
   for EIFR'Address use System'To_Address (16#3C#);

   type Compare_Mode is range 0 .. 3;
   for Compare_Mode'Size use 2;

   type WGM is range 0 .. 3;
   for WGM'Size use 2;

   type Clock_Select_Type is range 0 .. 7;
   for Clock_Select_Type'Size use 3;

   type TCCRA is record
      COMA    : Compare_Mode;
      COMB    : Compare_Mode;
      COMC    : Compare_Mode;
      WGM_Low : WGM;
   end record;
   for TCCRA use record
      COMA    at 0 range 6 .. 7;
      COMB    at 0 range 4 .. 5;
      COMC    at 0 range 2 .. 3;
      WGM_Low at 0 range 0 .. 1;
   end record;
   for TCCRA'Size use 8;

   type TCCRB is record
      ICNC     : Boolean;
      ICES     : Boolean;
      WGM_High : WGM;
      CS       : Clock_Select_Type;
   end record;
   for TCCRB use record
      ICNC     at 0 range 7 .. 7;
      ICES     at 0 range 6 .. 6;
      WGM_High at 0 range 3 .. 4;
      CS       at 0 range 0 .. 2;
   end record;
   for TCCRB'Size use 8;

   --Timer 1
   TCCR1A : General_Register;
   for TCCR1A'Address use System'To_Address (16#80#);

   TCCR1B : General_Register;
   for TCCR1B'Address use System'To_Address (16#81#);

   TCNT1 : Unsigned_16;
   for TCNT1'Address use System'To_Address (16#84#);

   OCR1A : Unsigned_16;
   for OCR1A'Address use System'To_Address (16#88#);

   OCR1AH : Unsigned_8;
   for OCR1AH'Address use System'To_Address (16#89#);

   OCR1B : Unsigned_16;
   for OCR1B'Address use System'To_Address (16#8A#);

   OCR1BH : Unsigned_8;
   for OCR1BH'Address use System'To_Address (16#8B#);

   OCR1C : Unsigned_16;
   for OCR1C'Address use System'To_Address (16#8C#);

   OCR1AL : Unsigned_8;
   for OCR1AL'Address use System'To_Address (16#88#);

   OCR1BL : Unsigned_8;
   for OCR1BL'Address use System'To_Address (16#8A#);

   OCR1CL : Unsigned_8;
   for OCR1CL'Address use System'To_Address (16#8C#);

   ICR1 : Unsigned_16;
   for ICR1'Address use System'To_Address (16#86#);

   --Timer 3
   TCCR3A : General_Register;
   for TCCR3A'Address use System'To_Address (16#90#);

   TCCR3B : General_Register;
   for TCCR3B'Address use System'To_Address (16#91#);

   TCNT3 : Unsigned_16;
   for TCNT3'Address use System'To_Address (16#94#);

   OCR3A : Unsigned_16;
   for OCR3A'Address use System'To_Address (16#98#);

   OCR3B : Unsigned_16;
   for OCR3B'Address use System'To_Address (16#9A#);

   OCR3C : Unsigned_16;
   for OCR3C'Address use System'To_Address (16#9C#);

   OCR3AL : Unsigned_8;
   for OCR3AL'Address use System'To_Address (16#98#);

   OCR3BL : Unsigned_8;
   for OCR3BL'Address use System'To_Address (16#9A#);

   OCR3CL : Unsigned_8;
   for OCR3CL'Address use System'To_Address (16#9C#);

   ICR3 : Unsigned_16;
   for ICR3'Address use System'To_Address (16#96#);

   --
   -- Timer 2

   TCCR2A : General_Register;
   for TCCR2A'Address use System'To_Address (16#B0#);

   TCNT2 : Unsigned_8;
   for TCNT2'Address use System'To_Address (16#B2#);

   OCR2A : Unsigned_8;
   for OCR2A'Address use System'To_Address (16#B3#);

   TIMSK2 : General_Register;
   for TIMSK2'Address use System'To_Address (16#70#);

   --     TIMSK : General_Register;
   --     for TIMSK'Address use System'To_Address (16#57#);
   --
   --     TIFR : General_Register;
   --     for TIFR'Address use System'To_Address (16#56#);

   --
   -- Timer 0

   TCCR0A : Unsigned_8;
   for TCCR0A'Address use System'To_Address (16#44#);

   TCNT0 : Unsigned_8;
   for TCNT0'Address use System'To_Address (16#46#);

   OCR0A : Unsigned_8;
   for OCR0A'Address use System'To_Address (16#47#);

   TIMSK0 : General_Register;
   for TIMSK0'Address use System'To_Address (16#6E#);
   --

   type USARTB is record
      RXCIE : Boolean;
      TXCIE : Boolean;
      UDRIE : Boolean;
      RXEN  : Boolean;
      TXEN  : Boolean;
      UXSZ2 : Boolean;
      RXB8  : Boolean;
      TXB8  : Boolean;
   end record;

   for USARTB use record
      TXB8  at 0 range 0 .. 0;
      RXB8  at 0 range 1 .. 1;
      UXSZ2 at 0 range 2 .. 2;
      TXEN  at 0 range 3 .. 3;
      RXEN  at 0 range 4 .. 4;
      UDRIE at 0 range 5 .. 5;
      TXCIE at 0 range 6 .. 6;
      RXCIE at 0 range 7 .. 7;
   end record;
   for USARTB'Size use 8;


   type USARTA is record
      RXC  : Boolean;
      TXC  : Boolean;
      UDRE : Boolean;
      FE   : Boolean;
      DOR  : Boolean;
      UPE  : Boolean;
      U2X  : Boolean;
      MCPM : Boolean;
   end record;

   for USARTA use record
      MCPM  at 0 range 0 .. 0;
      U2X   at 0 range 1 .. 1;
      UPE   at 0 range 2 .. 2;
      DOR   at 0 range 3 .. 3;
      FE    at 0 range 4 .. 4;
      UDRE  at 0 range 5 .. 5;
      TXC   at 0 range 6 .. 6;
      RXC   at 0 range 7 .. 7;
   end record;
   for USARTA'Size use 8;


   UCSR0B : USARTB;
   for UCSR0B'Address use System'To_Address (16#C1#);

   UCSR0A : USARTA;
   for UCSR0A'Address use System'To_Address (16#C0#);

   UDR0 : Unsigned_8;
   for UDR0'Address use System'To_Address (16#C6#);

   UBRR0L : Unsigned_8;
   for UBRR0L'Address use System'To_Address (16#C4#);

   UCSR1B : USARTB;
   for UCSR1B'Address use System'To_Address (16#C9#);

   UCSR1A : USARTA;
   for UCSR1A'Address use System'To_Address (16#C8#);

   UDR1 : Unsigned_8;
   for UDR1'Address use System'To_Address (16#CE#);

   UBRR1L : Unsigned_8;
   for UBRR1L'Address use System'To_Address (16#CC#);

   --- ADC
   type Channel_Type is range 0 .. 31;
   for Channel_Type'Size use 5;

   type Refs_Type is range 0 .. 3;
   for Refs_Type'Size use 2;

   type ADMUX_Type is record
      Refs  : Refs_Type;
      ADLAR : Boolean;
      MUX   : Channel_Type;
   end record;
   for ADMUX_Type use record
      Refs  at 0 range 6 .. 7;
      ADLAR at 0 range 5 .. 5;
      MUX   at 0 range 0 .. 4;
   end record;
   for ADMUX_Type'Size use 8;

   ADMUX : ADMUX_Type;
   for ADMUX'Address use System'To_Address (16#7C#);

   type ADC_Prescaler_Type is range 0 .. 7;
   for ADC_Prescaler_Type'Size use 3;

   --ADCSRA
   type ADCSRA_Type is record
      ADEN  : Boolean;
      ADSC  : Boolean;
      ADATE : Boolean;
      ADIF  : Boolean;
      ADIE  : Boolean;
      ADPS  : ADC_Prescaler_Type;
   end record;

   for ADCSRA_Type use record
      ADEN  at 0 range 7 .. 7;
      ADSC  at 0 range 6 .. 6;
      ADATE at 0 range 5 .. 5;
      ADIF  at 0 range 4 .. 4;
      ADIE  at 0 range 3 .. 3;
      ADPS  at 0 range 0 .. 2;
   end record;
   for ADCSRA_Type'Size use 8;

   ADCSRA : General_Register;
   for ADCSRA'Address use System'To_Address (16#7A#);

   type ADC_ADTS_Type is range 0 .. 7;
   for ADC_ADTS_Type'Size use 3;

   ADCSRB : General_Register;
   for ADCSRB'Address use System'To_Address (16#7B#);

   ADC_Data : Unsigned_16;
   for ADC_Data'Address use System'To_Address (16#78#);

   ADCH : Unsigned_8;
   for ADCH'Address use System'To_Address (16#79#);

   ADCL : Unsigned_8;
   for ADCL'Address use System'To_Address (16#78#);


   --CAN Definition
   type Full_MOB_ID is range 0..15;
   for Full_MOB_ID'size use 4;

   subtype MOB_ID is Full_MOB_ID range 0..14;
   subtype READ_MOB_ID is Full_MOB_ID range 0..7;

   type MOB_Array is array (MOB_ID) of Boolean;
   pragma Pack (MOB_Array);

   type CANGCONREG is record
      ABRQ    : Boolean;
      OVRQ    : Boolean;
      TTC     : Boolean;
      SYNTTC  : Boolean;
      LISTEN  : Boolean;
      TEST    : Boolean;
      ENASTB  : Boolean;
      SWRES   : Boolean;
   end record;

   for CANGCONREG  use record
      SWRES    at 0 range 0 .. 0;
      ENASTB   at 0 range 1 .. 1;
      TEST     at 0 range 2 .. 2;
      LISTEN   at 0 range 3 .. 3;
      SYNTTC   at 0 range 4 .. 4;
      TTC      at 0 range 5 .. 5;
      OVRQ     at 0 range 6 .. 6;
      ABRQ     at 0 range 7 .. 7;
   end record;
   for CANGCONREG'Size use 8;


   CANGCON  : CANGCONREG;
   for CANGCON'Address use System'To_Address (16#D8#);


   type CANSTAREG is record
      RESERVED7    : Boolean;
      OVFG         : Boolean;
      RESERVED5    : Boolean;
      TXBSY        : Boolean;
      RXBSY        : Boolean;
      ENFG         : Boolean;
      BOFF         : Boolean;
      ERRP         : Boolean;
   end record;

   for CANSTAREG  use record
      ERRP        at 0 range 0 .. 0;
      BOFF        at 0 range 1 .. 1;
      ENFG        at 0 range 2 .. 2;
      RXBSY       at 0 range 3 .. 3;
      TXBSY       at 0 range 4 .. 4;
      RESERVED5   at 0 range 5 .. 5;
      OVFG        at 0 range 6 .. 6;
      RESERVED7   at 0 range 7 .. 7;
   end record;
   for CANSTAREG'Size use 8;

   CANSTA  : CANSTAREG;
   for CANSTA'Address use System'To_Address (16#D9#);

   type CANGITREG is record
      CANIT    : Boolean;
      BOFFIT   : Boolean;
      OVRTIM   : Boolean;
      BXOK     : Boolean;
      SERG     : Boolean;
      CERG     : Boolean;
      FERG     : Boolean;
      AERG     : Boolean;
   end record;

   for CANGITREG  use record
      AERG        at 0 range 0 .. 0;
      FERG        at 0 range 1 .. 1;
      CERG        at 0 range 2 .. 2;
      SERG        at 0 range 3 .. 3;
      BXOK        at 0 range 4 .. 4;
      OVRTIM      at 0 range 5 .. 5;
      BOFFIT      at 0 range 6 .. 6;
      CANIT       at 0 range 7 .. 7;
   end record;
   for CANGITREG'Size use 8;

   CANGIT  : CANGITREG;
   for CANGIT'Address use System'To_Address (16#DA#);

   type CANGIEREG is record
      ENIT   : Boolean;
      ENBOFF : Boolean;
      ENRX   : Boolean;
      ENTX   : Boolean;
      ENERR  : Boolean;
      ENBX   : Boolean;
      ENERG  : Boolean;
      ENOVRT : Boolean;
   end record;

   for CANGIEREG  use record
      ENOVRT  at 0 range 0 .. 0;
      ENERG   at 0 range 1 .. 1;
      ENBX    at 0 range 2 .. 2;
      ENERR   at 0 range 3 .. 3;
      ENTX    at 0 range 4 .. 4;
      ENRX    at 0 range 5 .. 5;
      ENBOFF  at 0 range 6 .. 6;
      ENIT    at 0 range 7 .. 7;
   end record;
   for CANGIEREG'Size use 8;

   CANGIE  : CANGIEREG;
   for CANGIE'Address use System'To_Address (16#DB#);

   CANEN  : MOB_Array;
   for CANEN'Address use System'To_Address (16#DC#);

   CANIE  : MOB_Array;
   for CANIE'Address use System'To_Address (16#DE#);

   CANSIT  : MOB_Array;
   for CANSIT'Address use System'To_Address (16#E0#);

   CANBT1  : Unsigned_8;
   for CANBT1'Address use System'To_Address (16#E2#);

   CANBT2  : Unsigned_8;
   for CANBT2'Address use System'To_Address (16#E3#);

   CANBT3  : Unsigned_8;
   for CANBT3'Address use System'To_Address (16#E4#);

   CANTCON  : Unsigned_8;
   for CANTCON'Address use System'To_Address (16#E5#);

   CANTIM  : Unsigned_16;
   for CANTIM'Address use System'To_Address (16#E6#);

   CANTTC  : Unsigned_16;
   for CANTTC'Address use System'To_Address (16#E8#);

   CANTEC  : Unsigned_8;
   for CANTEC'Address use System'To_Address (16#EA#);

   CANREC  : Unsigned_8;
   for CANREC'Address use System'To_Address (16#EB#);

   type CAN_Message_Index is range 0..7;
   for CAN_Message_Index'size use 3;

   type CAN_Page_Type is record
      MOB : Full_MOB_ID;
      Auto_Increment : Boolean;
      Index          : CAN_Message_Index;
   end record;

   for CAN_Page_Type use record
      MOB at 0 range 4..7;
      Auto_Increment at 0 range 3..3;
      Index at 0 range 0..2;
   end record;

   for CAN_Page_Type'size use 8;


   type MOB_State is (Disable,
                      Enable_Transmission,
                      Enable_Reception,
                      Enable_Frame_Buffer_Reception);

   for MOB_State'size use 2;

   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;

   type CAN_MOB_Control is record
      State : MOB_State;
      Reply_Valid : Boolean;
      Extended_ID : Boolean;
      DLC         : DLC_Type;
   end record;

   for CAN_MOB_Control use record
      State       at 0 range 6..7;
      Reply_Valid at 0 range 5..5;
      Extended_ID at 0 range 4..4;
      DLC         at 0 range 0..3;
   end record;

   for CAN_MOB_Control'size use 8;

   CANHPMOB  : CAN_Page_Type;
   for CANHPMOB'Address use System'To_Address (16#EC#);

   CANPAGE  : CAN_Page_Type;
   for CANPAGE'Address use System'To_Address (16#ED#);


   type CANSTMOBREG is record
      DLCW    : Boolean;
      TXOK    : Boolean;
      RXOK    : Boolean;
      BERR    : Boolean;
      SERR    : Boolean;
      CERR    : Boolean;
      FERR    : Boolean;
      AERR    : Boolean;
   end record;

   for CANSTMOBREG  use record
      AERR     at 0 range 0 .. 0;
      FERR     at 0 range 1 .. 1;
      CERR     at 0 range 2 .. 2;
      SERR     at 0 range 3 .. 3;
      BERR     at 0 range 4 .. 4;
      RXOK     at 0 range 5 .. 5;
      TXOK     at 0 range 6 .. 6;
      DLCW     at 0 range 7 .. 7;
   end record;
   for CANSTMOBREG'Size use 8;


   CANSTMOB  : CANSTMOBREG;
   for CANSTMOB'Address use System'To_Address (16#EE#);

   CANCDMOB  : CAN_MOB_Control;
   for CANCDMOB'Address use System'To_Address (16#EF#);

   CANIDTX  : Unsigned_16;
   for CANIDTX'Address use System'To_Address (16#F0#);

   CANIDT  : Unsigned_16;
   for CANIDT'Address use System'To_Address (16#F2#);


   CANIDMX  : Unsigned_16;
   for CANIDMX'Address use System'To_Address (16#F4#);

   CANIDM  : Unsigned_16;
   for CANIDM'Address use System'To_Address (16#F6#);


   CANSTM  : Unsigned_16;
   for CANSTM'Address use System'To_Address (16#F8#);

   CANMSG  : Unsigned_8;
   for CANMSG'Address use System'To_Address (16#FA#);


   WDTCR : General_Register;
   for WDTCR'Address use System'To_Address (16#60#);
   pragma Volatile (WDTCR);


   Vector_Int0         : constant String := "__vector_int0";
   Vector_Int1         : constant String := "__vector_int1";
   Vector_Int2         : constant String := "__vector_int2";
   Vector_Int3         : constant String := "__vector_int3";
   Vector_Int4         : constant String := "__vector_int4";
   Vector_Int5         : constant String := "__vector_int5";
   Vector_Int6         : constant String := "__vector_int6";
   Vector_Int7         : constant String := "__vector_int7";
   Vector_Timer2_Comp  : constant String := "__vector_timer2_comp";
   Vector_Timer2_OVF   : constant String := "__vector_timer2_ovf";
   Vector_Timer1_Capt  : constant String := "__vector_timer1_capt";
   Vector_Timer1_CompA : constant String := "__vector_timer1_compa";
   Vector_Timer1_CompB : constant String := "__vector_timer1_compb";
   Vector_Timer1_CompC : constant String := "__vector_timer1_compc";
   Vector_Timer1_OVF   : constant String := "__vector_timer1_ovf";
   Vector_Timer0_Comp  : constant String := "__vector_timer0_comp";
   Vector_Timer0_OVF   : constant String := "__vector_timer0_ovf";
   Vector_CAN_IT       : constant String := "__vector_canit";
   Vector_OVR_IT       : constant String := "__vector_ovrit";
   Vector_SPI_STC      : constant String := "__vector_spi_stc";
   Vector_USART0_RX    : constant String := "__vector_usart0_rx";
   Vector_USART0_UDRE  : constant String := "__vector_usart0_udre";
   Vector_USART0_TX    : constant String := "__vector_usart0_tx";
   Vector_Analog_Comp  : constant String := "__vector_analog_comp";
   Vector_ADC          : constant String := "__vector_adc";
   Vector_EE_Ready     : constant String := "__vector_ee_ready";
   Vector_Timer3_Capt  : constant String := "__vector_timer3_capt";
   Vector_Timer3_CompA : constant String := "__vector_timer3_compa";
   Vector_Timer3_CompB : constant String := "__vector_timer3_compb";
   Vector_Timer3_CompC : constant String := "__vector_timer3_compc";
   Vector_Timer3_OVF   : constant String := "__vector_timer3_ovf)";
   Vector_USART1_RX    : constant String := "__vector_usart1_rx";
   Vector_USART1_UDRE  : constant String := "__vector_usart1_udre";
   Vector_USART1_TX    : constant String := "__vector_usart1_tx";
   Vector_TWI          : constant String := "__vector_twi";
   Vector_SPM_Ready    : constant String := "__vector_spm_ready";

end  AVR.AT90CAN128;


