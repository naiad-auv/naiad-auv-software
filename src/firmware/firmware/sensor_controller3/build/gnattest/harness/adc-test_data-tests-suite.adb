--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body ADC.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.ADC.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_ADC_Init_b5fb8f : aliased Runner_1.Test_Case;
   Case_2_1_Test_ADC_Init_48488f : aliased Runner_1.Test_Case;
   Case_3_1_Test_Get_20a2bc : aliased Runner_1.Test_Case;
   Case_4_1_Test_ADC_Interrupt_36d238 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Change_Channel_c99e86 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_ADC_Init_b5fb8f,
         "adc.ads:21:4:",
         Test_ADC_Init_b5fb8f'Access);
      Runner_1.Create
        (Case_2_1_Test_ADC_Init_48488f,
         "adc.ads:22:4:",
         Test_ADC_Init_48488f'Access);
      Runner_1.Create
        (Case_3_1_Test_Get_20a2bc,
         "adc.ads:24:4:",
         Test_Get_20a2bc'Access);
      Runner_1.Create
        (Case_4_1_Test_ADC_Interrupt_36d238,
         "adc.ads:29:4:",
         Test_ADC_Interrupt_36d238'Access);
      Runner_1.Create
        (Case_5_1_Test_Change_Channel_c99e86,
         "adc.ads:34:4:",
         Test_Change_Channel_c99e86'Access);

      Result.Add_Test (Case_1_1_Test_ADC_Init_b5fb8f'Access);
      Result.Add_Test (Case_2_1_Test_ADC_Init_48488f'Access);
      Result.Add_Test (Case_3_1_Test_Get_20a2bc'Access);
      Result.Add_Test (Case_4_1_Test_ADC_Interrupt_36d238'Access);
      Result.Add_Test (Case_5_1_Test_Change_Channel_c99e86'Access);

      return Result'Access;

   end Suite;

end ADC.Test_Data.Tests.Suite;
--  end read only
